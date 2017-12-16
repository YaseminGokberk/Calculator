//
//  ViewController.swift
//  Calculator
//
//  Created by GBGYP-10 on 2.12.2017.
//  Copyright © 2017 YaseminGokberk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    var isUserMiddleOfTypingANumber: Bool = true
    var internalStack = [Double]()
    

    @IBAction func digitTouchUpInside(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if isUserMiddleOfTypingANumber {
            displayLabel.text = digit
            isUserMiddleOfTypingANumber = false
        }
        else{
            displayLabel.text = displayLabel.text! + digit
        }
        
        
        
        
       // print("Digit:\(digit!)")
    
        
        
        // displayLabel.text = displayLabel.text! + digit
        
        }
    
        @IBAction func enter() {
            isUserMiddleOfTypingANumber = true
//            let digit = (displayLabel.text! as NSString).doubleValue
//            internalStack.append(digit)
            internalStack.append(displayValue)
            print("internalStack = \(internalStack)")
            
            
        }
    
    @IBAction func operand(_ sender: UIButton) {
        if !isUserMiddleOfTypingANumber{
            enter()
        }
        
            let sign = sender.currentTitle!
        
            switch(sign){
            case "×" :performOperation() {$0 * $1}
            case "÷" :performOperation() {$1 / $0}
            case "−" :performOperation() {$1 - $0}
            case "+" :performOperation() {$1 + $0}
            case "√" :performOperation() {sqrt($0)}
            case "^" :performOperation() {pow($1, $0)}
            default: break
            }
            
            

        
    }
    
    @IBAction func clear () {
    displayValue = 0
    displayLabel.text = "0"
        isUserMiddleOfTypingANumber = true
    }
    
    @IBAction func allClear () {
        clear()
        internalStack.removeAll()
        print("internalStack= \(internalStack)")
    }
    
    
    func performOperation(_ perform: (Double,Double) -> Double) {
        if internalStack.count >= 2{
        displayValue = perform(internalStack.removeLast(), internalStack.removeLast())
            enter()
    }
    }
    func performOperation(_ perform: (Double) -> Double) {
        if internalStack.count == 1{
            displayValue = perform(internalStack.removeLast())
            enter()
        }
    }
    func multiply (op1: Double, op2: Double) -> Double {
        return op1*op2
    }
    
    var displayValue : Double {
        get{
            return (displayLabel.text! as NSString).doubleValue
            
        }
        set{
            displayLabel.text = ("\(newValue)")
            
        }
    }
    
    
    
}

