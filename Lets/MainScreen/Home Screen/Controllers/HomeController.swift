
import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var letsLabel = HomeVCLabel(label: "Lets")
    var chatButton = HomeVCButton(image: UIImage(named: "chatImage")!)
    var searchButton = HomeVCButton(image: UIImage(named: "searchImage")!)
    var publishButton = HomeVCButton(image: UIImage(named: "publishImage")!)
    
    var collectionView: UICollectionView!
    
    let images = [UIImage(systemName: "square"), UIImage(systemName: "square"), UIImage(systemName: "square"), UIImage(systemName: "square"),UIImage(systemName: "square"), UIImage(systemName: "square"), UIImage(systemName: "square"), UIImage(systemName: "square"),UIImage(systemName: "square"), UIImage(systemName: "square"), UIImage(systemName: "square"), UIImage(systemName: "square"),UIImage(systemName: "square"), UIImage(systemName: "square"), UIImage(systemName: "square"), UIImage(systemName: "square")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setGradientBackground()
        setupHomeUI()
        setupCollectionView()
    }
    
    
    private func setupHomeUI() {
        view.addSubview(letsLabel)
        view.addSubview(chatButton)
        view.addSubview(searchButton)
        view.addSubview(publishButton)
        
        letsLabel.translatesAutoresizingMaskIntoConstraints = false
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        publishButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            letsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            letsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            
            chatButton.centerYAnchor.constraint(equalTo: letsLabel.centerYAnchor),
            chatButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            chatButton.widthAnchor.constraint(equalToConstant: 36),
            chatButton.heightAnchor.constraint(equalToConstant: 36),
            
            searchButton.centerYAnchor.constraint(equalTo: chatButton.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: chatButton.leadingAnchor, constant: -15),
            searchButton.widthAnchor.constraint(equalToConstant: 36),
            searchButton.heightAnchor.constraint(equalToConstant: 36),
            
            publishButton.centerYAnchor.constraint(equalTo: chatButton.centerYAnchor),
            publishButton.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -15),
            publishButton.widthAnchor.constraint(equalToConstant: 36),
            publishButton.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    // MARK: - UICollectionView Setup
    
    private func setupCollectionView() {
        // Создаем layout для коллекции с горизонтальной прокруткой
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal  // Устанавливаем горизонтальную прокрутку
        layout.itemSize = CGSize(width: 65, height: 65)  // Ширина ячейки
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        // Создаем UICollectionView с созданным layout
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .red  // Устанавливаем прозрачный фон
        
        // Отключаем отображение горизонтального ползункa
        collectionView.showsHorizontalScrollIndicator = false
        
        // Регистрируем кастомную ячейку
        collectionView.register(HomeHorizontalColCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        // Добавляем collectionView на экран
        view.addSubview(collectionView)
        
        // Устанавливаем constraints для UICollectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: letsLabel.bottomAnchor, constant: 20),  // Под лейблом
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 70)  // Высота для коллекции
        ])
        
        // Перезагружаем данные в коллекции
        collectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Декью повторно используемую ячейку
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! HomeHorizontalColCell
        
        // Настроим данные ячейки
        cell.configureCell(image: images[indexPath.row])
        
        return cell
    }
    
}
