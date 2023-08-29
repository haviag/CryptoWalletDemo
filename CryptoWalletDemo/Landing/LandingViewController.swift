//
//  LandingViewController.swift
//  CryptoWalletDemo
//
//  Created by Harold Villacob on 28/08/23.
//

import UIKit

class LandingViewController: UIViewController {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to CryptoWallet!"
        label.font = .systemFont(ofSize: 34, weight: .semibold)
        label.textAlignment = .natural
        label.numberOfLines = 0
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "If you are creating a new wallet press the GENERATE button. Take note of the mnemonic phrase, it should be stored in a safe place."
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ut leo mauris. Fusce mattis augue pretium magna convallis venenatis. Ut quis sollicitudin risus."
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let generateNewWalletButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GENERATE NEW WALLET", for: .normal)
        button.backgroundColor = .systemGray2
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let qrCaptureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("QR CAPTURE", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        return button
    }()
    
    let accessWalletButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ACCESS WALLET", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        accessWalletButton.addTarget(self, action: #selector(didTapAccessWallet), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        let spacer1 = createSpacer()
        let spacer2 = createSpacer()
        let spacer3 = createSpacer()
        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        [titleLabel, subTitleLabel, spacer1, bodyLabel, spacer2, generateNewWalletButton, qrCaptureButton, spacer3, accessWalletButton].forEach { subview in
            contentStackView.addArrangedSubview(subview)
        }
        
        NSLayoutConstraint.activate([
            // ScrollView constraints
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            // StackView constraints
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20),
            
            // Spacer constraints
            spacer1.heightAnchor.constraint(equalToConstant: 40),
            spacer2.heightAnchor.constraint(equalToConstant: 40),
            spacer3.heightAnchor.constraint(equalToConstant: 40),
            
            // Buttons constraints
            generateNewWalletButton.heightAnchor.constraint(equalToConstant: 60),
            generateNewWalletButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20),
            generateNewWalletButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            accessWalletButton.heightAnchor.constraint(equalToConstant: 60),
            accessWalletButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -20),
            accessWalletButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10)
        ])
    }
    
    func createSpacer() -> UIView {
        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        return spacer
    }

    
    @objc private func didTapAccessWallet() {
        let viewController = CryptoListViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
