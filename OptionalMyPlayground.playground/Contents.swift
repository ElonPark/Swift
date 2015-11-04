//: Playground - noun: a place where people can play

import UIKit

Int("123") //문자열 정수로 변환
Int("Swift")//"Swift"같은 문자열을 변환하면 nil 출력

//var result : Int = nil
//스위프트에서 nil은 '특정한 값이 없음'을 의미한다.


//옵셔널 정수형
var optInt :Int?
optInt = 3

//옵셔널 문자열
var optStr : String?
optStr = "Swift"

//옵셔널 실수형
var optDouble :Double?
optDouble = 3.14

//옵셔널 배열형
var optArr : [String]?
optArr = ["C","JAVA","Objective-C", "SmallTalk"]

//옵셔널 딕셔너리
var optDic : Dictionary <String,Int>?
var optDic2 : [String:Int]?
optDic = ["국어":94, "수학":88, "영어":96]

//옵셔널 클래스형
var optClass : AnyObject?

//옵셔널 강제 해제
print("옵셔널 자체의 값 : \(optInt)")
print("!로 옵셔널을 강제 해제한 값 : \(optInt!)")

var intPlus = Int("123")! + Int("123")!
intPlus = Int("123")! + 30

//옵셔널 안전한 해제
var str = "123"
let intFromStr = Int(str)

if intFromStr != nil{
    print("값 변환에 성공하였습니다. 변환된 값은 \(intFromStr!)입니다.")
}else{
    print("값 변환에 실패 하였습니다.")
}

//예제 2
var str1 = "Swift"
var intFromStr1 = Int(str1)

if intFromStr1 != nil{
// !=를 사용할 때는 띄어쓰기를 주의 하여야 한다. 컴파일어에서 변수! = nil로 인식할 수 있기 떄문에 
//변수 != nil로 인식할 수 있게 변수 뒤에 공백을 반드시 추가하여야 한다.
    
    print("값 변환에 성공하였습니다. 변환된 값은 \(intFromStr1!)입니다.")
}else{
    print("값 변환에 실패 하였습니다.")
    
}

//옵셔널 비강제 해제
if let intFormStr = Int(str1){// 조건문안에서 처리
    print("값 변환에 성공하였습니다. 변환된 값은 \(intFromStr1)입니다.") //!가 붙지않음
}else{
    print("값 변환에 실패 하였습니다.")
}

//딕셔너리 선언
var capital = ["KR" : "Seoul", "EN" : "London", "FR" : "Paris"]

print(capital["KR"])
print(capital["KR"]!) //옵셔널 강제 해제

//옵셔널 안전한 해제
if capital["KR"] != nil{
    print(capital["KR"]!)
}

//또는
if let val = capital["KR"]{
    print(val)
}


//옵셔널 자동 해제
let opInt = Int("123")
/*
if(opInt != nil){
    if ((opInt!) == 123){
        print("opInt == 123")
    }else{
        print("opInt != 123")
    }
}*/

if (opInt != nil){
    if (opInt == 123){
        print("opInt == 123")
    }else{
        print("opInt != 123")
    }
}
//비교 연산자를 사용하여 한쪽이 옵셔널, 다른 한쪽이 일반 타입이면
//자동으로 옵셔널을 해제하고 비교연산을 수행한다.

print(opInt == 123)
print(opInt == Optional(123))
print(opInt! == 123)
print(opInt! == Optional(123))

var optValue01 = Optional(123)
//옵셔널 타입의 변수나 상수를 정의할 때는 대입할 값을 옵셔널() 객체로 감싼 방식으로 처리

var optValue02 : Int? = 123 //순수 리터럴을 직접 대입할 수 있음

































