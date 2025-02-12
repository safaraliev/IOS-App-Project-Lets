//
//  AuthHeaderView.swift
//  Lets
//
//  Created by Нуридин Сафаралиев on 2/12/25.
//

import UIKit

class AuthHeaderView: UIView {
    
    private let appLabel: UILabel = {
        let label = UILabel()
        label.text = "Lets"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .green
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(appLabel)

        appLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([appLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
                                     appLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     appLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                    ])

    }
    
}
