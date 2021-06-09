//
//  RankFoodModel.swift
//  Dasik
//
//  Created by 이현민 on 2021/06/03.
//

import Foundation

struct RankCategory{
    var categoryimage:String
    var categoryname:String
}
struct RankFood : Codable{
    var name: String        //이름
    var type: String        //종류
    var ingredient: String  //성분
    var kcal: Double        //칼로리
    var carbo:Double //탄수화물
    var protein:Double      //단백질
    var fat:Double          //지방
    var price:Int           //가격
    var siteurl:String      //사이트url
    var foodimage:String        //음식사진
}

var categoryfoods: [RankCategory] = [
    RankCategory(categoryimage: "rice", categoryname: "밥"),
    RankCategory(categoryimage: "nudle", categoryname: "면"),
    RankCategory(categoryimage: "salad", categoryname: "샐러드"),
    RankCategory(categoryimage: "chicken_chest", categoryname: "닭가슴살"),
    RankCategory(categoryimage: "simple", categoryname: "간편식"),
    RankCategory(categoryimage: "snack", categoryname: "간식")
]

struct foodsData {
    var ricefoods:[RankFood]
    var noodlefoods:[RankFood]
    var saladfoods:[RankFood]
    var chickenfoods:[RankFood]
    var hmrfoods:[RankFood]
    var cookiefoods:[RankFood]
}

var foodData:foodsData = foodsData(ricefoods: [], noodlefoods: [], saladfoods: [], chickenfoods: [], hmrfoods: [], cookiefoods: [])

