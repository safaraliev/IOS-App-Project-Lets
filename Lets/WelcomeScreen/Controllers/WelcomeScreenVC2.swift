import UIKit


class WelcomScreenVC2: UIViewController {
    
    var onboardingView: OnboardingView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()

        // Создаем и настраиваем OnboardingView
        onboardingView = OnboardingView(frame: view.bounds)
        onboardingView.configure(text: "LETS", image: UIImage(named: "image2")!, info: """
        Select convenient date and plan activities together
        """)

        // Добавляем его на экран
        view.addSubview(onboardingView)
    }
    
}
