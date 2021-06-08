//
//  DietDetailViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/06/08.
//

import UIKit

class DietDetailViewController: UIViewController {
    
    var selectedData : String = ""

    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = selectedData

        // Do any additional setup after loading the view.
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
