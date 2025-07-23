import Cocoa

let armURL = "https://browser.yandex.ru/download?banerid=6400000000&referrer=appmetrica_tracking_id%3D389430554958814120%26ym_tracking_id%3D18110942918853339313&os=mac&arch=arm64&darktheme=1&portal_testids=1114258%2F-1%2C1114347%2F-1%2C1124063%2F-1%2C1127618%2F-1%2C1176504%2F-1&signature=WfEO3mlvFxnndnZmaFP0xj2JqbDYl%2F8sHn5Gmr9t2Rrec0wrY9uQEtxNAUCCoE5v%2FadEkBWfQCaQlOwv46pQUw%3D%3D"
let intelURL = "https://browser.yandex.ru/?banerid&referrer=appmetrica_tracking_id%3D389430554958814120%26ym_tracking_id%3D18110942918853339313#:~:text=MacOS%20(%D0%BF%D1%80%D0%BE%D1%86%D0%B5%D1%81%D1%81%D0%BE%D1%80%D1%8B%20Intel)"

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let screenSize = NSScreen.main?.frame.size ?? CGSize(width: 600, height: 400)
        let windowSize = CGSize(width: 420, height: 220)
        window = NSWindow(
            contentRect: NSRect(x: (screenSize.width - windowSize.width)/2,
                                y: (screenSize.height - windowSize.height)/2,
                                width: windowSize.width,
                                height: windowSize.height),
            styleMask: [.titled, .closable],
            backing: .buffered, defer: false)
        window.title = "Установка Яндекс.Браузера"
        window.makeKeyAndOrderFront(nil)

        let label = NSTextField(labelWithString: "Выберите версию для вашего Mac:")
        label.frame = NSRect(x: 60, y: 130, width: 300, height: 24)
        label.alignment = .center
        window.contentView?.addSubview(label)

        let armButton = NSButton(title: "Скачать для Mac M1/M2/M3 (ARM)", target: self, action: #selector(downloadARM))
        armButton.frame = NSRect(x: 60, y: 80, width: 300, height: 32)
        window.contentView?.addSubview(armButton)

        let intelButton = NSButton(title: "Скачать для Mac Intel", target: self, action: #selector(downloadIntel))
        intelButton.frame = NSRect(x: 60, y: 40, width: 300, height: 32)
        window.contentView?.addSubview(intelButton)
    }

    @objc func downloadARM() {
        if let url = URL(string: armURL) {
            NSWorkspace.shared.open(url)
            NSApp.terminate(nil)
        }
    }

    @objc func downloadIntel() {
        if let url = URL(string: intelURL) {
            NSWorkspace.shared.open(url)
            NSApp.terminate(nil)
        }
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run() 