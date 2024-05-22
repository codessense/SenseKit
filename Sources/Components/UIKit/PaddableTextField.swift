//  Created by Yujin Kim on 2024-05-22.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public final class PaddableTextField: UITextField {
    // MARK: Properties
    //
    fileprivate var edgeInsets: UIEdgeInsets
    
    public override var intrinsicContentSize: CGSize {
        let contentSize = super.intrinsicContentSize
        
        let width = contentSize.width + edgeInsets.left + edgeInsets.right
        let height = contentSize.height + edgeInsets.top + edgeInsets.bottom
        
        return CGSize(width: width, height: height)
    }
    
    // MARK: - Override methods
    //
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: edgeInsets)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: edgeInsets)
    }
    
    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: edgeInsets)
    }
    
    // MARK: - Initializer
    //
    public init(equalTo inset: CGFloat) {
        self.edgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        super.init(frame: .zero)
    }
    
    public init(edgeInsets topInset: CGFloat, _ leftInset: CGFloat, _ bottomInset: CGFloat, _ rightInset: CGFloat) {
        self.edgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
#endif
