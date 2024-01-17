import Foundation
import UIKit

class PaddingTextField: UITextField {
    var padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 40)
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= 13 // oтталкиваем на 10 пойнтов от правого края
        return rect
    }
    
    func setBorderColor(_ color: UIColor) {
        self.layer.borderColor = CGColor(red: 191.0/255.0, green: 191.0/255.0, blue: 191.0/255.0, alpha: 1)
    }
}
