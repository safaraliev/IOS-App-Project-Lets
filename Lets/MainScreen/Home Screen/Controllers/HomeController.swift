
import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var letsLabel = HomeVCLabel(label: "Lets")
    var chatButton = HomeVCButton(image: UIImage(named: "chatImage")!)
    var searchButton = HomeVCButton(image: UIImage(named: "searchImage")!)
    var publishButton = HomeVCButton(image: UIImage(named: "publishImage")!)
    
    var collectionView: UICollectionView!
    var tableView: UITableView!
    
    var userName = "New User"
    var meetingCount = 0
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-SemiBold", size: 30)
        label.textColor = .white
        return label
    }()

    let todayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito-Light", size: 20)
        label.textColor = UIColor(red: 179/255, green: 185/255, blue: 232/255, alpha: 1)
        return label
    }()
    
    let images = [UIImage(named: "profilePhoto1"),UIImage(named: "profilePhoto2"),UIImage(named: "profilePhoto3"),UIImage(named: "profilePhoto4"),UIImage(named: "profilePhoto5"),UIImage(named: "profilePhoto6"),UIImage(named: "profileNoPic"),UIImage(named: "profileNoPic"),UIImage(named: "profileNoPic"),UIImage(named: "profileNoPic"),]

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setupCollectionView()
        setupTableVIew()
        setupHomeUI()
        greetingLabel.text = "Hi \(userName)!"
        todayLabel.text = "You have \(meetingCount) meetings today"
    }
    
    
//    MARK: Setup UI
    private func setupHomeUI() {
        view.addSubview(letsLabel)
        view.addSubview(chatButton)
        view.addSubview(searchButton)
        view.addSubview(publishButton)
        view.addSubview(collectionView)
        view.addSubview(greetingLabel)
        view.addSubview(todayLabel)
        view.addSubview(tableView)
        
        letsLabel.translatesAutoresizingMaskIntoConstraints = false
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        publishButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            letsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
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
            publishButton.heightAnchor.constraint(equalToConstant: 36),
            
            collectionView.topAnchor.constraint(equalTo: letsLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 70),
            
            greetingLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            greetingLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            todayLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 5),
            todayLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
    }
    
    // MARK: - UICollectionView Setup
    
    private func setupCollectionView() {
        // Создаем layout для коллекции с горизонтальной прокруткой
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal  // Устанавливаем горизонтальную прокрутку
        layout.itemSize = CGSize(width: 66, height: 66)  // Ширина ячейки
        layout.sectionInset.left = 10
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        // Создаем UICollectionView с созданным layout
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear  // Устанавливаем прозрачный фон
        
        // Отключаем отображение горизонтального ползункa
        collectionView.showsHorizontalScrollIndicator = false
        
        // Регистрируем кастомную ячейку
        collectionView.register(HomeHorizontalColCell.self, forCellWithReuseIdentifier: "CustomCell")
        
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
    
//    MARK: UITableView Setup
    
    private func setupTableVIew(){
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            fatalError("HomeVC cannot initialie custome HomeTableCell")
        }
        cell.configure(with: "Tile", subtitle: "Subtitle")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}
