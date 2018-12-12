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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.welcomeBanner.image = UIImage(named: "orange-ombre")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
  
    
}
