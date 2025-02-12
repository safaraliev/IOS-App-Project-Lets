import UIKit


class WelcomScreenVC3: UIViewController {
    
    var onboardingView: OnboardingView!
    let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()

        // Создаем и настраиваем OnboardingView
        onboardingView = OnboardingView(frame: view.bounds)
        onboardingView.configure(text: "LETS", image: UIImage(named: "image3")!, info: """
        Our app ensures that you never forget your planned meetings.
        """)

        // Добавляем его на экран
        view.addSubview(onboardingView)
        view.addSubview(startButton)
        setupButtonStart()
    }

    private func setupButtonStart() {
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.white, for: .normal) // Устанавливаем цвет текста кнопки
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold) // Устанавливаем шрифт
        startButton.titleLabel?.textAlignment = .center
        startButton.titleLabel?.numberOfLines = 1
        startButton.backgroundColor = .red // Цвет фона кнопки
        startButton.layer.cornerRadius = 15 // Углы кнопки (опционально)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        

        // Ограничения для кнопки
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // По центру по горизонтали
            startButton.topAnchor.constraint(equalTo: onboardingView.infoLabel.bottomAnchor, constant: 50), // Отступ от OnboardingView
            startButton.heightAnchor.constraint(equalToConstant: 50), // Высота кнопки
            startButton.widthAnchor.constraint(equalToConstant: 240),
        ])
        
        // Создаем градиент с прозрачностью
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 119/255, green: 68/255, blue: 240/255, alpha: 0.7).cgColor, // Первый цвет
            UIColor(red: 206/255, green: 196/255, blue: 231/255, alpha: 0.7).cgColor // Второй цвет
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.5, y: 0.5)

        // Устанавливаем фрейм для градиента после того как кнопка получит фрейм
        startButton.layoutIfNeeded()
        gradientLayer.frame = startButton.bounds
        startButton.layer.cornerRadius = 15
        startButton.layer.masksToBounds = true // Важный параметр, чтобы градиент не выходил за границы кнопки

        // Применяем градиентный слой на кнопку
        startButton.layer.insertSublayer(gradientLayer, at: 0)
    }
}

