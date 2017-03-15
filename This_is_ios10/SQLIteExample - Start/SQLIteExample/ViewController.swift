//
//  ViewController.swift
//  SQLIteExample
//
//  Created by Scott Lee on 2016. 10. 4..
//  Copyright © 2016년 Studio G.B.U. All rights reserved.
//

import UIKit
import FMDB

class ViewController: UIViewController {

    @IBOutlet weak var memo: UITextField!
	
	var databasePath : String = ""
	
	func dataBaseInit() {

		let fileManager = FileManager.default
		let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		let docsDir = dirPaths[0]
		let dbPath : String = "\(docsDir)test.db"
		self.databasePath = dbPath
		
		guard !fileManager.fileExists(atPath: databasePath)  else {
			return
		}
		
		let db = FMDatabase(path: databasePath)
		
		db?.open()
		let sql_statament = "CREATE TABLE IF NOT EXISTS test(id integer primary key autoincrement, memo text)"
		db?.executeStatements(sql_statament)
		db?.close()
	}
	
	@IBAction func saveMemo(_ sender: UIButton) {
		let db = FMDatabase(path: self.databasePath)
		
		db?.open()
		let insert = "INSERT INTO test(memo) VALUES('\(memo.text!)')"
		db?.executeStatements(insert)
		
		if let error = db?.hadError() {
			print("insert error \(error)")
		}
	}
	
	@IBAction func loadMemo(_ sender: UIButton) {
		let db = FMDatabase(path: self.databasePath)
		
		db?.open()
		let select = "SELECT memo FROM test ORDER BY ID DESC LIMIT 1"
		let result : FMResultSet? = db?.executeQuery(select, withArgumentsIn: nil)
		
		if result != nil {
			while  result!.next() {
    memo.text = result!.string(forColumn: "memo")
			}
		} else {
			print("불러오기 에러")
		}
		
		
		if let error = db?.hadError() {
			print("select error \(error)")
		}

	}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		dataBaseInit()
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

