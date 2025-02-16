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
    private let signInButton = CustomButton(title: "Sign In", fontSize: .big, hasBackground: true)
    private let newUserButton = CustomButton(title: "New User? Create account.", fontSize: .med, hasBackground: false)
    private let forgotPasswordButton = CustomButton(title: "Forgot Password?", fontSize: .small, hasBackground: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradientBackground()
        
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
        newUserButton.addTarget(self, action: #selector(didTapNewUserButton), for: .touchUpInside)
        
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        self.view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        setupUI()
        
    }
   
    func setupUI(){        
        self.view.addSubview(headerView)
        self.view.addSubview(numberField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signInButton)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        numberField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            newUserButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            newUserButton.heightAnchor.constraint(equalToConstant: 44),
            newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 10),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    @objc private func didTapSignIn(){
        
        if let window = self.view.window{
            let vc = HomeTabBarController()
            window.rootViewController = vc
            window.makeKeyAndVisible()
        }
        
    }
    
    @objc private func didTapNewUserButton(){
        let vc = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func didTapForgotPassword(){
        let vc = ForgotPasswordVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapView() {
        self.view.endEditing(true)
    }
    
    @objc private func handleKeyboard(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        let keyboardHeight = keyboardFrame.height
        
        let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
        
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = isKeyboardShowing ? -keyboardHeight / 2 : 0
        }
    }
    
}
