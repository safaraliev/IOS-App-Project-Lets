import UIKit


class WelcomScreenVC3: UIViewController {
    
    var onboardingView: OnboardingView!
    
    let startButton = CustomButton(title: "Start", fontSize: .big, hasBackground: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        startButton.animateGradientChange()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        startButton.animateGradientChange()
    }

    
    private func setupUI(){
        onboardingView = OnboardingView(frame: view.bounds)
        onboardingView.configure(text: "LETS", image: UIImage(named: "image3")!, info: """
        Our app ensures that you never forget your planned meetings.
        """)

        startButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        view.addSubview(onboardingView)
        view.addSubview(startButton)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: onboardingView.infoLabel.bottomAnchor, constant: 50),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 240),
        ])

    }
    
    @objc func didTapButton(){
//        if let window = self.view.window{
//            window.rootViewController = LoginControllerVC()
//            window.makeKeyAndVisible()
        
        navigationController?.pushViewController(LoginControllerVC(), animated: true)
    }
    
}

