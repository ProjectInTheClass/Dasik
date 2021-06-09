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
    
    var dayMeal : DayMealInfo!
    
    @IBOutlet var navigation: UINavigationItem!
    
    @IBOutlet var breakfastKcal: UILabel!
    @IBOutlet var lunchKcal: UILabel!
    @IBOutlet var dinnerKcal: UILabel!
    
    @IBOutlet var breakfastButton: UIButton!
    @IBOutlet var lunchButton: UIButton!
    @IBOutlet var dinnerButton: UIButton!
    
    @IBOutlet var mealNameLabels: [UILabel]!
    @IBOutlet var mealKcalLabels: [UILabel]!
    @IBOutlet var mealDangerLabels: [UILabel]!
    
    var bfBNum: Int = 0
    var lBNum: Int = 0
    var dBNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigation.title = selectedData + " 식단"
        getMealInfo()
        
        breakfastKcal.text = String(round((dayMeal.breakFast[0].kcal + dayMeal.breakFast[1].kcal)*100)/100) + " kcal"
        breakfastKcal.textColor = .lightGray
        lunchKcal.text = String(round((dayMeal.lunch[0].kcal + dayMeal.lunch[1].kcal)*100)/100) + " kcal"
        lunchKcal.textColor = .lightGray
        dinnerKcal.text = String(round((dayMeal.dinner[0].kcal + dayMeal.dinner[1].kcal)*100)/100) + " kcal"
        dinnerKcal.textColor = .lightGray
            
        getDayInfo()
        updateUI()
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
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == 0{
            bfBNum = 1 - bfBNum
        }else if sender.tag == 1{
            lBNum = 1 - lBNum
        }else if sender.tag == 2{
            dBNum = 1 - dBNum
        }
        updateUI()
        let changedCheckMeal = "" + String(bfBNum) + String(lBNum) + String(dBNum)
        TmpUser.checkMeal.updateValue(changedCheckMeal, forKey: selectedData)
        changedata.sendUserInfotoServer()
        
    }
        
    func getDayInfo(){
        if let buttonInfo = TmpUser.checkMeal[selectedData]{
            if buttonInfo[buttonInfo.startIndex] == "1"{
                bfBNum = 1
            }else if buttonInfo[buttonInfo.startIndex] == "0"{
                bfBNum = 0
            }
                
            if buttonInfo[buttonInfo.index(buttonInfo.endIndex, offsetBy: -2)] == "1"{
                lBNum = 1
            }else if buttonInfo[buttonInfo.index(buttonInfo.endIndex, offsetBy: -2)] == "0"{
                lBNum = 0
            }
                
            if buttonInfo[buttonInfo.index(buttonInfo.endIndex, offsetBy: -1)] == "1"{
                dBNum = 1
            }else if buttonInfo[buttonInfo.index(buttonInfo.endIndex, offsetBy: -1)] == "0"{
                dBNum = 0
                }
        }else{
            return ;
        }
    }
        
    func updateUI(){
        mealNameLabels[0].text = dayMeal.breakFast[0].name
        mealNameLabels[1].text = dayMeal.breakFast[1].name
        mealNameLabels[2].text = dayMeal.lunch[0].name
        mealNameLabels[3].text = dayMeal.lunch[1].name
        mealNameLabels[4].text = dayMeal.dinner[0].name
        mealNameLabels[5].text = dayMeal.dinner[1].name
        
        mealKcalLabels[0].text = String(dayMeal.breakFast[0].kcal) + "kcal"
        mealKcalLabels[1].text = String(dayMeal.breakFast[1].kcal) + "kcal"
        mealKcalLabels[2].text = String(dayMeal.lunch[0].kcal) + "kcal"
        mealKcalLabels[3].text = String(dayMeal.lunch[1].kcal) + "kcal"
        mealKcalLabels[4].text = String(dayMeal.dinner[0].kcal) + "kcal"
        mealKcalLabels[5].text = String(dayMeal.dinner[1].kcal) + "kcal"
        
        mealDangerLabels[0].text = "주의성분 : " + dayMeal.breakFast[0].ingredient
        mealDangerLabels[1].text = "주의성분 : " + dayMeal.breakFast[1].ingredient
        mealDangerLabels[2].text = "주의성분 : " + dayMeal.lunch[0].ingredient
        mealDangerLabels[3].text = "주의성분 : " + dayMeal.lunch[1].ingredient
        mealDangerLabels[4].text = "주의성분 : " + dayMeal.dinner[0].ingredient
        mealDangerLabels[5].text = "주의성분 : " + dayMeal.dinner[1].ingredient
        
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
    }
    
    func getMealInfo(){
        var dayflag = 0
        for tmp in TmpUser.monthDiet{
            if selectedData == tmp.date{
                dayMeal = tmp
                dayflag = 1
                break
            }
        }
        if dayflag == 0 {
            dayMeal = defaultMealInfo
        }
    }
    
    
}
