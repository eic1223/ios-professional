//
//  ViewController.swift
//  Password
//
//  Created by Dane's macbook pro on 2022/04/11.
//

import UIKit

class ViewController: UIViewController {

    let stackView = UIStackView()
    let newPasswordTextField = PasswordTextField(placeHolderText: "New password")
    let criteriaView = PasswordCriteriaView(text: "uppercase letter (A-Z)")
//    let newPasswordTextField2 = PasswordTextField(placeHolderText: "Confirm password")
    let confirmButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

extension ViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        criteriaView.translatesAutoresizingMaskIntoConstraints = false
        
//        newPasswordTextField2.translatesAutoresizingMaskIntoConstraints = false
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
//        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(criteriaView)
//        stackView.addArrangedSubview(newPasswordTextField2)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
        
        ])
    }
}
