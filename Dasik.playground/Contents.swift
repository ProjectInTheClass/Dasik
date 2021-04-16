import UIKit

//1.약수의 개수 찾기
func findNumberofDivisor(){
    print("2부터 50까지 약수의 개수를 출력해줍시다.")
    let numbers = Array(2...50)
    
    for number in numbers{
        var numberofDivisor = 0
        for i in 1...number{
            if(number%i == 0){
                numberofDivisor += 1
            }
        }
        print(String(number) + "의 약수의 개수는 " + String(numberofDivisor) + "개 이다.")
    }
}

//2.1부터 100까지 숫자 더하기
func add1through100() {
    print("1부터 50까지 더해봅시다.")
    let numbers = Array(1...50)
    var sum = 0;
    for number in numbers {
        print(String(sum) + " + " + String(number) + " = " + String(sum + number))
        sum = sum + number
    }
    print(sum)
}

//3.피라미드 모양으로 별찍기
func printstar(){
    var line = 10
    /*
    print(String(line) + "줄 짜리 피라미드 별을 찍어봅시다.")
    for i in 1...line {
        for j in i...line {
            print(" ",terminator:"")
        }
        for k in 1...(i*2)-1 {
            print("*",terminator:"")
        }
        print()
    }
    */
    let lines = (1...line)
    
    (1...line).map{ i in
        (i...line).map { j in
            print(" ",terminator:"")
        }
        (1...(i*2)-1).map { k in
            print("*",terminator:"")
        }
        print()
    }
    
    
}




//4.배열 오름차순으로 정렬하기
func sortarray(){
    print("배열을 정렬해봅시다.")
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

//5.2부터 100사이의 소수 찾기
func findPrime(){
    print("2부터 20사이의 소수를 찾아봅시다.")
    let numbers = Array(2...20)
    /*
    for number in numbers{
        var numberofDivisor = 0
        for i in 1...number{
            if(number%i == 0){
                numberofDivisor += 1
            }
        }
        if(numberofDivisor == 2){
            print(String(number) + "은 소수입니다.")
        }
    }
    */
    (2...20).map { number in
        var numberofDivisor = 0
        (1...number).map { i in
            if(number%i == 0){
                numberofDivisor += 1
            }
        }
        
        if(numberofDivisor == 2){
            print(String(number) + "은 소수입니다.")
        }
    }
}


//findNumberofDivisor()
//add1through100()
printstar()
//sortarray()
findPrime()
