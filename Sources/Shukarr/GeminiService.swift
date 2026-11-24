import Foundation

struct GeminiResponse: Codable {
    struct Candidate: Codable {
        struct Content: Codable {
            struct Part: Codable {
                let text: String
            }
            let parts: [Part]
        }
        let content: Content
    }
    let candidates: [Candidate]?
}

struct GeminiResult: Codable {
    let surah: String
    let ayah: Int
    let arabic: String
    let transliteration: String
    let english: String
    let reflection: String
}

@MainActor
class GeminiService {
    static let shared = GeminiService()
    
    private let serviceName = "com.hello.shukarr"
    private let accountName = "GeminiAPIKey"
    
    func saveApiKey(_ key: String) -> Bool {
        return KeychainHelper.shared.save(key, service: serviceName, account: accountName)
    }
    
    func getApiKey() -> String? {
        return KeychainHelper.shared.read(service: serviceName, account: accountName)
    }
    
    func deleteApiKey() {
        KeychainHelper.shared.delete(service: serviceName, account: accountName)
    }
    
    func analyzeMood(q1: String, q2: String, q3: String, note: String) async -> GeminiResult {
        // Fallback verse in case of any failure
        let fallbackVerse = CuratedData.verses.randomElement()!
        let fallbackResult = GeminiResult(
            surah: fallbackVerse.surah,
            ayah: fallbackVerse.ayah,
            arabic: fallbackVerse.textArabic,
            transliteration: fallbackVerse.transliteration,
            english: fallbackVerse.textEnglish,
            reflection: "May this verse bring peace and comfort to your heart in your current state."
        )
        
        guard let apiKey = getApiKey(), !apiKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return fallbackResult
        }
        
        let prompt = """
        You are a compassionate Islamic spiritual guide. Based on the user's emotional check-in answers, select the single most appropriate Quranic verse.
        
        User input:
        - Mood description: \(q1)
        - Core issue: \(q2)
        - Needs most: \(q3)
        - Additional thoughts: \(note)
        
        Return a JSON object matching this schema exactly:
        {
          "surah": "Surah Name (English)",
          "ayah": 123,
          "arabic": "Arabic text of the verse",
          "transliteration": "English transliteration of the verse",
          "english": "English translation of the verse",
          "reflection": "A compassionate 2-3 sentence reflection explaining how this verse directly comforts, motivates or guides the user based on their specific feeling."
        }
        """
        
        guard let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=\(apiKey)") else {
            return fallbackResult
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let payload: [String: Any] = [
            "contents": [
                ["parts": [["text": prompt]]]
            ],
            "generationConfig": [
                "responseMimeType": "application/json"
            ]
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: payload)
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return fallbackResult
            }
            
            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(GeminiResponse.self, from: data)
            
            if let jsonText = apiResponse.candidates?.first?.content.parts.first?.text {
                if let jsonData = jsonText.data(using: .utf8) {
                    let result = try decoder.decode(GeminiResult.self, from: jsonData)
                    return result
                }
            }
        } catch {
            print("Gemini API call failed with error: \(error)")
        }
        
        return fallbackResult
    }
}
