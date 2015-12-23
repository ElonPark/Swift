//
//  ViewController.swift
//  HelloWorld
//
//  Created by Nebula_MAC on 2015. 11. 30..
//  Copyright © 2015년 Nebula_MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var uiTitle01: UILabel!
    @IBOutlet var uiTitle02: UILabel!
    @IBOutlet var uiTitle03: UILabel!
    @IBOutlet var uiTitle04: UILabel!
    @IBOutlet var uiTitle05: UILabel!

    
    
    @IBAction func clickBtn01(sender: AnyObject) {
        self.uiTitle01.text = "button01 clicked"
    }
    @IBAction func clickBtn02(sender : AnyObject) {
        self.uiTitle02.text = "button02 clicked"
    }
    @IBAction func clickBtn03(sender : AnyObject){
        self.uiTitle03.text = "button03 clickde"
        
    }
    @IBAction func clickBtn04(sender : AnyObject) {
        self.uiTitle04.text = "button04 clicked"
        
    }
    @IBAction func clickBtn05(sender: AnyObject) {
        self.uiTitle05.text = "button05 clicked"
    }
    
    
}

