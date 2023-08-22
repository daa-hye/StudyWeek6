//
//  SecondViewController.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/08/22.
//

import UIKit

class SecondViewController: UIViewController {

    let profileImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 50
        view.backgroundColor = .cyan
        return view
    }()

    let nameLabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 17)
        view.textColor = .white
        view.text = "다혜"
        return view
    }()

    let devideView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    let closeButton = {
        let view = UIButton()
        view.tintColor = .white
        view.setImage(UIImage(systemName: "xmark"), for: .normal)
        return view
    }()

    let chatButton = setBottomButton(title: "나와의 채팅", image: UIImage(systemName: "bubble.left.fill")!)

    let editButton = setBottomButton(title: "프로필 편집", image: UIImage(systemName: "pencil")!)

    let storyButton = setBottomButton(title: "카카오스토리", image: UIImage(systemName: "list.bullet.circle.fill")!)

    let presentButton = setTopbutton(image: UIImage(systemName: "gift.circle")!)

    let qrButton = setTopbutton(image: UIImage(systemName: "qrcode")!)

    let settingButton = setTopbutton(image: UIImage(systemName: "gearshape")!)


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray

        [profileImageView, nameLabel, devideView, closeButton, chatButton, editButton, storyButton, presentButton, qrButton, settingButton].forEach {
            view.addSubview($0)
        }
        setConstraints()
    }
    

    func setConstraints() {

        editButton.snp.makeConstraints { make in
            make.bottom.equalTo(chatButton)
            make.width.equalTo(view).multipliedBy(0.3)
            make.centerX.equalTo(view)
        }

        chatButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view).multipliedBy(0.3)
            make.trailing.equalTo(editButton.snp.leading)
        }

        storyButton.snp.makeConstraints { make in
            make.bottom.equalTo(chatButton)
            make.width.equalTo(view).multipliedBy(0.3)
            make.leading.equalTo(editButton.snp.trailing)
        }

        devideView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(view)
            make.horizontalEdges.equalTo(view)
            make.bottom.equalTo(editButton.snp.top).offset(-20)
        }

        profileImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.size.equalTo(view.safeAreaLayoutGuide.snp.height).multipliedBy(0.15)
            make.bottom.equalTo(devideView.snp.top).offset(-80)
        }

        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
        }

        closeButton.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        }

        settingButton.snp.makeConstraints { make in
            make.size.equalTo(closeButton)
            make.top.equalTo(closeButton.snp.top)
            make.trailing.equalTo(view).offset(-16)
        }

        qrButton.snp.makeConstraints { make in
            make.size.equalTo(closeButton)
            make.top.equalTo(settingButton.snp.top)
            make.trailing.equalTo(settingButton.snp.leading).offset(-16)
        }

        presentButton.snp.makeConstraints { make in
            make.size.equalTo(closeButton)
            make.top.equalTo(settingButton.snp.top)
            make.trailing.equalTo(qrButton.snp.leading).offset(-16)
        }
        

    }

    static func setBottomButton(title: String, image: UIImage) -> UIButton {

        var config = UIButton.Configuration.plain()
        config.title = title
        config.image = image
        config.baseBackgroundColor = .clear
        config.titleAlignment = .center
        config.imagePlacement = .top
        config.imagePadding = 8
        config.baseForegroundColor = .white

        return UIButton(configuration: config)
    }

    static func setTopbutton(image: UIImage) -> UIButton {
        var config = UIButton.Configuration.plain()
        config.image = image
        config.baseForegroundColor = .white

        return UIButton(configuration: config)
    }

}


