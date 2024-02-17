//
//  CustomSlider.swift
//  Settings_AApp
//
//  Created by Abdulbosid Jalilov on 12/02/24.
//

import UIKit

class CustomSlider: UIView {
    
    lazy var sliderView: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 1
        slider.maximumValue = 3
        slider.addTarget(self, action: #selector(didChangeValueOfSlider), for: .valueChanged)
        
        return slider
    }()
    
    lazy var smallLine: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "|"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.tag = 1
        
        return label
    }()
    
    lazy var smallLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Small"
        label.textAlignment = .center
        label.textColor = .black
        label.font = customFont
        label.tag = 2
        
        return label
    }()
    
    lazy var mediumLine: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "|"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.tag = 3
        
        return label
    }()
    
    lazy var mediumLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Medium"
        label.textAlignment = .center
        label.textColor = .black
        label.font = customFont
        label.tag = 4
        
        return label
    }()
    
    lazy var largeLine: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "|"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .thin)
        label.tag = 5
        
        return label
    }()
    
    lazy var largeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Large"
        label.textAlignment = .left
        label.textColor = .black
        label.font = customFont
        label.tag = 6
        
        return label
    }()
    
    
    var customFont : UIFont = .systemFont(for: .small, weight: .medium)
    let userDefaults = UserDefaults.standard
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if userDefaults.value(forKey: "font") != nil {
            sliderView.value = 1
        }else{
            sliderView.value = userDefaults.value(forKey: "font") as? Float ?? 1
        }
        configureFonts()
        setupUI()
    }
    
    
    func configureFonts(){
        if sliderView.value >= 1 && sliderView.value < 1.9 {
            smallLbl.font = .systemFont(for: .small, weight: .medium)
            mediumLbl.font = .systemFont(for: .small, weight: .medium)
            largeLbl.font = .systemFont(for: .small, weight: .medium)
        }else if sliderView.value >= 1.91 && sliderView.value <= 2.1 {
            smallLbl.font = .systemFont(for: .medium, weight: .medium)
            mediumLbl.font = .systemFont(for: .medium, weight: .medium)
            largeLbl.font = .systemFont(for: .medium, weight: .medium)
        }else if sliderView.value <= 3 && sliderView.value >= 2.9 {
            smallLbl.font = .systemFont(for: .large, weight: .medium)
            mediumLbl.font = .systemFont(for: .large, weight: .medium)
            largeLbl.font = .systemFont(for: .large, weight: .medium)
        }
        
    }
    
    
    @objc func didChangeValueOfSlider(){
        configureFonts()
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomSlider {
    
    
    fileprivate func setupUI(){
        self.addSubview(sliderView)
        sliderView.addSubview(smallLine)
        sliderView.addSubview(mediumLine)
        sliderView.addSubview(largeLine)
        self.addSubview(smallLbl)
        self.addSubview(mediumLbl)
        self.addSubview(largeLbl)
        NSLayoutConstraint.activate([
            sliderView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            sliderView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            sliderView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            sliderView.heightAnchor.constraint(equalToConstant: 60),
            
            smallLine.leftAnchor.constraint(equalTo: sliderView.leftAnchor),
            smallLine.centerYAnchor.constraint(equalTo: sliderView.centerYAnchor),
            
            smallLbl.topAnchor.constraint(equalTo: sliderView.bottomAnchor, constant: -10),
            smallLbl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            
            mediumLine.centerXAnchor.constraint(equalTo: sliderView.centerXAnchor),
            mediumLine.centerYAnchor.constraint(equalTo: sliderView.centerYAnchor),
            
            mediumLbl.topAnchor.constraint(equalTo: sliderView.bottomAnchor, constant: -10),
            mediumLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            largeLine.rightAnchor.constraint(equalTo: sliderView.rightAnchor),
            largeLine.centerYAnchor.constraint(equalTo: sliderView.centerYAnchor),
            
            largeLbl.topAnchor.constraint(equalTo: sliderView.bottomAnchor, constant: -10),
            largeLbl.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }
    
    
}
