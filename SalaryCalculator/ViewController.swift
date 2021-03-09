//
//  ViewController.swift
//  SalaryCalculator
//
//  Created by Keval on 3/9/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var qualificationPicker: UIPickerView!
    @IBOutlet weak var btnSingle: UIButton!
    @IBOutlet weak var btnNotSingle: UIButton!
    @IBOutlet weak var switchKids: UISwitch!
    @IBOutlet weak var lableKidsNo: UILabel!
    @IBOutlet weak var lableKidsYes: UILabel!
    @IBOutlet weak var lableKidsNumber: UILabel!
    @IBOutlet weak var stepperKids: UIStepper!
    @IBOutlet weak var kidsCount: UILabel!
    
    @IBOutlet weak var btnJava: UIButton!
    @IBOutlet weak var btnCSharp: UIButton!
    @IBOutlet weak var btnSwift: UIButton!
    @IBOutlet weak var btnPhp: UIButton!
    @IBOutlet weak var btnPython: UIButton!
    @IBOutlet weak var btnR: UIButton!
    @IBOutlet weak var btnJavaScript: UIButton!
    
    @IBOutlet weak var fieldExperience: UITextField!
    
    @IBOutlet weak var txtSalary: UILabel!
    
    var qualifications = ["Bachelor", "Diploma", "High School"]
    var salary = Double(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        qualificationPicker.delegate = self
        qualificationPicker.dataSource = self
        
        switchKids.isOn = false
        lableKidsNo.isEnabled = true
        lableKidsYes.isEnabled = false
        lableKidsNumber.isEnabled = false
        stepperKids.isEnabled = false
        kidsCount.isEnabled = false
        
        pickerView(qualificationPicker, didSelectRow: 0, inComponent: 1)
        
        fieldExperience.delegate = self
        
        txtSalary.text = String(salary)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return qualifications.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return qualifications[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // selected row at 'row'
        switch row {
            case 0:
                salary = Double(55000)
                txtSalary.text = String(salary)
                
            case 1:
                salary = Double(47000)
                txtSalary.text = String(salary)
                
            case 2:
                salary = Double(40000)
                txtSalary.text = String(salary)
                
            default:
                salary = Double(0)
                txtSalary.text = String(salary)
        }
    }
    
    @IBAction func btnSingleClicked(_ sender: UIButton) {
        btnSingle.isSelected = true
        btnNotSingle.isSelected = false
    }
    @IBAction func btnNotSingleClicked(_ sender: UIButton) {
        btnSingle.isSelected = false
        btnNotSingle.isSelected = true
    }

    @IBAction func switchKids(_ sender: UISwitch) {
        if sender.isOn {
            lableKidsYes.isEnabled = true
            lableKidsNo.isEnabled = false
            
            lableKidsNumber.isEnabled = true
            stepperKids.isEnabled = true
            kidsCount.isEnabled = true
        }
        else {
            lableKidsYes.isEnabled = false
            lableKidsNo.isEnabled = true
            
            lableKidsNumber.isEnabled = false
            stepperKids.isEnabled = false
            kidsCount.isEnabled = false
            
            if let kids = Int(kidsCount.text!) {
                if kids > 0 {
                    salary -= Double(kids * 7000)
                    txtSalary.text = String(salary)
                    stepperKids.value = stepperKids.minimumValue
                    kidsCount.text = String(0)
                }
            }
            
        }
    }
    @IBAction func stepperClick(_ sender: UIStepper) {
    
        if sender.value > Double(kidsCount.text!)! {
            salary += 7000   // (sender.value * 7000)
        }
        else {
            salary -= 7000
        }
        
        kidsCount.text = String(Int(sender.value))
        txtSalary.text = String(salary)
    }
    
    
    @IBAction func btnSwiftClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
            if btnPython.isSelected || btnR.isSelected {
                // do nothing
            }
            else {
                salary -= 5000
                txtSalary.text = String(salary)
            }
            
        }
        else {
            sender.isSelected = true
            
            if btnPython.isSelected || btnR.isSelected {
                // do nothing
            }
            else {
                salary += 5000
                txtSalary.text = String(salary)
            }
            
        }
        
    }
    @IBAction func btnPythonClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
            if btnSwift.isSelected || btnR.isSelected {
                // do nothing
            }
            else {
                salary -= 5000
                txtSalary.text = String(salary)
            }
            
        }
        else {
            sender.isSelected = true
            
            if btnSwift.isSelected || btnR.isSelected {
                // do nothing
            }
            else {
                salary += 5000
                txtSalary.text = String(salary)
            }
            
        }
    }
    @IBAction func btnRClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
            if btnPython.isSelected || btnSwift.isSelected {
                // do nothing
            }
            else {
                salary -= 5000
                txtSalary.text = String(salary)
            }
            
        }
        else {
            sender.isSelected = true
            
            if btnPython.isSelected || btnSwift.isSelected {
                // do nothing
            }
            else {
                salary += 5000
                txtSalary.text = String(salary)
            }
            
        }
    }
    
    @IBAction func btnJavaClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
            if btnJavaScript.isSelected || btnCSharp.isSelected {
                // do nothing
            }
            else {
                salary -= 3000
                txtSalary.text = String(salary)
            }
            
        }
        else {
            sender.isSelected = true
            
            if btnJavaScript.isSelected || btnCSharp.isSelected {
                // do nothing
            }
            else {
                salary += 3000
                txtSalary.text = String(salary)
            }
            
        }
    }
    @IBAction func btnJavascriptClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
            if btnJava.isSelected || btnCSharp.isSelected {
                // do nothing
            }
            else {
                salary -= 3000
                txtSalary.text = String(salary)
            }
            
        }
        else {
            sender.isSelected = true
            
            if btnJava.isSelected || btnCSharp.isSelected {
                // do nothing
            }
            else {
                salary += 3000
                txtSalary.text = String(salary)
            }
            
        }
    }
    @IBAction func btnCSharpClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
            if btnJavaScript.isSelected || btnJava.isSelected {
                // do nothing
            }
            else {
                salary -= 3000
                txtSalary.text = String(salary)
            }
            
        }
        else {
            sender.isSelected = true
            
            if btnJavaScript.isSelected || btnJava.isSelected {
                // do nothing
            }
            else {
                salary += 3000
                txtSalary.text = String(salary)
            }
            
        }
    }
    
    @IBAction func btnPhpClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let _ = string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
            return true
        }
        else {
            if let _ = string.rangeOfCharacter(from: NSCharacterSet.controlCharacters) {
                return true
            }
            else {
                return false
            }
        }
    }
    
    var increasedWithExp = false
    @IBAction func calculateClicked(_ sender: UIButton) {
        
//        if fieldExperience.text == nil {
//
//            return
//        }
        
        if let txtExp = fieldExperience.text {
            if txtExp.isEmpty {
                txtSalary.text = String(salary)
                increasedWithExp = false
            }
            if let exp = Int(txtExp) {
                if exp > 3 {
                    txtSalary.text = String(salary + 10_000)
                    increasedWithExp = true
                }
                else {
                    if increasedWithExp {
                        txtSalary.text = String(salary)
                        increasedWithExp = false
                    }
                }
            }
        }
        else {
            txtSalary.text = String(salary)
            increasedWithExp = false
        }
        
    }
    
//    var salaryBeforeExp = Double(0)
    
    @IBAction func experienceChanged(_ sender: UITextField) {
//        salaryBeforeExp = salary
//
//        if let txtExp = sender.text {
//            if let exp = Int(txtExp) {
//                if exp > 3 {
//                    salary += 10_000
//                    txtSalary.text = String(salary)
//                    increasedWithExp = true
//                }
//                else {
//                    if increasedWithExp {
//                        salary -= 10_000
//                        txtSalary.text = String(salary)
//                        increasedWithExp = false
//                    }
//                }
//            }
//        }
        
    }
    
}

