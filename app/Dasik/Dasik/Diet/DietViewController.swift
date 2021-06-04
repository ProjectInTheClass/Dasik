//
//  HomeViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/05/26.
//

import UIKit
import FSCalendar

class DietViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    @IBOutlet weak var calendar: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        return "kcal :\nkcal :\nkcal :\n"
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyy-MM-dd"
                
        dateSelected = dataFormatter.string(from: date)
                
        let vc = DietVC()
        self.present(vc, animated: true, completion: nil)
    }
}
