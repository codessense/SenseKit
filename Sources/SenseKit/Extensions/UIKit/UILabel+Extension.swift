//  Created by Yujin Kim on 2024-05-28.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UILabel {
    /// `UILabel`의 텍스트 색상을 설정합니다.
    ///
    /// ```
    /// let label = UILabel()
    /// label.setFont(to: UIColor())
    /// ```
    func setTextColor(to color: UIColor?) {
        if let text = self.text {
            let nsRange = NSRange(location: 0, length: text.count)
            let color = color as Any
            
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: nsRange)
            
            self.attributedText = attributedString
        }
    }
    
    /// `UILabel`의 텍스트 폰트를 설정합니다.
    ///
    /// ```
    /// let label = UILabel()
    /// label.setFont(to: UIFont())
    /// ```
    func setTextFont(to font: UIFont) {
        if let text = self.text {
            let nsRange = NSRange(location: 0, length: text.count)
            
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: nsRange)
            
            self.attributedText = attributedString
        }
    }
    
    /// `UILabel`의 전체 텍스트 행 간격을 설정합니다.
    ///
    /// ```
    /// let label = UILabel()
    /// label.setLineSpacing(to: 13)
    /// ```
    func setLineSpacing(to spacing: CGFloat) {
        if let text = self.text {
            let style = NSMutableParagraphStyle()
            style.lineSpacing = spacing
            
            let nsRange = NSRange(location: 0, length: text.count)
            
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: nsRange)
            
            self.attributedText = attributedString
        }
    }
    
    /// `UILabel`의 텍스트 한 행의 높이를 설정합니다.
    ///
    /// ```
    /// let label = UILabel()
    /// label.setLineHeight(to: 13)
    /// ```
    func setLineHeight(to height: CGFloat) {
        if let text = self.text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = height
            style.minimumLineHeight = height
            
            let lineOffset = (height - self.font.lineHeight) / 2 + self.font.descender
            
            let attributes: [NSAttributedString.Key : Any] = [
                .paragraphStyle: style,
                .baselineOffset: lineOffset
            ]
            
            let attributeString = NSAttributedString(string: text, attributes: attributes)
            
            self.attributedText = attributeString
        }
    }
}
#endif
