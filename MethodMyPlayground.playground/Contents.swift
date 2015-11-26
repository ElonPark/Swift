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


if let anyCar = anyCar as? SUV{
    print("\(anySUV!) 캐스팅이 성공하였습니다.")
}

//강제 캐스팅
let anySUV1 = anyCar as! SUV
print("\(anySUV!) 캐스팅이 성공하였습니다.")



//Any, AnyObject
/*클래스 타입에 상관없이 모든 종류의 클래스 타입을 저장할 수 있는 범용 타입의 클래스이다. 클래스 중에서 가장 추상화된 클래스이며,
상속관계가 직접 성립하는것은 아니지만 가장 상위 클래스이다. 모든 클래스의 인스턴스는 AnyObjet클래스 타입으로 선언된 변수나 
상수에 할당할 수 있다.*/

var allCar : AnyObject = Car()
allCar = SUV()

//모든 클래스의 인스턴스는 AnyObject 타입으로 선언된 함수나 메소드의 인자값으로 사용될 수 있으며, AnyObject 타입을 반환하는 
//함수나 메소드는 모든 종류의 클래스를 반환할 수 있다는 의미로 해석되기도 한다.
func move(param : AnyObject) -> AnyObject {
    return param
}

move(Car())
move(Vehicle())

//배열, 딕셔너리, 집합에서 AnyObject 타입을 사용하면 모든 클래스를 저장할 수 있다.
var list1 = [AnyObject]()
list1.append(Vehicle())
list1.append(Car())
list1.append(SUV())

/*AnyObject타입으로 선언된 값은 타입 캐스팅을 통해 구체적인 타입으로 변환할 수 있다.모든 클래스의 최상위 클래스임으로 항상
다운 캐스팅 수행된다. 상속관계가 성립하지 않아도 예외로 타입 캐스팅할 수 있지만 실제로 저장된 인스턴스 타입과 관계 없는 타입으로
캐스팅하고자 하면 오류가 발생한다.*/
let obj : AnyObject = SUV()

if let SUV = obj as? SUV{
    print("\(SUV) 캐스팅이 성공하였습니다.")
}

//AnyObject 타입은 클래스만 정의할 수 있지만 Any객체는 모든 타입에서 사용할 수 있다.
var value : Any = "Sample String"
value = 3
value = false
value = {() in print("함수가 실행됩니다.")}
value = [1, 3, 5, 7, 9]

//함수나 메소드의 인자값 또는 반환값이 Any 타입이라면 객체의 종류에 상관없이 입력 받을 수 있거나 모든 종류의 객체를  반환할 수 있다.

func name(param : Any) {
    print(param)
}

name(3)
name(false)
name([1, 3, 5, 7, 9])
name({() in print(">>>")})

//Any 타입으로 집단 자료형을 정의하면 모든 종류의 객체를 구분 없이 저장할 수 있다.
var list2 = [Any]()
list2.append(3)
list2.append(false)
list2.append([1, 3, 5, 7, 9])

//Any 타입은 매우 극단적으로 추상화된 타입으로 Any타입에 할당된 객체가 사용할 수 있는 프로퍼티나 메소드는 아예 제공되지 않는다.
//Any 타입으로 정의하면 모든 값을 제한 없이 받을 수 있지만 그 값을 이용하여 할 수 있는 것은 거의 없다.




//초기화
//init 구문
//초기화 블록은 인스턴스가 생성되는 시점에서 호출되는 블록으로 생성자라고 부르기도한다.
struct Resolution {
    var width = 0
    var height = 0
    
    //Int만을 인자값으로 받는 초기화 블록 정의
    init(width : Int){
        self.width = width
    }
}

class VideoMode {
    var resolution = Resolution(width : 2048)
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    
    //인스턴스 생성할 때 interlaced, frameRate 두 개의 인자값을 받는 초기화 블록
    init(interlaced : Bool, frameRate : Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
    
}


//Resolution 구조체에 대한 인스턴스 생성
let resolution = Resolution(width : 4096)

//ViedeoMode 클래스에 대한 인스턴스를 생성
let videoMode = VideoMode(interlaced: true, frameRate: 40.0)

/*초기화 블록에서 정의된 매개변수는 함수에서의 뵈부 매개변수명까지 그 역할을 겸한다. 초기화 블록에 정의된 모든 인자값은 매개변수명
까지 함꼐 입력해야 하며, 첫번째 매개변수 명은 생략할 수 있었던 함수와 달리 모든 인자값에 매개변수명을 붙여야 한다.
 구조체나 클래스의 init 구문이 인자값의 개수와 형식이 서로 다른 여러개의 init 구문을 선언할 수 있다.*/
class VideoMode1 {
    var resolution = Resolution(width : 2048)
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    
    //초기화될 때 name 인자값만 받는 init 구문
    init(name : String) {
        self.name = name
    }
    
    //초기화될 때 interlaced 인자값만 받는 init구문
    init(interlaced : Bool) {
        self.interlaced = interlaced
    }
    
    //인스턴스 생성할 때 interlaced, frameRate 두 개의 인자값을 받는 초기화 블록
    init(interlaced : Bool, frameRate : Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
    
    //초기화될 때 interlaced, frameRate, name 세 개의 인자값을 받는 init구문
    init(interlaced : Bool, frameRate : Double, name : String) {
        self.interlaced = interlaced
        self.frameRate = frameRate
        self.name = name
    }
    
}
//VideoMode 클래스에 대한 인스턴스를 생성하고 상수에 해당
let nameVideoMode = VideoMode1(name: "홍길동")
let simpleVideoMode = VideoMode1(interlaced: true)
let doubleVideoMode = VideoMode1(interlaced: true, frameRate: 40.0)
let tripleVideoMode = VideoMode1(interlaced: true, frameRate: 40.0, name: "홍길동")

//init구문이 작성되면 작성된 init 구문이 어떤 인자값 형식을 갖는가에 상관없이 그 객체의 기본 초기화 구문은 더는 제공되지 않는다.
class VideoMode {
    var resolution = Resolution(width : 2048)
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    
    //초기화될 때 name 인자값만 받는 init 구문
    init(name : String) {
        self.name = name
    }
}

//VideoMode 클래스에 대한 인스턴스를 생성하고 상수에 할당
//let defaultVideoMode = VideoMode() //에러
let nameVideoMode = VideoMode(name: "홍길동")

//커스텀 형식의 init 구문을 추가하고 나면 빈 인자값 형식의 기본 초기화 구문을 사용할 수 없다.
class VideoMode {
    var resolution = Resolution(width : 2048)
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    
    init() {
        
    }
    
    //초기화될 때 name 인자값만 받는 init 구문
    init(name : String) {
        self.name = name
    }
}

//VideoMode 클래스에 대한 인스턴스를 생성하고 상수에 할당
let defaultVideoMode = VideoMode() //에러 없음
let nameVideoMode = VideoMode(name: "홍길동")

//기본값이 지정된 초기화 구문에서는 인자값을 생략할 수 있는데, 이때 생략된 인자값 대신 기본값이 인자값으로 사용된다.
//이런 매개변수 기본값의 특성을 사용하면 자동으로 빈 인자 타입의 초기화 구문을 만들 수 있다.

class VideoMode {
    var name : String?
    //초기화될 때 name 인자값만 받는 init 구문
    init(name : String = "") {
        self.name = name
    }
}
//VideoMode 클래스에 대한 인스턴스를 생성하고 상수에 할당
let defaultVideoMode = VideoMode() //에러 없음
let nameVideoMode = VideoMode(name: "홍길동")

//위와 같이 인자값이 있는 초기화 구문에서 매개변수에 기본값을 지정하면 다음 두가지 형태의 인스턴스 생성 형식이 만들어진다.
// VideoMode()
// VideoMode(name:)


//구조체에 멤버와이즈 초기화 구문은 커스텀형식의 init 구문이 추가되면 더 이상 기본으로 제공되지 않는다.
struct Resolution {
    var width = 0
    var height = 0
}

//구조체에서 기본으로 제공해주는 두 가지 타입의 초기화 구문
let defaultResolution = Resolution()
let initResolution = Resolution(width: 4096, height: 1024)

//클래스는 이러한 멤버와이즈 초기화 구문이 제공되지 않으므로 기본적으로 저장 프로퍼티에 반드시 초기값이 할당되어 있어야한다.
//초기값을 할당하지 않는 방법은 프로퍼티타입을 옵셔널로 설정하는 것 밖에 없다.

/*init 구문을 별도로 작성하지 않으면, 옵셔널 타입을 제외한 모든 저장 프로퍼티는 선언 시 초기값이 할당되어야 한다.
  옵셔널 타입을 제외하고, 초기값이 할당되지 않은 모든 저장 프로퍼티는 init 구문 내부에서 초기값이 할당되어야 한다.*/

//초기화 구문의 오버라이딩
//초기화 구문을 오버라이딩할 때는 메소드와 마찬가지로 override 키워드를 붙여야한다.
//부모 클래스에서 명시적으로 선언된 적이 없더라도 이를 상속받은 자식 클래스에서는 반드시 오버라이딩 형식으로 작성해야 한다.
class Base {
    
}

class ExBase : Base {
    override init() {
        
    }
}

/*초기화 구문을 오버라이딩하면 부모 클래스에서 정의한 초기화 구문이 실행되지 않는다. 부모 클래스의 기본 초기화 구문에서 프로퍼티를 
초기화 했다면, 자식 클래스에서 기본 초기화 구문을 오버라이딩함으로써 부모 클래스 프로퍼티의 초기화가 누락되고 프로퍼티가 초기화 
되지 못하는 상황은 오류를 발생시키므로, 이런 상황을 방지 하고자 초기화 구문을 오버라이딩할 경우 부모 클래스에서 정의된 초기화 
구문을 내부적으로 호출해야 하는데, 오버라이딩된 초기화 구문 내부에 super.init 구문을 쓰면된다.*/
class Base {
    var baseValue : Double
    
    init(inputValue : Double) {
        self.baseValue = inputValue
    }
}

class ExBase : Base {
    override init(inputValue: Double) {
        super.init(inputValue: 10.5)
    }
}

/*baseValue 프로퍼티는 옵셔널 타입이 아닌 일반 타입으로 반드시 초기값이 있어야 하지만 초기화 구문의 오버라이딩으로 인해 초기값
할당 구문이 누락되면 오류가 발생한다. 이러한 오류를 방지하기 위해 오버라이딩된 초기화 구문에서 부모 클래스랴스의 초기화 구문을
직접 호출해주게 된다.*/


//초기화 구문 델리게이션
/*연쇄적으로 오버라이딩된 자식 클래스의 초기화 구문에서 부모 클래스의 초기화 구문에 대한 호출이 발생하는 것을 초기화 구문 
델리게이션이라고 한다. 기본 초기화된 구문을 제외한 나머지 초기화 구문을  오버라이딩할 때는 반드시 부모 클래스의 초기화 구문을 
호출함으로써 델리게이션 처리를 해 주어야 한다.

 부모 클래스에 기본 초기화 구문만 정의되어 있거나 기본 초기화 구문이 아예 명시적으로 정의되어 있지 않은 상태에서 자식 클래스에서 
init() 구문을 명시적으로 정의하기 위해 오버라이딩할 때는 super.init()구문을 호출해주지 않아도 자동으로 부모 클래스의 초기화 구문
호출이 이루어 진다. 이때 초기화 구문 호출은 자식 클래스부터 역순으로 이루어진다.*/

class Base {
    var baseValue : Double
    init() {
        self.baseValue = 0.0
        print("Base Init")
    }
}

class ExBase : Base {
    override init() {
        print("ExBase Init")
    }
}

let ex = ExBase()

//부모 클래스에서 기본 초기화 구문 외에 다른 형식의 초기화 구문이 추가 되어 있다면, 자식 클래스에서 기본 초기화 구문을 오버라이딩
//할때 명시적으로 부모 클래스의 기본 초기화 구문을 호출 해야한다.
class Base {
    var baseValue : Double
    init() {
        self.baseValue = 0.0
        print("Base Init")
    }
    
    init(baseValue : Double){
        self.baseValue = baseValue
    }
}

class ExBase : Base {
    override init() {
        super.init()
        print("ExBase Init")
    }
}

//옵셔널체인
//옵셔널 타입의 문제점: if구문을 통해 값의 안정성 여부를 검사해야 한다는것


//클래스나 구조체의 인스턴스가 옵셔널 타입으로 서언될 경우 프로퍼티와 메소드를 호출하기 위해서는 매번 if 구문을 통해
//옵셔널 인스턴스의 정상값 여부를 검사해야한다.
struct Human {
    var name : String?
    var man : Bool = true
}

var boy : Human? = Human(name: "홍길동", man: true)

if boy != nil {
    if boy!.name != nil{
        print("이름은 \(boy!.name!)입니다.")
    }
}

//옵셔널 비강제 해제 구문
if let b = boy {
    if let name = b.name {
        print("이름은 \(name)입니다.")
    }
}

//어떤 방법도 if 구문의 처리를 피할 수 없다.

//Human 구조체를 다른 구조체나 클래스가 프로퍼티로 사용하되, 이를 옵셔널 타입으로 설정하면 name 프로퍼티를 참조하기 위한 코드는 더
//복잡해 진다.
struct Company {
    var ceo : Human?
    var companyName : String?
}

var startup : Company? = Company(ceo: Human(name: "나대표", man: false), companyName: "루비페이퍼")

//ceo프로퍼티의 내부 프로퍼티 name 참조 과정
if let company = startup { //startup의 옵셔널 타입 해제
    if let ceo = company.ceo{ //ceo 프로퍼티의 옵셔널 해제
        if let name = ceo.name{ //name 옵셔널 해제
            print("대표이사의 이름은 \(name)입니다.")
        }
    }
}

//혹은 옵셔널 강제해제를 통해 name을 얻을 수 잇지만 런타임 오류가 발생할 수 있다.
if let name = startup!.ceo!.name {
    print("대표이사의 이름은 \(name)입니다.")
}

//옵셔널 체인
//if 구문을 쓰지 않고도 간결하게 사용할 수 있는 코드를 작성할 수 있다.
//이는 Objective-C의 특성 중 하나로 nil 객체에 메시지를 보내도 아무런 오류가 발생하지 않는 것이다.

//이러한 특성을 이용해 위의 여러번 중첩된 if구문을 옵셔널 체인을 이용해 작성해 보면
if let name = startup?.ceo?.name{
    print("대표이사의 이름은 \(name)입니다.")
}
// 참조가 아닌 할당이라면 다음과 같이 작성한다.
startup?.ceo?.name = "홍길동"
//이때 만약 startup 변수나 ceo 프로퍼티가 빈 값이라면 아무런 값도 할당되지 않은 채로 구문은 종료되지만 오류는 발생하지 않는다.

/*옵셔널 체인의 특징
 1.옵셔널 체인으로 참조된 값은 무조건 옵셔널 타입으로 반환된다.
 2.옵셔널 체인 과정에서 옵셔널 타입들이 여러 번 겹쳐 있더라도 중접되지 않고 한번만 처리된다. */

//옵셔널 체인으로 참조된 값은 반드시 옵셔널 타입으로 반환된다. 옵셔널 체인 구문에서 마지막에 오는 값이 옵셔널 타입이 아닌 일반값
//이라도 옵셔널 체인을 통해 참조했다면 이 값은 옵셔널 타입으로 변경됩니다.
print(startup?.ceo?.man)
//옵셔널 타입으로 반환되는 이유는 옵셔널 체인이라는 구문 자체가 nil을 반환할 가능성을 내포하고 있기 때문이다.
*/
//옵셔널 체인은 프로퍼티뿐만 아니라 메소드에서도 사용할 수 있다.
//메소드에서는 주로 반환값이 구조체나, 클래스, 또는 열거형 등으로 구성되어 그 내부에 있는 프로퍼티나 메소드를 사용해야 할 때 
//옵셔널 체인을 적절히 사용하연 호율적이다.
struct Human {
    var name : String?
    var man : Bool = true
}

struct Company{
    var ceo : Human?
    var companyName : String?
    
    func getCEO() -> Human? {
        return self.ceo
    }
}

var someCompany : Company? = Company(ceo: Human(name: "팀 쿡", man: true), companyName: "Apple inc")

let name = someCompany?.getCEO()?.name
if name != nil {
    print("대표이사의 이름은 \(name!)입니다.")
}
/*메소드 자체를 옵셔널 체인으로 사용하는 것이 아니라 메소드의 결과값을 옵셔널 체인으로 사용하는 것이다. 메소드 자체를 옵셔널 체인
형식으로 사용하는 것은 옵셔널 메소드일 때만 가능하다.

옵셔널 체인 구문 someCompany?.getCEO()?.name
옵셔널 강제 해제 someCompany!.getCEO()!.name

옵셔널 체인이 적용된 객체가 nil이라면 오류가 발생하지 않지만 옵셔널 강제해제를 사용한 객체가 nil일 경우 런타임 오류가 발생한다.
*/
