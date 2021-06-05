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
        nameTextField.text = "홍길동"
        heightTextField.text = "174"
        weightTextField.text = "70"
    }
    
    @IBAction func setUserName(_ sender: Any) {
        TmpUser.name = nameTextField.text!
        print(TmpUser.name)
        print(TmpUser.height)
        print(TmpUser.weight)
    }
    
    @IBAction func setUserHeight(_ sender: Any) {
        if let tmpHeight = Float(heightTextField.text!){
            TmpUser.height = tmpHeight
        }
        print(TmpUser.name)
        print(TmpUser.height)
        print(TmpUser.weight)
    }
    @IBAction func setUserWeight(_ sender: Any) {
        if let tmpWeight = Float(weightTextField.text!){
            TmpUser.weight = tmpWeight
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
