//
//  GenericViewController.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {

    let sampleLabel = UILabel()
    let sampleButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "네비"

        view.backgroundColor = .cyan

        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .yellow
        configureBorder(view: sampleLabel)
        sampleLabel.text = "제네릭 테스트"
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }

        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .gray
        sampleButton.snp.makeConstraints { make in
            configureBorder(view: sampleButton)
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)        }


        let generic = sum(a: 3.4444, b: 5.3333)
        print(generic)

        let value = sumInt(a: 3, b: 7)
        print(value)

        let value2 = sumDouble(a: 3.5, b: 7.7)
        print(value2)
    }


}
