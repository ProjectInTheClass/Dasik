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

public struct UserInfo{
    var name : String
    var height : Float
    var weight : Float
    var allergy : [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var checkMeal : [String : String] = ["06-01":"100", "06-02":"101", "06-03":"111","06-04":"010", "06-05":"111","06-06":"100", "06-07":"101", "06-08":"111","06-09":"000"]
}

public struct DayMealInfo{
    var date : String
    var breakFast : [RankFood]
    var lunch : [RankFood]
    var dinner : [RankFood]
}

var monthDiet : [DayMealInfo]! = []

var TmpUser = UserInfo(name: "junkyo", height: 175.0, weight: 75)
var tmp = RankFood(name: "", type:"",ingredient: "", kcal:0.0, carbo: 9.74, protein:18.91, fat:2.6,price:2900,siteurl:"www.naver.com", foodimage: "testimage")
var tmp1 = RankFood(name: "HI 닭가슴살", type:"닭가슴살",ingredient: "우유", kcal:138, carbo: 9.74, protein:18.91, fat:2.6,price:3100,siteurl:"www.naver.com",foodimage: "testimage")
var tmp2 = RankFood(name: "Good 닭가슴살", type:"닭가슴살",ingredient: "우유", kcal:138, carbo: 9.74, protein:18.91, fat:2.6,price:3300,siteurl:"www.naver.com",foodimage: "testimage")

var defaultMealInfo = DayMealInfo(date: "06-01", breakFast: [tmp, tmp], lunch: [tmp1, tmp1], dinner: [tmp2, tmp2])
