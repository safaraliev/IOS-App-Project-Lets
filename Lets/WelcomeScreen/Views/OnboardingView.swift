//
//  Untitled.swift
//  Lets
//
//  Created by baigeldi on 2/9/25.
//

import UIKit

class OnboardingView: UIView {

    let letsLabel = UILabel()
    let logoImage = UIImageView()
    let infoLabel = UILabel()

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

        infoLabel.textColor = .white
        infoLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        infoLabel.textAlignment = .center
        infoLabel.numberOfLines = 0
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        // Добавим элементы на экран
        addSubview(letsLabel)
        addSubview(logoImage)
        addSubview(infoLabel)

        // Ограничения для текста
        NSLayoutConstraint.activate([
            letsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            letsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 131),
            letsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            letsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])

        // Ограничения для изображения
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: letsLabel.bottomAnchor, constant: 60),
            logoImage.widthAnchor.constraint(equalToConstant: 200), // Ширина
            logoImage.heightAnchor.constraint(equalToConstant: 200) // Высота
        ])
        
        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 100),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
        ])
    }

    func configure(text: String, image: UIImage,info: String) {
        letsLabel.text = text
        logoImage.image = image
        infoLabel.text = info
    }
}
