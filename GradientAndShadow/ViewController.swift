//
//  Created by Marat Nazirov on 01.11.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var squareView: GradientView = {
        let squareView = GradientView(model: .init(
            colors: [
                Appearance.Square.leftGradientColor.cgColor,
                Appearance.Square.rightGradientColor.cgColor
            ],
            cornerRadius: Appearance.Square.corner,
            startPoint: Appearance.Square.startPoint,
            endPoint: Appearance.Square.endPoint
        ))
        return squareView
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
        setupShadow()
    }
    
    private func setupSubviews() { 
        view.addSubview(squareView)
    }
    
    private func setupConstraints() {
        squareView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            squareView.widthAnchor.constraint(equalToConstant: Appearance.Square.size.width),
            squareView.heightAnchor.constraint(equalToConstant: Appearance.Square.size.height),
            squareView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Appearance.Square.insets.left),
            squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupShadow() {
        squareView.layer.shadowColor = Appearance.Square.shadowColor
        squareView.layer.shadowOpacity = Appearance.Square.shadowOpacity
        squareView.layer.shadowOffset = Appearance.Square.shadowOffset
        squareView.layer.shadowRadius = Appearance.Square.shadowRadius
        squareView.layer.shouldRasterize = true
        squareView.layer.masksToBounds = false
    }
}

// MARK: - Appearance

private extension ViewController {
    enum Appearance {
        enum Square {
            // Common
            static let size = CGSize(width: 100, height: 100)
            static let insets = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
            static let corner = 13.0
            
            // Shadow
            static let shadowRadius = 8.0
            static let shadowOffset = CGSize(width: 0, height: 10)
            static let shadowOpacity: Float = 0.37
            static let shadowColor = UIColor.black.cgColor
            
            // Gradient
            static let leftGradientColor = UIColor(red: 82/255, green: 146/255, blue: 193/255, alpha: 1)
            static let rightGradientColor = UIColor(red: 237/255, green: 30/255, blue: 41/255, alpha: 1)
            static let startPoint = CGPoint(x: 0.0, y: 0.0)
            static let endPoint = CGPoint(x: 1.0, y: 1.0)
            
        }
    }
}
