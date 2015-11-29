//: Playground - noun: a place where people can play

import UIKit

//오류 처리
/*최근의 객체지향 언어들은 오류가 발생했을 때 함수나 메소드에서 해당 오류를 던지는(throws)처리를 할
수 있도록 지원한다. 이렇게 되면 함수/메소드의 반환 타입을 건드리지 않고도 효율적으로 오류 정보를 전
달할 수 있게 된다.*/

//오류 타입 정의하기
//오류 타입 객체는 하나의 일관된 오류 주제에 대해 다양한 오류 타입을 정의할 수 있어야 하므로 열거형
//을 이용하여 정의한다.

/*[YYYY-MM-DD]형태를 보이는 문자열을 분석하여 연도, 월, 일 형식의 데이터로 각각 변환하는 함수가 있다
면 이 함수는 문자열을 분석하는 과정에서 다음과 같은 다양한 오류를 만날 수 있다.
1. 입력된 문자열의 길이가 필요한 크기와 맞지 않는 오류
2. 입력된 문자열의 형식이 YYYY-MM-DD형태가 아닌 오류
3. 입력된 문자열의 값이 날짜와 맞지 않는 오류
이와 같이 함수가 반환할 오류는 이처럼 일관된 주제와 연관된 다양한 경우를 표헌 할 수 있어야 한다. 이
를 위해 가장 적합한 객체 타입이 열거형이라 할 수 있다.

오류 타입으로 사용되는 열거형을 정의할 때는 반드시 ErrorType이라는 프로토콜을 구현해야 한다. 컴파일
러는 ErrorType 프로토콜을 구현한 열거형만을 오류 타입으로 인정한다.
protocol ErrorType {
//아무런 기능이 정의되지 않은 프로토콜이다.
}
*/
enum DateParsError : ErrorType {
    case OverSizeString //입력된 데이터의 길이가 필요한 크기보다 큽니다.
    case UnderSizeString //입력된 데이터의 길이가 필요한 크기보다 부족하다.
    case IncorrectFormat(part : String) //입력된 데이터의 형식이 맞지 않습니다.
    case IncorrectData(part : String) //입력된 데이터의 값이 올바르지 않습니다.
}

//오류 던지기
/*함수나 메소드는 오류 객체를 외부로 던질 수 있다는 것을 알려주기 위해 정의구문을 작성할 때 throws
키워드를 추가한다. throws키워드는 반환 타입을 표시하는 화살표(->)보다 앞에 작성해야 하는데,
이는 오류를 던지면 값이 반환되지 않는다는 의미이기도 하다. 함수나 메소드 또는 익명 함수인 클로저까지
모두 throws키워드를 사용할 수 있지만, 명시적으로 throws 키워드를 추가하지 않으면 오류를 던질 수 없
다.
func canThrowErrors() throws -> String
func cannotThrowErrors() -> String

클로저를 이용하여 구문을 작성할 때도이와 비슷하게 반환 화살표 앞에 작성한다
{() throws -> String in
....
}*/

//날짜 분석 함수에서 오류 던지기
import Foundation

struct Date {
    var year : Int
    var month : Int
    var date : Int
}

func parseDate(param : NSString) throws -> Date {
    //입력된 문자열 길이가 10이 아닐 경우 분석이 불가능하므로 오류
    guard param.length == 10 else {
        if param.length > 10 {
            throw DateParsError.OverSizeString
        }else {
            throw DateParsError.UnderSizeString
        }
    }
    
    //반환할 객체 타입 선언
    var dateResult = Date(year: 0, month: 0, date: 0)
    
    //연도 정보 분석
    if let year = Int(param.substringWithRange(NSRange(location: 0, length: 4))) {
        dateResult.year = year
    }else {
        //연도 분석 오류
        throw  DateParsError.IncorrectFormat(part: "year")
    }
    
    //월 정보 분석
    if let month = Int(param.substringWithRange(NSRange(location: 5, length: 2))) {
      
        if month == 2{
            if let date = Int(param.substringWithRange(NSRange(location: 8, length: 2))) {
                //일에 대한 값이 1 ~ 28까지만 가능하므로 그 이외 범위는 잘못된 값으로 처리한다.
                guard date > 0 && date < 29 else {
                    print("2월 날짜 범위 초과")
                    throw DateParsError.IncorrectData(part: "Date")
                }
            }
        }

        
        //월에 대한 값은 1 ~ 12까지만 가능 하므로 그 이외의 범위는 잘못된 값으로 처리한다.
        guard month > 0 && month < 13 else {
            throw DateParsError.IncorrectData(part: "month")
        }
        dateResult.month = month
    }else{
        //월 분석 오류
        throw DateParsError.IncorrectFormat(part: "month")
    }
    
    if let date = Int(param.substringWithRange(NSRange(location: 8, length: 2))) {
        //일에 대한 값이 1 ~ 31까지만 가능하므로 그 이외 범위는 잘못된 값으로 처리한다.
        guard date > 0 && date < 32 else {
            throw DateParsError.IncorrectData(part: "Date")
        }
        dateResult.date = date
        
    }else {
        //일 분석 오류
        throw DateParsError.IncorrectFormat(part: "date")
    }
    
    
    
    return dateResult
}

//이렇게 정의된 함수나 메소드를 호출할 때는 try 키워드를 붙여야한다.
//try parseDate("2020-02-29")
//let date = try parseDate("2020-02-28")

//오류 객체 잡아내기
func getPartsDate(param: String, type : String) {
    do {
        let date = try parseDate(param)
        
        switch type {
        case "year" :
            print("\(date.year)년입니다.")
        case "month" :
            print("\(date.month)월입니다.")
        case "date" :
            print("\(date.date)일입니다.")
            
        default :
            print("입력값에 해당하는 날짜정보가 없습니다.")
        }
    }catch DateParsError.OverSizeString {
     print("입력된 문자열이 너무 깁니다. 줄여주세요")
    }catch DateParsError.UnderSizeString {
        print("입력된 문자열이 불충분합니다. 늘려주세요")
    }catch DateParsError.IncorrectFormat(let part){
        print("입력값의 \(part)에 해당하는 형식이 잘못되었습니다.")
    }catch DateParsError.IncorrectData(let part){
        print("입력값의 \(part)에 해당하는 값이 잘못사용되었습니다. 확인해주세요.")
    }catch {
        print("알 수 없는 오류가 발생하였습니다.")
    }
}

getPartsDate("2015-12-31", type: "year")
getPartsDate("2015-12-31", type: "month")
getPartsDate("2015-13-31", type: "month")
getPartsDate("2015-12-40", type: "date")

//필요에 의해 오류를 던지지 않게 하고 싶을때는 try!키워드를 사용한다
let date = try! parseDate("2015-09-31")
print("\(date)")
