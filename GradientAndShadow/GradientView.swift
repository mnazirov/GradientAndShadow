//
//  Created by Marat Nazirov on 01.11.2024.
//

import UIKit

final class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    init(model: GradientView.Model) {
        super.init(frame: .zero)
        gradientLayer.colors = model.colors
        gradientLayer.cornerRadius = model.cornerRadius
        gradientLayer.startPoint = model.startPoint
        gradientLayer.endPoint = model.endPoint
        layer.addSublayer(gradientLayer)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

extension GradientView {
    struct Model {
        let colors: [CGColor]
        let cornerRadius: CGFloat
        let startPoint: CGPoint
        let endPoint: CGPoint
        
        init(
            colors: [CGColor],
            cornerRadius: CGFloat = 0,
            startPoint: CGPoint = .zero,
            endPoint: CGPoint = .zero
        ) {
            self.colors = colors
            self.cornerRadius = cornerRadius
            self.startPoint = startPoint
            self.endPoint = endPoint
        }
    }
}
