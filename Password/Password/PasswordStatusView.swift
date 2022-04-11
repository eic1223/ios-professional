//
//  PasswordStatusView.swift
//  Password
//
//  Created by Dane's macbook pro on 2022/04/12.
//

import Foundation
import UIKit

class PasswordStatusView: UIView {
    
    let stackView = UIStackView()
    let criteria1 = PasswordCriteriaView(text: "8-32 characters (no spaces)")
    let criteriaLabel = UILabel()
    let criteria2 = PasswordCriteriaView(text: "uppercase letter (A-Z)")
    let criteria3 = PasswordCriteriaView(text: "lowercase (a-z)")
    let criteria4 = PasswordCriteriaView(text: "digit (0-9)")
    let criteria5 = PasswordCriteriaView(text: "spacial character (e.g. !@#$%^)")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}

extension PasswordStatusView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .tertiarySystemFill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalCentering
        
        criteriaLabel.text = "Use at least 3 of these 4 criteria when setting your password:"
        criteriaLabel.numberOfLines = 0
        criteriaLabel.textColor = .secondaryLabel
        criteriaLabel.lineBreakMode = .byWordWrapping
        criteriaLabel.attributedText = makeCriteriaMessage()
        
        criteria1.translatesAutoresizingMaskIntoConstraints = false
        criteria2.translatesAutoresizingMaskIntoConstraints = false
        criteria3.translatesAutoresizingMaskIntoConstraints = false
        criteria4.translatesAutoresizingMaskIntoConstraints = false
        criteria5.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    func layout() {
        stackView.addArrangedSubview(criteria1)
        stackView.addArrangedSubview(criteriaLabel)
        stackView.addArrangedSubview(criteria2)
        stackView.addArrangedSubview(criteria3)
        stackView.addArrangedSubview(criteria4)
        stackView.addArrangedSubview(criteria5)
        addSubview(stackView)
        
        // stack view
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2),
        ])
       
    }
    
    private func makeCriteriaMessage() -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        plainTextAttributes[.foregroundColor] = UIColor.secondaryLabel
        
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.foregroundColor] = UIColor.label
        boldTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        
        let attrText = NSMutableAttributedString(string: "Use at least ", attributes: plainTextAttributes)
        attrText.append(NSAttributedString(string: "3 of these 4 ", attributes: boldTextAttributes))
        attrText.append(NSAttributedString(string: "criteria when setting your password:", attributes: plainTextAttributes))
        
        return attrText
    }
}


