//
//  HomeTableViewCell.swift
//  Lets
//
//  Created by Нуридин Сафаралиев on 2/18/25.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "customeHomeCell"
    
    private let containerView: UIView = {
            let view = UIView()
            view.backgroundColor = .lightGray
            view.layer.cornerRadius = 12
            return view
        }()

        private let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            label.textColor = .white
            label.numberOfLines = 0
            return label
        }()

        private let subtitleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = .white.withAlphaComponent(0.8)
            label.numberOfLines = 0
            return label
        }()

        // MARK: - Init
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        // MARK: - Setup UI
        private func setupUI() {
            backgroundColor = .clear
            contentView.backgroundColor = .clear

            // Добавляем контейнер для контента
            contentView.addSubview(containerView)
            containerView.addSubview(titleLabel)
            containerView.addSubview(subtitleLabel)

            // Настройка констрейнтов
            containerView.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            subtitleLabel.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

                titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
                titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),

                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                subtitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
                subtitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
                subtitleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
            ])

            // Добавляем тень
            containerView.layer.shadowColor = UIColor.black.cgColor
            containerView.layer.shadowOpacity = 0.4
            containerView.layer.shadowOffset = CGSize(width: 1, height: 4)
            containerView.layer.shadowRadius = 5
        }

        // MARK: - Configure Cell
        func configure(with title: String, subtitle: String) {
            titleLabel.text = title
            subtitleLabel.text = subtitle
        }
}
