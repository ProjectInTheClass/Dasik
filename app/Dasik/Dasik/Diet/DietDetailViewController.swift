//
//  DietDetailViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/06/08.
//

import UIKit

class DietDetailViewController: UIViewController {
    
    let checkGreen = #colorLiteral(red: 0.115068391, green: 0.7852822542, blue: 0.1747186184, alpha: 1)
    var selectedData : String = ""

    @IBOutlet var navigation: UINavigationItem!
    
    @IBOutlet var breakfastKcal: UILabel!
    @IBOutlet var lunchKcal: UILabel!
    @IBOutlet var dinnerKcal: UILabel!
    
    @IBOutlet var breakfastButton: UIButton!
    @IBOutlet var lunchButton: UIButton!
    @IBOutlet var dinnerButton: UIButton!
    
    var bfBNum: Int = 0
    var lBNum: Int = 0
    var dBNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigation.title = selectedData + " 식단"
        breakfastKcal.text = "" + " kcal"
        breakfastKcal.textColor = .lightGray
        lunchKcal.text = "" + " kcal"
        lunchKcal.textColor = .lightGray
        dinnerKcal.text = "" + " kcal"
        dinnerKcal.textColor = .lightGray
        
        if bfBNum == 0{
            breakfastButton.tintColor = .lightGray
        }
        else if bfBNum == 1{
            breakfastButton.tintColor = checkGreen
        }
        
        if lBNum == 0{
            lunchButton.tintColor = .lightGray
        }
        else if lBNum == 1{
            lunchButton.tintColor = checkGreen
        }
        
        if dBNum == 0{
            dinnerButton.tintColor = .lightGray
        }
        else if dBNum == 1{
            dinnerButton.tintColor = checkGreen
        }
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
    @IBAction func breakfastButtonCheck(_ sender: UIButton) {
        if breakfastButton.tintColor == .lightGray{
            breakfastButton.tintColor = checkGreen
            bfBNum = 1
        }
        else if breakfastButton.tintColor == checkGreen{
            breakfastButton.tintColor = .lightGray
            bfBNum = 0
        }
    }
    @IBAction func lunchButtonCheck(_ sender: UIButton) {
        if lunchButton.tintColor == .lightGray{
            lunchButton.tintColor = checkGreen
            lBNum = 1
        }
        else if lunchButton.tintColor == checkGreen{
            lunchButton.tintColor = .lightGray
            lBNum = 0
        }
    }
    @IBAction func dinnerButtonCheck(_ sender: UIButton) {
        if dinnerButton.tintColor == .lightGray{
            dinnerButton.tintColor = checkGreen
            //dBNum = 1
        }
        else if dinnerButton.tintColor == checkGreen{
            dinnerButton.tintColor = .lightGray
            //dBNum = 0
        }
    }
}
