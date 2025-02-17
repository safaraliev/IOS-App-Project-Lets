import UIKit
class HomeVCLabel:UILabel{
    
     init(label: String) {
         super.init(frame: .zero)
         text = label
         font = UIFont(name: "Nunito-Black", size: 40)
         textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
