//: Playground - noun: a place where people can play

import UIKit
/*
var str = "Hello, playground"
//소문자와 대문자를 구별한다.
let A0 = 30
let a0 = 30



//@UIApplicationMain //앱 시작계체 지정
//class AppDelegate : UIResponder, UIAccelerometerDelegate

//개별 변수 할당
var name = "홍길동"
var type = "의적"

/*

여러줄 주석안에 
/*
또 여러줄 주석을 중첩하여

*/

사용할 수 있음
*/

//정수형 변수와 문자열 변수 선언
var year0 = 2015
var message = "Hello, World"

//정수형 상수와 문자열 상수 선언
let birthYear = 1980
let welcomMessage = "안녕하세요"

//선언
var year : Int
//초기화
year = 2015

var  variableValue = 3
variableValue = 7

let constantValue = 3
//constantValue = 7 //상수에 값을 변경하려고 하면 오류가 발생함


var intValue = 3
intValue = 5

var strValue = "Hello World!"
strValue = "GoodBye, World"


//intValue = "안녕하세요" //정수형 변수에 문자열을 넣으면 에러
//strValue = 100 //문자열 변수에 정수를 집어 넣으면 에러


Int.max
Int.min

Int64.max
Int64.min

Int32.max
Int32.min

Int16.max
Int16.min

Int8.max
Int8.min

//Unsigned Intetger
UInt.max
UInt.min

UInt64.max
UInt64.min

UInt32.max
UInt32.min

UInt16.max
UInt16.min

UInt8.max
UInt8.min


typealias Float32 = Float
typealias Float64 = Double //Float64는 실제적으로 더블로 처리함

// Bool 타입 저장 변수
var close = true
// Bool 타입 저장 상수
let succes = true
let fail = false

//문자열 저장 변수
var projectName = "iOS 9 study"
//문자열 저장 상수
let language = "swift"


//문자타입 저장 변수
var firstLetter : Character = "s"
//문자타입 저장 상수
let lastLetter : Character = "t"

//타입추론과 타입 어노테이션
//선언과 초기화를 동시에 
var day =  7

//선언과 초기화를 분리
var year1 :Int // 선언부분
year1 = 2015 //초기화 부분

//var year2 //타입 어노테이션이 없으므로 에러

//타입 어노테이션 예
var year3 : Int
var name1 : String
var firstChr : Character
var distance : Double
var pi : Float
var flag : Bool

//타입이 서로 다른 변수의 결합
var desc = "오늘 날짜는 "
var today = 28

var todayDesc = desc + String(today)
print(todayDesc)

//문자열 템플릿
let name3 = "마스터"
let birthY = 01
let birthM = 02
let birthD = 03

let profile = "\(name3)님은 \(birthY)년 \(birthM)월 \(birthD)일에 탄생하심 "
print(profile)

let apple = 3
let banana = 2
let orange = 4

//츌력할 구문을 문자열 템플릿으로 구성
let desc2 = "과일은 총 \(apple + banana + orange)개 입니다."
print(desc2)

//산술 연산자 테스트
var a = 10
var b = 1

//단항 연산자
-a
-b

//이항 연산자
a + b
a - b
a * b
a / b
a % b

//비교 연산자
a < b
a > b
a <= b
a >= b
a == b
a != b

true && false
true || true

//범위 연산자
for row in b...a //1부터 10까지 10개 //b..<a 이렇게하면 1에서 9까지
{
    row
}

//대입 연산자 = -= += *= /= 등등 //스킵
a = 10
b = 1
//증감 연산자 -- ++

b = a++
a
b = a
a = a + 1

a = 10
b = 1

b = ++a
a = a + 1
b = a

//여러줄로 작성한 코드
var i = 0
i++
print("result = \(i)")

//한줄로 작성한 코드
var j = 0; j++; print("result = \(j)\n")

for var i = 0 ; i < 10; i++ {
    print("\(i)번쩨 실행입니다")
}


var ij = 0
for ; ij < 10; ij++
{
    print("\(ij)번째 실행입니다 2");
}

for ; ; {
    break //여기에 작성되는 코드는 무한 반복됨 
    //break문으로 막아둠
}

*/ //렉걸려서 이전 실습 코드는 주석처리함

for var i = 1; i < 10; i++ {
    for var j = 1; j  < 10; j++
    {
        print("\(i) X \(j) = \(i * j)")
    }
    print("\n")
}

for row in 1...5{
    print("2 X \(row) = \(row * 2)")
}

var lang = "swift"
for char in lang.characters
{
    print("개별 문자는 \(char)입니다.")
}

//루프생략 _를 사용하여 루프상수를 생략할 수 있다.
let size = 5
let padChar = "0"
var keyWord = "3"

for _ in 1...size
{
    keyWord = padChar + keyWord
}
print("\(keyWord)")

var n =  2
while n < 1000
{
    n *= 2
}
print(n)

//repeat ~ while문
//코드블록을 먼저 실행한 다음, 조건식을 평가하여 반복 여부를 결정한다.
repeat {
n =  n * 2
}
while n < 1000
print(n)

//조건문

var adult = 19
var age = 15

if age < adult {
    print("당신은 미성년자네요")
}else{
    print("당신은 성인이네요")
}

var browser = "Safari"
var browserName : String

if browser == "IE"
{
    browserName = "인터넷 익스플로러"
}else if browser == "FF"
{
 browserName = "파이어폭스"
}else if browser == "Opera"
{
    browserName = "오페라"
}else if browser == "Safari"
{
    browserName = "사파리"
}
else
{
    browserName = "알려지지 않은 브라우저"
}

print("현재 사용중인 브라우져는 \(browserName)입니다")

//guard 구문
func divide(base : Int)
{
    guard base != 0 else
    { //조건이 참일때는 실행되는 블록이 없음
        print("연산할 수 없습니다.")
        return
    }
    
    let result = 100 / base
    print(result)
}

divide(0)
divide(1)

//#available 구문 OS버전을 구분하기 위해 사용한다.
if #available(iOS 9, OSX 10.10, watchOS 1, *) //마지막은 *로 구분한다.
{
    //iOS 9, OSX 10.10, watchOS 1 용 API 구문
}else{
    //API를 사용하지 못했을때에 대한 실패 처리
}

//fallthrough 구문
//swift에서 switch ~ case문은  각 case 블록마다 사용해야하는 break구문을 생략할 수 있다.
//case에서 break구문 없이 사용하고 싶을때는 fallthrough을 사용한다.

let sampleChar : Character = "a"

switch sampleChar { //반드시 조건이 일치하는 케이스가 있어야한다.

case "a", "b" : // 하나 이상의 조건도 비교가능
    print("a 또는 b입니다.")
    fallthrough
case "a" : //문자 일치
    print("폴쓰루")
    fallthrough //다음 케이스로 넘어감
case "A" :
    print("글자는 A입니다.")

default : //디폴트는 모든 패턴을 매칭 시킬수 있는 구문이 있으면 생략가능
    print("일치하는 글자가 없습니다.")
}


//튜플도 사용가능
var valus = (2, 3)

switch valus {
case let (x, 3) :
    print("튜플의 두번째 값이 3일때 첫번째 값은 \(x)입니다")
case let (3, y) :
        print("튜플의 첫번째 값이 3일때 첫번째 값은 \(y)입니다")
case let (x, y) : //이 구문으로 모든 패턴을 매칭 시킬수 있어 디폴트구문 생략됨
    print("튜플의 값은 각각 \(x), \(y)입니다")
}


//범위도 비교가능
var passTime = 1957
switch passTime {
case 0..<60 :
    print("방금 작성된 글입니다.")
case 60..<3600 :
    print("조금 전 작성된 글입니다.")
case 3600..<86400 :
    print("얼마전 작성된 글입니다.")
default :
    print("예전에 작성된 글입니다.")
}

//where 구문 사용가능
var point = (3, -3)

switch point {
    
case let (x, y) where x == y :
    print("\(x)과 \(y)은  x == y 선 상에 있습니다.")
case let (x, y) where x == -y :
    print("\(x)과 \(y)은  x == -y 선 상에 있습니다.")
case let (x, y) :
    print("\(x)과 \(y)은  일반 좌죠 상에 있습니다.")

}


//제어 전달문에는 continue, braek, fallthrough, return 가 있다.

var text = "This is a swift book for Apple's programming language"
var result = ""

for char in text.characters {
    switch char {
    case " " :
        result.append(Character("_"))
        continue
        
    case "o" :
        result.append(Character("O"))
        continue
    default :
        result.append(char);
    }
}

print(result)

//구문 레이블과 break, continue
/* 레이블 이름 : while 반복실행을 유지할 조건{
   반복해서 실행할 구문
}
  사용할때 break 레이블 이름 , continue 레이블 이름
*/
//break을 이용해 이중 루프의 내부, 외부 루프를 모두 종료 시키고 싶을때
//레이블을 이용한다.

outer : for i in 1...5 {
    inner : for j in 1...9 {
        if(j == 3){
            break outer
        }
        print("\(i) X \(j) = \(i * j)")
    }
}










