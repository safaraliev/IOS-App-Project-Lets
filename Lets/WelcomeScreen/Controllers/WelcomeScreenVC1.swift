//
//  WelcomScreenVC1.swift
//  Lets!
//
//  Created by baigeldi on 2/10/25.
//

import UIKit

class WelcomScreenVC1: UIViewController {
    
    var onboardingView: OnboardingView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()

        // Создаем и настраиваем OnboardingView
        onboardingView = OnboardingView(frame: view.bounds)
        onboardingView.configure(text: "LETS", image: UIImage(named: "image1")!, info: """
        Simplify the organization of your gatherings and enjoy time with your friends.
        """)

        // Добавляем его на экран
        view.addSubview(onboardingView)
    }
}
