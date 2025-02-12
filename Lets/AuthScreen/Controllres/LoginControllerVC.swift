//
//  LoginControllerViewController.swift
//  Lets
//
//  Created by Нуридин Сафаралиев on 2/12/25.
//

import UIKit

class LoginControllerVC: UIViewController {

    
    var headerView: AuthHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setGradientBackground()
//        headerView = AuthHeaderView(frame: view.bounds)
//        headerView.configure(text: "LETS", image: UIImage(named: "image1")!)
//        view.addSubview(headerView)
        
        setupUI()
    }
   
    func setupUI(){
        headerView = AuthHeaderView()
        headerView.configure(text: "LETS", image: UIImage(named: "image1")!)
        view.addSubview(headerView)
        headerView.backgroundColor = .green
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
    }
}
