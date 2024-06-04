//
//  UIStackView+Extension.swift
//
//
//  Created by Yujin Kim on 2024-06-04.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UIStackView {
    /// `UIStackView`에 여러 개의 subview를 배열 형태로 추가합니다.
    ///
    /// - Parameter views: `UIView` 배열
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { view in
            self.addArrangedSubview(view)
        }
    }
    
    /// `UIStackView`에 추가되어 있는 모든 subview를 한 번에 제거합니다.
    ///
    func removeArrangedSubviews() {
        if !self.arrangedSubviews.isEmpty {
            self.arrangedSubviews.forEach { view in
                self.removeArrangedSubview(view)
            }
        }
    }
}

public extension UIStackView {
    /// `UIStackView`에 subview와 속성 값을 파라미터로 전달해 함께 초기화합니다.
    ///     
    ///     let stackview = UIStackView(arrangedSubviews: [UIView(), UIView()], axis: .horizontal)
    convenience init(
        arrangedSubviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0.0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill
    ) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
}
#endif
