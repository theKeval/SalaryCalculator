//
//  ViewController.swift
//  SalaryCalculator
//
//  Created by Keval on 3/9/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
            kidsCount.text = "0"
        }
    }
    
    @IBAction func stepperClick(_ sender: UIStepper) {
        kidsCount.text = String(Int(sender.value))
    }
    
    @IBAction func btnJavaClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
    }
    @IBAction func btnCSharpClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
    }
    @IBAction func btnSwiftClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
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
    @IBAction func btnPythonClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
    }
    @IBAction func btnRClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
    }
    @IBAction func btnJavascriptClicked(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
    }
    
    
}

