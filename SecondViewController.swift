//
//  SecondViewController.swift
//  MyFinalsApp
//
//  Created by Zachary Heidorn on 1/20/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var passedString: String!
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = passedString
        label1.text = ("my favorite word is " + passedString)
    }
   
    
    

}


