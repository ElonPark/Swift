//: Playground - noun: a place where people can play

import UIKit
/* /**/
//메소드

//self 키워드, 프로퍼티들은 자신이 지역 변수가 아닌 멤버 변수라는 것을 알리기 위해 self워드를 붙인다.
class Counter {
    //카운트를 저장할 프로퍼티
    var count = 0
    
    //카운트를 1증가
    func increment(){
        self.count++;
    }
    
    //입력된 값만큼 카운트를 증가
    func incrementBy(amount : Int){
        self.count += amount
    }
    
    //카운트를 0으로 초기화
    func reset(){
        self.count = 0
    }
}

//count 클래스의 인스턴스 생성, 초기 카운터 값은 0
let counter = Counter()
print(counter.count)
//카운터를 증가 시킴, 카운터 값은 1
counter.increment()
print(counter.count)

//카운터 값을 5만큼 증가, 카운터 값은 6
counter.incrementBy(5)
print(counter.count)

//카운터 값을 초기화
counter.reset()
print(counter.count)


//매개변수가 두 개 이상인 메소드
class Boo {
    func desc (name : String, msg : String) -> String{
        return "\(name)의 메시지: \(msg)"
    }
}

let b = Boo()
b.desc("홍길동", msg: "두번쨰 인자에 대한 결과")


//구조체나 열거형의 인스턴스 메소드 내부에서 프로퍼티의 값을 수정할 때는 반드시 메소드 앞에 mutating 키워드를 추가해야하낟.
//구조체나 열거형 인스턴스를 상수로 할당 받으면 mutation 메소드를 호출할 수 없다.
struct Point{
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX : Double, y deltaY : Double) {
        self.x += deltaX
        self.y += deltaY
    }
}


var point = Point(x: 10.5, y: 12.0)
point.moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 \(point.x), \(point.y)입니다")


//클래스의 인스턴스 메소드에서는 프로퍼티를 수정할 때 별도의 키워드가 필요하지 않다.
class Location{
    var x = 0.0, y = 0.0
     func moveByX(x deltaX : Double, y deltaY : Double) {
        self.x += deltaX
        self.y += deltaY
    }
}

var loc = Location()
loc.x = 10.5
loc.y = 12.0

loc.moveByX(x: 3.0, y: 4.5)

print("이제 새로운 좌표는 \(loc.x), \(loc.y)입니다")


//타입 메소드
//클래스 타입에 정의된 메소드를 하위 클래스에서 재정의 가능한 타입 메소드로 선언할 때는 static 대신 class 키워드를 사용하여 
//해당 메소드가 재정의 가능한 타입 메소드라는 것을 컴파일러에게 알려줄 수 있다.
//인스턴스 메소드와의 차이점은타입 메소드는 객체 자체에대한 호출을 한다.

//타입 메소드 선언, 호출 예제
class Foo {
    //타입 메소드 선언
    class func fooTypeMethod() {
        //타입 메소드 구현 내용
    }
}

let f = Foo()
//f.fooTypeMethod() //X 호출 안됨
Foo.fooTypeMethod() //호출 성공

//타입 메소드를 사용하여 객체의 값을 변경하면 해당 객체를 사용하는 모든 곳에서 변경된 값이 적용된다.
//타입 메소드를 선언하고 사용할 때는 반드시 이러한 영향성의 범위를 고려하려 사용해야 한다.



//상속
class A {
    var name = "Class A"
    
    var  description : String {
        return "This class name is \(self.name)"
    }
    
    func foo() {
        print("\(self.name)'s method foo is called")
    }
}

class B : A {
    var prop = "Class B"
    
    func boo() -> String{
        return "Class B prop = \(self.prop)"
    }
}

let a = A()

a.name
a.description
a.foo()

let b = B()
b.prop
b.boo()

b.name
b.foo()
b.description

b.name = "Class C"
b.foo()
b.description

/*클래스 A를 상속 받은 클래스 B는 아래와 같이 정의되어 있다.
class B {
    var name = "Class A"
    var prop = "Class B"
    
    var  description : String {
        return "This class name is \(self.name)"
    }
    
    func foo() {
        print("\(self.name)'s method foo is called")
    }
    func boo() -> String{
        return "Class B prop = \(self.prop)"
    }

}*/


//개념적인 예제
class Vechicle {
    var currentSpeed = 0.0
    
    var description : String{
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다"
    }
    
    func makeNoise() {
        //임의의 교통수단 자체는 경적을 울리는 기능이 필요없다.
    }
}

let baseVehicle = Vechicle()
baseVehicle.description

class Bicycle : Vechicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

//자전거 객체의 현재 속도를 설정
bicycle.currentSpeed = 20.0

print("자전거 : \(bicycle.description)")

class Tandem : Bicycle {
    var passengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.passengers = 2
tandem.currentSpeed = 14.0

print("Tandem : \(tandem.description)")

//오버라이딩
/*override 키워드를 붙여서 사용한다. override 키워드는 부모 클래스나 그 이상의 상위 클래스에서 반드시 선언 되어 있고, 이를 재정의할 때만 붙일 수 있는 키워드이다. 
 프로퍼티를 오버라이딩할 때는 상위 클래에서에서 저장 프로퍼티였건, 연산 프로퍼티였건 관계없이 연산프로퍼티로 오버라이딩 해야한다.
본래 읽고 쓰기가 모두 허용되는 저장 프로퍼티를 연산 프로퍼티로 오버라이딩할 경우 get, set 구문을 모두 제공해야한다. 저장 프로퍼티를 읽기 전용 연산 프로퍼티로 오버라이딩할 수 없다. get구문만 제공되는 연산 프로퍼티를 get구문만 제공되는 연산 프로퍼리로 오버라이딩 가능*/

//오버라이딩 예제
class Car : Vechicle{
    
    var gear = 0
    var engineLevel = 0
    
    override var currentSpeed : Double{
        get {
            return Double(self.engineLevel * 50)
        }
        set{
            //아무것도 안함
            
        }
    }
    
    override var description : String{
        get{
            return "Car : engineLevel = \(self.engineLevel), so currentSpeed = \(self.currentSpeed)"
        }
        set {
            print("New Value is \(newValue)")
        }
    }
}


let c = Car()

c.engineLevel = 5
c.currentSpeed
c.description = "New Class Car"

print(c.description)

class AutomaticCar : Car {
    override var currentSpeed : Double{
        didSet {
            self.gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

//메소드 오버라이딩은 오버라이딩 대상이 되는 메소드의 매개변수 개수나 타입, 그리고 반환 타입은 변경할 수 없다.
//매개변수 타입이 다르면 오버로딩으로 처리

class Bike : Vechicle {
    override func makeNoise() {
        print("빠라빠라빠라밤")
    }
}

let bk = Bike()
bk.makeNoise()

//두번째 매개변수부터는 매개변수의 개수, 타입이 모두 일치 하여도 매개변수명이 다르면 새로운 메소드를 정의한 것이 된다.


//서브클래싱 결과값 비교
class HybridCar : Car {
    //아무 것도 추가로 선언하지 않음
}

class KickBord : Vechicle {
    //아무 것도 추가로 선언하지 않음
}

let h = HybridCar()
h.description

let k = KickBord()
k.description
//부모 클래스를 참조할 때는 self 대신 super를 쓰면 된다.

//final 키워드를 사용하면 오버라이딩을 막을 수 있다.
//final 프로퍼티, 메소드, 클래스에 붙일 수도 있다.
//final 클래스는 상속 자체가 차단되는 클래스이다.
//final이 선언된 클래스는 그 자체를 인스턴스로 만들어 사용할 수만 있다.
*/

//타입 캐스팅
//자식 클래스는 본래의 타입 태신 부모 클래스 타입으로 선언하여 사용할 수 있다.

class Vehicle {
    var currentSpeed = 0.0
    
    func accelerate(){
        self.currentSpeed++
    }
}

class Car : Vehicle {
    var gear : Int{
        return Int(self.currentSpeed / 20) + 1
    }
    
    func wiper() {
        //창을 닦는다.
    }
    
}

let trans : Vehicle = Car()
/* Car 클래스는 Vehicle 클래스 타입에 구현되어 있어야 하는 프로퍼티와 메소드가 상속을 통해 모두 구현되어 있으므로 Car 클래스는 
형식상 Vehicle 타입으로 간주할 수 있고, 이 때문에 Car 클래스로 된 인스턴스를 Vehicle 타입의 상수에 할당할 수 있다.
반대로 Vehicle 인스턴스를 Car 클래스 타입의 변수나 상수에 할당할 수는 없다. Car 타입이 되기 위해 가져야 할 요소들 중에서 
gear 프로퍼티나 wiper() 메소드가 Vehicle 클래스에는 정의 되어 있지 않기 때문이다.*/

class SUV: Car {
    var fourWheel = false
}

let jeep : Vehicle = SUV()

/*함수나 메소드의 인자값을 정의할 떄 하위 클래스 타입으로 선언하는 것보다 상위 클래스 타입으로 선언하면 인자값으로 사용할 수 있는
객체의 범위가 훨씬 넓어진다.*/
func move(param : SUV) {
    param.accelerate()
}

//인자값 타입을 바꾸면 훨씬 넓은 범위 객체를 인자값으로 받을 수 있다.
func move(param : Vehicle) {
    param.accelerate()
} //이제는 Vehicle 클래스나 이를 상속받은 모든 클래스의 인스턴스를 인자값으로 사용할 수 있다.


//배열이나 딕셔너리도 마찬가지로 고정된 하나의 타입만 입력 받을 수 있다.
var list = [SUV]() //SUV 타입의 인스턴스만 배열에 추가할 수 있다.
list.append(SUV())

var list0 = [Vehicle]() //Vehicle을 아이템 타입으로 사용하면 Vehicle, Car, SUV 클래스 모두 저장할 수 있다.
list0.append(Vehicle())
list0.append(Car())
list0.append(SUV())


//타입 비교 연산
// 인스턴스 is 비교대상 타입
//비교대상 타입을 상속받은 하위 클래스라면 결과값은 ture로 반환된다.
var testBool : Bool
testBool = SUV() is SUV
print(testBool)
print(SUV() is Car)
print(SUV() is Vehicle)
print(Car() is Vehicle)
print(Car() is SUV)

//타입을 비교 연산할 때 변수가 선언된 타입을 기준으로 비교하는 것이 아니라 변수에 할당된 실제 인스턴스를 기준으로 타입을 비교한다.
let myCar : Vehicle = SUV()

if myCar is SUV {
    print("myCar는 SUV 타입입니다.")
}else{
    print("myCars는 SUV 타입이 아닙니다.")
}

let newCar : Vehicle = Car()

if newCar is SUV {
    print("newCar는 SUV 타입입니다.")
}else {
    print("newCars는 SUV 타입이 아닙니다.")
}


//타입 캐스팅 연산
let someCar : Vehicle = SUV()

/*업 캐스팅
- 하위 클래스 타입을 상위 클래스 타입으로 캐스팅할 때(캐스팅하기 전 타입이 하위 클래스, 캐스팅한 후 타입이 상위 클래스)
- 캐스팅한 결과, 캐스팅하기 전 타입보다 추상화될 때
- 일반적으로 캐스팅 과정에서 오류가 발생할 가능성이 없음

 다운 캐스팅
- 상위 클래스 타입을 하위 클래스 타입으로 캐스팅할 때(캐스팅하기 전 타입이 상위 클래스, 캐스팅한 후 타입이 하위 클래스)
- 캐스팅한 결과, 캐스팅하기 전 타입보다 구체화될 때
- 오류에 대한 처리 방식에 따라 옵셔널 캐스팅과 강제 캐스팅으로 나뉘어짐 

 업 캐스팅은 하위 클래스 타입을 상위 클래스 타입으로 캐스팅 하는 것을 말한다. 캐스팅한 결과는 캐스팅하기 전보다 상위 클래스 타입
으로 변환되며, 이를 추상화되었다고 말한다. 자식 클래스를 부모 클래스 타입으로 변환하는 만큼 안전한 캐스팅으로 오류가 발생하지 않음

 다운 캐스팅은 상위 클래스 타입의 객체를 하위 클래스 타입으로 캐스팅하는 것을 의미한다. 부모 클래스 타입을 자식 클래스 타입으로
변환 하는 것으로 자식 클래스 타입의 구성에 적합하지 않을 수 있으므로 캐스팅 과정에서 오류가 발생할 수 있다. 
 오류가 발생하면 nil로 반환되어야 하므로 이를 고려하여 다운 캐스팅은 옵셔널 타입으로 반환하는 옵셔널 캐스팅과 반드시 캐스팅에 성공
한다는 전체하에 일반 타입으로 반환하는 강제 캐스팅으로 나누어 진다.

 타입 캐스팅을 위한 연산자로는 as을 사용한다. 업 캐스팅을 수행할 때는 as, 다운 캐스팅은 as?, as!를 사용한다.
옵셔널 타입으로 번환할 때는 as?, 일반 타입으로 강제 캐스팅할 때는 as!

 객체 as 변환할 타입*/

//업 캐스팅
let anyCar : Car = SUV()
let anyVehicle = anyCar as Vehicle

//다운 캐스팅
let anySUV = anyCar as? SUV
if anySUV != nil {
    print("\(anySUV!) 캐스팅이 성공하였습니다.")
}






























