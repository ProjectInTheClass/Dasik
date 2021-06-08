//
//  CreateMenuViewController.swift
//  Dasik
//
//  Created by 이현민 on 2021/06/09.
//

import UIKit

class CreateMenuViewController: UIViewController {

    @IBOutlet var UserHeight: UITextField!
    @IBOutlet var UserWeight: UITextField!
    
    @IBOutlet var egg: UISwitch!
    @IBOutlet var milk: UISwitch!
    @IBOutlet var maemil: UISwitch!
    @IBOutlet var mil: UISwitch!
    @IBOutlet var daedu: UISwitch!
    @IBOutlet var peanut: UISwitch!
    @IBOutlet var hodu: UISwitch!
    @IBOutlet var bean: UISwitch!
    @IBOutlet var fish: UISwitch!
    @IBOutlet var shrimp: UISwitch!
    @IBOutlet var crab: UISwitch!
    @IBOutlet var jogae: UISwitch!
    @IBOutlet var squid: UISwitch!
    @IBOutlet var fork: UISwitch!
    @IBOutlet var chicken: UISwitch!
    @IBOutlet var beef: UISwitch!
    @IBOutlet var ahwang: UISwitch!
    @IBOutlet var peach: UISwitch!
    @IBOutlet var tomato: UISwitch!
    
    var allergyNames:[UISwitch]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allergyNames = [egg,milk,maemil,mil,daedu,peanut,hodu,bean,fish,shrimp,crab,jogae,squid,fork,chicken,beef,ahwang,peach,tomato]
        // Do any additional setup after loading the view.
        let allergySize = TmpUser.allergy.count
        for i in 0..<allergySize{
            if TmpUser.allergy[i] == 1{
                allergyNames[i].isOn = true
            }
            else{
                allergyNames[i].isOn = false
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        let index = sender.tag
        
        TmpUser.allergy[index] = 1 - TmpUser.allergy[index]
        let allergySize = TmpUser.allergy.count
        for i in 0..<allergySize{
            if TmpUser.allergy[i] == 1{
                allergyNames[i].isOn = true
            }
            else{
                allergyNames[i].isOn = false
            }
        }
        print(TmpUser.allergy)
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
