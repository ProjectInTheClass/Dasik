//
//  AllergyViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/06/04.
//

import UIKit

class AllergyViewController: UIViewController {

    @IBOutlet var allergyButtons: [UISwitch]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        let index = sender.tag
        TmpUser.allergy[index] = 1 - TmpUser.allergy[index]
        
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
