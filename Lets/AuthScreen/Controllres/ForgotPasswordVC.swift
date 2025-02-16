//
//  LoginControllerViewController.swift
//  Lets
//
//  Created by Нуридин Сафаралиев on 2/12/25.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    
    private let headerView = AuthHeaderView(title: "Reset Password")
    private let emailField = CustomTextField(fieldType: .email)
    private let resetPasswordButton = CustomButton(title: "Reset Password", fontSize: .big, hasBackground: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradientBackground()
        self.resetPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        self.view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        setupUI()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
   
    func setupUI(){
        if let nav = self.navigationController{
            nav.navigationBar.tintColor = .white
        }
        
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(resetPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4),
            
            emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 102),
            emailField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: 240),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            resetPasswordButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 32),
            resetPasswordButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            resetPasswordButton.widthAnchor.constraint(equalToConstant: 240),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func didTapForgotPassword() {
//        let email = self.emailField.text ?? ""
//        navigationController?.popToRootViewController(animated: true)
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

