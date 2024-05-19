//  Created by Yujin Kim on 2024-05-19.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    /// 부모 `UIViewController`를 찾습니다.
    ///
    /// - Returns: `UIViewController` or `nil`
    var parentViewController: UIViewController? {
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        
        return nil
    }
}

public extension UIView {
    /// `UIView`에 여러 개의 subview를 배열 형태로 추가합니다.
    ///
    /// - Parameter views: `UIView` 배열
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
    
    /// `UIView`를 원형으로 만듭니다.
    ///
    /// - Parameter diameter: 동일한 너비와 높이 값
    func makeCircle(diameter: CGFloat) {
        self.bounds.size.width = diameter
        self.bounds.size.height = diameter
        self.layer.cornerRadius = diameter / 2
        self.clipsToBounds = true
    }
}
#endif
