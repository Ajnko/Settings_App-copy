//
//  SoundSettingsViewController.swift
//  Settings_AApp
//
//  Created by Abdulbosid Jalilov on 01/02/24.
//

import UIKit
import SnapKit

class SoundsSettingsViewController: UIViewController {
    
    let soundsTitle = ["Tovush balandligi", "Internet bilan aloqa uzildi", "Efirdagi buyurtmalar", "Taklif qilingan buyurtmalar", "Buyurtma bekor qilindi", "Yangi buyurtma", "Tarif rejasi sotib olishda", "Tarif reja o'zgarganda"]
    let soundsSettingsTableView: UITableView = {
       let tableview = UITableView()
        tableview.register(SoundsSettingsTableViewCell.self, forCellReuseIdentifier: SoundsSettingsTableViewCell.identifier)
        return tableview
    }()
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tovush sozlamari"
        view.backgroundColor = .systemBackground
        initView()
        self.soundsSettingsTableView.reloadData()
    }
    
    func initView(){
        view.addSubview(soundsSettingsTableView)
        soundsSettingsTableView.delegate = self
        soundsSettingsTableView.dataSource = self
        soundsSettingsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

extension SoundsSettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height: CGFloat = 75
        return height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soundsTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SoundsSettingsTableViewCell.identifier, for: indexPath) as! SoundsSettingsTableViewCell
        cell.soundsSettingsTextLabel.text = soundsTitle[indexPath.row]
        
        switch userDefaults.value(forKey: "font") as? Int {
            
        case 1: cell.soundsSettingsTextLabel.font = .systemFont(for: .small, weight: .regular)
        case 2: cell.soundsSettingsTextLabel.font = .systemFont(for: .medium, weight: .regular)
        case 3: cell.soundsSettingsTextLabel.font = .systemFont(for: .large, weight: .regular)
            
        default: print("something")
            
        }
        
        return cell
    }
    
}
