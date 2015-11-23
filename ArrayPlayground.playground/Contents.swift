//: Playground - noun: a place where people can play

import UIKit
/*
/*
*/
var cityRow = ["Seoul", "New York", "LA", "Santiago"]

cityRow[0]
cityRow[1]
cityRow[2]
cityRow[3]

let size = cityRow.count
for var i = 0; i < size; i++
{
    print("\(i)번째 배열 원소는  \(cityRow[i])입니다.")
}

let length = cityRow.count
for i in 0..<length
{
    print("\(i)번째 배열 원소는  \(cityRow[i])입니다.")
}
for row in cityRow
{
    print("배열 원소는  \(row)입니다.")
}

var cityRow1 = Array<String>()

var list = [String]()

if list.isEmpty
{
  print("배열이 비어있는 상태입니다.")
}else{
    print("배열에는 \(list.count)개의 아이템이 저장되어 있습니다.")
}

list.append("Seoul") //["Seoul"]
list.append("New York")//["Seoul", "New York"]
list.insert("Tokyo", atIndex: 1)
list.appendContentsOf(["Dubai", "Sydney"])// list.extend(["Dubai", "Sydney"])

//배열을 선언 및 초기화
var cityRow2 = [String]()
//배열을 추가
cityRow2[0] = "Seoul"
cityRow2[1] = "Tokyo"
cityRow2[2] = "Madrid"
cityRow2[3] = "Dubai"
cityRow2[4] = "Sydney"

var cityRow0 = Array(count: 3, repeatedValue: "None")
var cityRow1 = [String](count: 3, repeatedValue: "None")

var alphabet = ["a", "b", "c", "d", "e" ]
    print(alphabet[0...2])
    print(alphabet[2...3])
    print(alphabet[1...3])

alphabet[1...2] = ["1", "2", "3"] //b, c가 삭제되고 1,2,3이 추가되어 배열에 전체 크기가 5에서 6으로 됨(2개 지워지고 3개 추가)

for row in alphabet
{
    print(row)
}

print("\n")

alphabet[2...4] = ["A"] // 2와 4 사이인 3번에 A입력됨

for row in alphabet
{
    print(row)
}

var genres0 : Set = ["Classic", "Rock", "Baad"]

var g : Set<String> = []

var genres : Set<String> = ["Classic", "Rock", "Baad"]

g.insert("Classic")
g.insert("Rock")
g.insert("Balad")
g.insert("Jazz")

if g.isEmpty
{
    print("g는 비어있습니다")
}else{
    print("g 안에는 \(g.count)개의 원소가 있습니다.")
}

for d in g.sort()
{
    print(d)
}

g.insert("Jazz") //이미 같은 원소가 있으면 아무 처리도 하지않음

if let removedItem = g.remove("Rock")
{
    print("아이템 \(removedItem)의 삭제가 완료 되었습니다.")
}else{
    print("삭제할 값이 집합에 없습니다.")
}

g.removeAll()

if g.isEmpty
{
    print("모든 아이템이 삭제 되었습니다.")
}else{
    print("아직 \(g.count)개의 아이템이 남아 있습니다.")
}

if g.contains("Rock")
{
    print("Rock 아이템이 저장되어 있습니다.")
}else{
    print("Rock 아이템이 저장되어 있지 않습니다.")
}

let odddigits : Set = [ 1, 3, 5, 7, 9]  //홀수 집합
let evenDigits : Set = [ 0, 2, 4, 6, 8] //짝수 집합
let primeDigits : Set = [ 2, 3, 5, 7] //소수집합

print(odddigits.intersect(evenDigits).sort())//교집합

print(odddigits.exclusiveOr(evenDigits).sort())//양쪽집합에 공통된 원소를 제외한 모든 원소

print(odddigits.subtract(primeDigits).sort())//차집합

print(odddigits.union(evenDigits).sort())//합집합


print(primeDigits.isSubsetOf(odddigits)) //집합이다른집합에부분집합이면 true 아니면false

print(odddigits.isSupersetOf(evenDigits))//집합이 다른 집합의 상위집합이면 true 아니면 false

print(odddigits.isDisjointWith(evenDigits)) //두 집합에 공통 값이 있으면 false 하나도 없으면 true

//튜플
let tupleValue = ( "a", "b", 1, 2.5, true)

tupleValue.0
tupleValue.1
tupleValue.2
tupleValue.3
tupleValue.4


var tp01 : (Int, Int) = (100, 200)
var tp02 : (Int, String, Int) = (100, "a", 200)
var tp03 : (Int, (String, String)) = (100, ("t", "v"))
var tp04 : (String) = ("sample string") //실제적으로 튜플이 아님

let tupleValue1 : (String, Character, Int, Float, Bool) = ("a", "b", 1, 2.5, true)
let (a, b, c, d, e) = tupleValue //이런식으로 각각 값을 할당 받을 수 있음
print(a)
print(c)
print(e)

//결과값으로 튜플을 반환하는 함수
func getTupleValue() -> (String, String, Int)
{
    return ("t", "v", 100)
}

//튜플을 반환하는 함수는 튜플로 받을 수 있음
let (f, k, h) = getTupleValue()
print(f)
print(k)
print(h)


//언더바를 이용해 일부만 사용할 수 있으면 그러나 아이템의 갯수는 맞춰줘야함
let (v, _, o) = getTupleValue()
print(v)
print(o)
*/

//딕셔너리  //형식 [키 : 데이터, 키 : 데이터, ....]
var capital = ["KR":"Seoul", "EN":"London", "FR":"Paris"]

print(capital["KR"])

//딕셔너리 초기화, 선언
var capital1 = Dictionary<String, String>()

var capotal2 = [String:String]()

//선언과 초리화를 분리
var cap0 : Dictionary<String,String>
cap0 = Dictionary()

var cap1 :[String:String]
cap1 = [String:String]()
cap1 = [:] //타입이 명시적으로 선언 되었을때만 사용가능

cap1["JP"] = "Tokyo"

if cap1 .isEmpty
{
    print("딕셔너리가 비어 있습니다.")
}else{
    print("딕셔너리의 현재 크기는 \(cap1.count)입니다.\n")
}

print(cap1.updateValue("Seoul", forKey: "KR")) //"KR":"Seoul"이라는 데이터가 추가되고 nill을 반환
print(cap1.updateValue("도쿄", forKey: "JP")) //"JP":"Tokyo"을 "JP":"도쿄"로 변경하고 "Tokyo"를 반환함 //옵셔널

cap1.updateValue("Ottawa", forKey: "CA")
cap1.updateValue("Beijing", forKey: "CN")
cap1.updateValue("London", forKey: "EN")

for i in cap1
{
    print(i)
}
print("\n")
//nil을 할당하여 값을 삭제
cap1["CN"] = nil
//cap1.removeValueForKey("CA")

for i in cap1
{
    print(i)
}

if let removeValue = cap1.removeValueForKey("CA"){
    print("삭제된 값은 \(removeValue)입니다")
}else{
    print("아무 값도 삭제 되지 않았습니다.")
}


//순회 탐색
for row in cap1 {
    let(key, value) = row
    print("현재 데이터는 \(key):\(value)입니다")
}
print("\n")

for (key, value) in cap1{
    print("현재 데이터는 \(key):\(value)입니다.")
}
//내부에서 고유키에 대한 해시 처리 값을 기준으로 내부 정렬한다. 입력순서와 다른게 출력된다.

