//  Created by Yujin Kim on 2024-05-23.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public final class ApplicationManager {
    static let shared = ApplicationManager()
    static let external = ApplicationManager.External.self
    
    private init() {}
}

public extension ApplicationManager {
    enum External: String {
        case appStore
        case privacyPolicy
        case termsOfService
        
        private static var urls: [External : String] = [:]
        
        public var url: String {
            if let url = External.urls[self] {
                return url
            }
            
            return self.rawValue
        }
        
        public static func setURL(for type: External, to url: String) {
            External.urls[type] = url
        }
    }
}

public extension ApplicationManager {
    func getVersion() -> String? {
        if let infoPlist = Bundle.main.infoDictionary,
           let version = infoPlist["CFBundleShortVersionString"] as? String {
            return version
        }
        
        return nil
    }
    
    func openAppStore() {
        if let url = URL(string: External.appStore.url), UIApplication.shared.canOpenURL(url) {
            return UIApplication.shared.open(url)
        }
    }
    
    func openPrivacyPolicy() {
        if let url = URL(string: External.privacyPolicy.url), UIApplication.shared.canOpenURL(url) {
            return UIApplication.shared.open(url)
        }
    }
    
    func openTermsOfService() {
        if let url = URL(string: External.termsOfService.url), UIApplication.shared.canOpenURL(url) {
            return UIApplication.shared.open(url)
        }
    }
}
#endif
