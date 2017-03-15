//
//  ViewController.swift
//  LottoDrawExample
//
//  Created by Nebula_MAC on 2017. 3. 11..
//  Copyright © 2017년 Nebula_Park. All rights reserved.
//

import UIKit
import FMDB

class ViewController: UIViewController, UITableViewDataSource {

	
	@IBOutlet weak var tableView: UITableView!
	
	var lottomNumber = [(number1: Int, number2: Int, number3: Int,number4: Int, number5: Int, number6: Int)]()
	
	var databasePath : String = ""
	
	func dataBaseInit() {
		let fileManager = FileManager.default
		let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		let docsDir = dirPaths[0]
		let dbPath : String = "\(docsDir)lotto.db"
		self.databasePath = dbPath
		
		guard !fileManager.fileExists(atPath: databasePath)  else {
			return
		}
		
		let db = FMDatabase(path: databasePath)
		
		db?.open()
		var sql_statament = "CREATE TABLE IF NOT EXISTS lotto(id integer primary key autoincrement, "
		sql_statament += "number1 INTEGER, number2 INTEGER, number3 INTEGER, "
		sql_statament += "number4 INTEGER, number5 INTEGER, number6 INTEGER)"
		
		db?.executeStatements(sql_statament)
		db?.close()
	}

	
	func makeLottoNumber() {
		lottomNumber = [(number1: Int, number2: Int, number3: Int,number4: Int, number5: Int, number6: Int)]()
		
		var originalNumber = Array(1...45)
		var index = 0
		
		for _ in 0...4 {
			originalNumber = Array(1...45)
			var columnArray = [Int]()
			
			for _ in 0...5 {
				let upper_bound = UInt32(originalNumber.count)
				index = Int(arc4random_uniform(upper_bound))
				columnArray.append(originalNumber[index])
				originalNumber.remove(at: index)
			}
			
			columnArray.sort()
			let column = (columnArray[0], columnArray[1], columnArray[2],
			              columnArray[3], columnArray[4], columnArray[5])
			
			lottomNumber.append(column)
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		dataBaseInit()
		makeLottoNumber()
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return lottomNumber.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "lottoCell", for: indexPath) as! LottoCell
		
		let row : Int = indexPath.row
		
		cell.number1.text = "\(lottomNumber[row].number1)"
		cell.number2.text = "\(lottomNumber[row].number2)"
		cell.number3.text = "\(lottomNumber[row].number3)"
		cell.number4.text = "\(lottomNumber[row].number4)"
		cell.number5.text = "\(lottomNumber[row].number5)"
		cell.number6.text = "\(lottomNumber[row].number6)"
		
		return cell
	}
	
	@IBAction func doDraw(_ sender: UIBarButtonItem) {
		makeLottoNumber()
		tableView.reloadData()
	}
	
	@IBAction func loadData(_ sender: UIBarButtonItem) {
		lottomNumber = [(number1: Int, number2: Int, number3: Int,number4: Int, number5: Int, number6: Int)]()
		
		let db = FMDatabase(path: databasePath)
		
		guard db?.open() != nil else {
			print("db open fail")
			return
		}
		
		let select = "SELECT number1, number2, number3, number4, number5, number6 FROM lotto"

		guard let result = db?.executeQuery(select, withArgumentsIn: nil) else {
			print("executeQuery Faile")
			return
		}
		
		while result.next() {
			var columnArray = [Int]()
			for i in 1...6 {
				let addElement = result.string(forColumn: "number\(i)")
				columnArray.append(Int(addElement!)!)
			}
			
			columnArray.sort()
			let column = (columnArray[0], columnArray[1], columnArray[2],
			              columnArray[3], columnArray[4], columnArray[5])
			
			lottomNumber.append(column)
		}
		tableView.reloadData()
	}
	
	@IBAction func saveData(_ sender: UIBarButtonItem) {
		let db = FMDatabase(path: databasePath)
		
		guard db?.open() != nil else {
			print("db open fail")
			return
		}
		print(lottomNumber)
		
		db?.executeUpdate("DELETE FROM lotto", withArgumentsIn: nil)
		if let error = db?.hadError() {
			print("DB init error = \(error)")
		}
		
		for number in lottomNumber {
			var insert = "INSERT INTO lotto(number1, number2, number3, number4, number5, number6)"
			insert += " values(\(number.number1), \(number.number2), \(number.number3),"
			insert += " \(number.number4), \(number.number5), \(number.number6))"
			print(insert)
			db?.executeUpdate(insert, withArgumentsIn: nil)
			
			if let error = db?.hadError() {
				print("DB save error = \(error)")
			}
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

