import UIKit

func nextNumber(_ number: Int) -> Int {
    return number + 1
}

nextNumber(5)
nextNumber(10)
nextNumber(1023)


func getSquare(_ number : Int) -> Int {
    return number * number
}


let value = getSquare(3)
print(value)



func getMinutesAndSeconds(seconds: Int) -> (min: Int, sec: Int) {
    let minutes = seconds / 60
    let seconds = seconds % 60
    return (minutes, seconds)
}


let result: (min: Int, sec: Int) = getMinutesAndSeconds(seconds: 850)
print(result.min)
print(result.sec)



let str1 = "Writing Swift code"
let str2 = "is interactive and fun"

func concat(_ str1: String,_ str2: String) -> String {
    return str1 + str2
}
print(concat(str1, str2))



func getDate(_ dateString: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    
    let todayDate: Date = Date()
    print(todayDate)
    
    let result: Date = formatter.date(from: dateString) ?? todayDate
    print(result)
    return result
}
print(getDate("2004-11-23"))
