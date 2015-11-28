//: Playground - noun: a place where people can play

import UIKit
/*/**/*/
//열거형과 확장 구문

//열거형이란 서로 연관된 데이터들이 멤버로 구성되어 있는 자료형 객체
//열거형에서 데이터들은 열거형 객체를 정의하는 시점에서 함께 정의된다. 
//열거형의 데이터 멤버들은 정의(Definition) 개념으로 작성되는 것이므로 컴파일러가 미리 인지할 수 있다.
/*컴파일러가 미리 인지할 수 있고 없고는 차이는 런타임 오류와 컴파일 오류의 차이로 나타난다. 변수에 입력될 값들을 미리 특정할 수 있다면
 리터럴로 직접 값을 입력하는 것보다 미리 열거형 타입으로 각 값에 해당하는 멤버를 정의하고 사용하는 것을 추천한다. 

다음의 조건을 만족하는 경우라면 값을 직접 입력하거나 집단 데이터 타입을 사용하는 것보타 열거형으로 정의해서 사용하는 것이 좋다.
 1.원치 않는 값이 잘못 입력되는 것을 막고 싶을 때
 2.입력받을 값을 미리 특정할 수 있을때
 3.제한된 값 중에서만 선택할 수 있도록 강제하고 싶을 때

열거형의 멤버로 정의할 수 있는 데이터 집합은 연속된 값들이 아닌 불연속된 값들의 집합이어야하며 서로 공통된 주제로 연관성이 있는 값들로
이루어져야 한다. 또한 종류가 무한히 늘어나지 않고 몇 가지로 수렴되는 값들이어야 한다.
 
열거형 데이터 집합의 예
 
 성별 남,여
 국가 한국, 미국, 중국, 일본, ...
 지역 서울, 부산, 인천, ...
 직급 사원, 대리, 차장, ...
 색상 빨강, 파랑, 초록, ...
 방향 동, 서, 남, 북
*/

//멤버 데이터를 정의한다는 것을 나타내기 위해 case 키워드를 사용한다.
enum Direction {
    case North
    case South
    case East, West //키워드를 한번만 사용하여 한줄로 작성하고 각 멤버를 쉼표로 이용하여 구분한다.
}

Direction.North
Direction.South
Direction.East
Direction.West

//열거형을 정의한다는 것은 새로운 타입의 데이터를 정의하는 것과 같다. 변수나 상수에 Direction 멤버 중 하나를 할당한다면
//변수나 상수는  Direction타입으로 선언된다.
var directionToHead = Direction.West
//변수가 초기값으로 Direction타입의 멤버를 할당 받았기 때문에 열거형 이름을 생략할 수 있다.
directionToHead = .East
//타입 어노테이션과 함께 사용한다면 열거형 객체의 이름을 생략하고 멤버만 할당할 수 있다.
var directionHead : Direction = .East

//열거형 객체를 switch구문에 넣어 멤버별 기능을 정의할때, 열거형 정의된 멤버 전부를 사용하여 case 구문을 작성할 경우 default구문은 생략 가능
switch directionHead {
case .North :
    print("북쪽입니다.")
case .South :
    print("남쪽입니다.")
case .East :
    print("동쪽입니다.")
case .West :
    print("서쪽입니다.")
}

//멤버와 값의 분리
//멤버와 실질적인 값을 분리하여 멤버는 이해하기 쉬운 문자열로 정의하고, 실질적인 값을 맴버에 할당하여 사용하면 편리하다.

//HTTP 응답코드
enum HTTPCode0 : Int {
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
}

HTTPCode0.OK.rawValue
HTTPCode0.NOT_MODIFY.rawValue
HTTPCode0.INCORRECT_PAGE.rawValue
HTTPCode0.SERVER_ERROR.rawValue

//열거형에 정수값이 자동으로 할당될 때는 첫 번째 값을 기준으로 +1씩 처리하여 다음 멤버들에게 각각 할당한다.
enum Rank : Int {
    case one = 1
    case two, three, four, five
}

Rank.one.rawValue
Rank.two.rawValue
Rank.three.rawValue
Rank.four.rawValue
Rank.five.rawValue

//첫번째 멤버를 10으로 지정 했다면 나머지는 11, 12, 13, 14로 설정된다.
//만약 두번째 멤버에도 값을 직접할한다면 그 이후 멤버들은 두 번째 값을 기준으로 1씩 증가하는 값을 가진다.
enum Rank1 : Int {
    case one = 10
    case two = 20
    case three, four, five
}

Rank1.one.rawValue
Rank1.two.rawValue
Rank1.three.rawValue
Rank1.four.rawValue
Rank1.five.rawValue

//열거형 객체의 멤버가 실질 값을 가지지 않고 단순히 멤버만 정의되어 있다면 rawValue 속성은 사용할 수 없다.

//열거형 객체의 멤버와 실질 값은 선언하는 시점에서 정의되지만, 사용되는 시점에서 멤버에 보조 값을 설정할 수 있는 방법도 제공한다.
//이렇게 설정된 값을 연관 값(Associated Values)하고 한다.
enum  ImageFormat {
    case JPEG
    case PNG(Bool) //투명한 PNG와 그렇지 않은 PNG
    case GIF(Int, Bool) //컬러 수와 애니메이션 여부
}

var newImage = ImageFormat.PNG(true)
newImage = .GIF(256, false)

//열거형은 클래스나 구조체처럼 내부에 연산 프로퍼티와 메소드를 정의할 수 있다.
//열거형은 구조체나 클래스와 달리 인스턴스를 만들 수 없지만, 열거형의 멤버를 인스턴스처럼 사용할 수 있다.
enum HTTPCode : Int{
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
    
    var value : String {
        return "HTTPCode number is \(self.rawValue)"
    }
    
    func getDescription() -> String {
        switch self {
        case .OK :
            return "응답이 성공 했습니다. HTTP 코드는 \(self.rawValue)입니다."
        case .NOT_MODIFY :
            return "변경된 내역이 없습니다. HTTP 코드는 \(self.rawValue)입니다."
        case .INCORRECT_PAGE :
            return "존재하지 않는 페이지 입니다. HTTP 코드는 \(self.rawValue)입니다."
        case .SERVER_ERROR :
            return "서버 오류입니다. HTTP 코드는 \(self.rawValue)입니다."
        }
        
    }
    
    static func getName() -> String {
        return "This Enumberation is HTTPCode"
    }
    
}

var response = HTTPCode.OK
response = .NOT_MODIFY

response.value
response.getDescription()

HTTPCode.getName()



//확장 구문













































