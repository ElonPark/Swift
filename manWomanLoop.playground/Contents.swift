//: Playground - noun: a place where people can play

import UIKit

//남자들이 절대 빠져나오기 힘든 무한 루프

var man : String = ""
var woman : String = ""

var anger : Bool = true

var action : Int = random() % 10


print("시작")
man = "미안해"
print("남자: \(man)")
//let delay = 0.3 * Double(NSEC_PER_SEC)
//let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))

while(anger) {
	let stop = random() % 10
	//dispatch_after(time, dispatch_get_main_queue()) {
	action = random() % 2
	
	if man == "미안해" {
		woman = "뭐가 미안한데?"
		print("여자: \(woman)")
	}
	
	if woman == "뭐가 미안한데?" {
		if action == 0 {
			man = "몰라"
		} else {
			man = "알아"
		}
		print("남자: \(man)")
	}
	if man == "몰라" {
		woman = "모르면서 미안해?"
	} else {
		woman = "알면서 그래?"
	}
	print("여자: \(woman)")
	if woman == "알면서 그래?" || woman == "모르면서 미안해?" {
		action = random() % 2;
		if action == 0 {
			man = "잘못했어"
		} else {
			man = "미안해"
		}
		print("남자: \(man)")
	}
	
	if man == "잘못했어" {
		woman = "뭘 잘못했는데 ??"
		print("여자: \(woman)")
	}
	
	if woman == "뭘 잘못했는데 ??" {
		action = random() % 2;
		if action == 0 {
			man = "몰라"
		} else {
			man = "알아"
		}
		print("남자: \(man)")
	}
	if action == stop && man == "미안해"{
		anger = false
	}
	//}
}
