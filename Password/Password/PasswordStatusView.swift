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
    let criteriaLabel = UILabel()
    
    let lengthCriteriaView = PasswordCriteriaView(text: "8-32 characters (no spaces)")
    let uppercaseCriteriaView = PasswordCriteriaView(text: "uppercase letter (A-Z)")
    let lowercaseCriteiraView = PasswordCriteriaView(text: "lowercase (a-z)")
    let digitCriteriaView = PasswordCriteriaView(text: "digit (0-9)")
    let specialCharacterCriteriaView = PasswordCriteriaView(text: "spacial character (e.g. !@#$%^)")
    
    // Used to determine if we reset criteria back to empty state
    var shouldResetCriteria: Bool = true
    
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
        
        lengthCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        uppercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        lowercaseCriteiraView.translatesAutoresizingMaskIntoConstraints = false
        digitCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        specialCharacterCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    func layout() {
        stackView.addArrangedSubview(lengthCriteriaView)
        stackView.addArrangedSubview(criteriaLabel)
        stackView.addArrangedSubview(uppercaseCriteriaView)
        stackView.addArrangedSubview(lowercaseCriteiraView)
        stackView.addArrangedSubview(digitCriteriaView)
        stackView.addArrangedSubview(specialCharacterCriteriaView)
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

// MARK: - Actions
extension PasswordStatusView {
    func updateDisplay(_ text: String) {
        let lengthAndNoSpaceMet = PasswordCriteria.lengthAndNoSpaceMet(text)
        let uppercaseMet = PasswordCriteria.uppercaseMet(text)
        let lowercaseMet = PasswordCriteria.lowercaseMet(text)
        let digitMet = PasswordCriteria.digitMet(text)
        let specialCharaterMet = PasswordCriteria.specialCharacterMet(text)
        
        if shouldResetCriteria{
            // Inline validation (check or white)
            lengthAndNoSpaceMet
                ? lengthCriteriaView.isCriteriaMet = true
                : lengthCriteriaView.reset()
            
            uppercaseMet
                ? uppercaseCriteriaView.isCriteriaMet = true
                : uppercaseCriteriaView.reset()
            
            lowercaseMet
                ? lowercaseCriteiraView.isCriteriaMet = true
                : lowercaseCriteiraView.reset()
            
            digitMet
                ? digitCriteriaView.isCriteriaMet = true
                : digitCriteriaView.reset()
            
            specialCharaterMet
            ? specialCharacterCriteriaView.isCriteriaMet = true
            : specialCharacterCriteriaView.reset()
        } else {
            // focus lost (V or X)
            lengthCriteriaView.isCriteriaMet = lengthAndNoSpaceMet
            uppercaseCriteriaView.isCriteriaMet = uppercaseMet
            lowercaseCriteiraView.isCriteriaMet = lowercaseMet
            digitCriteriaView.isCriteriaMet = digitMet
            specialCharacterCriteriaView.isCriteriaMet = specialCharaterMet
        }
    }
    
    func validate(_ text: String) -> Bool {
           let uppercaseMet = PasswordCriteria.uppercaseMet(text)
           let lowercaseMet = PasswordCriteria.lowercaseMet(text)
           let digitMet = PasswordCriteria.digitMet(text)
           let specialCharacterMet = PasswordCriteria.specialCharacterMet(text)

           let checkable = [uppercaseMet, lowercaseMet, digitMet, specialCharacterMet]
           let metCriteria = checkable.filter { $0 }
           let lengthAndNoSpaceMet = PasswordCriteria.lengthAndNoSpaceMet(text)
           
           if lengthAndNoSpaceMet && metCriteria.count >= 3 {
               return true
           }
           
           return false
       }
    
    func reset() {
        lengthCriteriaView.reset()
        uppercaseCriteriaView.reset()
        lowercaseCriteiraView.reset()
        digitCriteriaView.reset()
        specialCharacterCriteriaView.reset()
    }
}


//// MARK: - Tests
//extension PasswordStatusView {
//    var isCheckMarkImage: Bool {
//        return imageView?.image == checkmarkImage
//    }
//
//    var isXmarkImage: Bool {
//        return imageView?.image == xmarkImage
//    }
//
//    var isResetImage: Bool {
//        return imageView?.image == circleImage
//    }
//}
