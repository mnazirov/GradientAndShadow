//
//  ViewController.swift
//  GradientAndShadow
//
//  Created by Marat Nazirov on 01.11.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var squareView: UIView = {
        let square = UIView()
        square.backgroundColor = .green
        square.layer.cornerRadius = Appearance.squareCorner
        return square
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Private methods

private extension ViewController {
    private func commonInit() {
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() { 
        view.addSubview(squareView)
    }
    
    private func setupConstraints() {
        squareView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            squareView.widthAnchor.constraint(equalToConstant: Appearance.squareSize.width),
            squareView.heightAnchor.constraint(equalToConstant: Appearance.squareSize.height),
            squareView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Appearance.squareInsets.left),
            squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: - Appearance

private extension ViewController {
    enum Appearance {
        static let squareSize = CGSize(width: 100, height: 100)
        static let squareInsets = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
        static let squareCorner = 13.0
    }
}

