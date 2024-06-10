//  Created by Yujin Kim on 2024-05-19.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UICollectionView {
    /// `UICollectionView`의 보조 뷰 유형입니다.
    ///
    enum SupplementaryViewOfKind: CustomStringConvertible {
        /// 섹션 헤더
        ///
        case header
        /// 섹션 푸터
        ///
        case footer
        
        /// 보조 뷰 유형에 따른 identifier를 반환합니다.
        ///
        public var description: String {
            switch self {
            case .header:
                return UICollectionView.elementKindSectionHeader
            case .footer:
                return UICollectionView.elementKindSectionFooter
            }
        }
    }
}

public extension UICollectionView {
    /// `UICollectionViewCell` 클래스를 `UICollectionView`에 등록합니다.
    ///
    /// - Parameter name: 등록할 `UICollectionViewCell` 타입
    func register<C: UICollectionViewCell>(withClass name: C.Type) {
        self.register(C.self, forCellWithReuseIdentifier: String(describing: name))
    }
    
    /// `UICollectionReusableView` 클래스를 `UICollectionView`의 보조 뷰로 등록합니다.
    ///
    /// - Parameters:
    ///  - name: 등록할 `UICollectionReusableView` 타입
    ///  - kind: 등록할 보조 뷰의 유형
    func register<V: UICollectionReusableView>(withClass name: V.Type, supplementaryViewOfKind kind: SupplementaryViewOfKind) {
        self.register(V.self, forSupplementaryViewOfKind: kind.description, withReuseIdentifier: String(describing: name))
    }
    
    /// 재사용 가능한 `UICollectionViewCell` 클래스 인스턴스를 컬렉션 뷰에서 재사용합니다.
    ///
    /// - Parameters:
    ///   - name: 재사용할 `UICollectionViewCell` 클래스 타입
    ///   - indexPath: 재사용할 셀의 인덱스
    /// - Returns: `UICollectionViewCell` 하위 클래스의 인스턴스
    func dequeueReusableCell<C: UICollectionViewCell>(withClass name: C.Type, for indexPath: IndexPath) -> C {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? C else {
            #if DEBUG
            fatalError("\(#function) -- Not found \(String(describing: name)), make sure the cells are registered in the collection view.")
            #endif
        }
        
        return cell
    }
    
    /// 재사용 가능한 `UICollectionReusableView` 클래스 인스턴스를 컬렉션 뷰의 보조 뷰로 재사용합니다.
    ///
    /// - Parameters:
    ///   - name: 재사용할 `UICollectionReusableView` 클래스 타입
    ///   - kind: 재사용할 보조 뷰의 유형
    ///   - indexPath: 재사용할 보조 뷰의 인덱스
    /// - Returns: `UICollectionReusableView` 하위 클래스의 인스턴스
    func dequeueSupplementaryView<V: UICollectionReusableView>(
        withClass name: V.Type,
        supplementaryViewOfKind kind: SupplementaryViewOfKind,
        for indexPath: IndexPath
    ) -> V {
        guard let view = self.dequeueReusableSupplementaryView(ofKind: kind.description, withReuseIdentifier: String(describing: name), for: indexPath) as? V else {
            #if DEBUG
            fatalError("\(#function) -- Not found \(String(describing: name)), make sure the cells are registered in the collection view.")
            #endif
        }
        
        return view
    }
    
    /// 컬렉션 뷰를 지정된 아이템으로 안전하게 스크롤합니다.
    ///
    /// - Parameters:
    ///   - indexPath: 스크롤할 아이템의 인덱스
    ///   - scrollPosition: 아이템의 스크롤 위치
    ///   - animated: 스크롤 애니메이션 처리 여부
    func scrollToItemSafety(
        at indexPath: IndexPath,
        at scrollPosition: UICollectionView.ScrollPosition,
        animated: Bool
    ) {
        guard indexPath.item >= 0,
              indexPath.section >= 0,
              indexPath.section < self.numberOfSections,
              indexPath.item < self.numberOfItems(inSection: indexPath.section) else { return }
              
        self.scrollToItem(at: indexPath, at: scrollPosition, animated: true)
    }
}
#endif
