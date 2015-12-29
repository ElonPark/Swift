//
//  ViewController.swift
//  Swift05-ValueDelivery01
//
//  Created by Nebula_MAC on 2015. 12. 26..
//  Copyright © 2015년 Nebula_MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var IblUpdate: UILabel!
    @IBOutlet var IblInterval: UILabel!
    @IBOutlet var paramEmail: UITextField!
    @IBOutlet var paramUpdate: UISwitch!
    @IBOutlet var paramInterval: UIStepper!
    
    
    //스위치가 바뀔 때마다 화면에 값을 텍스트로 출력
    @IBAction func onStepper(sender: AnyObject) {
        
        let intervalStepper = sender as! UIStepper
        IblInterval.text = "\(Int(intervalStepper.value))분마다"
        
    }
    //스태퍼의 값이 변경될 때마다 화면에 값을 텍스트로 출력
    @IBAction func onSwitch(sender: AnyObject) {
        let updateSwitch = sender as! UISwitch
        
        if (updateSwitch.on == true){
            IblUpdate.text = "갱신함"
        }else{
            IblUpdate.text = "갱신하지 않음"
        }//end if
    }
    
    @IBAction func onSubmit(sender: AnyObject) {
        if let rvc = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as? ResultViewController {
            
            //이메일 입력값 대입 (String)
            rvc.paramEamil = self.paramEmail.text!
            
            //자동갱신 여부값 대입(Bool)
            rvc.paramUpdate = self.paramUpdate.on
            
            //갱신주기 값 대입(Double)
            rvc.paramInterval = self.paramInterval.value
            
            //화면 이동
            //self.presentViewController(rvc, animated: true, completion:nil)
            self.navigationController?.pushViewController(rvc, animated: true)
        }
    }
    
    
    @IBAction func onPerformSegue(sender: AnyObject) {
        //세그를 실행한다.
        performSegueWithIdentifier("ManualSubmit", sender : self)
    }
    
    //세그가 실행되기 전 준비하는 메소드
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //세그로 변경하여 다운캐스팅
        if let rvc = segue.destinationViewController as? ResultViewController {
            //이메일 입력값 대입 (String)
            rvc.paramEamil = self.paramEmail.text!
            
            //자동갱신 여부값 대입(Bool)
            rvc.paramUpdate = self.paramUpdate.on
            
            //갱신주기 값 대입(Double)
            rvc.paramInterval = self.paramInterval.value
        }
    }
}

