//
//  SoundsSettingsTableViewCell.swift
//  Settings_AApp
//
//  Created by Abdulbosid Jalilov on 01/02/24.
//

import UIKit
import SnapKit

class SoundsSettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SoundsSettingsTableViewCell"
    
    let soundsSettingsTextLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.numberOfLines = 5
        return label
    }()

    let switchButton: UISwitch = {
       let button = UISwitch()
        button.onTintColor = .purple
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.addSubview(switchButton)
        switchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.snp.right).offset(-15)
        }
        
        self.addSubview(soundsSettingsTextLabel)
        soundsSettingsTextLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.snp.left).offset(18)
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
        }
    }

}
