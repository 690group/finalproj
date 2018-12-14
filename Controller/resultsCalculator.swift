//
//  CalculatorResults.swift
//  finalproj
//
//  Created by Stephanie Santana on 12/10/18.
//  Copyright © 2018 Jasmine Chen. All rights reserved.
//

import UIKit

class resultsCalculator: UIViewController {
    
    @IBOutlet weak var calories: UILabel!
    
    @IBOutlet weak var protein: UILabel!
    
    @IBOutlet weak var carbs: UILabel!
    
    @IBOutlet weak var fats: UILabel!
    
    @IBOutlet weak var resultsBackground: UIImageView!
    
    @IBOutlet weak var buttonToWebview: UIButton!
    var finalCalculations = ""
    var finalWeight = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //for displaying background
         self.resultsBackground.image = UIImage(named: "graybackground")
        calories.text = finalCalculations
 
        //to make rounded corners on buttons
        buttonToWebview.layer.cornerRadius = buttonToWebview.frame.size.height/3
        
        let calculatedProtein = Double(finalWeight)! * 1.0

        let calculatedCarbs1 = Double(finalWeight)! * 1.2
        let calculatedCarbs2 = Double(finalWeight)! * 1.5
        
        let calculatedFats1 = Double(finalWeight)! * 0.3
        let calculatedFats2 = Double(finalWeight)! * 0.6
        
        protein.text = String(format:"%.0f",calculatedProtein)
        carbs.text = String(format:"%.0f-%.0f", calculatedCarbs1, calculatedCarbs2)
        fats.text = String(format:"%.0f-%.0f", calculatedFats1, calculatedFats2)


        
        
        
        
    }
    
    
}
