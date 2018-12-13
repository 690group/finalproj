//
//  SelectedButton.swift
//  finalproj
//
//  Created by Stephanie Santana on 12/10/18.
//  Copyright © 2018 Jasmine Chen. All rights reserved.
//

import UIKit

class selectedButton: UIButton {
    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        addTarget(self, action: #selector(selectedButton.buttonPressed), for: .touchUpInside)
        layer.cornerRadius = frame.size.height/4
        
      //  addTarget(self, action: #selector(selectedButton.buttonIsNotPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    @objc func buttonIsNotPressed(){
        deactivateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        isOn = bool
        let color = bool ? UIColor.orange : UIColor.lightGray
        backgroundColor = color
    }
    
    func deactivateButton(bool: Bool) {
        isOn = false
        let color = bool ? UIColor.lightGray : UIColor.lightGray
        
        backgroundColor = color
    }
}
