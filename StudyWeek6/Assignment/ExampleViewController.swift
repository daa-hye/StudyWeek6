//
//  ExampleViewController.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/08/22.
//

import UIKit
import SnapKit

class ExampleViewController: UIViewController {

    let grayView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    let titleTextField = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.borderStyle = .line
        return view
    }()

    let dateTextField = {
        let view = UITextField()
        view.placeholder = "날짜를 입력해주세요"
        view.textAlignment = .center
        view.borderStyle = .line
        return view
    }()
    
    let memoTextView = {
        let view = UITextView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        [grayView, titleTextField, dateTextField, memoTextView].forEach {
            view.addSubview($0)
        }

        setConstraints()

    }

    func setConstraints() {

        grayView.snp.makeConstraints { make in
            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.3)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view).inset(20)
        }

        titleTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.topMargin.equalTo(grayView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
        }

        dateTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.topMargin.equalTo(titleTextField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
        }

        memoTextView.snp.makeConstraints { make in
            make.topMargin.equalTo(dateTextField.snp.bottom).offset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view).inset(20)
        }

    }

}
