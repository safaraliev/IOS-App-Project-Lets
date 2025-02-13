//
//  LoginControllerViewController.swift
//  Lets
//
//  Created by Нуридин Сафаралиев on 2/12/25.
//

import UIKit

class LoginControllerVC: UIViewController {

    
    private let headerView = AuthHeaderView(title: "Sign In")
    private let numberField = CustomTextField(fieldType: .number)
    private let passwordField = CustomTextField(fieldType: .password)
    private let signInButton = CustomButton(title: "Sign In", fontSize: .med, hasBackground: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradientBackground()
        setupUI()
    }
   
    func setupUI(){        
        self.view.addSubview(headerView)
        self.view.addSubview(numberField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signInButton)

        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        numberField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4),
            
            numberField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 102),
            numberField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            numberField.widthAnchor.constraint(equalToConstant: 240),
            numberField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: numberField.bottomAnchor, constant: 32),
            passwordField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 240),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 32),
            signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 240),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
        
    }
}
