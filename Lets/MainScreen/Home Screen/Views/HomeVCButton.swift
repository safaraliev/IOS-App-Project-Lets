import UIKit

class HomeVCButton: UIButton {

    init(image: UIImage) {
        super.init(frame: .zero)
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleToFill
        layer.cornerRadius = 18
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
