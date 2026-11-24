import Foundation

struct MoodEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    let q1Selection: String
    let q2Selection: String
    let q3Selection: String
    let writtenNote: String
    
    let verseArabic: String
    let verseTransliteration: String
    let verseEnglish: String
    let verseReference: String
    let aiReflection: String
}

struct DhikrState: Codable {
    var dateString: String
    var subhanallahCount: Int = 0
    var alhamdulillahCount: Int = 0
    var allahuAkbarCount: Int = 0
    var laIlahaIllallahCount: Int = 0
    var astaghfirullahCount: Int = 0
}

@MainActor
class SakinaStore: ObservableObject {
    static let shared = SakinaStore()
    
    @Published var moodEntries: [MoodEntry] = []
    @Published var currentDhikrState: DhikrState = DhikrState(dateString: "")
    
    private var moodFile: URL {
        let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        let appSupport = paths[0].appendingPathComponent("Shukarr")
        try? FileManager.default.createDirectory(at: appSupport, withIntermediateDirectories: true)
        return appSupport.appendingPathComponent("mood_entries.json")
    }
    
    private var dhikrFile: URL {
        let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        let appSupport = paths[0].appendingPathComponent("Shukarr")
        try? FileManager.default.createDirectory(at: appSupport, withIntermediateDirectories: true)
        return appSupport.appendingPathComponent("dhikr_state.json")
    }
    
    init() {
        loadData()
        verifyAndResetDhikr()
    }
    
    func loadData() {
        // Load Moods
        if let data = try? Data(contentsOf: moodFile),
           let moods = try? JSONDecoder().decode([MoodEntry].self, from: data) {
            self.moodEntries = moods
        }
        
        // Load Dhikr
        if let data = try? Data(contentsOf: dhikrFile),
           let state = try? JSONDecoder().decode(DhikrState.self, from: data) {
            self.currentDhikrState = state
        } else {
            self.currentDhikrState = DhikrState(dateString: getTodayString())
            saveDhikr()
        }
    }
    
    func addMoodEntry(q1: String, q2: String, q3: String, note: String, arabic: String, transliteration: String, english: String, reference: String, reflection: String) {
        let entry = MoodEntry(
            id: UUID(),
            date: Date(),
            q1Selection: q1,
            q2Selection: q2,
            q3Selection: q3,
            writtenNote: note,
            verseArabic: arabic,
            verseTransliteration: transliteration,
            verseEnglish: english,
            verseReference: reference,
            aiReflection: reflection
        )
        moodEntries.insert(entry, at: 0)
        saveMoods()
    }
    
    func deleteMoodEntry(at offsets: IndexSet) {
        moodEntries.remove(atOffsets: offsets)
        saveMoods()
    }
    
    func saveMoods() {
        if let data = try? JSONEncoder().encode(moodEntries) {
            try? data.write(to: moodFile)
        }
    }
    
    func saveDhikr() {
        if let data = try? JSONEncoder().encode(currentDhikrState) {
            try? data.write(to: dhikrFile)
        }
    }
    
    func verifyAndResetDhikr() {
        let today = getTodayString()
        if currentDhikrState.dateString != today {
            currentDhikrState = DhikrState(dateString: today)
            saveDhikr()
        }
    }
    
    private func getTodayString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
}
