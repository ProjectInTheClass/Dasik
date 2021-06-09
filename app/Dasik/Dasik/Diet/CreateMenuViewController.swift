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
    
    @IBAction func makeMenu(_ sender: Any) {
        var rejectflag:Int = 0
        
        if let tmpHeight = Float(UserHeight.text!){
            TmpUser.height = tmpHeight
        }
        else{
            TmpUser.height = 0.0
            rejectflag = 1
        }
        if let tmpWeight = Float(UserWeight.text!){
            TmpUser.weight = tmpWeight
        }
        else{
            TmpUser.weight = 0.0
            rejectflag = 1
        }
        
        if rejectflag == 1 {
            let alert = UIAlertController(title: "실패", message: "키와 몸무게를 입력해주셔야 합니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
        }
        else{
            makeMenuAPI()
            let alert = UIAlertController(title: "성공", message: "식단표가 완성되었습니다. 성공적인 다이어트를 기원합니다.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
        }
        print(TmpUser.name)
        print(TmpUser.height)
        print(TmpUser.weight)
    }
    
    public func makeMenuAPI(){
        
        
        print("makeMenuAPI Function Start!")
        let dic:[String : Any] = ["height":TmpUser.height, "weight": TmpUser.weight,
                                  "egg":TmpUser.allergy[0], "milk":TmpUser.allergy[1], "maemil":TmpUser.allergy[2],
                                  "mil":TmpUser.allergy[3], "daedu":TmpUser.allergy[4], "peanut":TmpUser.allergy[5],
                                  "hodu":TmpUser.allergy[6], "bean":TmpUser.allergy[7], "fish":TmpUser.allergy[8],
                                  "shrimp":TmpUser.allergy[9],"crab":TmpUser.allergy[10],"jogae":TmpUser.allergy[11],
                                  "squid":TmpUser.allergy[12], "fork":TmpUser.allergy[13],"chicken":TmpUser.allergy[14],
                                  "beef":TmpUser.allergy[15], "ahawng":TmpUser.allergy[16], "peach":TmpUser.allergy[17],
                                  "tomato":TmpUser.allergy[18]]
        
        guard let url = URL(string:"http://222.108.114.91:8080/foods/getMenu".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            print(request)
        }
        catch{
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept-Type")
         
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: { (data, response, error) in

            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as! [String:[Any]]
            let foodjsons = json!["diets"] as! [Any]
            
            foodjsons.forEach{ item in
                guard let object = item as? [String : Any] else { return }
                // 가지고 있는 string key값을 이용하여 값을 가져온다.
                var date = object["date"] as! String
                let time = object["time"] as! String
                let food = object["food"] as! Any
                
                guard let foodObject = food as? [String : Any] else {return}
                let name = foodObject["name"] as! String
                let type = foodObject["type"] as! String
                let ingredient = foodObject["ingredient"] as! String
                let kcal = foodObject["kcal"] as! Double
                let carbo = foodObject["carbo"] as! Double
                let protein = foodObject["protein"] as! Double
                let fat = foodObject["fat"] as! Double
                let price = foodObject["price"] as! Int
                let siteurl = foodObject["siteurl"] as! String
                
                var dates = date.components(separatedBy: "-")
                if dates[0].count == 1 {dates[0] = "0" + dates[0]}
                if dates[1].count == 1 {dates[1] = "0" + dates[1]}
                date = dates[0] + "-" + dates[1]
                
                DietFoods.append(DietFood(date: date, time: time, name: name, type: type, ingredient: ingredient, kcal: kcal, carbo: carbo, protein: protein, fat: fat, price: price, siteurl: siteurl))
            }
            DietFoods.forEach{ item in
                //해당 날짜에 해당하는 정보가 있는지 판별
                
                print("date : \(item.date), name : \(item.name), type : \(item.type), kcal : \(item.kcal), siteurl: \(item.siteurl)")
            }
        }).resume()
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
