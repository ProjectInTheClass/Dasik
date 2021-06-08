//
//  HomeViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/05/26.
//

import UIKit
import Charts

class HomeViewController: UIViewController {
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var percentLabel: UILabel!
    @IBOutlet var barChartView: BarChartView!
    @IBOutlet var breakfastButton: UIButton!
    @IBOutlet var lunchButton: UIButton!
    @IBOutlet var dinnerButton: UIButton!
    
    var bfBNum: Int = 0
    var lBNum: Int = 0
    var dBNum: Int = 0
    var dates: [String]!
    var kcals: [Double]!
    
    let mainColor = #colorLiteral(red: 0.7457820773, green: 0.5518586636, blue: 0.2199451327, alpha: 1)
    let checkGreen = #colorLiteral(red: 0.115068391, green: 0.7852822542, blue: 0.1747186184, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
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
        
        dates = WeekString()
        kcals = [300.0, 314.5, 350.0, 233.3, 400.0, 520.0, 410.0]
        
        barChartView.noDataText = "데이터가 없습니다."
        barChartView.noDataFont = .systemFont(ofSize: 20)
        barChartView.noDataTextColor = .lightGray
        
        percentLabel.text = String(progressView.progress * 100) + "%"
        
        setChart(dataPoints: dates, values: kcals)
    }
    
    func WeekString() -> [String]{
        var dates: [String] = []
        let now = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        
        let day1 = DateComponents(day: -1)
        let day2 = DateComponents(day: -2)
        let day3 = DateComponents(day: -3)
        let day4 = DateComponents(day: -4)
        let day5 = DateComponents(day: -5)
        let day6 = DateComponents(day: -6)
        
        dateFormatter.dateFormat = "MM-dd"
        
        if let D6 = calendar.date(byAdding: day6, to: now){
            dates.append(dateFormatter.string(from: D6))
        }
        if let D5 = calendar.date(byAdding: day5, to: now){
            dates.append(dateFormatter.string(from: D5))
        }
        if let D4 = calendar.date(byAdding: day4, to: now){
            dates.append(dateFormatter.string(from: D4))
        }
        if let D3 = calendar.date(byAdding: day3, to: now){
            dates.append(dateFormatter.string(from: D3))
        }
        if let D2 = calendar.date(byAdding: day2, to: now){
            dates.append(dateFormatter.string(from: D2))
        }
        if let D1 = calendar.date(byAdding: day1, to: now){
            dates.append(dateFormatter.string(from: D1))
        }
        dates.append(dateFormatter.string(from: now))
        
        return dates
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
        // 옵션 애니메이션
        //barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)


        // 리미트라인
        //let ll = ChartLimitLine(limit: 10.0, label: "타겟")
        //barChartView.leftAxis.addLimitLine(ll)


        // 맥시멈
        //barChartView.leftAxis.axisMaximum = 30
        // 미니멈
        barChartView.leftAxis.axisMinimum = 0

        
        // 백그라운드컬러
        //barChartView.backgroundColor = .yellow
        
    }
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


