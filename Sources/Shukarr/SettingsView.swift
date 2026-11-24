import SwiftUI

struct SettingsView: View {
    @State private var apiKey: String = ""
    @State private var saveStatus: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Settings")
                .font(.system(.title, design: .serif))
                .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
            
            Divider()
                .background(Color(red: 0.62, green: 0.58, blue: 0.50).opacity(0.3))
            
            // Gemini Section
            VStack(alignment: .leading, spacing: 8) {
                Text("Gemini API Key")
                    .font(.headline)
                    .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                
                Text("An API key is required to analyze your mood check-in statements using Gemini and select tailored Quranic verses. Get a free key at Google AI Studio.")
                    .font(.caption)
                    .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                
                HStack {
                    SecureField("Enter Gemini API Key", text: $apiKey)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 400)
                    
                    Button("Save") {
                        if GeminiService.shared.saveApiKey(apiKey) {
                            saveStatus = "Saved successfully!"
                            NotificationManager.shared.scheduleDailyNotifications() // refresh notifications
                        } else {
                            saveStatus = "Failed to save to Keychain."
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.79, green: 0.66, blue: 0.30))
                    
                    if !apiKey.isEmpty {
                        Button("Clear") {
                            GeminiService.shared.deleteApiKey()
                            apiKey = ""
                            saveStatus = "API Key cleared from Keychain."
                        }
                        .buttonStyle(.bordered)
                    }
                }
                
                if !saveStatus.isEmpty {
                    Text(saveStatus)
                        .font(.caption)
                        .foregroundColor(Color(red: 0.48, green: 0.62, blue: 0.49))
                        .padding(.top, 4)
                }
            }
            .padding(.bottom, 10)
            
            // Notifications Section
            VStack(alignment: .leading, spacing: 8) {
                Text("Notifications & Reminders")
                    .font(.headline)
                    .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                
                Text("Enable 6-hour native notifications to receive random Quran and Hadith quotes daily.")
                    .font(.caption)
                    .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                
                Button("Configure Notifications") {
                    NotificationManager.shared.requestAuthorization()
                    NotificationManager.shared.scheduleDailyNotifications()
                }
                .buttonStyle(.bordered)
            }
            .padding(.bottom, 10)
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
        .padding(.top, 50)
        .background(Color(red: 0.11, green: 0.10, blue: 0.09))
        .onAppear {
            apiKey = GeminiService.shared.getApiKey() ?? ""
        }
    }
}
