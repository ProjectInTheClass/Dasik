//
//  HomeViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/05/26.
//

import UIKit
import FSCalendar

class DietViewController: UIViewController {
    var selectData : String = ""
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet var todayColor: UIView!
    @IBOutlet var zeroColor: UIView!
    @IBOutlet var oneColor: UIView!
    @IBOutlet var twoColor: UIView!
    @IBOutlet var threeColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        todayColor.backgroundColor = .blue
        zeroColor.backgroundColor = .white
        oneColor.backgroundColor =  #colorLiteral(red: 0.9999999404, green: 0.4634621441, blue: 0.4539236426, alpha: 1)
        twoColor.backgroundColor = #colorLiteral(red: 0.9565297365, green: 0.9999999404, blue: 0.4745624959, alpha: 1)
        threeColor.backgroundColor = #colorLiteral(red: 0.5128232241, green: 0.9999999404, blue: 0.5238958001, alpha: 1)
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calendar.reloadData()
    }
}

extension DietViewController:FSCalendarDelegate,FSCalendarDataSource, FSCalendarDelegateAppearance{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        
        selectData = dateFormatter.string(from: date)
        
        self.performSegue(withIdentifier: "DietDetail", sender: nil)
        
        calendar.deselect(date)
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let redColor = #colorLiteral(red: 0.9999999404, green: 0.4634621441, blue: 0.4539236426, alpha: 1)
        let yellowColor = #colorLiteral(red: 0.9565297365, green: 0.9999999404, blue: 0.4745624959, alpha: 1)
        let greenColor = #colorLiteral(red: 0.5128232241, green: 0.9999999404, blue: 0.5238958001, alpha: 1)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        
        let today = Date.init()
        let today_string = dateFormatter.string(from: today)
        
        let key = dateFormatter.string(from: date)
        
        if today < date {
            return UIColor.white
        }
        
        if key == today_string{
            return .blue
        }
        
        if let colorindex = TmpUser.checkMeal[key] {
            var sum = 0
                for i in colorindex{
                    if i == "1"{
                        sum = sum+1
                    }
                }
            if sum == 0{
                return UIColor.white
            }
            else if sum == 1{
                return redColor
            }
            else if sum == 2{
                return yellowColor
            }
            else{
                return greenColor
            }
            }else {
                return UIColor.white
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? DietDetailViewController{
            detail.selectedData = selectData
        }
    }
}
