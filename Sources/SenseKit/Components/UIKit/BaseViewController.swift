//  Created by Yujin Kim on 2024-06-15.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

open class BaseViewController<M>: UIViewController {
    open var viewModel: M?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLayouts()
        self.setConstraints()
        self.setIfNeededs()
    }
    
    // MARK: Custom methods
    //
    open func setLayouts() {}
    
    open func setConstraints() {}
    
    open func setIfNeededs() {}
    
    open func deinitializes() {}
    
    // MARK: Initializer
    //
    public init(viewModel: M? = nil) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        self.deinitializes()
        
        #if DEBUG
        debugPrint("\(self) is deinitialized.")
        #endif
    }
}
#endif
