//
//  ViewController.swift
//  GetLanguageExample
//
//  Created by Nebula_MAC on 2017. 3. 16..
//  Copyright © 2017년 Nebula_Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var preferLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		let language = Locale.preferredLanguages[0]
		let locale = Locale.current as NSLocale
		let local = locale.object(forKey: .countryCode)!
		preferLabel.text = "Language: \(language) Local: \(local)"
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

