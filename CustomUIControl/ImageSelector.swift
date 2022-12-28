//
//  ImageSelector.swift
//  CustomUIControl
//
//  Created by Tianbo Qiu on 12/28/22.
//

import UIKit

// A subclass a UIControl to select an image from a list of horizontally aligned images.
class ImageSelector: UIControl {
    
    // currently selected image
    var selectedIndex = 0
    
    // a list of images to select
    var images: [UIImage] = [] {
        didSet {
            imageButtons = images.map({ image in
                let button = UIButton()
                button.setImage(image, for: .normal)
                button.imageView?.contentMode = .scaleAspectFit
                button.addTarget(self, action: #selector(imageButtonTapped(_:)), for: .touchUpInside)
                return button
            })
            
            selectedIndex = 0
        }
    }
    
    private var imageButtons: [UIButton] = [] {
        didSet {
            oldValue.forEach { $0.removeFromSuperview() }
            imageButtons.forEach { selectorStackView.addArrangedSubview($0) }
        }
    }
    
    private let selectorStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 12.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    @objc private func imageButtonTapped(_ sender: UIButton) {
        guard let index = imageButtons.firstIndex(of: sender) else {
            preconditionFailure("Unmatched button")
        }
        selectedIndex = index
        // notify observers
        sendActions(for: .valueChanged)
    }
    
    private func configureViewHierarchy() {
        addSubview(selectorStackView)
        
        NSLayoutConstraint.activate([
            selectorStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectorStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectorStackView.topAnchor.constraint(equalTo: topAnchor),
            selectorStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViewHierarchy()
    }
}
