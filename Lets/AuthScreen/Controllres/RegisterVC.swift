//
//  LoginControllerViewController.swift
//  Lets
//
//  Created by Нуридин Сафаралиев on 2/12/25.
//

import UIKit

class RegisterVC: UIViewController {

    
    let headerView = AuthHeaderView(title: "Register")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradientBackground()
        setupUI()
    }
   
    func setupUI(){
        self.view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4),
        ])
    }
}
