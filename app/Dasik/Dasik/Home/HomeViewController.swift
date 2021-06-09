//
//  HomeViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/05/26.
//

import UIKit
import Charts

class HomeViewController: UIViewController {
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd"
        return formatter
    }()

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var percentLabel: UILabel!
    @IBOutlet var barChartView: BarChartView!
    @IBOutlet var breakfastButton: UIButton!
    @IBOutlet var lunchButton: UIButton!
    @IBOutlet var dinnerButton: UIButton!
    
    @IBOutlet var mealName: [UILabel]!
    @IBOutlet var kcalLabels: [UILabel]!
    
    var bfBNum: Int = 0
    var lBNum: Int = 0
    var dBNum: Int = 0
    var dates: [String]!
    var kcals: [Double] = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    let mainColor = #colorLiteral(red: 0.7457820773, green: 0.5518586636, blue: 0.2199451327, alpha: 1)
    let checkGreen = #colorLiteral(red: 0.115068391, green: 0.7852822542, blue: 0.1747186184, alpha: 1)
    var todayMealInfo : DayMealInfo!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        
        let now = Date.init()
        let now_string = dateFormatter.string(from: now)
        
        for tmp in tmpMonthMeal.monthDiet{
            if now_string == tmp.date{
                todayMealInfo = tmp
                break
            }
        }
        
        getUserName()
        
        mealName[0].text = todayMealInfo.breakFast.name
        mealName[2].text = todayMealInfo.lunch.name
        mealName[4].text = todayMealInfo.dinner.name
        
        kcalLabels[0].text = String(todayMealInfo.breakFast.kcal)
        kcalLabels[1].text = String(todayMealInfo.lunch.kcal)
        kcalLabels[2].text = String(todayMealInfo.dinner.kcal)
       
        dates = WeekString()
        //barChartView.noDataText = "데이터가 없습니다."
        //barChartView.noDataFont = .systemFont(ofSize: 20)
        //barChartView.noDataTextColor = .lightGray
        percentLabel.text = String(progressView.progress * 100) + "%"
        
        setChart(dataPoints: dates, values: kcals)
        
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    func getUserName(){
        let alert = UIAlertController(title: "User Name", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField(){ (userNameTextField) in
            userNameTextField.placeholder = "한현진"
            userNameTextField.keyboardType = .default
        }
        
        let ok = UIAlertAction(title: "OK", style: .default){(ok) in
            TmpUser.name = (alert.textFields?[0].text!)!
            self.updateUI()
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func WeekString() -> [String]{
        var dates: [String] = []
        let now = Date()
        let calendar = Calendar.current

        let day1 = DateComponents(day: -1)
        let day2 = DateComponents(day: -2)
        let day3 = DateComponents(day: -3)
        let day4 = DateComponents(day: -4)
        let day5 = DateComponents(day: -5)
        let day6 = DateComponents(day: -6)
        let day7 = DateComponents(day: -7)
        
        if let D7 = calendar.date(byAdding: day7, to: now){
            dates.append(dateFormatter.string(from: D7))
            let sum = getTotalKcal(date: dateFormatter.string(from: D7))
            kcals[0] = sum
        }
        if let D6 = calendar.date(byAdding: day6, to: now){
            dates.append(dateFormatter.string(from: D6))
            let sum = getTotalKcal(date: dateFormatter.string(from: D6))
            kcals[1] = sum
        }
        if let D5 = calendar.date(byAdding: day5, to: now){
            dates.append(dateFormatter.string(from: D5))
            let sum = getTotalKcal(date: dateFormatter.string(from: D5))
            kcals[2] = sum
        }
        if let D4 = calendar.date(byAdding: day4, to: now){
            dates.append(dateFormatter.string(from: D4))
            let sum = getTotalKcal(date: dateFormatter.string(from: D4))
            kcals[3] = sum
        }
        if let D3 = calendar.date(byAdding: day3, to: now){
            dates.append(dateFormatter.string(from: D3))
            let sum = getTotalKcal(date: dateFormatter.string(from: D3))
            kcals[4] = sum
        }
        if let D2 = calendar.date(byAdding: day2, to: now){
            dates.append(dateFormatter.string(from: D2))
            let sum = getTotalKcal(date: dateFormatter.string(from: D2))
            kcals[5] = sum
        }
        if let D1 = calendar.date(byAdding: day1, to: now){
            dates.append(dateFormatter.string(from: D1))
            let sum = getTotalKcal(date: dateFormatter.string(from: D1))
            kcals[6] = sum
        }
        
        return dates
    }
    
    func getTotalKcal(date : String)->Double{
        var dayMeal : DayMealInfo!
        for tmp in tmpMonthMeal.monthDiet{
            if date == tmp.date{
                dayMeal = tmp
                break
            }
        }
        return dayMeal.breakFast.kcal+dayMeal.lunch.kcal+dayMeal.dinner.kcal
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
            
        // 데이터 생성
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "섭취량(kcal)")
        
        // 차트 컬러
        
        chartDataSet.colors = [mainColor]
        
        // 데이터 삽입
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        
        // 선택 안되게
        chartDataSet.highlightEnabled = false
        // 줌 안되게
        barChartView.doubleTapToZoomEnabled = false


        // X축 레이블 위치 조정
        barChartView.xAxis.labelPosition = .bottom
        // X축 레이블 포맷 지정
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dates)

        
        // X축 레이블 갯수 최대로 설정 (이 코드 안쓸 시 Jan Mar May 이런식으로 띄엄띄엄 조금만 나옴)
        barChartView.xAxis.setLabelCount(dataPoints.count, force: false)
        
        // 오른쪽 레이블 제거
        barChartView.rightAxis.enabled = false
        
        // 기본 애니메이션
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        barChartView.leftAxis.axisMinimum = 0
        
    }
    
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
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "MM-dd"
        
        let now = Date.init()
        let now_string = dateFormmater.string(from: now)
        
        TmpUser.checkMeal.updateValue(changedCheckMeal, forKey: now_string)
    }
    
    func updateUI(){
        nameLabel.text = TmpUser.name
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
}


