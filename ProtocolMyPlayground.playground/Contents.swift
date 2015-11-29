//: Playground - noun: a place where people can play

import UIKit
//프로토콜
//다른 언어의 인터페이스 역할이다.
/*델리게이트 패턴을 구현하기 위해서도 이용한다. 구조체나 클래스, 확장 등의 객체를 구현하는 과정에서도 프로포콜을 선언하여 구현해야
할 메소드의 명세를 공통으로 정의할 수 있으며, 프로토콜을 구현한 객체의 메소드나 속성을 은닉하고 프로토콜에서 선언된 명세의 내용만 제공
하는 기능을 하기도 한다. 한마디로 프로토콜이란 특정 객체가 갖추어야할 기능이나 속성에 대한 설계도이다.

프로토콜을 구현할 수 있는 구현체들은 다음과 같다.
1. 구조체
2. 클래스
3. 열거형
4. 확장 객체


프로토콜에 선언되는 프로퍼티에는 초기값을 할당할 수 없다. 프로퍼티의 종류, 이름, 변수/상수 구분, 타입, 읽기 전용인지 읽고 쓰기가
가능한지에 대해서만 정의한다.*/
protocol SamplePropProtocol {
    var name : String { get set }
    var description : String { get }
}

/*의도하는 프로퍼티가 연산 프로퍼티일 때는 get 키워드만으로 읽기전용 속성으로 설정하거나 get과 set을 모두 사용하여 읽고 쓸 수 있는 프
로퍼티로 설정할 수 있다. 그러나 저장 프로퍼티로 사용하려면 반드시 get과 set 키워드를 모두 추가해야한다. get 키워드만 선언한 읽기 전용
속성으로 저장 프로퍼티를 구현할 수 없다.*/
struct PropertyProtocolImpl : SamplePropProtocol {
    var name = "홍길동"
    var description : String {
        return "Name : \(self.name)"
    }
}
/*
//메소드
protocol SampleMethodProtocel {
func excute(cmd : String)
func showPort(p : Int) -> String
}

//프로토콜에 선언된 것중에서 일부를 누락하면 오류가 발생하지만 프로포콜에 정의되어 있지 않은 메소드를 임의로 추가하는것은 문제가 되지 않는다.
struct Process : SampleMethodProtocel {
//첫 번째 매개변수명은 변경 가능하다.
func excute(command: String) {
if command == "start"{
print("실행합니다.")
}
}
func showPort(port : Int) -> String {
return "Port : \(port)"
}
}

//두 번째 매개변수명부터는 프로토콜과 구현체 양쪽에서 모두 일치 해야한다.
//외부 매개변수명이 설정되어 있을 때는 구현체에서도 동일하게 반영해야 한다.
protocol NewSampleMethodProtocel {
    func excute(cmd : String, desc : String)
    func showPort(p : Int, memo desc : String) -> String
}

struct NewProcess : NewSampleMethodProtocel {
    func excute(command : String, desc : String) {
        if command == "start" {
            print("실행합니다.")
        }
    }
    
    func showPort(port: Int, memo desc: String) -> String {
        return "Port : \(port), Memo : \(desc)"
    }
}

/*구조체에 구현된 메소드의 실행 구문에서 프로퍼티를 수정해야 한다면 메소드 앞에 mutating키워드를 붙여야한다. 그런데 해당 메소드가
프로토콜에서 선언된 메소드라면 프로토콜에 mutating 키워드가 먼저 작성되어 있어야한다. 프로토콜에 mutating 키워드가 붙지 않은 메소드를
구조체에서 mutating 메소드로 작성하면 이를 컴파일러에서는 프로토콜의 메소드를 구현하지 않은 것으로 간주하여 구현 대상 누락 오류가 발생
한다.

프로토콜을 구현할 수 있는 대상인 구조체나 열거형을 위해서는 프로토콜에 mutating 키워드가 붙어 있어야 한다. 없는 경우는 다음 두 가지 중
하나로 해석할 수 있다.

1. 구조체나 열거형 등 값 타입의 객체에서 내부 프로퍼티의 값을 변경하기를 원치 않을 때
2. 주로 클래스를 대상으로 간주하고 작성된 프로토콜일 때*/

protocol SampleMethodProtocol {
    mutating func execute(command : String)
    func showTarget( p : Int) -> String
}

struct Process : SampleMethodProtocol {
    
    var paramCommand : String?
    mutating func execute(command: String) {
        self.paramCommand = command
        
        if command == "start" {
            print("실행합니다.")
        }
    }
    
    func showTarget(port: Int) -> String {
        return "Port : \(port), now command : \(self.paramCommand!)"
    }
    
}

/*프로토콜에서 mutating 키워드가 붙어 있지 않은 메소드를 구현할 때 mutating 키워드를 붙이면 오류가 발생하지만
프로토콜에서 mutating 키워드가 붙어있는 메소드를  구조체 등에서 mutating 키워드를 붙이지 않고 구현해도 오류는 발생하지 않는다.*/
struct Process2 : SampleMethodProtocol {
    var paramCommand : String?
    
    func execute(command: String) {
        if command == "start" {
            print("실행합니다.")
        }
    }
    
    func showTarget(type: Int) -> String {
        return "Type : \(type)"
    }
}

//클래스는 참조 타입의 객체이므로 mutating를 붙일 필요가 없다.
class Thread : SampleMethodProtocol {
    var paramCommand : String?
    
    init(command : String = "start") {
        self.paramCommand = command
    }
    
    func execute(command: String) {
        self.paramCommand = command
        if command == "start" {
            print("실행합니다.")
        }
    }
    
    func showTarget(port : Int) -> String {
        return "Port : \(port), now command : \(self.paramCommand!)"
    }
}
/* 프로토콜에는 타입 메소드나 타입 프로퍼티도 정의할 수 있다. 프로토콜의 각 선언 앞에 static 키워드를 붙이면 된다.
클래스에서 타입 메소드를 선언할 때 사용하는 또 다른 키워드인 class는 프로토콜에서 사용할 수 없다. 프로토콜에서 사용할 수 없을 뿐,
클래스에서 구현할 때는 필요에 따라 static이나 class 키워드를 선택하여 사용할 수 있다. 구조체나 열거형에서 구현할 때는 선택의 여지
없이 static 키워드를 붙여야 한다. */

protocol SomeTypeProperty {
    static var defaultValue : String { get set }
    static func getDefaultValue() -> String
}

struct TypeStruct : SomeTypeProperty {
    static var defaultValue  = "default"
    
    static func getDefaultValue() -> String {
        return defaultValue
    }
}

class ValueObject : SomeTypeProperty {
    
    static var defaultValue = "default"
    //클래스 상속 시 필요에 따라 static 키워드 대신 class 키워드를 사용하는 것은 프로토콜 명세를 올바르게 구현하는 것으로 간주한다.
    class func getDefaultValue() -> String {
        return defaultValue
    }
}



//초기화 구문
protocol SomeInitProtocol {
    init()
    init(cmd : String)
}

/*메소드와 달리 초기화 블록은 호출할 때 첫 번째 매개변수명부터 사용하므로 프로토콜에서 선언된 초기화 구문의 매개변수와 다르게 구현하면
안된다. 반드시 매개변수명까지 일치해야 제대로 프로토콜을 구현한 것이 된다. 프로토콜 명세에 멤버와이즈 초기화 구문이 포함되어 있을 때에
는 이를 직접 구현해야 한다. 클래스에서는 초기화 구문을 구현할 때 반드시 required 키워드를 붙여야한다.

초기화 구문을 구현할 때 주의헤야 할 점은 다음과 같다.
1. 첫번째 매개변수명부터 프로토콜의 명세와 완전히 일치해야함
2. 프로포콜 명세에 포함된 초기화 구문은 구조체나 클래스에서 기본으로 제공되는 초기화 구문 형식과 일치 하더라도 반드시 직접 구현해야 한
다.
3. 클래스에서 초기화 구문을 구현할 때는 required 키워드를 붙여야 한다.*/

struct  StructInit : SomeInitProtocol {
    var cmd : String
    
    init() {
        self.cmd = "start"
    }
    
    init(cmd: String) {
        self.cmd = cmd
    }
}
// 구조체와 달리 초기화 구문 앞에 required 키워드를 붙인다.
class ClassInit : SomeInitProtocol {
    var cmd : String
    
    required init() {
        self.cmd = "start"
    }
    
    required init(cmd: String) {
        self.cmd = cmd
    }
}

/*상속과 프로토콜 구현은 동시에 선언할 수 있다. 부몰 클래스로부터 물려받은 초기화 구문과 프로토콜로부터 구현해야 하는 초기화 구문이
중복 되는 경우, 부모클래스에서 물려받은 초기화 구문을 오버라이드하는 것이 되어 required 키워드와 overried 키워드를 동시에 추가하여
초기화 구문을 작성해야 한다.*/
/*
protocol Init {
init()
}

class Parent {
init() {}
}

//프로토콜을 구현하기 위해 초기화 구문을 작성해야 한다. 이때 부모 클래스 입장에서 보면 자신의 초기화 구문을 자식 클래스에서 재정의하는
//것이 된다. 그렇기 때문에 override와 required 키워드를 모두 붙인다. 이때 키워드의 순서는 관계 없다.
class Child : Parent, Init {
override required init() {

}
}
*/
//이 규칙은 메소드나 연산 프로퍼티에서도 같다.
protocol Init {
    func getValue()
}

class Parent {
    func getValue() {
        
    }
}

class Child: Parent, Init {
    override func getValue() {
        
    }
}

//상속은 단일 상속만 혀용되지만 프로토콜의 개수에는 제한이 없다.
struct MultiImplement : SampleMethodProtocol, SomeInitProtocol {
    var cmd : String
    
    init() {
        self.cmd = "default"
    }
    
    init(cmd: String) {
        self.cmd = cmd
    }
    
    mutating func execute(cmd: String) {
        self.cmd = cmd
        if cmd == "start" {
            print("시작합니다.")
        }
    }
    
    func showTarget(port: Int) -> String {
        return "Port : \(port), now command : \(self.cmd)"
    }
}
//부모 클래스가 있다면 프로토콜 선언보다 앞서 작성되어야 한다.
class BaseObject {
    var name : String = "홍길동"
}

class MultiImplWithInherit : BaseObject, SampleMethodProtocol, SomeInitProtocol {
    var cmd : String
    required override init() {
        self.cmd = "default"
    }
    
    required init(cmd: String) {
        self.cmd = cmd
    }
    
    func execute(cmd: String) {
        self.cmd = cmd
        if cmd == "start" {
            print("시작합니다.")
        }
    }
    
    func showTarget(port: Int) -> String {
        return "Port : \(port), now command : \(self.cmd)"
    }
    
}

var muIWIClass = MultiImplWithInherit()
print(muIWIClass.name)
//타입으로서의 프로토콜
/* 프로토콜은 특별한 기능을 부여하지 않더라도 코드내에서 자료형으로 사용하기에 부족함이 없는 객체이다. 이 때문에 때로는 타입으로서
중요한 역할을 하기도 한다. 프로토콜을 자효형으로 사용할 수 있어서 다음과 같이 다른 타입들이 사용될 수 있는 여러 상황에서 프로토콜을
사용할 수 있다. 프로토콜을 상위 클래스 타입으로 간주하여 사용하는 것과 유사하다.

상수나 변수, 그리고 프로퍼티의 타입으로 사용할 수 있음
함수, 메소드 또는 초기화 구문에서 매개변수 타입이나 반환 타입으로 프로토콜을 사용할 수 있음
배열이나 사전, 혹은 다른 컨테이너의 타입으로 사용할 수 있음

프로토콜 타입으로 정의된 변수나 상수에 할당된 객체는 프로토콜 이외에 구현체에서 취가한 프로퍼티나 메소드들을 컴파일러로부터 은닉 해준다.*/
protocol Wheel {
    func spin()
    func hold()
}

class Bicycle : Wheel {
    var moveState = false
    
    func pedal() {
        self.moveState = true
    }
    
    func pullBreak() {
        self.moveState = false
    }
    
    func spin() {
        self.pedal()
    }
    func hold() {
        self.pullBreak()
    }
}

let trans = Bicycle()
trans.moveState
trans.pedal()
trans.pullBreak()
trans.spin()
trans.hold()

let transs : Wheel = Bicycle()
//Wheel 타입으로 상수에 할당하면 transs가 사용할 수 있은 프로퍼티나 메소드는 다음의 두가지로 제한된다.
transs.spin()
transs.hold()
/*객체 본래 타입이 아니라 프로토콜 타입으로 선언한 변수나 상수에 할당받아 사용하는 것은 특정 프로토콜을 구현하는 모든 클래스나
구조체를 변수나 상수에 할당할 수 있다는 장점이 있다. 개별 구조체나 클래스 타입으로 변수나 상수가 한정되지 않으므로 실질적으로 정의된
객체가 무엇이든지 특정 프로토콜을 구현하기만 했다면 모두 할당받을 수 있다.
프로토콜 타입으로 선언하여 할당받으면 프로토콜에서 선언된 메소드나 프로퍼티는 모두 이용할 수 있다.*/
/*
//두개 이상의 특정 프로토콜들 타입을 모두 사용해야 할 때
protocol A {
    func doA()
}

protocol B {
    func doB()
}

class Impl: A, B {
    func doA() {
        
    }
    
    func doB() {
        
    }
    
    func desc() -> String {
        return "Class intance method"
    }
    
}

var ipl : protocol<A, B> = Impl()
ipl.doA()
ipl.doB()
*/
//Wheel 타입으로 선언된 구문을 제너릭 타입으로 바꾸어 작성할 수도 있다.
let tran : protocol<Wheel> = Bicycle()


//델리게이션
/* 네가 누군지 난 알 필요 없다. 다만 너는 내가 호출할 메소드를 구현하고 있지만 하면 된다.
델리게이션은 델리게이트 패턴과 연관되는 아주 중요한 개념으로 간단하게 설명하면 특정 기능을 다른 객체에 위임하고, 그에 다라 필요한 시점
에 메소드의 호출만 만든 패턴을 의미한다.


예를 들어 연료펌프는 연료가 부족해지면 이를 연료펌프가 장착된 시스템에 알려주는 기능을 가지고 있다면 이 알림을 받은 운송 시스템은 각자
의 방법으로 모자란 연료를 보충한다. 연료가 가득차면 연료보충을 중단하도록 알려주는 기능 또한 있다고 가정하고 이때 연료가 부족해지는 시
점이나 연료가 가득 차는 시점을 연료펌프가 장착된 시스템이 점검하는 것이 아니라 연료펌프에 위임해두고, 연료 펌프가 알아서 스스로 알려주
도록 하는 것이 바로 델리게이션이라 할 수 있다.*/
protocol FuelPumpDelegate {
    func lackFuel() //연료 부족
    func fullFuel() //연료 가득
}

class FuelPump {
    var maxGage : Double = 100.0
    var delegate : FuelPumpDelegate? = nil
    
    var fuelGage : Double {
        didSet{
            if oldValue < 10 {
                //연료가 부족해지면 델리게이트의 lackFule 메소드를 호출한다.
                self.delegate?.lackFuel()
            }else if oldValue == self.maxGage {
                //연료가 가득차면 델리게이트의 fullFuel 메소드를 호출한다.
                self.delegate?.fullFuel()
            }
        }
    }
    
    init(fuelGage : Double = 0) {
        self.fuelGage = fuelGage
    }
    
    //연료펌프를 가동한다.
    func startPump() {
        while(true) {
            if self.fuelGage > 0 {
                self.jetFuel()
            }else {
                break
            }
        }
    }
    
    
    //연료를 엔진에 분사한다. 분사할 때마다 연료 게이지의 눈금은 내려간다.
    func jetFuel() {
        self.fuelGage--
    }
}


//연료펌프 클래스를 이동수단에 장착
//이동 수단이 되는 클래스는 반드시 FuelPumpDelegate 프로토콜을 구현해야 한다. 그래야 연료펌프 클래스의 delegate 프로퍼티에 자신을 할당
//할 수 있는 타입이 될 수 있을 것이다.

class Car: FuelPumpDelegate {
    var fuelPump = FuelPump(fuelGage: 100)
    
    init() {
        self.fuelPump.delegate = self
    }
    
    //이 메소드는 fuelPump가 호출하게 된다.
    func lackFuel() {
        //연료 보충
    }
    
    //이 메소드는 fuelPump가 호출하게 된다.
    func fullFuel() {
        //연료 보충 중단한다.
    }
    
    //자동차에 시동을 건다.
    func start() {
        fuelPump.startPump()
    }
}


//프로토콜의 활용
//확장 구문과 프로토콜
//확장 구문에서 프로토콜을 구현할 수 있다.
class Man {
    var name : String?
    
    init(name : String = "홍길동") {
        self.name = name
    }
}

protocol Job {
    func doWork()
}
//뒤늦게 Job 프로토콜을 구현해야 할 때라면 확장 구문을 사용하여 기존 클래스 수정없이 Job 프로토콜을 구현할 수 있다.
extension Man : Job {
    func doWork() {
        print("\(self.name!)님이 일을 합니다.")
    }
}

let man = Man(name: "개발자")
man.doWork()

//프로토콜의 상속
//여러 개의 프로토콜을 하나의 프로토콜에 한꺼번에 상속하여 각 프로토콜들의 명세를 하나의 프로토콜에 담을 수 있다.
protocol A {
    func doA()
}

protocol B {
    func doB()
}

protocol C : A, B {
    func doC()
}

/*실질적인  C프로토콜에 내용
protocol C {
func doA()
func doB()
func doC()
}
*/

class ABC: C {
    func doA() {
        
    }
    func doB() {
        
    }
    func doC() {
        
    }
}

let abc : C = ABC()
abc.doA()
abc.doB()
abc.doC()

let a : A = ABC()
a.doA()

let ab : protocol< A, B > = ABC()
ab.doA()
ab.doB()

let abc2 : protocol< A, B, C > = ABC()
abc2.doA()
abc2.doB()
abc2.doC()

func foo(abc : C) { }
foo(ABC())

func boo(abc : protocol<A, B>) { }
boo(ABC())

//상속으로 구성된 프로토콜은 상위 프로포콜 타입으로 선언된 변수/상수나 함수의 인자값으로 사용될 수 있다.
//프로토콜을 상속할떄 부모 프로토콜과 자식프로토콜의 선언이 겹칠 경우 클래스에서 override 키워드를 붙여야하는 제약이 없다.
protocol C1 : A, B {
    func doA()
    func doB()
    func doC()
}

//상속 관계로 성립된 프로토콜은 is, as 같은 타입 연산자들을 사용하여 타입에 대한 비교와 타입 변환을 할 수 있다.
abc is C
abc is protocol<A, B>
abc is A
abc is B
a is C
a is B
ab is C
abc2 is protocol<A, B, C>


*/
/* as 연산자는 제한된 범위 내에서 타입을 캐스팅할 수 있도록 해준다.

1. 실제로 할당된 인스턴스 타입
2. 인스턴스가 구현한 프로토콜 타입
3. 클래스가 상속을 받았을 경우 모든 상위 클래스
4. 프로토콜 타입이 상속을 받았을 경우 모든 상위 프로토콜

실제 할당된 인스턴스 객체에 따라서 캐스팅이 성공할 수도, 실패할 수도 있기 때문에 실제로 할당된 인스턴스 객체의 타입을 기준으
로 일치하거나 상위 타입이면 캐스팅이 잘 되겠지만, 그렇지 않으면 캐스팅에 실패한다. 이는 캐스팅 결과값으로 nil이 반환될 수 있
다는 의미로 이 때문에 하위 캐스팅에서는 일반 캐스팅 연산자를 사용하는 대신 옵셔널 타입으로 캐스팅 결과를 반환하는 옵셔널 캐스
팅 연산자와 캐스팅 실패를 감안하고서라도 일반 타입으로 캐스팅하는 강제 캐스팅 연산자 중에서 선택해서 사용해야 한다.
*/

protocol Machine {
    func join()
}

protocol Wheel : Machine {
    func lotate()
    
    init(name : String, currentSpeed : Double)
}

class Vehicle {
    var currentSpeed = 0.0
    var name = ""
    
    init(name : String, currentSpeed : Double) {
        self.name = name
        self.currentSpeed = currentSpeed
    }
}

class Car : Vehicle, Wheel {
    required override init(name : String, currentSpeed: Double = 0.0) {
        super.init(name: name, currentSpeed: currentSpeed)
    }
    
    func join() {
        //join parts
    }
    
    func lotate() {
        print("\(self.name)의 바퀴가 회전 합니다.")
    }
}

class Carpet: Vehicle, Machine {
    func join() {
        //join parts
    }
}


var translist = [Vehicle]()
translist.append(Car(name: "자동차", currentSpeed: 10.0))
translist.append(Carpet(name: "양탄자", currentSpeed: 15.0))

for trans in translist {
    if let obj  = trans as? Wheel {
        obj.lotate()
    }else {
        print("\(trans.name)의 하위 타입 변환이 실패 했습니다.")
    }
}

//클래스 전용 프로토콜
//클래스만 사용할 수 있는 프로토콜을 클래스 전용 프로토콜이라고 하는데, 프로토콜 정의시 class 키워드를 사용하여 클래스 전용 
//프로토콜임을 컴파일러에 알려준다. 이때 class 키워드를 사용하는 위치는 프로토콜의 이름 뒤 콜론으로 구분된 영역이다.
//class 키워드와 상속 프로토콜을 이름을 작성할때는 class 키워드를 맨 앞에 작성해야 한다.
protocol SomeClassOnlyProtocol : class, Wheel, Machine {
    //클래스에서 구현할 내용 작성
}


//옵셔널
/*선택적 요청 문법이다. 이 문법은 프로토콜에서 선언된 프로퍼티나 메소드, 초기화 구문등 프로토콜을 구현할 때 작성해야 하는
요소들을 필수 사항에서 선택사항으로 바꾸어준다. Optional 키워드를 사용하여 표시한다. 프로토콜에서 Optional 키워드를 사용하려
면 프로토콜 앞에 @objc를 표시해야 한다. @objc는 파운데이션 프레임워크에 정의된 어노테이션의 일종으로서 이 어노테이션이 붙은 
코드나 객체를 오브젝티브-C 코드에서도 참조할 수 있도록 노출됨을 의미한다. 실제로 상호동작할 일이 없어도 붙여야한다. @objc 
어노테이션이 붙은 프로토콜은 구조체나 열거형 등에서 구현할 수 없고 클래스만 이 프로토콜을 구현할 수 있다. Optional키워드도 
클래스 전용 프로토콜이다.*/
import Foundation //파운데이션 프레임워크에서 참조할 수 있도록 한다.

@objc
protocol MsgDelegate {
    optional func onReceive(new : Int)
}

class MsgCenter {
    var delegate : MsgDelegate?
    var newMsg : Int = 0
    
    func msgCheck() {
        if newMsg > 0 { //새로운 메시지가 도착했다면
            self.delegate?.onReceive?(self.newMsg)
            self.newMsg = 0
        }
    }
}


class Watch: MsgDelegate {
    var msgCenter : MsgCenter?
    
    init(msgCenter : MsgCenter) {
        self.msgCenter = msgCenter
        
        while(true) {
            self.msgCenter?.msgCheck()
        }
    }
    
    //프로토콜에 optional키워드를 붙인 메소드를 구현할때 앞에 @objc 어노테이션을 붙인다.
    @objc func onReceive(new: Int) {
        print("\(new) 건의 메시지가 도착했습니다.")
    }
}

//var watch = Watch(msgCenter: MsgCenter())
