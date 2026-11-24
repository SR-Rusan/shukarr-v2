import SwiftUI
import AppKit

class DhikrPanelController: NSWindowController, NSWindowDelegate {
    static var shared: DhikrPanelController?
    
    convenience init() {
        let panel = NSPanel(
            contentRect: NSRect(x: 150, y: 150, width: 340, height: 450),
            styleMask: [.titled, .closable, .fullSizeContentView, .nonactivatingPanel, .utilityWindow],
            backing: .buffered,
            defer: false
        )
        panel.level = .floating
        panel.isMovableByWindowBackground = true
        panel.titlebarAppearsTransparent = true
        panel.titleVisibility = .hidden
        panel.isOpaque = false
        panel.backgroundColor = NSColor.clear
        panel.isReleasedWhenClosed = false
        
        let contentView = FloatingDhikrView()
        
        let hostingView = NSHostingView(rootView: contentView)
        panel.contentView = hostingView
        
        self.init(window: panel)
        panel.delegate = self
        self.window?.center()
    }
    
    func windowWillClose(_ notification: Notification) {
        DhikrPanelController.shared = nil
    }
    
    static func show() {
        if shared == nil {
            shared = DhikrPanelController()
        }
        shared?.window?.makeKeyAndOrderFront(nil)
    }
}

struct FloatingDhikrView: View {
    @ObservedObject private var store = SakinaStore.shared
    @State private var activeIndex: Int = 0
    @State private var eventMonitor: Any? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Shukarr Daily Dhikr")
                    .font(.system(.headline, design: .serif))
                    .foregroundColor(Color(red: 0.95, green: 0.93, blue: 0.85)) // Cream
                Spacer()
                Button(action: {
                    DhikrPanelController.shared?.close()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)
            .padding(.top, 16)
            .padding(.bottom, 12)
            
            // Dhikr Items
            VStack(spacing: 12) {
                dhikrRow(title: "SubhanAllah", arabic: "سُبْحَانَ اللَّهِ", count: store.currentDhikrState.subhanallahCount, index: 0) {
                    if store.currentDhikrState.subhanallahCount < 100 {
                        store.currentDhikrState.subhanallahCount += 1
                        store.saveDhikr()
                    }
                }
                
                dhikrRow(title: "Alhamdulillah", arabic: "الْحَمْدُ لِلَّهِ", count: store.currentDhikrState.alhamdulillahCount, index: 1) {
                    if store.currentDhikrState.alhamdulillahCount < 100 {
                        store.currentDhikrState.alhamdulillahCount += 1
                        store.saveDhikr()
                    }
                }
                
                dhikrRow(title: "Allahu Akbar", arabic: "اللَّهُ أَكْبَرُ", count: store.currentDhikrState.allahuAkbarCount, index: 2) {
                    if store.currentDhikrState.allahuAkbarCount < 100 {
                        store.currentDhikrState.allahuAkbarCount += 1
                        store.saveDhikr()
                    }
                }
                
                dhikrRow(title: "La ilaha illallah", arabic: "لَا إِلَهَ إِلَّا اللَّهُ", count: store.currentDhikrState.laIlahaIllallahCount, index: 3) {
                    if store.currentDhikrState.laIlahaIllallahCount < 100 {
                        store.currentDhikrState.laIlahaIllallahCount += 1
                        store.saveDhikr()
                    }
                }
                
                dhikrRow(title: "Astaghfirullah", arabic: "أَسْتَغْفِرُ اللَّهَ", count: store.currentDhikrState.astaghfirullahCount, index: 4) {
                    if store.currentDhikrState.astaghfirullahCount < 100 {
                        store.currentDhikrState.astaghfirullahCount += 1
                        store.saveDhikr()
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Footer Control Instruction
            Text("Click row to increment count. Press SPACE to increment active row.")
                .font(.system(size: 10))
                .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
                .padding(.bottom, 12)
        }
        .frame(width: 340, height: 450)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 0.11, green: 0.10, blue: 0.09).opacity(0.95)) // Dark charcoal base
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 0.79, green: 0.66, blue: 0.30), lineWidth: 1.5) // Muted gold border
                )
        )
        .focusable()
        .onAppear {
            store.verifyAndResetDhikr()
            eventMonitor = NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
                guard let keyWindow = NSApp.keyWindow, keyWindow == DhikrPanelController.shared?.window else {
                    return event
                }
                if event.keyCode == 49 { // Spacebar
                    incrementActiveDhikr()
                    return nil // consume event
                } else if event.keyCode == 125 { // Down arrow
                    activeIndex = (activeIndex + 1) % 5
                    return nil
                } else if event.keyCode == 126 { // Up arrow
                    activeIndex = (activeIndex - 1 + 5) % 5
                    return nil
                }
                return event
            }
        }
        .onDisappear {
            if let monitor = eventMonitor {
                NSEvent.removeMonitor(monitor)
                eventMonitor = nil
            }
        }
    }
    
    private func incrementActiveDhikr() {
        switch activeIndex {
        case 0:
            if store.currentDhikrState.subhanallahCount < 100 { store.currentDhikrState.subhanallahCount += 1 }
        case 1:
            if store.currentDhikrState.alhamdulillahCount < 100 { store.currentDhikrState.alhamdulillahCount += 1 }
        case 2:
            if store.currentDhikrState.allahuAkbarCount < 100 { store.currentDhikrState.allahuAkbarCount += 1 }
        case 3:
            if store.currentDhikrState.laIlahaIllallahCount < 100 { store.currentDhikrState.laIlahaIllallahCount += 1 }
        case 4:
            if store.currentDhikrState.astaghfirullahCount < 100 { store.currentDhikrState.astaghfirullahCount += 1 }
        default:
            break
        }
        store.saveDhikr()
    }
    
    @ViewBuilder
    private func dhikrRow(title: String, arabic: String, count: Int, index: Int, action: @escaping () -> Void) -> some View {
        let isActive = activeIndex == index
        let isDone = count >= 100
        
        HStack(spacing: 12) {
            // Active Indicator Dot
            Circle()
                .fill(isActive ? Color(red: 0.79, green: 0.66, blue: 0.30) : Color.clear)
                .frame(width: 6, height: 6)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(isDone ? Color(red: 0.48, green: 0.62, blue: 0.49) : Color(red: 0.95, green: 0.93, blue: 0.85))
                
                Text(arabic)
                    .font(.system(size: 14))
                    .foregroundColor(Color(red: 0.62, green: 0.58, blue: 0.50))
            }
            
            Spacer()
            
            // Progress details
            HStack(spacing: 8) {
                Text("\(count)/100")
                    .font(.system(.callout, design: .monospaced))
                    .foregroundColor(isDone ? Color(red: 0.48, green: 0.62, blue: 0.49) : Color(red: 0.79, green: 0.66, blue: 0.30))
                
                Image(systemName: isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isDone ? Color(red: 0.48, green: 0.62, blue: 0.49) : Color(red: 0.62, green: 0.58, blue: 0.50))
                    .font(.title3)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isActive ? Color(red: 0.15, green: 0.13, blue: 0.10) : Color(red: 0.15, green: 0.13, blue: 0.10).opacity(0.4))
        )
        .onTapGesture {
            activeIndex = index
            action()
        }
    }
}
