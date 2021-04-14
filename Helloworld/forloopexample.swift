//
//  forloopexample.swift
//  Helloworld
//
//  Created by 이현민 on 2021/04/14.
//

import Foundation

//1부터 100까지 숫자 더하기
func add1through100() {
    let numbers = Array(1...100)
    var sum = 0;
    for number in numbers {
        print(String(sum) + " + " + String(number) + " = " + String(sum + number))
        sum = sum + number
    }
    print(sum)
}

//피라미드 모양으로 별찍기
func printstar(){
    var line = 10
    print(String(line) + "줄 짜리 피라미드 별 찍기")
    for i in 1...line {
        for j in i...line {
            print(" ",terminator:"")
        }
        for k in 1...(i*2)-1 {
            print("*",terminator:"")
        }
        print()
    }
}

//배열 오름차순으로 정렬하기
func sortarray(){
    var numbers: Array<Int> = [5, 3, 2, 17, 32, 21, 9, 10, 72, 98, 7, 1000, 100, 10000, 69]

    var save = 0
    var index = 1
    var saveindex = 0
    var check = 0

    for i in 0...numbers.count-2 {
        save = numbers[i]
        saveindex = i
        for j in index...numbers.count-1{
            if(save > numbers[j]){
                save = numbers[j]
                saveindex = j
            }
        }
        numbers[saveindex] = numbers[i]
        numbers[i] = save
        index = index + 1
        
        print(numbers)
    }
}
