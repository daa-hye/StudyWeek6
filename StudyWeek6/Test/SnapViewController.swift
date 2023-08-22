//
//  SnapViewController.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/08/22.
//

import UIKit
import SnapKit

/*
 addSubView
 superVIew
 offset inset
 RTL : leading vs left
 */

class SnapViewController: UIViewController {

    let redView = UIView()
    let whiteVIew = UIView()
    let blueVIew = UIView()
    let yellowView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view)
        }

        view.addSubview(whiteVIew)
        whiteVIew.backgroundColor = .white
        whiteVIew.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }

        view.addSubview(blueVIew)
        blueVIew.backgroundColor = .blue
        blueVIew.snp.makeConstraints { make in
            //make.centerX.centerY.equalTo(view)
            make.center.equalTo(view)
            //make.width.height.equalTo(200)
            make.size.equalTo(200)
        }

        blueVIew.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
//            make.size.equalTo(150)
//            make.leading.top.equalToSuperview()
//
//            make.leading.top.trailing.bottom.equalToSuperview()
            make.edges.equalTo(blueVIew).inset(50)
        }


    }

    

}
