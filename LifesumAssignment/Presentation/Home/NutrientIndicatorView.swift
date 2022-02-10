//
//  NutrientIndicatorView.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/8/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import UIKit

class NutrientIndicatorView: UIView {
    
    var label: UILabel?
    var valueLabel: UILabel?
    var underlineLabel: UILabel?
    
    required init?(coder: NSCoder) {
        fatalError("Do not use this initializer.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    func setupConstraints() {
        
        guard let label = label, let valueLabel = valueLabel, let underlineLabel = underlineLabel else { return }
        
        label.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        underlineLabel.translatesAutoresizingMaskIntoConstraints = false                
        
        NSLayoutConstraint.activate([
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 30.0),
            
            valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueLabel.topAnchor.constraint(equalTo: underlineLabel.bottomAnchor, constant: 5.0),
            
            underlineLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            underlineLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 3.0),
            underlineLabel.heightAnchor.constraint(equalToConstant: 1.0),
            underlineLabel.widthAnchor.constraint(equalToConstant: 60.0)
            
        ])
    }
    
    func setupView() {
        
        label = UILabel()
        valueLabel = UILabel()
        underlineLabel = UILabel()
        underlineLabel?.backgroundColor = .textLightGray
        
        guard let label = label, let valueLabel = valueLabel, let underlineLabel = underlineLabel else { return }
        
        let array = [label, valueLabel, underlineLabel]
        
        let _ = array.map({
            $0.textColor = .textLightGray
            $0.font = UIFont(name: "AvenirLTStd-Book", size: 14.0)
            $0.textAlignment = .center
            addSubview($0)
        })
    }
    
}
