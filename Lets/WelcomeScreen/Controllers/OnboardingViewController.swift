import UIKit

class OnboardingViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageViewController: UIPageViewController!
    let pages = [ WelcomScreenVC1(), WelcomScreenVC2(), WelcomScreenVC3(),]
    let pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
        setupPageControl()
        setGradientBackground()
    }

    // MARK: - Setup Methods

    func setupPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        if let firstVC = pages.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }

    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0

        // Цвет активной точки (белый)
        pageControl.currentPageIndicatorTintColor = .white

        // Цвет неактивных точек (полупрозрачный белый)
        pageControl.pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.5)

        // Увеличиваем размер точек
        pageControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)

        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)

        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    // MARK: - UIPageViewController DataSource

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index > 0 else { return nil }
        return pages[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else { return nil }
        return pages[index + 1]
    }

    // MARK: - UIPageViewController Delegate

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let currentVC = pageViewController.viewControllers?.first, let index = pages.firstIndex(of: currentVC) {
            pageControl.currentPage = index
        }
    }
}


extension UIViewController {
    func setGradientBackground(
        colors: [UIColor] = [
            UIColor(red: 125/255, green: 104/255, blue: 232/255, alpha: 1), // Первый цвет (RGB: 125, 104, 232)
            UIColor(red: 74/255, green: 54/255, blue: 183/255, alpha: 1)  // Второй цвет (RGB: 74, 54, 183)
        ],
        startPoint: CGPoint = CGPoint(x: 0.5, y: 0),
        endPoint: CGPoint = CGPoint(x: 0.5, y: 1)
    ) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
