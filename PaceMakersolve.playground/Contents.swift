import UIKit

// [1] timer

let time = 90

var min = Int(), sec = Int()
/*
for remainTime in (1...time).reversed() {
    min = remainTime / 60
    sec = remainTime % 60
    if min != 0 {
        print(String(min) + "m ", terminator: "")
    }
    print(String(sec) + "s")
}
*/
//풀이
let times = (1...time).reversed()

times.map { timevar in
   
    min = timevar / 60
    sec = timevar % 60
    if min != 0 {
        print(String(min) + "m ", terminator: "")
    }
    print(String(sec) + "s")
}



// [2] print star

let star = 5
var blankCnt = Int()
/*
for starCnt in (1...star) {
    blankCnt = 5 - starCnt
    if blankCnt != 0 {
        for _ in (1...blankCnt) {
            print(" ", terminator : "")
        }
    }
    for _ in (1...starCnt) {
        print("*", terminator : "")
    }
    print("")
}
*/

//2풀이
let stars = (1...star)

stars.map { starvar in
    blankCnt = 5 - starvar
    let blankCnts = (0...blankCnt)
    let starCnts = (1...starvar)
    
    if blankCnt != 0 {
        blankCnts.map{ bcnt in
            print(" ", terminator : "")
        }
    }
    starCnts.map{ scnt in
        print("*", terminator : "")
    }
    print("")
}






// [3] 최댓값 추출하기
/// it returns pair of
/// 1. maximum value
/// 2. it's index
/// of positive integer array. returns [-1,-1] on error
/*
func maximumIndexAndValue(of array :[Int]) -> (Int, Int){
    
    if array.count == 0 {
        return (-1,-1)
    }
    
    var maximumValue = -1
    var maximumValueIndex = -1
    
    for i in 0...array.count-1 {
        if maximumValue < array[i] {
            maximumValue = array[i]
            maximumValueIndex = i
        }
    }
    
    return (maximumValue,maximumValueIndex)
}

var input = [1,2,3,3,8,4,4,3,1,2]
maximumIndexAndValue(of: input)

// [4] min 에서 max 사이의 소수 구하기

/// min 에서 max 사이의 소수를 어레이에 담아 리턴해주는 함수
func getPrimeNumbers(between low:Int, and high:Int) -> [Int]{
    var visit : [Bool] = Array(repeating: false, count:1000)
    var primes : [Int] = [Int]()
    for i in 2...high{
        if visit[i] == true{
            continue
        }else{
            if low...high ~= i {
                primes.append(i) // 원하는 범위 안의 소수를 찾음
            }
            for mul in 1...(high/i){
                visit[i*mul] = true
            }
        }
    }
    return primes
}

getPrimeNumbers(between: 20, and: 30)

// [5] 1부터 10까지의 값중에서 random으로 30개를 집어넣음

let k = 30

var arr : Array<Int> = []

for  _ in 0..<k{
    let tmp = Int.random(in: 1...10)
    //print(tmp)
    arr.append(tmp)
}
print(arr)

// [6] 1부터 10이 몇번 나왔는지 counting하고 print

var cnt = Array(repeating: 0, count: 10)

for index in arr{
    cnt[index-1]+=1
}

for i in 0..<10{
    print(String(i+1) + " appears " + String(cnt[i]) + " times!")
}
*/

