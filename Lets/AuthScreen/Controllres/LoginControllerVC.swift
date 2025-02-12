//
//  LoginControllerViewController.swift
//  Lets
//
//  Created by Нуридин Сафаралиев on 2/12/25.
//

import UIKit

class LoginControllerVC: UIViewController {

    
    let headerView = AuthHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradientBackground()
        
        setupUI()
    }
    
    func setupUI(){
        self.view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     headerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),])
    }
    
}
