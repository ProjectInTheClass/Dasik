//
//  DetailView.swift
//  Dasik
//
//  Created by 희준이 on 2021/06/04.
//

import SwiftUI

struct DetailView: View {
    var dateInfo = printDateInof()
    var mealInfo = getMealInfo()
    
    var body: some View {
        VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/) {
            Text( dateInfo+"  식단표")
                .font(.title)
        }
        VStack {
            VStack {
                Text("아침")
                    .font(.title)
                    .position(x: 30, y: -70)
                Text(mealInfo.breakFast.name)
                    .font(.title)
                Text(String(mealInfo.breakFast.kcal))
                    .font(.title)
            }
            VStack {
                Text("점심")
                    .font(.title)
                    .position(x: 30, y: -90)
                Text(mealInfo.lunch.name)
                    .font(.title)
                Text(String(mealInfo.lunch.kcal))
                    .font(.title)
            }
            VStack {
                Text("저녁")
                    .font(.title)
                    .position(x: 30, y: -90)
                Text(mealInfo.dinner.name)
                    .font(.title)
                Text(String(mealInfo.dinner.kcal))
                    .font(.title)
            }
        }
            
    }
}

func printDateInof()->String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd"
    
    return dateFormatter.string(from: selectedDate)
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

func getMealInfo()->DayMealInfo{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd"
    
    let key = dateFormatter.string(from: selectedDate)
    
    for mealInfo in tmpMonthMeal.monthDiet{
        if mealInfo.date == key{
            return mealInfo
        }
    }
    return tmpMonthMeal.monthDiet[0]
}
