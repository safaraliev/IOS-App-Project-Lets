

//import UIKit
//
//class AuthHeaderView: UIView {
//
//    private let appLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Lets"
//        label.textAlignment = .center
//        label.textColor = .white
//        label.font = UIFont.systemFont(ofSize: 40)
//        return label
//    }()
//
//
//
//    init() {
//        super.init(frame: .zero)
//        self.backgroundColor = .green
//        setupUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupUI() {
//        self.addSubview(appLabel)
//
//        appLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([appLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
//                                     appLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//                                     appLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//                                    ])
//
//    }
//
//}

import UIKit

class AuthHeaderView : UIView {

    let letsLabel = UILabel()
    let logoImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        // Настроим текстовую метку
        letsLabel.textColor = .white
        letsLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        letsLabel.textAlignment = .center
        letsLabel.numberOfLines = 0
        letsLabel.translatesAutoresizingMaskIntoConstraints = false

        // Настроим изображение
        logoImage.contentMode = .scaleAspectFill
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(letsLabel)
        addSubview(logoImage)

        // Ограничения для текста
        NSLayoutConstraint.activate([
            letsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            letsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 65),
            letsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            letsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: letsLabel.bottomAnchor, constant: 32),
            logoImage.widthAnchor.constraint(equalToConstant: 170), // Ширина
            logoImage.heightAnchor.constraint(equalToConstant: 170) // Высота
        ])
        
    }
    
    func configure(text: String, image: UIImage) {
        letsLabel.text = text
        logoImage.image = image
    }
}

