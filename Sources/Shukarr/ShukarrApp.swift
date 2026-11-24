import SwiftUI
import AppKit

extension NSImage {
    func rounded(cornerRadius: CGFloat) -> NSImage {
        let image = NSImage(size: self.size)
        image.lockFocus()
        let rect = NSRect(origin: .zero, size: self.size)
        let path = NSBezierPath(roundedRect: rect, xRadius: cornerRadius, yRadius: cornerRadius)
        path.addClip()
        self.draw(in: rect, from: rect, operation: .sourceOver, fraction: 1.0)
        image.unlockFocus()
        return image
    }
}

@main
struct ShukarrApp: App {
    var body: some Scene {
        WindowGroup {
            MainDashboardView()
                .preferredColorScheme(.dark)
                .onAppear {
                    NotificationManager.shared.requestAuthorization()
                    NotificationManager.shared.scheduleDailyNotifications()
                    
                    // Set Dock Icon
                    if let iconUrl = Bundle.main.url(forResource: "AppIcon", withExtension: "png"),
                       let image = NSImage(contentsOf: iconUrl) {
                        let roundedImage = image.rounded(cornerRadius: image.size.width * 0.18)
                        NSApplication.shared.applicationIconImage = roundedImage
                    }
                    
                    // Hide main window title bar title text to prevent overlap
                    DispatchQueue.main.async {
                        for window in NSApplication.shared.windows {
                            if !(window is NSPanel) {
                                window.titleVisibility = .hidden
                                window.titlebarAppearsTransparent = true
                            }
                        }
                    }
                }
        }
        .windowStyle(.titleBar)
    }
}
