//
//  DetailView.swift
//  Dasik
//
//  Created by 희준이 on 2021/06/04.
//

import SwiftUI

struct DetailView: View {
    var dateInfo = printDateInof()
    
    var body: some View {
        //Text(dateSelected)
        VStack {
            Text(dateInfo)
            Text("식단표")
                .font(.title)
                .position(x: 150 ,y: 20)
            Text("아침")
                .font(.title)
                .position(x: 30, y: -70)
            Text("점심")
                .font(.title)
                .position(x: 30, y: -90)
            Text("저녁")
                .font(.title)
                .position(x: 30, y: -90)
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
