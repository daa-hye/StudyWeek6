//
//  CustomTableViewController.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/08/24.
//

import UIKit
import SnapKit

struct Sample {
    let text: String
    var isExpand: Bool
}

class CustomTableViewController: UIViewController {

    //viewDidLoad 보다 클로저 구문이 먼저 실행됨
    //class 인스턴스 생성 직전에 클로저 구문이 우선 실행
    lazy var tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension // 1.
        view.delegate = self
        view.dataSource = self
        // uinib - xib
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        return view
    }()

    let imageView = {
        let view = PosterImageView(frame: .zero)
        return view
    }()

    //var isExpand = false //false 2, true 0
    var list = [Sample(text: "텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트", isExpand: false),Sample(text: "텍스트텍텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트", isExpand: false),Sample(text: "텍스트", isExpand: false)]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
    }

}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.textLabel?.text = list[indexPath.row].text
        cell.textLabel?.numberOfLines = list[indexPath.row].isExpand ? 0 : 2
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        list[indexPath.row].isExpand.toggle()
        tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}
