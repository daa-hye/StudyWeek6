//
//  SignInTextField.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/08/24.
//

import UIKit

class SignInTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        borderStyle = .roundedRect
        backgroundColor = .darkGray
        textColor = .white
        textAlignment = .center
    }

}
