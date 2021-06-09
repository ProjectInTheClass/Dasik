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
    var checkMeal : [ String : String] = ["06-02":"100", "06-03":"101", "06-13":"111","06-14":"000", "06-01":"111"]
}

public struct DayMealInfo{
    var date : String
    var breakFast : RankFood
//    var breakFastide : RankFood2
    var lunch : RankFood
//    var lunchside : RankFood2
    var dinner : RankFood
//    var dinnerside : RankFood2
}


public struct MonthlyDietInfo{
    var monthDiet : [DayMealInfo] = [dayMeal, dayMeal2, dayMeal3,dayMeal4, dayMeal5, dayMeal6,dayMeal7, dayMeal8, dayMeal9,dayMeal10, dayMeal11, dayMeal12,dayMeal13, dayMeal4, dayMeal15,dayMeal16, dayMeal17, dayMeal18,dayMeal19, dayMeal21, dayMeal22,dayMeal24]
}

var TmpUser = UserInfo(name: "junkyo", height: 175.0, weight: 75)
var tmp = RankFood(name: "스테이크 닭가슴살", type:"닭가슴살",ingredient: "우유", kcal:138, carbohydrate: 9.74, protein:18.91, fat:2.6,price:2900,siteurl:"www.naver.com" , foodimage: "testimage")
var tmp1 = RankFood(name: "HI 닭가슴살", type:"닭가슴살",ingredient: "우유", kcal:138, carbohydrate: 9.74, protein:18.91, fat:2.6,price:3100,siteurl:"www.naver.com" , foodimage: "testimage")
var tmp2 = RankFood(name: "Good 닭가슴살", type:"닭가슴살",ingredient: "우유", kcal:138, carbohydrate: 9.74, protein:18.91, fat:2.6,price:3300,siteurl:"www.naver.com" , foodimage: "testimage")

var dayMeal = DayMealInfo(date: "06-01", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal2 = DayMealInfo(date: "06-02", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal3 = DayMealInfo(date: "06-03", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal4 = DayMealInfo(date: "06-04", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal5 = DayMealInfo(date: "06-05", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal6 = DayMealInfo(date: "06-06", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal7 = DayMealInfo(date: "06-07", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal8 = DayMealInfo(date: "06-08", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal9 = DayMealInfo(date: "06-09", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal10 = DayMealInfo(date: "06-10", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal11 = DayMealInfo(date: "06-11", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal12 = DayMealInfo(date: "06-12", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal13 = DayMealInfo(date: "06-13", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal14 = DayMealInfo(date: "06-14", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal15 = DayMealInfo(date: "06-15", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal16 = DayMealInfo(date: "06-16", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal17 = DayMealInfo(date: "06-17", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal18 = DayMealInfo(date: "06-18", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal19 = DayMealInfo(date: "06-19", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal20 = DayMealInfo(date: "06-20", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal21 = DayMealInfo(date: "06-21", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal22 = DayMealInfo(date: "06-22", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal23 = DayMealInfo(date: "06-23", breakFast: tmp, lunch: tmp1, dinner: tmp2)
var dayMeal24 = DayMealInfo(date: "06-24", breakFast: tmp, lunch: tmp1, dinner: tmp2)

var tmpMonthMeal = MonthlyDietInfo()
