//
//  ViewController.swift
//  SalaryCalculator
//
//  Created by Keval on 3/9/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    // Outlet of UI Elements
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
    // -----------------------
    
    // Variable declarations
    var qualifications = ["Bachelor", "Diploma", "High School"]
    var salary = Double(0)
    // -----------------------
    
    // function called when the screen will be loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up UIPickerView by assigning
        // delegate and datasource to this ViewController
        qualificationPicker.delegate = self
        qualificationPicker.dataSource = self
        
        // setting kids switch to OFF initially
        switchKids.isOn = false
        lableKidsNo.isEnabled = true
        lableKidsYes.isEnabled = false
        lableKidsNumber.isEnabled = false
        stepperKids.isEnabled = false
        kidsCount.isEnabled = false
        
        // selecting first row of pickerVIew manually
        pickerView(qualificationPicker, didSelectRow: 0, inComponent: 1)
        
        // setting salary text with salary variable
        txtSalary.text = String(salary)
    }
    
    // supporting functions for UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // this function will calculate the number of rows required to add in pickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return qualifications.count
    }
    // this function will set the row value string from the list of qualification
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return qualifications[row]
    }
    // keeping the previous selected qualification to check and re-calculate salary by changing
    // basic salary of specific qualification
    var prevSelectedQualif = -1
    // this function will be triggered when picker view item selection will be changed
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // changing salary value according to the selected row of pickerView
        switch row {
            case 0:
                // base salary difference for transition from 'diploma' to 'bachelor'
                if prevSelectedQualif == 1 {
                    salary += 8000
                    txtSalary.text = String(salary)
                }
                // base salary difference for transition from 'high school' to 'bachelor'
                else if prevSelectedQualif == 2 {
                    salary += 15000
                    txtSalary.text = String(salary)
                }
                // if this selection is initial selection
                else if prevSelectedQualif == -1 {
                    salary = Double(55000)
                    txtSalary.text = String(salary)
                }
                
                // setting the previous selection variable to 'bachelor'
                prevSelectedQualif = 0
                
            case 1:
                // base salary difference for transition from 'bachelor' to 'diploma'
                if prevSelectedQualif == 0 {
                    salary -= 8000
                    txtSalary.text = String(salary)
                }
                // base salary difference for transition from 'high school' to 'diploma'
                else if prevSelectedQualif == 2 {
                    salary += 7000
                    txtSalary.text = String(salary)
                }
                // if this selection is initial selection
                else if prevSelectedQualif == -1 {
                    salary = Double(47000)
                    txtSalary.text = String(salary)
                }
                
                // setting the previous selection variable to 'diploma'
                prevSelectedQualif = 1
                
            case 2:
                // base salary difference for transition from 'bachelor' to 'high school'
                if prevSelectedQualif == 0 {
                    salary -= 15000
                    txtSalary.text = String(salary)
                }
                // base salary difference for transition from 'diploma' to 'high school'
                else if prevSelectedQualif == 1 {
                    salary -= 7000
                    txtSalary.text = String(salary)
                }
                // if this selection is initial selection
                else if prevSelectedQualif == -1 {
                    salary = Double(40000)
                    txtSalary.text = String(salary)
                }
                
                // setting the previous selection variable to 'high shcool'
                prevSelectedQualif = 2
                
            default:    // default case - setting salary 0
                salary = Double(0)
                txtSalary.text = String(salary)
        }
        
    }
    // -----------------------
    
    // radio button click actions
    // being single or not does not make any difference for salary increment 🙁
    @IBAction func btnSingleClicked(_ sender: UIButton) {
        // making sure only one of the radio button will be selected
        btnSingle.isSelected = true
        btnNotSingle.isSelected = false
    }
    @IBAction func btnNotSingleClicked(_ sender: UIButton) {
        // making sure only one of the radio button will be selected
        btnSingle.isSelected = false
        btnNotSingle.isSelected = true
    }
    // -----------------------
    
    // action for UISwitch to ask have kids.
    @IBAction func switchKids(_ sender: UISwitch) {
        if sender.isOn {
            // enable/disable the Yes/No lable based on the UISwitch
            lableKidsYes.isEnabled = true
            lableKidsNo.isEnabled = false
            
            // If switch is on, then let the user
            // increase/decrease number of kids
            lableKidsNumber.isEnabled = true
            stepperKids.isEnabled = true
            kidsCount.isEnabled = true
        }
        else {  // If the user select NO for have kids
            // enable/disable lable on Switch value changes
            lableKidsYes.isEnabled = false
            lableKidsNo.isEnabled = true
            
            // disable the UI elements to restrict user from entering number of kids
            lableKidsNumber.isEnabled = false
            stepperKids.isEnabled = false
            kidsCount.isEnabled = false
            
            // if user turn off the switch for kids and if there are 1 or more kids added already
            // in that case reset the kidsCount and deduct appropriate amount from salary.
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
    // stepper action to increase or decrease number of kids
    @IBAction func stepperClick(_ sender: UIStepper) {
        // condition to check whether the 'plus' button of stepper clicked
        // or the minus button of stepper clicked. accordingly add/deduct amount from salary.
        if sender.value > Double(kidsCount.text!)! {
            salary += 7000   // (sender.value * 7000)
        }
        else {
            salary -= 7000
        }
        
        // show the kids count in lable after each add/remove click
        kidsCount.text = String(Int(sender.value))
        // update the salary text
        txtSalary.text = String(salary)
    }
    
    // checkbox click events to select programming languages
    // note: similar condition check have been applied in all programming language
    // checkbox selection. comment of condition is mentioned in SwiftClicked.
    @IBAction func btnSwiftClicked(_ sender: UIButton) {
        
        // condition based on checkbox selection state
        if sender.isSelected {
            sender.isSelected = false
            
            // condition to check whether any of the three programming languages from same category
            // is already selected or not.
            if btnPython.isSelected || btnR.isSelected {
                // do nothing
            }
            else {  // if no language from same category is selected -> remove 5k for current deselection
                salary -= 5000
                txtSalary.text = String(salary)
            }
            
        }
        else {
            sender.isSelected = true
            
            // same condition to check if any of the language from same category is selected or not
            if btnPython.isSelected || btnR.isSelected {
                // do nothing
            }
            else {  // if no category is selected -> add 5k for current selection
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
    
    // second category of programming language selection
    // selecting any one of this language will add 3k to salary
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
    
    // knowing php is not important. So we'll not reward the employee for this 😕
    @IBAction func btnPhpClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
    }
    // -----------------------
    
    // taking a temporary variable to keep an eye on
    // whether we have increased the salary based on experience OR not
    var increasedWithExp = false
    // click action handler for Calculate button
    // this button mainly handles the salary difference based on years of experience.
    @IBAction func calculateClicked(_ sender: UIButton) {
        
        // check if the years of experience field text is not null
        if let txtExp = fieldExperience.text {
            // if the years of experience filed is empty and we did increased the salary before
            // it means the user have removed the previously added years, so reset the salary and
            // remove the 10k from salary
            if txtExp.isEmpty && increasedWithExp {
                salary -= 10_000
                txtSalary.text = String(salary)
                increasedWithExp = false
            }
            
            // if the years of experience is and integer parsable, only then proceed
            if let exp = Int(txtExp) {
                // if years of experience is greater than 3
                if exp > 3 {
                    // and if user did not already increased the salary -> add 10k in salary
                    if !increasedWithExp {
                        // salaryBeforeExp = salary
                        salary += 10_000
                        txtSalary.text = String(salary)
                        
                        // set increasedWithExp variable to 'true' only in this case.
                        increasedWithExp = true
                    }
                    
                }
                else {  // if years of experience is less than 3
                    // and if we have already added 10k for increased salary -> remove 10k
                    // because user have changed the years of experience from
                    // previously added >3 years to <3 years
                    if increasedWithExp {
                        salary -= 10_000
                        txtSalary.text = String(salary)
                        increasedWithExp = false
                    }
                }
            }
            
        }
        else {  // if somehow years of experience field text is null
            // and if we already have increased the salary then reset the salary
            // by removing 10k from salary
            if increasedWithExp {
                salary -= 10_000
                txtSalary.text = String(salary)
                increasedWithExp = false
            }
        }
        
    }
    
}

