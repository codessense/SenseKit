//  Created by Yujin Kim on 2024-05-19.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UICollectionView {
    enum SupplementaryViewOfKind: CustomStringConvertible {
        case header
        case footer
        
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
    func register<C: UICollectionViewCell>(withClass name: C.Type) {
        self.register(C.self, forCellWithReuseIdentifier: String(describing: name))
    }
    
    func register<V: UICollectionReusableView>(withClass name: V.Type, supplementaryViewOfKind kind: SupplementaryViewOfKind) {
        self.register(V.self, forSupplementaryViewOfKind: kind.description, withReuseIdentifier: String(describing: name))
    }
    
    func dequeueReusableCell<C: UICollectionViewCell>(withClass name: C.Type, for indexPath: IndexPath) -> C {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? C else {
            #if DEBUG
            fatalError("\(#function) -- Not found \(String(describing: name)), make sure the cells are registered in the collection view.")
            #endif
        }
        
        return cell
    }
    
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
