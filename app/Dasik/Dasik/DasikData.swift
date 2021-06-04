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
    let name : String
    var height : Float
    var weight : Float
    var allergy : [Int]
    var checkDiet : [Int]
}

public struct DayMealInfo{
    var date : Date
    var breakFast : RegularDietFood
    var lunch : RegularDietFood
    var dinner : RegularDietFood
}

public struct MonthlyDietInfo{
    var monthDiet : [DayMealInfo]
}
