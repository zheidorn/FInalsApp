//
//  ViewController.swift
//  MyFinalsApp
//
//  Created by student3 on 1/6/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
// zach heidorn

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var currentLetterLabel: UILabel!
    
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var counter = 0
    var currentLetter:Character!
    var labelArray = [UILabel]()

        override func viewDidLoad() {
            super.viewDidLoad()
            getCurrentLetter()
            labelArray = [label1, label2, label3, label4, label5]
        }
        
            
    
        
    
        
    @IBAction func whenTapped(sender: UITapGestureRecognizer) {
    
        let selectedPoint = sender.locationInView(self.view)
        print(selectedPoint)
        
        for label in labelArray
        {
            if CGRectContainsPoint(label.frame, selectedPoint)
            {
                label.text = String(currentLetter)
            }
        }
        
    
    
            
            counter++
            
            if counter == 26
            {
                reset()
            }
            
            getCurrentLetter()
            
            
        }
        
        func getCurrentLetter() {
            let myRange = Range<String.Index>(start: letters.startIndex.advancedBy (counter), end: letters.startIndex.advancedBy(counter+1))
            
            currentLetterLabel.text = letters.substringWithRange(myRange)
            currentLetter = Character(letters.substringWithRange(myRange))
        }
        
        func reset()
        {
            counter = 0
            
            let alert = UIAlertController(title: "Resetting Counter", message: "Press Ok To Reset", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: clearLabels)
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
            
        }
        
        func clearLabels(action: UIAlertAction)
        {
            label1.text = ""
            label2.text = ""
            label3.text = ""
            label4.text = ""
            label5.text = ""
        }

    
    

    

}

