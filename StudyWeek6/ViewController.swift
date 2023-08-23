//
//  ViewController.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/08/21.
//

import UIKit

// - 스토리보드 : 객체 얹기, 레이아웃 잡기, 아울렛 연결, 속성 조절

// - 코드
// 1. 뷰객체 프로퍼티 선언 (클래스 인스턴스 생성)
// 2. 명시적으로 루트뷰에 추가 (+ translatesAutoresizingMaskIntoConstraints)
// 3. 크기와 위치 정의
// 4. 속성 정의
// -> Frame의 한계
// -> AutoResizingMask, AutoLayout -> 스토리보드 대응
// -> NSLayoutConstraints -> 코드베이스 대응
    //1. isActive = true
    //2. addConstraints
// -> NSLayoutAnchor

class ViewController: UIViewController {

    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)

        setLayoutAnchor()

        /*AutoresizingMask, AutoLayout 둘 중 하나만 쓸 수 있는데
         AutoresizingMask 사용이 디폴트로 true라서 꺼줘야함
         */
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)

        emailTextField.backgroundColor = .lightGray
        emailTextField.isSecureTextEntry = true
        emailTextField.placeholder = "닉네임을 입력해주세요"

        // 레이아웃 활성화
        // isActive
//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50).isActive = true

        // addConstaints
        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)

        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)

        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)

        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50)

        view.addConstraints([leading, trailing, height, top])

        passwordTextField.backgroundColor = .brown
    }

    @objc func signButtonClicked() {

        let vc = LocationViewController()
        let nav = UINavigationController(rootViewController: vc)

        present(nav, animated: true)

    }

    func setLayoutAnchor() {

        view.addSubview(signButton)
        signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)

        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.backgroundColor = .blue

        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }


}

