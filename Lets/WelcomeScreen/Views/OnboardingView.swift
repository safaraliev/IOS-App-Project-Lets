//
//  Untitled.swift
//  Lets
//
//  Created by baigeldi on 2/9/25.
//

import UIKit

class OnboardingView: UIView {

    private let letsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Nunito-Black", size: 40)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Nunito-SemiBold", size: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {

        letsLabel.translatesAutoresizingMaskIntoConstraints = false
        logoImage.translatesAutoresizingMaskIntoConstraints = false


        infoLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(letsLabel)
        addSubview(logoImage)
        addSubview(infoLabel)

        NSLayoutConstraint.activate([
            letsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            letsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 131),
            letsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            letsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: letsLabel.bottomAnchor, constant: 60),
            logoImage.widthAnchor.constraint(equalToConstant: 200),
            logoImage.heightAnchor.constraint(equalToConstant: 200)
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
