//
//  MainViewController.swift
//  Swift05-SceneTransition03
//
//  Created by Nebula_MAC on 2015. 12. 25..
//  Copyright © 2015년 Nebula_MAC. All rights reserved.
//

import UIKit

class MainViewController : UIViewController {
    
    @IBAction func wind(sender: AnyObject) {
        //세그웨이를 실행한다.
        performSegueWithIdentifier("ManualWind", sender: self)
    }
    
    //Unwind
    @IBAction func unwindToMainViewController(segue : UIStoryboardSegue){
        
    }
}
