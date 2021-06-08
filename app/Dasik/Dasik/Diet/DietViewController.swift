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
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.delegate = self
        calendar.dataSource = self
        
    }
    
}
extension DietViewController:FSCalendarDelegate,FSCalendarDataSource, FSCalendarDelegateAppearance{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        
        selectData = dateFormatter.string(from: date)
        
        self.performSegue(withIdentifier: "DietDetail", sender: nil)
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        
        let today = Date.init()
        let today_string = dateFormatter.string(from: today)
        
        let key = dateFormatter.string(from: date)
        
        if key == today_string{
            return .blue
        }
        
        if let colorindex = TmpUser.checkMeal[key] {
            if colorindex == 0{
                return UIColor.gray
            }
            else if colorindex == 1{
                return UIColor.red
            }
            else if colorindex == 2{
                return UIColor.orange
            }
            else{
                return UIColor.green
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
