//
//  DasikData.swift
//  Dasik
//
//  Created by 희준이 on 2021/06/04.
//

import Foundation


public struct RegularDietFood{
    var name: String        //이름
    var type: String        //종류
    var ingredient: String  //성분
    var kcal: Double        //칼로리
    var carbohydrate:Double //탄수화물
    var protein:Double      //단백질
    var fat:Double          //지방
    var price:Int           //가격
    var foodimage:String        //음식사진
}

public struct UserInfo:Codable{
    var name : String
    var height : Float
    var weight : Float
    var allergy : [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var checkMeal : [String : String]
    var monthDiet : [DayMealInfo]
}

public struct DayMealInfo:Codable{
    var date : String
    var breakFast : [RankFood]
    var lunch : [RankFood]
    var dinner : [RankFood]
}

//var monthDiet : [DayMealInfo]! = []

var TmpUser = UserInfo(name: "홍길동", height: 0.0, weight: 0.0, checkMeal: [:] , monthDiet: [] )

var tmp = RankFood(name: "아직 준비중 입니다", type:"",ingredient: "", kcal:0.0, carbo: 0.0, protein:0.0, fat:0.0,price:0,siteurl:"", foodimage: "testimage")
//var tmp1 = RankFood(name: "HI 닭가슴살", type:"닭가슴살",ingredient: "우유", kcal:138, carbo: 9.74, protein:18.91, fat:2.6,price:3100,siteurl:"www.naver.com",foodimage: "testimage")
//var tmp2 = RankFood(name: "Good 닭가슴살", type:"닭가슴살",ingredient: "우유", kcal:138, carbo: 9.74, protein:18.91, fat:2.6,price:3300,siteurl:"www.naver.com",foodimage: "testimage")

var defaultMealInfo = DayMealInfo(date: "06-01", breakFast: [tmp, tmp], lunch: [tmp, tmp], dinner: [tmp, tmp])

struct changeData {
    
    
    public func getUserInfofromServer(){
        print("getUserInfo Function Start!")

        guard let url = URL(string:"http://3.37.163.248:9000/users/findUser".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        do{
            let dic:Dictionary = ["userName":String(TmpUser.name)]
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

            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as! [String : Any]
//            print(json!)
            let userjsons = json!["user"] as? [[String:Any]]
//            print(userjsons!)
            
//            let height = userjsons!["height"]
//            print(height)
            userjsons!.forEach{info in
                let weight = info["weight"] as! Float
                let height = info["height"] as! Float
                let allergy = info["allergy"] as! [Int]
                if let checkMeal = info["checkMeal"] as? [String : String] {
                    TmpUser.checkMeal = checkMeal
                    print("not null")
                    print(checkMeal)
                }
                else{
                    TmpUser.checkMeal = [:]
                    print("null checkmeal")
                }
                let monthDiets = info["monthDiet"] as? [[String:Any]]
                
                monthDiets!.forEach{days in
                    var dayMeal = DayMealInfo(date: "", breakFast: [], lunch: [], dinner: [])
                    let date = days["date"] as! String
                    let bfs = days["breakFast"] as? [[String:Any]]
                    let lus = days["lunch"] as? [[String:Any]]
                    let dfs = days["dinner"] as? [[String:Any]]
                    var breakfastList:[RankFood] = []
                    bfs!.forEach{ bf in
                        let name = bf["name"] as! String
                        let type = bf["type"] as! String
                        let ingredient = bf["ingredient"] as! String
                        let kcal = bf["kcal"] as! Double
                        let carbo = bf["carbo"] as! Double
                        let protein = bf["protein"] as! Double
                        let fat = bf["fat"] as! Double
                        let price = bf["price"] as! Int
                        let siteurl = bf["siteurl"] as! String
                        let foodimage = bf["foodimage"] as! String
                        
                        breakfastList.append(RankFood(name: name, type: type, ingredient: ingredient, kcal: kcal, carbo: carbo, protein: protein, fat: fat, price: price, siteurl: siteurl, foodimage:foodimage))
                    }
                    dayMeal.date = date
                    dayMeal.breakFast = breakfastList
                    
                    var lunchList:[RankFood] = []
                    lus!.forEach{ bf in
                        let name = bf["name"] as! String
                        let type = bf["type"] as! String
                        let ingredient = bf["ingredient"] as! String
                        let kcal = bf["kcal"] as! Double
                        let carbo = bf["carbo"] as! Double
                        let protein = bf["protein"] as! Double
                        let fat = bf["fat"] as! Double
                        let price = bf["price"] as! Int
                        let siteurl = bf["siteurl"] as! String
                        let foodimage = bf["foodimage"] as! String
                        
                        lunchList.append(RankFood(name: name, type: type, ingredient: ingredient, kcal: kcal, carbo: carbo, protein: protein, fat: fat, price: price, siteurl: siteurl, foodimage:foodimage))
                    }
                    dayMeal.lunch = lunchList
                    
                    var dinnerList:[RankFood] = []
                    dfs!.forEach{ bf in
                        let name = bf["name"] as! String
                        let type = bf["type"] as! String
                        let ingredient = bf["ingredient"] as! String
                        let kcal = bf["kcal"] as! Double
                        let carbo = bf["carbo"] as! Double
                        let protein = bf["protein"] as! Double
                        let fat = bf["fat"] as! Double
                        let price = bf["price"] as! Int
                        let siteurl = bf["siteurl"] as! String
                        let foodimage = bf["foodimage"] as! String
                        
                        dinnerList.append(RankFood(name: name, type: type, ingredient: ingredient, kcal: kcal, carbo: carbo, protein: protein, fat: fat, price: price, siteurl: siteurl, foodimage:foodimage))
                    }
                    dayMeal.dinner = dinnerList
                    
                    TmpUser.monthDiet.append(dayMeal)
                    print(dayMeal)
                    
                    
                    
                    
                    print(date)
                    
                }

                TmpUser.height = height
                TmpUser.weight = weight
                TmpUser.allergy = allergy
            }
            
            
        }).resume()
        
        
    }
    public func sendUserInfotoServer(){
        print("sendUserInfo Function Start!")
        
        guard let url = URL(string:"http://3.37.163.248:9000/users/saveUserInfo".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do{
            print("TmpUser-------")
            print(TmpUser)
            
            var encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData:Data = try encoder.encode(TmpUser) // data
            print(jsonData)
            request.httpBody = jsonData

        }
        catch{
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept-Type")
             
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: { (data, response, error) in

            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
            print("json------------")
            print(json!)

        }).resume()
    }

}

var changedata = changeData()
