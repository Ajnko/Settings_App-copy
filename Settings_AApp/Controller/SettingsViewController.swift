//
//  ViewController.swift
//  Settings_AApp
//
//  Created by Abdulbosid Jalilov on 01/02/24.
//

import UIKit
import SnapKit

enum CustomFont {
    case small
    case medium
    case large
}

class SettingsViewController: UIViewController {


    let settingsTitle = ["Til", "Shrift", "Tema", "Haritani", "Tovushlar"]
    var settingsSubtitle = ["O'zbekcha", "", "Kunduzgi", "Ko'rsatilgan", ""]
    
    let settingsTableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .blue
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        return tableView
    }()
    
    let saveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(didTapSaveBtn), for: .touchUpInside)
        btn.isHidden = true
        
        return btn
    }()
    
    let fontSlider: CustomSlider = {
        let slider = CustomSlider()
        slider.isHidden = true
        
        return slider
    }()
    
    let userDefaults = UserDefaults.standard
    var isFontChangerOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sozlamalar"
        initView()
        
    }
    
    func initView() {
        view.addSubview(settingsTableView)
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        settingsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(fontSlider)
        fontSlider.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(view.snp.right).offset(-10)
            make.left.equalTo(view.snp.left).offset(10)
            make.height.equalTo(100)
        }
        
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(fontSlider.snp.bottom).offset(10)
            make.right.equalTo(view.snp.right).offset(-10)
            make.height.equalTo(view.snp.height).multipliedBy(0.1)
            make.width.equalTo(view.snp.width).multipliedBy(0.3)
        }
    }
    
    @objc func didTapSaveBtn() {
        if fontSlider.sliderView.value >= 1 && fontSlider.sliderView.value < 1.9 {
            userDefaults.setValue(1, forKey: "font")
            let index = 1
            let textSize = "Small"
            
            if index < settingsSubtitle.count {
                settingsSubtitle.remove(at: index)
                settingsSubtitle.insert(textSize, at: index)
            }
            print("small")
        } else if fontSlider.sliderView.value >= 1.91 && fontSlider.sliderView.value <= 2.1 {
            userDefaults.setValue(2, forKey: "font")
            
            let index = 1
            let textSize = "Medium"
            
            if index < settingsSubtitle.count {
                settingsSubtitle.remove(at: index)
                settingsSubtitle.insert(textSize, at: index)
            }
            print("medium")
        } else if fontSlider.sliderView.value <= 3 && fontSlider.sliderView.value >= 2.9 {
            userDefaults.setValue(3, forKey: "font")
            
            let index = 1
            let textSize = "Large"
            
            if index < settingsSubtitle.count {
                settingsSubtitle.remove(at: index)
                settingsSubtitle.insert(textSize, at: index)
            }
            print("large")
        }
        
        settingsTableView.reloadData()
        isFontChangerOpened.toggle()
        fontSlider.isHidden = true
        saveButton.isHidden = true
        settingsTableView.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 60
        return rowHeight
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        cell.settingsTextLabel.text = settingsTitle[indexPath.row]
        cell.subtitleTextLabel.text = settingsSubtitle[indexPath.row]
        
        switch userDefaults.value(forKey: "font") as? Int {
            
        case 1: cell.settingsTextLabel.font = .systemFont(for: .small, weight: .regular)
        case 2: cell.settingsTextLabel.font = .systemFont(for: .medium, weight: .regular)
        case 3: cell.settingsTextLabel.font = .systemFont(for: .large, weight: .regular)
            
        default: print("something")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            isFontChangerOpened.toggle()
            fontSlider.isHidden = false
            saveButton.isHidden = false
            settingsTableView.isHidden = true
        case 4:
            let vc = SoundsSettingsViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
}

extension UIFont {
    
    static func systemFont(for customFont: CustomFont, weight: UIFont.Weight) -> UIFont {
        let fontSize: CGFloat
        
        switch customFont {
        case .small:
            fontSize = 20.0
        case .medium:
            fontSize = 26.0
        case .large:
            fontSize = 32.0
        }
        
        return UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
    
}

