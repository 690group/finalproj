//
//  TDEModelFEMALE.swift
//  finalproj
//
//  Created by Stephanie Santana on 12/11/18.
//  Copyright © 2018 Jasmine Chen. All rights reserved.
//

import Foundation

class TDEEModelFEMALE {
    var feet:Double
    var inches:Double
    var weight:Double
    var age:Double
    var caloriesToAdjust:Double
    var activityLevel:Double
    
    init(feet:Double, inches:Double, weight:Double, age:Double, caloriesToAdjust:Double, activityLevel:Double){
        self.feet = feet
        self.inches = inches
        self.weight = weight
        self.age = age
        self.caloriesToAdjust = caloriesToAdjust
        self.activityLevel = activityLevel
    }
    
    func TDEEFemale()->Int {
        let weightCalculation = 10 * (weight/2.2)
        let heightCalculation = 6.25 * (feet*30.48+inches*2.54)
        let ageCalculation = -5 * age - 161
        
        let BasalMetobolicRate = weightCalculation + heightCalculation + ageCalculation
        
            return Int((BasalMetobolicRate*activityLevel) + caloriesToAdjust)
    }
}
