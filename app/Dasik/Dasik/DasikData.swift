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
    var checkMeal : [ String : Int] = ["06-02":1, "06-03":2, "06-13":3,"06-14":0, "06-01":3]
}

public struct DayMealInfo{
    var date : String
    var breakFast : RankFood
    var lunch : RankFood
    var dinner : RankFood
}

public struct MonthlyDietInfo{
    var monthDiet : [DayMealInfo] = [dayMeal, dayMeal2, dayMeal3]
}

var TmpUser = UserInfo(name: "junkyo", height: 175.0, weight: 75)
var tmp = RankFood(name: "스테이크 닭가슴살", type:"닭가슴살",ingredient: "두유", kcal:138, carbohydrate: 9.74, protein:18.91, fat:2.6,price:2900,siteurl:"www.naver.com" , foodimage: "testimage")
var tmp1 = RankFood(name: "HI 닭가슴살", type:"닭가슴살",ingredient: "두유", kcal:138, carbohydrate: 9.74, protein:18.91, fat:2.6,price:3100,siteurl:"www.naver.com" , foodimage: "testimage")
var tmp2 = RankFood(name: "Good 닭가슴살", type:"닭가슴살",ingredient: "두유", kcal:138, carbohydrate: 9.74, protein:18.91, fat:2.6,price:3300,siteurl:"www.naver.com" , foodimage: "testimage")
var dayMeal = DayMealInfo(date: "06-01", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal2 = DayMealInfo(date: "06-02", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal3 = DayMealInfo(date: "06-03", breakFast: tmp, lunch: tmp1, dinner: tmp2)

var tmpMonthMeal = MonthlyDietInfo()
