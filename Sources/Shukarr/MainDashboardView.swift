import SwiftUI
import AppKit

struct MainDashboardView: View {
    @ObservedObject private var store = SakinaStore.shared
    
    @State private var selectedTab: String? = "checkin"
    
    // MCQ selections
    @State private var moodSelection: String = "😌 Calm & Content"
    @State private var weighingHeart: String = "Work/Study pressure"
    @State private var needMost: String = "Comfort and reassurance"
    @State private var customNote: String = ""
    
    // Check-in state
    @State private var currentStep: Int = 1
    @State private var isLoading: Bool = false
    @State private var resultVerse: GeminiResult? = nil
    // Local static quote for the dashboard quote box
    @State private var dashboardQuote: String = "\"Indeed, with hardship [will be] ease.\" — Ash-Sharh 6"
    
    let moods = ["😌 Calm & Content", "😔 Sad or Low", "😰 Anxious or Worried", "😤 Frustrated or Angry", "😶 Empty or Lost"]
    let weights = ["Work/Study pressure", "Family or relationships", "Health concerns", "Feeling distant from Allah", "Grief or loss"]
    let needs = ["Comfort and reassurance", "Motivation to keep going", "Reminder of gratitude", "Strength and patience", "A sign I'm on the right path"]
    
    var body: some View {
        NavigationSplitView {
            // Sidebar
            List(selection: $selectedTab) {
                // Custom Sidebar Header/Branding
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        if let logoUrl = Bundle.main.url(forResource: "AppLogo", withExtension: "png"),
                           let nsImage = NSImage(contentsOf: logoUrl) {
                            Image(nsImage: nsImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                        }
                        
                        Text("Shukarr")
                            .font(.system(.title3, design: .serif))
                            .bold()
                            .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                    }
                    
                    Text("Islamic Wellness & Remembrance")
                        .font(.system(size: 10, design: .serif))
                        .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 4)
                
                Divider()
                    .background(Color(red: 0.62, green: 0.58, blue: 0.50).opacity(0.15))
                    .padding(.bottom, 8)
                
                Label("Dashboard", systemImage: "square.grid.2x2")
                    .tag("checkin")
                
                Label("Journal", systemImage: "book.closed")
                    .tag("journal")
                
                Label("Settings", systemImage: "gearshape")
                    .tag("settings")
                
                Section("Dhikr Tracker") {
                    Button(action: {
                        DhikrPanelController.show()
                    }) {
                        Label("Open Floating Widget", systemImage: "macwindow.badge.plus")
                            .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                    }
                    .buttonStyle(.plain)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("")
        } detail: {
            GeometryReader { outerGeo in
                ZStack {
                    Color(red: 0.11, green: 0.10, blue: 0.09).ignoresSafeArea()
                    
                    // Mosque silhouette background blended subtly
                    if let bgUrl = Bundle.main.url(forResource: "DashboardBg", withExtension: "png"),
                       let nsImage = NSImage(contentsOf: bgUrl) {
                        Image(nsImage: nsImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .opacity(0.04)
                            .allowsHitTesting(false)
                    }
                    
                    if let tab = selectedTab {
                        switch tab {
                        case "checkin":
                            ZStack(alignment: .topTrailing) {
                                ScrollView {
                                    VStack(spacing: 24) {
                                        heroSection
                                        bentoGridSection
                                        recentJournalSection
                                    }
                                    .padding(.horizontal, 24)
                                    .padding(.bottom, 24)
                                    .padding(.top, 50)
                                }
                                .frame(width: outerGeo.size.width, height: outerGeo.size.height)
                            }
                        case "journal":
                            journalView
                                .frame(width: outerGeo.size.width, height: outerGeo.size.height)
                        case "settings":
                            SettingsView()
                                .frame(width: outerGeo.size.width, height: outerGeo.size.height)
                        default:
                            Text("Select an option")
                        }
                    } else {
                        Text("Select an option")
                            .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                    }
                }
                .frame(width: outerGeo.size.width, height: outerGeo.size.height)
                .navigationTitle("")
                .removeTitleBarTitle()
            }
        }
        .frame(minWidth: 850, minHeight: 650)
        .onAppear {
            loadOrRefreshDailyQuote()
        }
    }
    
    // 1. Hero Card Welcome Banner
    var heroSection: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Discover tranquility, maintain remembrance")
                    .font(.system(.subheadline, design: .serif))
                    .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                
                Text("Let's start the journey of Enlightenment")
                    .font(.system(.title, design: .serif))
                    .bold()
                    .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
            }
            Spacer()
            
            if let logoUrl = Bundle.main.url(forResource: "AppLogo", withExtension: "png"),
               let nsImage = NSImage(contentsOf: logoUrl) {
                Image(nsImage: nsImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 0.15, green: 0.13, blue: 0.10).opacity(0.8))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(red: 0.79, green: 0.66, blue: 0.30).opacity(0.2), lineWidth: 1)
                )
        )
    }
    
    // 2. Bento Grid Section
    var bentoGridSection: some View {
        HStack(alignment: .top, spacing: 20) {
            // Left Column: Mood Check-In Card
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Image(systemName: "heart.text.square")
                        .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                    Text("Mood Check-In")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
                }
                
                if isLoading {
                    VStack(spacing: 12) {
                        Spacer()
                        ProgressView().scaleEffect(1.2)
                        Text("Seeking Quranic guidance...")
                            .font(.caption)
                            .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, minHeight: 250)
                } else if let verse = resultVerse {
                    // Verse result box
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text(verse.surah + " " + String(verse.ayah))
                                .font(.system(.caption, design: .serif))
                                .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                            Spacer()
                            Button("Reset") {
                                resultVerse = nil
                                currentStep = 1
                            }
                            .buttonStyle(.plain)
                            .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                            .focusable(false)
                        }
                        
                        Text(verse.arabic)
                            .font(.system(size: 16))
                            .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .multilineTextAlignment(.trailing)
                            .padding(.vertical, 4)
                        
                        Text(verse.english)
                            .font(.system(size: 12, design: .serif))
                            .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
                        
                        Text(verse.reflection)
                            .font(.system(size: 11))
                            .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                            .padding(.top, 4)
                    }
                    .padding(16)
                    .background(Color(red: 0.11, green: 0.10, blue: 0.09))
                    .cornerRadius(12)
                } else {
                    // Question steps
                    VStack(alignment: .leading, spacing: 12) {
                        if currentStep == 1 {
                            Text("How is your overall mood?")
                                .font(.subheadline)
                                .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                            VStack(spacing: 8) {
                                ForEach(moods, id: \.self) { mood in
                                    CustomOptionRow(text: mood, isSelected: moodSelection == mood) {
                                        moodSelection = mood
                                    }
                                }
                            }
                        } else if currentStep == 2 {
                            Text("What is weighing on you?")
                                .font(.subheadline)
                                .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                            VStack(spacing: 8) {
                                ForEach(weights, id: \.self) { weight in
                                    CustomOptionRow(text: weight, isSelected: weighingHeart == weight) {
                                        weighingHeart = weight
                                    }
                                }
                            }
                        } else if currentStep == 3 {
                            Text("What do you need most?")
                                .font(.subheadline)
                                .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                            VStack(spacing: 8) {
                                ForEach(needs, id: \.self) { need in
                                    CustomOptionRow(text: need, isSelected: needMost == need) {
                                        needMost = need
                                    }
                                }
                            }
                            
                            TextField("Optional thoughts...", text: $customNote)
                                .textFieldStyle(.plain)
                                .padding(8)
                                .background(Color(red: 0.11, green: 0.10, blue: 0.09))
                                .cornerRadius(6)
                                .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
                        }
                        
                        HStack {
                            if currentStep > 1 {
                                Button("Back") { currentStep -= 1 }
                                    .buttonStyle(.bordered)
                                    .focusable(false)
                            }
                            Spacer()
                            Button(currentStep == 3 ? "Seek Guidance" : "Next") {
                                if currentStep < 3 {
                                    currentStep += 1
                                } else {
                                    analyzeAndShowResult()
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(Color(red: 0.79, green: 0.66, blue: 0.30))
                            .focusable(false)
                        }
                        .padding(.top, 8)
                    }
                    .frame(minHeight: 220, alignment: .top)
                }
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 0.15, green: 0.13, blue: 0.10).opacity(0.8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(red: 0.79, green: 0.66, blue: 0.30).opacity(0.15), lineWidth: 1)
                    )
            )
            
            // Right Column: Dhikr & Quote
            VStack(spacing: 20) {
                // Box 1: Dhikr Widget Progress Box
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color(red: 0.48, green: 0.62, blue: 0.49))
                        Text("Daily Remembrance")
                            .font(.headline)
                            .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
                        Spacer()
                        Button(action: {
                            DhikrPanelController.show()
                        }) {
                            Image(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")
                                .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                        }
                        .buttonStyle(.plain)
                        .focusable(false)
                    }
                    
                    VStack(spacing: 6) {
                        miniProgressRow(title: "SubhanAllah", count: store.currentDhikrState.subhanallahCount)
                        miniProgressRow(title: "Alhamdulillah", count: store.currentDhikrState.alhamdulillahCount)
                        miniProgressRow(title: "Allahu Akbar", count: store.currentDhikrState.allahuAkbarCount)
                        miniProgressRow(title: "La ilaha illallah", count: store.currentDhikrState.laIlahaIllallahCount)
                        miniProgressRow(title: "Astaghfirullah", count: store.currentDhikrState.astaghfirullahCount)
                    }
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(red: 0.15, green: 0.13, blue: 0.10).opacity(0.8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color(red: 0.79, green: 0.66, blue: 0.30).opacity(0.15), lineWidth: 1)
                        )
                )
                
                // Box 2: Daily Quote Box
                VStack(alignment: .leading, spacing: 10) {
                    Text("Daily Quote")
                        .font(.system(.caption, design: .serif))
                        .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                        .bold()
                    
                    Text(dashboardQuote)
                        .font(.system(.subheadline, design: .serif))
                        .italic()
                        .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                    
                    Button("Refresh") {
                        selectAndSaveNewDailyQuote(today: getTodayString())
                    }
                    .buttonStyle(.plain)
                    .font(.system(size: 10))
                    .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                    .focusable(false)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(red: 0.15, green: 0.13, blue: 0.10).opacity(0.8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color(red: 0.79, green: 0.66, blue: 0.30).opacity(0.15), lineWidth: 1)
                        )
                )
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    // 3. Bottom Section: Numbered Journal Log
    var recentJournalSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recent Reflections")
                .font(.system(.title3, design: .serif))
                .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
            
            if store.moodEntries.isEmpty {
                Text("Your recent journal and AI reflections will appear here as a timeline.")
                    .font(.caption)
                    .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
            } else {
                VStack(spacing: 12) {
                    ForEach(Array(store.moodEntries.prefix(3).enumerated()), id: \.element.id) { index, entry in
                        HStack(spacing: 16) {
                            Text(String(format: "%02d", index + 1))
                                .font(.system(.title2, design: .serif))
                                .bold()
                                .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(entry.q1Selection)
                                        .font(.subheadline)
                                        .bold()
                                        .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
                                    Spacer()
                                    Text(entry.date, style: .date)
                                        .font(.system(size: 10))
                                        .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                                }
                                
                                Text("\"\(entry.verseEnglish)\" — \(entry.verseReference)")
                                    .font(.system(.caption, design: .serif))
                                    .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                            }
                        }
                        .padding(16)
                        .background(Color(red: 0.15, green: 0.13, blue: 0.10).opacity(0.6))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(red: 0.62, green: 0.58, blue: 0.50).opacity(0.1), lineWidth: 1)
                        )
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // Dhikr Progress mini indicator row
    @ViewBuilder
    private func miniProgressRow(title: String, count: Int) -> some View {
        let pct = Double(count) / 100.0
        HStack(spacing: 8) {
            Text(title)
                .font(.system(size: 11))
                .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
            Spacer()
            
            // Progress Bar (Fixed size calculation instead of GeometryReader)
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color(red: 0.11, green: 0.10, blue: 0.09))
                    .frame(width: 80, height: 6)
                RoundedRectangle(cornerRadius: 3)
                    .fill(count >= 100 ? Color(red: 0.48, green: 0.62, blue: 0.49) : Color(red: 0.79, green: 0.66, blue: 0.30))
                    .frame(width: 80 * CGFloat(min(pct, 1.0)), height: 6)
            }
            
            Text("\(count)/100")
                .font(.system(size: 9, design: .monospaced))
                .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
        }
    }
    
    // Feature 1: Mood History/Journal view
    var journalView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Mood Journal")
                .font(.system(.title, design: .serif))
                .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
            
            Divider()
                .background(Color(red: 0.62, green: 0.58, blue: 0.50).opacity(0.3))
            
            if store.moodEntries.isEmpty {
                VStack(spacing: 12) {
                    Spacer()
                    Image(systemName: "book.closed")
                        .font(.system(size: 40))
                        .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                    Text("No past check-ins found. Complete a mood check-in to begin your journal.")
                        .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            } else {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(store.moodEntries) { entry in
                            VStack(alignment: .leading, spacing: 12) {
                                HStack(alignment: .center, spacing: 8) {
                                    Text(entry.date, style: .date)
                                        .font(.headline)
                                        .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                                    Text(entry.date, style: .time)
                                        .font(.subheadline)
                                        .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                                    
                                    Spacer()
                                    
                                    Text(entry.q1Selection)
                                        .font(.caption)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color(red: 0.11, green: 0.10, blue: 0.09))
                                        .cornerRadius(6)
                                        .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
                                    
                                    Button(action: {
                                        if let index = store.moodEntries.firstIndex(where: { $0.id == entry.id }) {
                                            store.deleteMoodEntry(at: IndexSet(integer: index))
                                        }
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                                    }
                                    .buttonStyle(.plain)
                                    .focusable(false)
                                    .help("Delete Entry")
                                }
                                
                                if !entry.writtenNote.isEmpty {
                                    Text("\"\(entry.writtenNote)\"")
                                        .font(.body.italic())
                                        .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("\(entry.verseArabic)")
                                        .font(.system(size: 18))
                                        .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .multilineTextAlignment(.trailing)
                                        .lineSpacing(4)
                                    
                                    Text("\"\(entry.verseEnglish)\" — \(entry.verseReference)")
                                        .font(.system(.subheadline, design: .serif))
                                        .foregroundColor(Color(red: 0.79, green: 0.66, blue: 0.30))
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    Text(entry.aiReflection)
                                        .font(.caption)
                                        .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
                                        .padding(.top, 4)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(16)
                                .background(Color(red: 0.11, green: 0.10, blue: 0.09))
                                .cornerRadius(8)
                            }
                            .padding(16)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(red: 0.15, green: 0.13, blue: 0.10).opacity(0.8))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(red: 0.79, green: 0.66, blue: 0.30).opacity(0.15), lineWidth: 1)
                            )
                        }
                    }
                    .padding(.top, 12)
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
        .padding(.top, 50)
        .background(Color(red: 0.11, green: 0.10, blue: 0.09).opacity(0.8))
    }
    
    private func deleteEntries(offsets: IndexSet) {
        store.deleteMoodEntry(at: offsets)
    }
    
    private func analyzeAndShowResult() {
        isLoading = true
        Task {
            let result = await GeminiService.shared.analyzeMood(
                q1: moodSelection,
                q2: weighingHeart,
                q3: needMost,
                note: customNote
            )
            
            await MainActor.run {
                // Save to history using store
                store.addMoodEntry(
                    q1: moodSelection,
                    q2: weighingHeart,
                    q3: needMost,
                    note: customNote,
                    arabic: result.arabic,
                    transliteration: result.transliteration,
                    english: result.english,
                    reference: "\(result.surah) \(result.ayah)",
                    reflection: result.reflection
                )
                
                self.resultVerse = result
                self.isLoading = false
            }
        }
    }
    
    private func loadOrRefreshDailyQuote() {
        let defaults = UserDefaults.standard
        let today = getTodayString()
        let savedDate = defaults.string(forKey: "dailyQuoteDate")
        
        if savedDate == today, let savedQuote = defaults.string(forKey: "dailyQuoteText") {
            self.dashboardQuote = savedQuote
        } else {
            selectAndSaveNewDailyQuote(today: today)
        }
    }
    
    private func selectAndSaveNewDailyQuote(today: String) {
        let defaults = UserDefaults.standard
        
        struct QuoteItem {
            let id: String
            let text: String
        }
        
        var allQuotes: [QuoteItem] = []
        
        for v in CuratedData.verses {
            allQuotes.append(QuoteItem(
                id: "verse:\(v.surah):\(v.ayah)",
                text: "\"\(v.textEnglish)\" — \(v.surah) \(v.ayah)"
            ))
        }
        
        for h in CuratedData.hadiths {
            allQuotes.append(QuoteItem(
                id: "hadith:\(h.source)",
                text: "\"\(h.textEnglish)\" — \(h.source)"
            ))
        }
        
        var shownIDs = defaults.stringArray(forKey: "shownQuoteIDs") ?? []
        var availableQuotes = allQuotes.filter { !shownIDs.contains($0.id) }
        
        if availableQuotes.isEmpty {
            shownIDs = []
            availableQuotes = allQuotes
        }
        
        if let selected = availableQuotes.randomElement() {
            self.dashboardQuote = selected.text
            shownIDs.append(selected.id)
            
            defaults.set(today, forKey: "dailyQuoteDate")
            defaults.set(selected.text, forKey: "dailyQuoteText")
            defaults.set(shownIDs, forKey: "shownQuoteIDs")
        }
    }
    
    private func getTodayString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
}

extension View {
    @ViewBuilder
    func removeTitleBarTitle() -> some View {
        if #available(macOS 15.0, *) {
            self.toolbar(removing: .title)
        } else {
            self
        }
    }
}

struct CustomOptionRow: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    @State private var isHovered = false
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85))
                Spacer()
                ZStack {
                    Circle()
                        .stroke(isSelected ? Color(red: 0.79, green: 0.66, blue: 0.30) : Color(red: 0.62, green: 0.58, blue: 0.50).opacity(0.3), lineWidth: 1.5)
                        .frame(width: 16, height: 16)
                    if isSelected {
                        Circle()
                            .fill(Color(red: 0.79, green: 0.66, blue: 0.30))
                            .frame(width: 8, height: 8)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? Color(red: 0.79, green: 0.66, blue: 0.30).opacity(0.1) : (isHovered ? Color(red: 0.18, green: 0.16, blue: 0.14) : Color(red: 0.11, green: 0.10, blue: 0.09)))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color(red: 0.79, green: 0.66, blue: 0.30).opacity(0.8) : Color(red: 0.62, green: 0.58, blue: 0.50).opacity(0.15), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
        .focusable(false)
        .onHover { hovering in
            isHovered = hovering
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static let defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}
