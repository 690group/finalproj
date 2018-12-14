//
//  WelcomeCalculator.swift
//  finalproj
//
//  Created by Stephanie Santana on 12/11/18.
//  Copyright © 2018 Jasmine Chen. All rights reserved.
//

import UIKit

class WelcomeCalculator: UIViewController {
    
    @IBOutlet weak var welcomeBanner: UIImageView!
    
    @IBOutlet weak var buttonToCalculatorVC: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //to make rounded corners on uttons
        buttonToCalculatorVC.layer.cornerRadius = buttonToCalculatorVC.frame.size.height/2
        
        self.welcomeBanner.image = UIImage(named: "orange-ombre")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  
    
}
