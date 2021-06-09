//
//  UserInfoSettingViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/06/05.
//

import UIKit

class UserInfoSettingViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nameTextField.keyboardType = .default
        heightTextField.keyboardType = .decimalPad
        weightTextField.keyboardType = .decimalPad
        nameTextField.placeholder = TmpUser.name
        heightTextField.placeholder = String(TmpUser.height)
        weightTextField.placeholder = String(TmpUser.weight)
    }
    
    @IBAction func setUserInfo(_ sender: Any) {
        TmpUser.name = nameTextField.text!
        if let tmpHeight = Float(heightTextField.text!){
            TmpUser.height = tmpHeight
        }
        else{
            TmpUser.height = 0.0
        }
        if let tmpWeight = Float(weightTextField.text!){
            TmpUser.weight = tmpWeight
        }
        else{
            TmpUser.weight = 0.0
        }
        print(TmpUser.name)
        print(TmpUser.height)
        print(TmpUser.weight)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
