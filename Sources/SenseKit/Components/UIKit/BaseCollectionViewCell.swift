//  Created by Yujin Kim on 2024-05-28.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit)
import UIKit

open class BaseCollectionViewCell<M>: UICollectionViewCell {
    // MARK: Properties
    //
    internal static var identifier: String {
        return String(describing: self)
    }
    
    internal var model: M? {
        didSet {
            guard let model = self.model else {
                debugPrint("\(String(describing: self.reuseIdentifier)) -- Cell model is not available.")
                
                return
            }
            
            self.bind(model)
            
            debugPrint("\(String(describing: self.reuseIdentifier)) -- Cell model is available.")
        }
    }
    
    // MARK: Initializer
    //
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func bind(_ model: M) {}
    
    internal func setLayouts() {}
    
    internal func setConstraints() {}
}
#endif
