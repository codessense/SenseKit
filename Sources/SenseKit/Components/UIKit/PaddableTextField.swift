//  Created by Yujin Kim on 2024-05-22.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/// 가장자리 여백을 설정할 수 있는 UITextField의 서브클래스
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
    /// 사용자가 정의한 동일한 가장자리 여백 값으로 PaddableTextField를 초기화하고 생성합니다.
    ///
    /// - Parameter inset: 모든 가장자리에 적용할 여백 값
    public init(equalToInset inset: CGFloat) {
        self.edgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        super.init(frame: .zero)
    }
    
    /// 사용자가 정의한 가장자리 여백 값으로 PaddableTextField를 초기화하고 생성합니다.
    ///
    /// - Parameters:
    ///   - topInset: 상단 가장자리 여백 값
    ///   - leftInset: 왼쪽 가장자리 여백 값
    ///   - bottomInset: 하단 가장자리 여백 값
    ///   - rightInset: 오른쪽 가장자리 여백 값
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
