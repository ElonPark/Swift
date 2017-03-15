//
//  ViewController.swift
//  interfaceBuilderExample
//
//  Created by Nebula_MAC on 2017. 3. 11..
//  Copyright © 2017년 Nebula_Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var helloLabel: UILabel!
	
	@IBOutlet weak var touchBtn: UIButton!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	@IBAction func touchTouchBtn(_ sender: UIButton) {
		let placeHolderText = "Hello iOS 10"
		if helloLabel.text == placeHolderText {
			helloLabel.text = "Me too"
		} else {
			helloLabel.text = placeHolderText
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

