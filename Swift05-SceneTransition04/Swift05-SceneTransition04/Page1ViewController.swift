//
//  Page1ViewController.swift
//  Swift05-SceneTransition04
//
//  Created by Nebula_MAC on 2015. 12. 25..
//  Copyright © 2015년 Nebula_MAC. All rights reserved.
//

import UIKit

class Page1ViewController : UIViewController {
    @IBAction func unwindToPage1(sender : UIStoryboardSegue){
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //NSLog("PrepareForSegue: sender : 메소드가 호출됩니다.")
        //NSLog("Segue Identifier : %@", segue.identifier!)
        
        if(segue.identifier == "segueForPage2"){
            NSLog("Show 타입의 세그가 실행됩니다.")
            //Show 타입의 세그웨이가 실행될 때 처리해야 할 내용을 여기에 작성
        }else if(segue.identifier == "customSegueForPage2"){
            NSLog("커스텀 타입의 세그가 실행됩니다.")
            //커스텀 타입의 세그웨이가 실행될 때 처리해야 할 내용을 여기에 작성
        }else{
            NSLog("알수없는 세그가 실행됩니다.")
            //기타 세그가 실행될 때 처리해야 할 내용을 여기에 작성
        }
    }
}
