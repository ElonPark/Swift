//
//  SecondViewController.swift
//  Swift05-SceneTransition02
//
//  Created by Nebula_MAC on 2015. 12. 23..
//  Copyright © 2015년 Nebula_MAC. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func dismiss(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func pop(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}