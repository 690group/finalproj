//
//  websiteViewController.swift
//  finalproj
//
//  Created by Stephanie Santana on 12/12/18.
//  Copyright © 2018 Jasmine Chen. All rights reserved.
//

import UIKit
import WebKit

class websiteViewController: UIViewController {
    
    @IBOutlet weak var web: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this will load a page for bodybuilding.com about macros
        let myurl = URL(string: "http://www.bodybuilding.com/content/from-here-to-macros-4-steps-to-better-nutrition.html")
        let request = URLRequest(url: myurl!)
        web.load(request)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

