//  Created by Yujin Kim on 2024-05-20.
//  Copyright © 2024 Yujin Kim. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UIImageView {
    func setImage(with imageURL: URL) {
        DispatchQueue.global().async { [weak self] in
            guard let selfRef = self else { return }
            
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        selfRef.image = image
                    }
                }
            }
        }
    }
    
    func setImage(
        with imageURL: URL,
        contentMode: UIView.ContentMode = .scaleAspectFit,
        placeholder: UIImage? = nil,
        completion: ((UIImage?) -> Void)? = nil
    ) {
        self.image = placeholder
        self.contentMode = contentMode
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                #if DEBUG
                fatalError("\(#function) -- \(String(describing: error.localizedDescription))")
                #endif
            }
            
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completion?(nil)
                
                return
            }
            
            DispatchQueue.main.async { [unowned self] in
                self.image = image
                
                completion?(image)
            }
        }.resume()
    }
}
#endif
