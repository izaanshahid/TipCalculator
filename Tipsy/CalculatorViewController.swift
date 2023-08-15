//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var tipPct: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tenPctButton.isSelected=false
        let numberKeyboard = UIKeyboardType.numberPad
                billTextField.keyboardType = numberKeyboard
       
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        let pct = sender.currentTitle!
        tipPct = sender.currentTitle
        if pct == "0%"{
            zeroPctButton.isSelected=true
            tenPctButton.isSelected=false
            twentyPctButton.isSelected=false
        }
        if pct == "10%"{
            tip = 0.1
            zeroPctButton.isSelected=false
            tenPctButton.isSelected=true
            twentyPctButton.isSelected=false
        }
        if pct == "20%"{
            tip = 0.2
            zeroPctButton.isSelected=false
            tenPctButton.isSelected=false
            twentyPctButton.isSelected=true
        }
        //print(tip)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let splitnum = Int(sender.value)
        splitNumberLabel.text = String(splitnum)
        
    }
    
    func bill()->Float{
        let input = Float(billTextField.text!)!
        let num: Float = (Float(tip) * input) + input
        let person = Float(splitNumberLabel.text!)!
        return num/person
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(bill())
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    @IBAction func inputField(_ sender: UITextField) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.billText = String(bill())
            resultVC.tip = tipPct
            resultVC.people = splitNumberLabel.text!
            
        }
    }
    
}

