//
//  LoginControllerViewController.swift
//  Lets
//
//  Created by Нуридин Сафаралиев on 2/12/25.
//

import UIKit

class RegisterVC: UIViewController {

    let headerView = AuthHeaderView(title: "Register")
    let numberField = CustomTextField(fieldType: .number)
    let passwordField = CustomTextField(fieldType: .password)
    let repeatPasswordField = CustomTextField(fieldType: .password)
    let signUpButton = CustomButton(title: "Sign Up", fontSize: .big, hasBackground: true)
    let signInButton = CustomButton(title: "Already have an account? Sign In.", fontSize: .med, hasBackground: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradientBackground()
        
        signUpButton.addTarget(self, action: #selector(didTapSignpButton), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        self.view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
   
    func setupUI(){
        
        self.view.addSubview(headerView)
        self.view.addSubview(numberField)
        self.view.addSubview(passwordField)
        self.view.addSubview(repeatPasswordField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(signInButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        numberField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        repeatPasswordField.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
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
            
            repeatPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 32),
            repeatPasswordField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            repeatPasswordField.widthAnchor.constraint(equalToConstant: 240),
            repeatPasswordField.heightAnchor.constraint(equalToConstant: 50),
            
            signUpButton.topAnchor.constraint(equalTo: repeatPasswordField.bottomAnchor, constant: 32),
            signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 240),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            
            signInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 10),
            signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    @objc private func didTapSignInButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapSignpButton(){
        navigationController?.popViewController(animated: true)
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
