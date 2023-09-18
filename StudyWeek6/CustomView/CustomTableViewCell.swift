//
//  CustomTableViewCell.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/08/25.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    let label = UILabel()
    let button = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
        setConstraints()    //add subview 이후에 constraints 설정

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        //view.addSubview(label) -> 여기서는 view에 추가하면 안됨...
        contentView.addSubview(label)
        contentView.addSubview(button)
        label.backgroundColor = .blue
        button.backgroundColor = .cyan
    }

    func setConstraints() {
        button.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.trailingMargin.equalTo(contentView)
        }
        label.snp.makeConstraints { make in
            make.top.leadingMargin.bottom.equalTo(contentView)
            make.centerY.trailingMargin.equalTo(contentView)
        }
    }

    // Interface Builder
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
