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
    var siteurl:String      //사이트url
    var foodimage:String        //음식사진
}

public struct UserInfo{
    var name : String
    var height : Float
    var weight : Float
    var allergy : [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var checkMeal : [ String : Int] = ["06-11":1, "06-12":2, "06-13":3,"06-14":0, "06-01":3]
}

public struct DayMealInfo{
    var date : Date
    var breakFast : RankFood
    var lunch : RankFood
    var dinner : RankFood
}

public struct MonthlyDietInfo{
    var monthDiet : [DayMealInfo]
}

var TmpUser = UserInfo(name: "junkyo", height: 175.0, weight: 75)

