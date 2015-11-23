//: Playground - noun: a place where people can play
//함수
import UIKit
/*

/**/
//매개변수와 반환값이 모두 없는 함수
func printHello() {
print("안녕하세요")
}

//매개변수가 없지만 반환값은 있는 함수
func sayHello() ->String {
let returnValue = "안녕하세요"
return returnValue
}

//매개변수는 있으나 반환값이 없는 함수
func printHelloWithName(name : String) {
print("\(name)님, 안녕하세요")
}

//매개변수와 반환값이 모두 있는 함수
func sayHelloWithName(name : String) -> String {
let returnValue = "\(name)님, 안녕하세요"
return returnValue
}

var name = "홍길동"
printHello()

let say = sayHello()
print(say)

printHelloWithName(name)

var shwn = sayHelloWithName(name)
print(shwn)

//인자값에 상수나 변수를 입력하는 대신 값 자체를 입력하는것을 '리터럴'이라 한다.

func prHelloWithName(name : String, welcomMessage : String){
print("\(name)님, \(welcomMessage)")
}

//입력된 값 X 횟수만큼 카운트값을 증가
func incrementBy(amount : Int, numberOfTimes : Int) -> Int{
var count = 0
count = amount * numberOfTimes
return count
}

var incerm = incrementBy(2, numberOfTimes: 7)

//prHelloWithName("홍길동", "안녕하세요") //자바처럼 이렇게 호출하면 에러가 난다.

//오브젝티브-씨의 문법 스타일을 맞추고 기존 프레임워크의 호환성을 위해 외부 매개변수명을 사용한다.
prHelloWithName("홍길동", welcomMessage: "안녕하세요")

//스위프트 문서에서 함수이름을 표기할때 첫번째 인자명은 _로 대체한다.
/* 메소드(_:인자값2:)
* fucn printHello()   ->  printHello()
* fucn printHelloWithName(name : String)  ->  printHelloWithName(_:)
* func incrementBy(amount : Int, numberOfTime : Int)  ->  incrementBy(_:numberOfTimes:)
*/

//기본값이 지정된 함수
func echo(message : String, newline : Bool = true) {
if newline == true {
print(message, true)
}else {
print(message, false)
}
}

echo("안녕하세요")
echo("안녕하세요", newline: true)
echo("안녕하세요", newline: false)

//함수의 변환값과 튜플
func getIndvInfo() -> (Int, String) {
let age = 22
let name = "마스터"

return (age, name)
}


var myTuple : (Int,String)
myTuple = getIndvInfo()
print(myTuple)

func getIndvInfo0() -> (Int, Character, String) {
//데이터 타입이 String으로 추론되는 것을 방지하기 위해 타입 어노테이션 선언
let sexual : Character = "M"
let age = 22
let name = "마스터"

return (age, sexual, name)
}

var userInfo = getIndvInfo0()
print(userInfo.0)
print(userInfo.1)
print(userInfo.2)

let (a,b,c) = getIndvInfo0()
print(a)
print(b)
print(c)

//내부 매개변수명 외부 매개변수명
func printHelloWithName1(name : String, msg welcomeMessage : String) {
print("\(name)님, \(welcomeMessage)")
}

func printHelloWithName2(to name : String, msg welcomeMessage : String) {
print("\(name)님, \(welcomeMessage)")
}

printHelloWithName1("홍길동", msg: "안녕하세요") //외부 매개변수 명으로 인자값을 받음
printHelloWithName2(to: "홍길동", msg: "안녕하세요")

//외부 매개변수명 생략
func printHelloWithName3(name : String, _ welcomeMessage : String) {
print("\(name)님, \(welcomeMessage)")
}

printHelloWithName3("홍길동", "안녕하세요") // _ 를 이용하면 매개변수를 생략하고 호출이 가능하다.


//가변 인자값
func avg(score : Int...) -> Double {//개수의 제한없이 점수를 입력 받는다.
var total = 0 //점수 합계
for r in score { //배열로 입력된 값들을 순회탐색하면서 점수를 합산
total += r
}
return ( Double (total) / Double(score.count) ) //평균값을 구해서 반환
}

print(avg(10, 20, 30, 40))

//매개변수와 매개상수

//스위프트에서 함수의 인자값은 상수로 정의된다.
/*
func incrementBy(base : Int) -> Int{
return ++base //base는 상수이기 때문에 값을 변경시키면 에러가 발생
}
*/
//매개변수 앞에 var을 붙이면 변수로 처리된다 생략시에는 기본적으로 let으로 처리된다.
func incrementBy0(var base : Int) -> Int{
return ++base //base는 상수이기 때문에 값을 변경시키면 에러가 발생
}

var myNum = 1
var myNum2 = incrementBy0(myNum)
print(myNum2)
print(myNum) //매개변수에 값은 값이 복사되어 가기 때문에 원래의 변수값은 변함 없다.

func foo(name : String, var _ paramAge: Int) -> String {
paramAge++
let msg = "\(name)의 내년 나이는 \(paramAge)세입니다."
return msg
}

var myInfo = foo("마스터", 22)
print(myInfo)


//inout 매개변수

var count = 30

func foo1 (var paramCount : Int) -> Int {
return ++paramCount
}
print(foo1(count))
print(count)
//외부에서 입력된 값은 복사되어 전달되기 때문에 외부 변수의 값 자체는 변하지 않는다.
//함수 내부에서 수정한 인자값을 함수 외부까지 전달하기 위해 inout 키워드를 사용한다.

func foo2 (inout paramCount : Int) ->Int {
return ++paramCount
}

//변수 앞에 &을 붙이면 값이 아닌 메모리 주소가 전달되고
//함수는 이 주소를 읽어들이기 위해 inout키워드는 사용한다.
print(foo2(&count)) // 함수 내부의 paramCount  변수 값: 31
print(count) //외부에서 정의된 count 변수값: 31

//상수는 inout 매개변수에 인자값으로 전달할 수 없음
//let count = 30
//foo2(&count) // (X)

//리터럴은 inout 매개변수에 인자값으로 전달할 수 없음
//foo(&30)

//변수는 inout 매개변수에 인자값으로 전달할 수 있음


//변수의 범위와 생명주기
do{
var ccnt : Int = 0//지역변수
//초기화하지 않으면 메모리를 할당 받지 못해 주소값이 존재하지 않아 참조할 수 없어 에러가 발생한다.

do{
ccnt = 3
print(++ccnt)
}
print(++ccnt)
}
//블록을 벗어나면 접근할 수 없다.

var count1 = 30 //전역변수

func foo3() -> Int{
return ++count1  //값이 복사되어 전달된 것이 아니라 메모리 주소가 참조로 전달됨
}

var foNum = foo3()
print(foNum)
print(count1)//값이 변경된 것을 확인할 수 있다.

func foo4(var count1 : Int) -> Int{
return ++count1
}

print(foo4(count1)) //함수 내부의 변수 값: 32
print(count1) //외부에 정의된 변수 값: 31



//일급 함수의 특성

//1.변수나 상수에 함수를 할당할 수 있음
func foo(base : Int) -> String {
print("함수 foo가 실행됩니다.")
return "결과값은 \(base+1)입니다."
}

let f = foo //f 상수에 foo 함수가 할당됨
f(5)

let b = foo(5)

let f0 = foo
f(7)


//Int -> String
func foo1(age : Int) -> String {
return "\(age)"
}

//(Int, String) -> String
func foo2(age : Int, name : String) -> String{
return "\(name)의 나이는 \(age)세 입니다."
}

//(Int, String) -> (String, Int)
func foo3(age : Int, name : String) -> (String, Int){
return (name, age)
}

//인자값이 없는 경우 : () -> String
func foo4() -> String {
return "Empty Values"
}

//반환값이 없는 경우 : Int -> ()
func boo0(base: Int) {
print("param = \(base)")
}

//인자값, 반환값 모두 없는 경우 : () -> ()
func doo0() {
print("empty values")
}

/* Void 함수 타입 선언
() -> String == Void -> String
Int -> () == Int -> Void
() -> () == Void -> Void
*/



//2. 함수의 반환 타입으로 함수를 사용할 수 있음
func foo5() -> String{
return "this is foo5()"
}

func boo1() -> (Void -> String) {
return foo5
}

let b1 = boo1()
b1()



func plus(a : Int , b : Int) -> Int{
return a + b
}

func minus(a : Int , b : Int) -> Int{
return a - b
}

func times(a : Int , b : Int) -> Int{
return a * b
}

func divide(a : Int , b : Int) -> Int{
guard b != 0 else{
return 0
}
return a / b
}

func calc(operand : String) -> (Int, Int) -> Int {
switch operand {
case "+" :
return plus
case "-" :
return minus
case "*" :
return times
case "/" :
return divide
default :
return plus
}
}

let c = calc("+")
c(3,4) // == plus(3,4) = 7

let c2 = calc("-")
c2(3,4) // == mimus(3,4) = -1

let c3 = calc("*")
c3(3,4) // == times(3,4) = 12

let c4 = calc("/")
c4(3,4) //divide(3,4) = 0

//3.함수의 인자값으로 함수를 사용할 수 있음
func boo(param : Int) -> Int{
return param + 1
}

//함수를 인자값으로 전달
func foo(base : Int, function f : Int -> Int) -> Int{
return f(base)
}

foo(3, function: boo) //4

//활용
func succesThrough() {
print("연산 처리가 성공했습니다.")
}

func failThough() {
print("처리과정에 오류가 발행하였습니다.")
}

func foo1(base : Int, succes sCallBack : Void -> Void, fail fCallBack: Void -> Void) -> Int {
guard base != 0 else {
fCallBack() //실패함수를 실행한다.
return 0
}

defer{//지연 처리문
//모든 나머지 구문들이 다 실행되고 난 다음에 실행됨
sCallBack() //성공함수를 실행한다.
}
return 100 //base
}

foo1(20, succes: succesThrough, fail: failThough)


//익명함수 클로저(Clusure)
foo1(30,
succes:{
Void -> Void in print("연산처리가 성공 했습니다.")
},
fail: {
Void -> Void in print("처리과정에 오류가 발생하였습니다.")
}
)


//함수의 중첩 , 함수안에 다른함수를 작성해 사용할 수 있다.

//중첩된 함수 예제

//외부 함수
func foo2 (base : Int) -> String {

//내부 함수
func boo(inc : Int) -> String{
return "\(inc)를 반환합니다."
}

let result = boo(base + 1)
return result
}

foo2(3)

//내부 함수를 반환값으로 제공 가능
//외부함수
func foo3(base : Int) -> (Int) -> String{

//내부함수
func boo(inc : Int) ->String {
return "\(inc)를 반환합니다."
}
return boo
}

let f = foo3(3)//foo3가 실행되고, 그 결과로 boo가 대입된다.
let d = f(30)// boo(30)과 같다.


//내부함수가 외부함수의 지역 함수를 참조
func basic(param : Int) -> (Int) -> Int{
let value = param + 20
func append(add : Int) -> Int{
return value + add
}
return append
}

let b = basic(10)
print(b)

b(10) // append 함수가 클로저를 갖는다.
print(b(10))
*/

/* 1.클로저는 두 가지로 이루어진 객체이다, 하나는 내부 함수이며, 또 다른 하나는 내부 함수가 만들어진 주변환경이다.
2.클로저는 외부 함수 내에서 내부 함수를 반환하고, 내부 함수가 외부 함수의 지역변수나 상수를 참조할 때 만들어진다.
즉, 클로저란 내부 함수와 내부 함수에 영향을 미치는 주변 환경(Context)을 모두 포함한 객체이다. */

//클로저

let f0 = { () -> Void in
    print("클로저가 실행됩니다.")
}

f0()

//f 마저도 생략하고 싶을때
({ () -> Void in
    print("클로저가 실행됩니다.")
})()

let c1 = { (s1 : Int, s2 : String) -> Void in
    print("s1: \(s1), s2: \(s2)")
}

c1(1, "closure")

({ (s1 : Int, s2 : String) -> Void in
    print("s1: \(s1), s2: \(s2)")
})(1, "closure")

let value = [1,9,5,7,3,2]

func order(s1 : Int, s2 : Int) -> Bool{
    if s1 > s2 {
        return true
        
    }else{
        return false
    }
}

value.sort(order)



value.sort({ (s1 : Int, s2 : Int) -> Bool in
    if s1 > s2 {
        return true
    }else {
        return false
    }
})

//요약, 위와 같은 내용을 간단하게 표현 가능
value.sort({(s1 : Int, s2 : Int) -> Bool in return s1 > s2})

//반환값이 생략되면 컴파일러가 반환값을 찾아 해당 타입으로 정의하는 것을 이용해
//한번 더 요약 가능
value.sort({(s1 : Int, s2 : Int) in return s1 > s2})

//컴파일러의 타입 추론을 이용해 한번 더 요약 가능
value.sort({ s1, s2 in return s1 > s2})

//$0, $1, $2 와 같은 내부 상수를 이용해 매개변수 생략 가능
value.sort({return $0 > $1})

//컴파일러가 반환 타입을 추론 가능하기 때문에 return도 생략가능
value.sort({ $0 > $1})

//연산자 함수를 사용 하여 요약 가능
value.sort( > ) //?! 요약쩝니다.




