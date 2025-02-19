import UIKit

class HomeHorizontalColCell: UICollectionViewCell {


    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.layer.cornerRadius = bounds.width / 2
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = bounds.width / 2
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -1),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -1),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(image: UIImage?) {
        imageView.image = image
    }
}
