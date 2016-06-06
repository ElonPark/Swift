//: Playground - noun: a place where people can play

import UIKit



func testRe(num: Int = random()
) -> String {
	print(num)
	
	var str2 = "hello"
	guard num % 2 == 0 else{
		str2 = "랜덤 넘버는 홀수 = \(num)"
		return str2
	}

	
	return str2
	
}

print(testRe())
