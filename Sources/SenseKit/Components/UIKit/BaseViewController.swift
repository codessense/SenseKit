//  Created by Yujin Kim on 2024-06-15.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

open class BaseViewController: UIViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLayouts()
        self.setConstraints()
        self.setIfNeededs()
    }
    
    open func setLayouts() {}
    
    open func setConstraints() {}
    
    open func setIfNeededs() {}
    
    open func deinitializes() {}
    
    deinit {
        self.deinitializes()
        
        #if DEBUG
        debugPrint("\(self) is deinitialized.")
        #endif
    }
}
#endif
