import Foundation
import UserNotifications

@MainActor
class NotificationManager {
    static let shared = NotificationManager()
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }
    
    func scheduleDailyNotifications() {
        // Cancel all existing pending notifications first to prevent duplicates
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        let center = UNUserNotificationCenter.current()
        
        // Define default times
        let times = [
            (hour: 6, minute: 0, title: "Morning Light 🌅", type: "quran"),
            (hour: 12, minute: 0, title: "Midday Wisdom 📖", type: "hadith"),
            (hour: 18, minute: 0, title: "Evening Reflection 🌙", type: "quran"),
            (hour: 0, minute: 0, title: "Night Contemplation 🌌", type: "hadith")
        ]
        
        // Schedule next 7 days of notifications
        let calendar = Calendar.current
        var scheduledCount = 0
        
        for dayOffset in 0..<7 {
            guard let baseDate = calendar.date(byAdding: .day, value: dayOffset, to: Date()) else { continue }
            
            for time in times {
                var components = calendar.dateComponents([.year, .month, .day], from: baseDate)
                components.hour = time.hour
                components.minute = time.minute
                components.second = 0
                
                guard let triggerDate = calendar.date(from: components), triggerDate > Date() else {
                    continue
                }
                
                let content = UNMutableNotificationContent()
                content.title = time.title
                content.sound = .default
                
                var bodyText = ""
                var userInfo: [String: String] = [:]
                
                if time.type == "quran" {
                    let verse = CuratedData.verses.randomElement()!
                    bodyText = "\"\(verse.textEnglish)\" — \(verse.surah) \(verse.ayah)"
                    userInfo = [
                        "type": "quran",
                        "surah": verse.surah,
                        "ayah": String(verse.ayah),
                        "arabic": verse.textArabic,
                        "transliteration": verse.transliteration,
                        "english": verse.textEnglish
                    ]
                } else {
                    let hadith = CuratedData.hadiths.randomElement()!
                    bodyText = "\"\(hadith.textEnglish)\" — \(hadith.source)"
                    userInfo = [
                        "type": "hadith",
                        "source": hadith.source,
                        "arabic": hadith.textArabic,
                        "english": hadith.textEnglish
                    ]
                }
                
                content.body = bodyText
                content.userInfo = userInfo
                
                let triggerComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: triggerDate)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerComponents, repeats: false)
                
                let requestIdentifier = "shukarr-notification-\(dayOffset)-\(time.hour)"
                let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
                
                center.add(request) { error in
                    if let error = error {
                        print("Failed to schedule notification: \(error.localizedDescription)")
                    }
                }
                
                scheduledCount += 1
            }
        }
        
        print("Scheduled \(scheduledCount) notifications for the next 7 days.")
    }
}
