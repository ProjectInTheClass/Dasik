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
    var carbohydrate:Double //탄수화물
    var protein:Double      //단백질
    var fat:Double          //지방
    var price:Int           //가격
    var siteurl:String      //사이트url
    var foodimage:String        //음식사진
}

struct RankFood2 : Codable{
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

var categoryfoods: [RankCategory] = [
    RankCategory(categoryimage: "testimage", categoryname: "밥"),
    RankCategory(categoryimage: "testimage", categoryname: "면"),
    RankCategory(categoryimage: "testimage", categoryname: "샐러드"),
    RankCategory(categoryimage: "testimage", categoryname: "닭가슴살"),
    RankCategory(categoryimage: "testimage", categoryname: "간편식"),
    RankCategory(categoryimage: "testimage", categoryname: "간식")
]

var rankfoods: [RankFood] = [
    RankFood(name: "스테이크 닭가슴살", type:"닭가슴살",ingredient: "두유", kcal:138, carbohydrate: 9.74, protein:18.91, fat:2.6,price:2900,siteurl:"www.naver.com" , foodimage: "testimage"),
    RankFood(name: "HI 닭가슴살", type:"닭가슴살",ingredient: "두유", kcal:138, carbohydrate: 9.74, protein:18.91, fat:2.6,price:3100,siteurl:"www.naver.com" , foodimage: "testimage"),
    RankFood(name: "Good 닭가슴살", type:"닭가슴살",ingredient: "두유", kcal:138, carbohydrate: 9.74, protein:18.91, fat:2.6,price:3300,siteurl:"www.naver.com" , foodimage: "testimage")
]

struct foodsData {
    var ricefoods:[RankFood2]
    var noodlefoods:[RankFood2]
    var saladfoods:[RankFood2]
    var chickenfoods:[RankFood2]
    var hmrfoods:[RankFood2]
    var cookiefoods:[RankFood2]
}

var foodData:foodsData = foodsData(ricefoods: [], noodlefoods: [], saladfoods: [], chickenfoods: [], hmrfoods: [], cookiefoods: [])

