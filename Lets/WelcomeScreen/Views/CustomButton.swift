//
//  Untitled.swift
//  Lets
//
//  Created by baigeldi on 2/12/25.
//

import UIKit

class CustomButton: UIButton {

    // Переменные для кастомизации
    var gradientLayer: CAGradientLayer!

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.numberOfLines = 1
        self.backgroundColor = .clear
        self.layer.cornerRadius = 15
        self.translatesAutoresizingMaskIntoConstraints = false
        
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 119/255, green: 68/255, blue: 240/255, alpha: 0.7).cgColor,
            UIColor(red: 206/255, green: 196/255, blue: 231/255, alpha: 0.7).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.5, y: 0.5)
        self.layer.masksToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = self.bounds
        if gradientLayer.superlayer == nil {
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
