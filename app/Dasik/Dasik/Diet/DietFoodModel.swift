//
//  DietFoodModel.swift
//  Dasik
//
//  Created by 이현민 on 2021/06/09.
//

import Foundation

struct DietFood : Codable{
    var date: String
    var time: String        //아침,점심,저녁
    var name: String        //이름
    var type: String        //종류
    var ingredient: String  //성분
    var kcal: Double        //칼로리
    var carbo:Double //탄수화물
    var protein:Double      //단백질
    var fat:Double          //지방
    var price:Int           //가격
    var siteurl:String      //사이트url
}

var DietFoods = [DietFood]()
