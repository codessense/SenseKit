//  Created by Yujin Kim on 2024-05-19.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UITableView {
    /// UITableViewCell 서브클래스를 UITableView에 등록합니다.
    ///
    /// - Parameters:
    ///     - name: UITableViewCell 서브클래스 타입
    func register<C: UITableViewCell>(withClass name: C.Type) {
        self.register(C.self, forCellReuseIdentifier: String(describing: name))
    }
    
    /// UITableViewCell을 재사용하여 UITableViewCell 서브클래스 인스턴스를 반환합니다.
    ///
    /// - Parameters:
    ///     - name: UITableViewCell 서브클래스 타입
    /// - Returns: UITableViewCell 서브클래스 인스턴스
    func dequeueReusableCell<C: UITableViewCell>(withClass name: C.Type) -> C {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: name)) as? C else {
            #if DEBUG
            fatalError("\(#function) -- Not found \(String(describing: name)), make sure the cells are registered in the table view.")
            #endif
            return .init()
        }
        
        return cell
    }
    
    /// UITableViewCell을 재사용하여 UITableViewCell 서브클래스 인스턴스를 반환합니다.
    ///
    /// - Parameters:
    ///     - name: UITableViewCell 서브클래스 타입
    ///     - indexPath: IndexPath
    /// - Returns: UITableViewCell 서브클래스 인스턴스
    func dequeueReusableCell<C: UITableViewCell>(withClass name: C.Type, for indexPath: IndexPath) -> C {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? C else {
            #if DEBUG
            fatalError("\(#function) -- Not found \(String(describing: name)), make sure the cells are registered in the table view.")
            #endif
            return .init()
        }
        
        return cell
    }
    
    /// IndexPath가 유효한지 확인한 후 안전하게 해당 IndexPath로 스크롤합니다.
    ///
    /// - Parameters:
    ///     - indexPath: 스크롤할 IndexPath
    ///     - scrollPosition: 스크롤 위치
    ///     - animated: 애니메이션 여부
    func scrollToRowSafety(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard indexPath.section < self.numberOfSections else { return }
        guard indexPath.row < self.numberOfRows(inSection: indexPath.section) else { return }
        
        self.scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
}
#endif
