//
//  UserInfoSettingViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/06/05.
//

import UIKit

class UserInfoSettingViewController: UIViewController {

    @IBOutlet weak var dietScrollView: UIScrollView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MyTapMethod))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        dietScrollView.addGestureRecognizer(singleTapGestureRecognizer)
        dietScrollView.addGestureRecognizer(singleTapGestureRecognizer)
        
        // Do any additional setup after loading the view.
        nameTextField.keyboardType = .default
        heightTextField.keyboardType = .decimalPad
        weightTextField.keyboardType = .decimalPad
        
        nameTextField.text = TmpUser.name
        if TmpUser.height != 0.0{
            heightTextField.text = String(TmpUser.height)
        }
        if TmpUser.weight != 0.0{
            weightTextField.text = String(TmpUser.weight)
        }
        
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
    
    @objc func MyTapMethod(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
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
