//
//  SignInViewController.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/08/24.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {

    let titleLabel = {
        let label = UILabel()
        label.text = "HYEFLIX"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 50)

        return label
    }()

    let idTextField = {
        let textField = SignInTextField()
        textField.attributedPlaceholder = NSAttributedString(string: TextFieldType.id.placeholder, attributes: [.foregroundColor: UIColor.white])
        return textField
    }()

    let passwordTextField = {
        let textField = SignInTextField()
        textField.attributedPlaceholder = NSAttributedString(string: TextFieldType.password.placeholder, attributes: [.foregroundColor: UIColor.white])
        textField.textContentType = .password
        return textField
    }()

    let nicknameTextField = {
        let textField = SignInTextField()
        textField.attributedPlaceholder = NSAttributedString(string: TextFieldType.nickname.placeholder, attributes: [.foregroundColor: UIColor.white])
        return textField
    }()

    let locationTextField = {
        let textField = SignInTextField()
        textField.attributedPlaceholder = NSAttributedString(string: TextFieldType.location.placeholder, attributes: [.foregroundColor: UIColor.white])
        return textField
    }()

    let codeTextField = {
        let textField = SignInTextField()
        textField.attributedPlaceholder = NSAttributedString(string: TextFieldType.code.placeholder, attributes: [.foregroundColor: UIColor.white])
        return textField
    }()

    let signInButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 6

        return button
    }()

    var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        stackView = UIStackView(arrangedSubviews: [idTextField, passwordTextField, nicknameTextField, locationTextField, codeTextField])
        setUI()

    }

}

extension SignInViewController {

    func setUI() {

        view.backgroundColor = .black

        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }

        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view).inset(32)
            make.top.equalTo(titleLabel.snp.bottom).offset(130)
            make.bottom.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.65)
        }

        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalTo(view).inset(32)
            make.top.equalTo(stackView.snp.bottom).offset(24)
            make.height.equalTo(40)
        }

    }

    enum TextFieldType {
        case id
        case password
        case nickname
        case location
        case code

        var placeholder: String {
            switch self {
            case .id:
                return "이메일 주소 또는 전화번호"
            case .password:
                return "비밀번호"
            case .nickname:
                return "닉네임"
            case .location:
                return "위치"
            case .code:
                return "추천인코드"
            }
        }
    }

}
