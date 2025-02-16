import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {
    
    enum CustomTextFieldType {
        case username
        case email
        case number
        case password
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.textColor = .black
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        let placeholderColor = UIColor.lightGray
//        UIColor(red: 129/255, green: 133/255, blue: 130/255, alpha: 1)
        
        switch fieldType {
        case .username:
            self.attributedPlaceholder = NSAttributedString(
                string: "Username",
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )

        case .email:
            self.attributedPlaceholder = NSAttributedString(
                string: "Email Address",
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
            
        case .password:
            self.attributedPlaceholder = NSAttributedString(
                string: "Password",
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            
        case .number:
            self.attributedPlaceholder = NSAttributedString(
                string: "Number",
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )
            self.keyboardType = .numberPad
            self.textContentType = .telephoneNumber
        }
        
        self.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()  // Скрыть клавиатуру
        return true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
