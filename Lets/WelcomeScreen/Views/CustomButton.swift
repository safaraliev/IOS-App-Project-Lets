//
//  Untitled.swift
//  Lets
//
//  Created by baigeldi on 2/12/25.
//

import UIKit

class CustomButton: UIButton {

    enum FontSize {
        case big
        case med
        case small
    }
    
    var gradientLayer: CAGradientLayer!

    init(title: String, fontSize: FontSize, hasBackground: Bool) {
        super.init(frame: .zero)
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.textAlignment = .center
        
        self.backgroundColor = .clear
        
        if hasBackground {
            addGradientLayer()
        }
        
        let titleColor: UIColor = hasBackground ? UIColor(red: 250/255, green: 238/255, blue: 220/255, alpha: 1) : .black
        self.setTitleColor(titleColor, for: .normal)
        
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 22)
            
        case .med:
            self.titleLabel?.font = UIFont(name: "Nunito_SemiBold", size: 18)
            
        case .small:
            self.titleLabel?.font = UIFont(name: "Nunito_Regular", size: 16)
        }
        
        self.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
//        self.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
        
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = bounds
        gradientLayer?.cornerRadius = layer.cornerRadius
    }
    
//    Pressing animation
    @objc func buttonPressed() {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        } completion: { _ in
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
//            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
//                self.transform = CGAffineTransform(scaleX: 1, y: 1)
//            }, completion: nil)
        }

    }
    
    private func addGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(red: 230/255, green: 108/255, blue: 89/255, alpha: 1).cgColor, UIColor(red: 242/255, green: 165/255, blue: 80/255, alpha: 1).cgColor]
    
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.5, y: 0.5)
        gradient.frame = bounds
        
        layer.insertSublayer(gradient, at: 0)
        self.gradientLayer = gradient
        }
    

    
    func animateGradientChange() {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = gradientLayer?.colors
        animation.toValue = [UIColor(red: 242/255, green: 165/255, blue: 80/255, alpha: 1).cgColor, UIColor(red: 230/255, green: 108/255, blue: 89/255, alpha: 1).cgColor]
        animation.fillMode = .forwards
        animation.duration = 3.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        gradientLayer?.add(animation, forKey: "colorChange")
    }

    
}
