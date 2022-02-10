//
//  HomeViewController.swift
//  LifesumAssignment
//
//  Created by Ruchira Randana on 2/7/22.
//  Copyright © 2022 Ruchira Randana. All rights reserved.
//

import UIKit
import Lottie

class HomeViewController: UIViewController, HomeViewModelProtocol {
    
    // MARK: - Instance variables
    //using non-optionals for DI
    var viewModel: HomeViewModel!
    var carbsView: NutrientIndicatorView!
    var proteinView: NutrientIndicatorView!
    var fatView: NutrientIndicatorView!
    var loadingView: UIView!
    var animationView: AnimationView?
    let circle: CircleView = CircleView(frame: CGRect(x: UIScreen.main.bounds.width/2 - 135.0, y: 150, width: 270, height: 270))
    
    // MARK: - Init methods
    init(withViewModel: HomeViewModel, carbsView: NutrientIndicatorView, proteinView: NutrientIndicatorView, fatView: NutrientIndicatorView,
                  loadingView: UIView){
        
        self.viewModel = withViewModel
        self.carbsView = carbsView
        self.proteinView = proteinView
        self.fatView = fatView
        self.loadingView = loadingView
        
        carbsView.translatesAutoresizingMaskIntoConstraints = false
        proteinView.translatesAutoresizingMaskIntoConstraints = false
        fatView.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
        
    }
       
    required init?(coder: NSCoder) {
        fatalError("Do not use this initializer.")
    }
    
    // MARK: - UI methods
    private func loadUI(){
        
        view.backgroundColor = .white
        view.addSubview(circle)
        view.addSubview(carbsView)
        view.addSubview(proteinView)
        view.addSubview(fatView)
        
        let moreInfoButton = UIButton()
        moreInfoButton.translatesAutoresizingMaskIntoConstraints = false
        moreInfoButton.setTitle("MORE INFO", for: .normal)
        moreInfoButton.setTitleColor(.white, for: .normal)
        moreInfoButton.setTitleColor(.circleOrange, for: .highlighted)
        moreInfoButton.titleLabel?.textColor = .white
        moreInfoButton.backgroundColor = .black
        moreInfoButton.layer.cornerRadius = 37.5
        moreInfoButton.layer.shadowColor = UIColor.shadowBlack.cgColor
        moreInfoButton.layer.shadowOffset = CGSize(width: 0.0, height: 16.0)
        moreInfoButton.layer.masksToBounds = false
        moreInfoButton.addCharacterSpacingForTitle(kernValue: 2, state: .normal)
        view.addSubview(moreInfoButton)
        
        loadingView.backgroundColor = .black
        loadingView.alpha = 0.9
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingView)
        
        var lottieView = AnimationView()
        lottieView = .init(name: "Lottie_food")
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .loop
        lottieView.animationSpeed = 1.5
        self.animationView = lottieView
        loadingView.addSubview(lottieView)
        
        NSLayoutConstraint.activate([
            lottieView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            lottieView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            lottieView.widthAnchor.constraint(equalToConstant: 100.0),
            lottieView.heightAnchor.constraint(equalToConstant: 100.0)
        ])
        
        NSLayoutConstraint.activate([
            
            proteinView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            proteinView.topAnchor.constraint(equalTo: circle.bottomAnchor, constant: 30.0),
            
            carbsView.topAnchor.constraint(equalTo: proteinView.topAnchor),
            carbsView.rightAnchor.constraint(equalTo: proteinView.leftAnchor, constant: -100.0),
            
            fatView.topAnchor.constraint(equalTo: proteinView.topAnchor),
            fatView.leftAnchor.constraint(equalTo: proteinView.rightAnchor, constant: 100.0),
            
            moreInfoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50.0),
            moreInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moreInfoButton.widthAnchor.constraint(equalToConstant: 287.0),
            moreInfoButton.heightAnchor.constraint(equalToConstant: 75.0),
            
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingView.leftAnchor.constraint(equalTo: view.leftAnchor),
            loadingView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func updateUIWithFoodItemInfo(food: FoodItem?, status: Bool){
        
        if status == true {
            guard let name = food?.name,
                let calories = food?.calories,
                let proteins = food?.proteins,
                let carbs = food?.carbs,
                let fat = food?.fat else { return }
            
            circle.foodNameLabel.text = name
            circle.caloriesLabel.text = String(format:"%d", calories)
            
            proteinView.label?.text = "PROTEIN"
            proteinView.valueLabel?.text = viewModel.convertToPercentage(value: proteins)
            
            fatView.label?.text = "FAT"
            fatView.valueLabel?.text = viewModel.convertToPercentage(value: fat)
            
            carbsView.label?.text = "CARBS"
            carbsView.valueLabel?.text = viewModel.convertToPercentage(value: carbs)
            
        }
    }
    
    private func displayLoadingView(){
        self.loadingView.isHidden = false
        self.animationView?.play()
    }
    
    private func hideLoadingView(){
        self.animationView?.pause()
        self.loadingView.isHidden = true
    }
    
    // MARK: - View lifecycle methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        loadUI()
        displayLoadingView()
        viewModel.getRandomFoodItem()
        
        let savedFoodItem = viewModel.getLastSavedFoodItem()
        if let savedFoodItem = savedFoodItem {
            updateUIWithFoodItemInfo(food: savedFoodItem, status: true)
        }
    }
    
    // MARK: - Detect shake gesture
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            displayLoadingView()
            viewModel.getRandomFoodItem()
        }
    }
    
    // MARK: - HomeViewModel delegate methods
    func foodByIdReceived(food: FoodItem?, status: Bool) {
        
        hideLoadingView()
        updateUIWithFoodItemInfo(food: food, status: status)
        
    }
}

