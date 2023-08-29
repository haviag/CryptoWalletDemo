//
//  CryptoDetailViewController.swift
//  CryptoWalletDemo
//
//  Created by Harold Villacob on 28/08/23.
//

import UIKit

class CryptoDetailViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 50, weight: .semibold)
        return label
    }()
    
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .medium)
        return label
    }()

    let statisticsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .natural
        return label
    }()
    
    let actualPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .medium)
        return label
    }()
    
    let cryptoTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(symbolLabel)
        stackView.addArrangedSubview(cryptoTypeLabel)
        stackView.addArrangedSubview(statisticsLabel)
        stackView.addArrangedSubview(actualPriceLabel)
        
        NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with viewModel: CryptoDetailViewModel) {
        titleLabel.text = viewModel.assetName
        symbolLabel.text = viewModel.assetID
        cryptoTypeLabel.text = viewModel.assetType
        statisticsLabel.text = viewModel.statistics
        actualPriceLabel.text = String(viewModel.currentPrice)
    }

}
