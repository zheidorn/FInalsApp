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
        
        alert("Resetting Counter", message: "Press ok to continue", buttonText:"Ok")
        
        
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if atLeastOneVowel()
        {
            return true
        }
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let next = segue.destinationViewController as! SecondViewController
        next.passedString = makeString()
       
    }
    @IBAction func whenDone(sender: UIButton) {
        if atLeastOneVowel()
        {
            performSegueWithIdentifier("whenDoneSegue", sender: sender)
            
           
            //alert("you have at least one vowel", message: "Press ok to continue", buttonText: "ok")
            
            //presentViewController(SecondViewController(), animated: true, completion: nil)
            //let view = self.storyboard?.instantiateViewControllerWithIdentifier("SecondViewController")
            
            //self.navigationController?.pushViewController(view!, animated: true)
            
            
            
        }
        if noVowels()
        {
            alert("you need at least one vowel to move on", message: "press ok to continue", buttonText: "ok")
        }
        
        
    }
    
    func alert (title:String, message:String, buttonText:String)
    {
        let alert = UIAlertController(title:title, message:message, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title:buttonText, style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    func atLeastOneVowel() -> Bool
    {
        if labelArray.contains(isVowel)
        {
            
            return true
            

        }
        return false
    }
    
    
    
    
    func noVowels() -> Bool
    {
        return !atLeastOneVowel()
    }
    
    func makeString() -> String
    {
        var result = ""
        for	label in labelArray
        {
            if label.text != nil {
             result = result + label.text!
            } else {
                result = result + " "
            }
        }
        return result
    }
    
    
  
    
    func isVowel(label: UILabel) -> Bool
    {
        if (label.text == "A" || label.text == "E" || label.text == "I" || label.text == "O" || label.text == "U" )
        {
            return true
        }
        return false
    }
    
    

    
}
