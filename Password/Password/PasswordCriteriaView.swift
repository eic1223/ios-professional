//
//  PasswordCriteriaView.swift
//  Password
//
//  Created by Dane's macbook pro on 2022/04/12.
//

import Foundation
import UIKit

class PasswordCriteriaView: UIView {
    
    let stackView = UIStackView()
    let imageVIew = UIImageView()
    let label = UILabel()
    
    let criteriaString: String
    
    let checkmarkImage = UIImage(systemName: "checkmark.circle")!.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    let xmarkImage = UIImage(systemName: "xmark.circle")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    let circleImage = UIImage(systemName: "circle")!.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
    
    var isCriteriaMet: Bool = false {
        didSet {
            if isCriteriaMet {
                imageVIew.image = checkmarkImage
            } else {
                imageVIew.image = xmarkImage
            }
        }
    }
    
    func reset() {
        isCriteriaMet = false
        imageVIew.image = circleImage
    }
    
    
    init(text: String) {
        self.criteriaString = text
        
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 40)
    }
}

extension PasswordCriteriaView {
    func style() {
        //
        translatesAutoresizingMaskIntoConstraints = false
//        backgroundColor = .systemOrangex
        
        //
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
//        stackView.backgroundColor = .systemRed
        
        //
        imageVIew.translatesAutoresizingMaskIntoConstraints = false
        imageVIew.image = UIImage(systemName: "circle")!.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
        
        //
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
        label.text = criteriaString
    }
    
    func layout() {
        stackView.addArrangedSubview(imageVIew)
        stackView.addArrangedSubview(label)
        addSubview(stackView)
        
        // stackview
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        // checkmark
        NSLayoutConstraint.activate([
            imageVIew.heightAnchor.constraint(equalTo: imageVIew.widthAnchor), // 이게 되네?
        ])
        
        // CHCP
        imageVIew.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
    }
}
