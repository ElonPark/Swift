//
//  ResultViewController.swift
//  Swift05-ValueDelivery01
//
//  Created by Nebula_MAC on 2015. 12. 27..
//  Copyright © 2015년 Nebula_MAC. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //email 값을 받을 변수
    var paramEamil : String = ""
    //Update 값을 받을 변수
    var paramUpdate : Bool = false
    //Interval 값을 받을 변수
    var paramInterval : Double = 0
    
    @IBOutlet var resultEamil: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    override func viewDidLoad() {
        self.resultEamil.text = paramEamil
        self.resultUpdate.text = (self.paramUpdate == true ? "자동걩신" : "자동갱신 안함") //? 삼항연산자 사용
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }
    
    @IBAction func onBack(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
