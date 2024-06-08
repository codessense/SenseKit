//  Created by Yujin Kim on 2024-06-08.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UIViewController {
    /// 해당 옵저버를 리스너로 지정합니다.
    ///
    /// - Parameters:
    ///    - name: notification 이름입니다.
    ///    - selector: 알림과 함께 실행되는 Objective-C SEL 타입 포인터 입니다.
    func addNotificationObserver(name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
    
    /// 옵저버를 해제합니다.
    ///
    /// - Parameter name: notification 이름
    func removeNotificationObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
    }
    
    /// 모든 옵저버를 해제합니다.
    func removeNotificationObservers() {
        NotificationCenter.default.removeObserver(self)
    }
}
#endif
