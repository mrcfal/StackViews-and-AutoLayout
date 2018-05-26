//
//  ViewController.swift
//  StackViews and AutoLayout
//
//  Created by Marco Falanga on 26/05/18.
//  Copyright © 2018 Marco Falanga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstStackView: UIStackView!
    var secondStackView: UIStackView!
    var thirdStackView: UIStackView!
    
    var imgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //first stackview (father)
        firstStackView = UIStackView()
        setupFirstStack()
        //secondStack, thirdStack
        secondStackView = UIStackView()
        thirdStackView = UIStackView()
        setupSecondAndThirdStacks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkOrientation()
    }
    
    func setupFirstStack() {
        view.addSubview(firstStackView)
        
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        
        firstStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
        firstStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.9).isActive = true
        
        firstStackView.distribution = .fillEqually
    }
    
    func setupSecondAndThirdStacks() {
        firstStackView.addArrangedSubview(secondStackView)
        firstStackView.addArrangedSubview(thirdStackView)
        
        secondStackView.distribution = .fillEqually
        thirdStackView.distribution = .fillEqually
        
        secondStackView.axis = .vertical
        thirdStackView.axis = .vertical
        
        let v = UIView()
        
        imgView = UIImageView(image: #imageLiteral(resourceName: "placeHolder"))
        v.addSubview(imgView)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
        imgView.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imgView.clipsToBounds = true
        
        imgView.layer.cornerRadius = 50
        
        secondStackView.addArrangedSubview(v)
        
        for _ in 0...3 {
            let label = UILabel()
            label.text = "Label example"
            label.textColor = .red
            label.textAlignment = .center
            
            secondStackView.addArrangedSubview(label)
        }
        
        for _ in 0...5 {
            let label = UILabel()
            label.text = "Label 2"
            label.textColor = .blue
            label.textAlignment = .center
            
            thirdStackView.addArrangedSubview(label)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        checkOrientation()
    }
    
    func checkOrientation() {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            landscapeSetup()
        } else {
            print("Portrait")
            portraitSetup()
        }
        
    }
    
    func landscapeSetup() {
        firstStackView.axis = .horizontal
    }
    
    func portraitSetup() {
        firstStackView.axis = .vertical
    }

}

