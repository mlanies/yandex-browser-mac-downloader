import Cocoa

let armURL = "https://browser.yandex.ru/download?partner_id=831050&banerid=1312898233&os=mac&arch=arm64"
let intelURL = "https://browser.yandex.ru/download?partner_id=831050&banerid=1312898233&os=mac&arch=x86_64"
let corpURL = "https://browser.yandex.ru/corp/builds?refid=5931838"

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let screenSize = NSScreen.main?.frame.size ?? CGSize(width: 600, height: 400)
        let windowSize = CGSize(width: 420, height: 370)
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
        label.frame = NSRect(x: 60, y: 280, width: 300, height: 24)
        label.alignment = .center
        window.contentView?.addSubview(label)

        let armButton = NSButton(title: "Скачать для Mac M1/M2/M3 (ARM)", target: self, action: #selector(downloadARM))
        armButton.frame = NSRect(x: 60, y: 230, width: 300, height: 32)
        window.contentView?.addSubview(armButton)

        let intelButton = NSButton(title: "Скачать для Mac Intel", target: self, action: #selector(downloadIntel))
        intelButton.frame = NSRect(x: 60, y: 185, width: 300, height: 32)
        window.contentView?.addSubview(intelButton)

        // Заголовок для корпоративной версии
        let corpLabel = NSTextField(labelWithString: "Яндекс.Браузер для организаций")
        corpLabel.frame = NSRect(x: 60, y: 135, width: 300, height: 24)
        corpLabel.alignment = .center
        corpLabel.font = NSFont.boldSystemFont(ofSize: 15)
        window.contentView?.addSubview(corpLabel)

        // Кнопка для корпоративной версии
        let corpButton = NSButton(title: "Скачать корпоративную версию", target: self, action: #selector(downloadCorp))
        corpButton.frame = NSRect(x: 60, y: 90, width: 300, height: 32)
        window.contentView?.addSubview(corpButton)
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

    @objc func downloadCorp() {
        if let url = URL(string: corpURL) {
            NSWorkspace.shared.open(url)
            NSApp.terminate(nil)
        }
    }
}

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run() 