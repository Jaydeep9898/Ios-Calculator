//
//  ViewController.swift
//  Calculator
//
//  Created by Jaydeep Khambholja on 2019-04-10.
//  Copyright © 2019 Jaydeep Khambholja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath: Bool = false;
    var operation: Int = 0;
    var done = false;
    var hasDot = false;
    
    @IBOutlet weak var output: UILabel!
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath || ( numberOnScreen == 0 && !hasDot ) || done{
            
            output.text = String(sender.tag)
            numberOnScreen = Double(output.text!)!
            performingMath = false
            done = false
            hasDot = false
            
        }else{
            output.text = output.text! + String(sender.tag)
            numberOnScreen = Double(output.text!)!
        }
        
    }
    
    @IBAction func comma(_ sender: UIButton) {
        if(!hasDot){
            output.text = output.text! + (sender.titleLabel?.text!)!
            hasDot = true;
        }
    }
    
    
    @IBAction func clear(_ sender: Any) {
        
        output.text = "0";
        numberOnScreen = 0;
        previousNumber = 0;
        operation = 0;
        performingMath = false;
        hasDot = false;
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        func div(a:Double, b:Double)->Double{
            return a/b;
        }
        func mult(a:Double, b:Double)->Double{
            return a*b;
        }
        func sub(a:Double, b:Double)->Double{
            return a-b;
        }
        func add(a:Double, b:Double)->Double{
            return a+b;
        }
        
        if(sender.tag != 15){
            
            previousNumber = Double(output.text!)!;
            output.text = sender.titleLabel?.text;
            operation = sender.tag;
            performingMath = true;
            
        }else{
            switch operation{
                case 11:
                    output.text = String(div(a: previousNumber, b: numberOnScreen));
                
                case 12:
                    output.text = String(mult(a: previousNumber, b: numberOnScreen));

                case 13:
                    output.text = String(sub(a: previousNumber, b: numberOnScreen));

                case 14:
                    output.text = String(add(a: previousNumber, b: numberOnScreen));
                
                default:
                    output.text = String("Error");

            }
            done = true;
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

