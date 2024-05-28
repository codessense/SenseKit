//  Created by Yujin Kim on 2024-05-28.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UILabel {
    func setLineHeight(to height: CGFloat) {
        if let text = self.text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = height
            style.minimumLineHeight = height
            
            let lineOffset = (height - self.font.lineHeight) / 4
            
            let attributes: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.paragraphStyle: style,
                NSAttributedString.Key.baselineOffset: lineOffset
            ]
            
            let attributeString = NSAttributedString(string: text, attributes: attributes)
            
            self.attributedText = attributeString
        }
    }
}
#endif
