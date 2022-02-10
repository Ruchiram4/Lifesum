//
//  CircleView.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/7/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    var foodNameLabel: UILabel
    var caloriesLabel: UILabel
    var caloriesPerServingLabel: UILabel
    
    private lazy var pulse: CAGradientLayer = {
        let l = CAGradientLayer()
        l.type = .axial
        l.colors = [UIColor.circleOrange.cgColor, UIColor.circleRed.cgColor]
        l.locations = [ 0, 1 ]
        l.startPoint = CGPoint(x: 0, y: 0)
        l.endPoint = CGPoint(x: 1, y: 1)
        layer.addSublayer(l)
        return l
    }()
    
    override init(frame: CGRect) {
        
        self.foodNameLabel = UILabel()
        self.caloriesLabel = UILabel()
        self.caloriesPerServingLabel = UILabel()
        
        foodNameLabel.translatesAutoresizingMaskIntoConstraints = false
        caloriesLabel.translatesAutoresizingMaskIntoConstraints = false
        caloriesPerServingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        caloriesLabel.font = UIFont(name: "AvenirLTStd-Book", size: 60.0)
        caloriesLabel.textColor = .white
        caloriesLabel.text = ""
        
        caloriesPerServingLabel.text = "Calories per serving"
        caloriesPerServingLabel.font = UIFont(name: "AvenirNextCondensed-Italic", size: 18.0)
        caloriesPerServingLabel.textColor = .white
        
        foodNameLabel.text = ""
        foodNameLabel.font = UIFont(name: "AvenirLTStd-Book", size: 18.0)
        foodNameLabel.textColor = .white
                
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Do not use this method to initialize.")
    }
      
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        pulse.frame = bounds
        pulse.cornerRadius = bounds.width / 2.0
        
        self.addSubview(foodNameLabel)
        self.addSubview(caloriesLabel)
        self.addSubview(caloriesPerServingLabel)

        NSLayoutConstraint.activate([
            
            caloriesLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            caloriesLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            caloriesPerServingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            caloriesPerServingLabel.topAnchor.constraint(equalTo: caloriesLabel.bottomAnchor, constant: 0.0),
            
            foodNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            foodNameLabel.bottomAnchor.constraint(equalTo: caloriesLabel.topAnchor, constant: -20.0)
                        
        ])
    }

}
