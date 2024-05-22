//  Created by Yujin Kim on 2024-05-20.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public final class PaddableLabel: UILabel {
    // MARK: - Properties
    //
    fileprivate var topInset: CGFloat
    fileprivate var leftInset: CGFloat
    fileprivate var bottomInset: CGFloat
    fileprivate var rightInset: CGFloat
    
    public override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += leftInset + rightInset
        contentSize.height += topInset + bottomInset
        
        return contentSize
    }
    
    public override func drawText(in rect: CGRect) {
        let edgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        
        super.drawText(in: rect.inset(by: edgeInsets))
    }
    
    // MARK: - Initializer
    //
    public init(edgeInsets topInset: CGFloat, _ leftInset: CGFloat, _ bottomInset: CGFloat, _ rightInset: CGFloat) {
        self.topInset = topInset
        self.leftInset = leftInset
        self.bottomInset = bottomInset
        self.rightInset = rightInset
        
        super.init(frame: .zero)
    }
    
    public init(topInset: CGFloat, leftInset: CGFloat, bottomInset: CGFloat, rightInset: CGFloat) {
        self.topInset = topInset
        self.leftInset = leftInset
        self.bottomInset = bottomInset
        self.rightInset = rightInset
        
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
#endif
