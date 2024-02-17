//
//  SettingsTableViewCell.swift
//  Settings_AApp
//
//  Created by Abdulbosid Jalilov on 01/02/24.
//

import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = "Settings TableView Cell"
    
    let settingsTextLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    let subtitleTextLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .secondaryLabel
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.addSubview(settingsTextLabel)
        settingsTextLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.snp.left).offset(18)
        }

        self.addSubview(subtitleTextLabel)
        subtitleTextLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.snp.right).offset(-15)
        }
        
    }

}
