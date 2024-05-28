//  Created by Yujin Kim on 2024-05-28.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UILabel {
    func setFont(to font: UIFont) {
        if let text = self.text {
            let nsRange = NSRange(location: 0, length: text.count)
            
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: nsRange)
            
            self.attributedText = attributedString
        }
    }
    
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
