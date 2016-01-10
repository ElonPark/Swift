//
//  TheaterListController.swift
//  MyMovieChart
//
//  Created by Nebula_MAC on 2016. 1. 7..
//  Copyright © 2016년 Nebula_MAC. All rights reserved.
//

import UIKit

class TheaterListController : UITableViewController {
 
    @IBOutlet var theaterTable: UITableView!
    
    //API를 통해 불러온 데이터를 저장할 배열 변수
    var list = [NSDictionary]()
    
    //읽어올 데이터의 시작위치
    var startPoint = 0
    
    //======초기화면=============
    override func viewDidLoad() {
        self.callTheaterAPI()
        
    }//viewDidLoad end
    
    //=================더보기 버튼=================
    @IBAction func moreTheater(sender: AnyObject) {
        
        //영화관 API 호출
        self.callTheaterAPI()
        
        //데이터를 다시 읽어오도록 테이블 뷰를 갱신
        self.theaterTable.reloadData()
        
    }//moreTheater end
    
    
    //=============================세그웨이=====================================
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //실행된 세그웨이의 식별자가  segu_detail이라면
        if(segue.identifier == "segue_map") {
            //sender 인자를 캐스팅하여  테이블 셀 객체로 변환한다.
            let cell = sender as! TheaterCell
            
            //세그웨이를 실행한 객체 정보를 이용하여 몇 번째 행이 선택되었는지 확인한다.
            let path  = self.theaterTable.indexPathForCell(cell)
            
            //API 영화 데이터 배열 중에서 선택된 행에 대한 데이터를 얻는다.
            let data = self.list[path!.row]
            
            //세그웨이가 향할 목적지 뷰 컨트롤러 객체를 읽어와 mvo 변수에 데이터를 연결해준다.
            (segue.destinationViewController as? TheaterViewController)?.param = data
            
        }
    }//prepareForSegue end
    
    
    //=============================영화관  API====================--
    func callTheaterAPI() {
        
        // 1. URL 및 인자값을 위한 변수를 선언
        let apiURL = "http://api.data.go.kr/openapi/2b429635-443e-4edf-a15e-5c77f932d412" //API 요청 주소
        
        //API 인증키
        let serviceKey = /* 발급 받은 키*/        
        //불러올 데이터 갯수
        let sList = 20
        
        //데이터 형식
        let type = "json"
        
        // 2. 인자값들을 요청 URL로 구성하여 NSURL 객체를 생성한다.
        let urlObj = NSURL(string: "\(apiURL)?serviceKey=\(serviceKey)&s_page=\(self.startPoint)&s_list=\(sList)&type=\(type)")
        // print("\(apiURL)?serviceKey=\(serviceKey)&s_page=\(self.startPoint)&s_list=\(sList)&type=\(type)")
        
        do{
            // 3. NSString 객체를 이용하여 API를 호출하고 그 결과값을 인코딩된 문자열로 받아온다.
            let stringdata = try NSString(contentsOfURL: urlObj!, encoding: 0x80000422)
            
            // 4. 문자열로 받은 데이터를 UTF-8로 인코딩처리한 NSData로 변환한다.
            let encdata = stringdata.dataUsingEncoding(NSUTF8StringEncoding)
            
            do{
                // 5. NSData 객체를 파싱하여 NSArray 객체로 변환한다.
                let apiArray = try NSJSONSerialization.JSONObjectWithData(encdata!, options: []) as? NSArray
                
                // 6. 읽어온 데이터를 순회하면서 self.list 배열에 추가한다.
                for obj in apiArray! {
                    
                    self.list.append(obj as! NSDictionary)
                }
            }catch { //데이터를 파싱하지 못했을 경우
                //경고창 형식으로 오류 메시지를 표시해준다.
                let alert = UIAlertController(title: "실패", message: "데이터 분석이 실패하였습니다.", preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "확인", style: .Cancel, handler: nil)
                
                alert.addAction(cancelAction)
                
                self.presentViewController(alert, animated: false, completion: nil)
                
            }//try ~ catch end
            
            // 7. 읽어와야 할 다음 페이지의 데이터 시작 위치를 구해 저장해둔다.
            self.startPoint += sList
            
        } catch { //데이터를 읽어오지 못했을 경우
            //경고창 형식으로 오류 메시지를 표시해준다.
            let alert = UIAlertController(title: "실패", message: "데이터 분석이 실패하였습니다.", preferredStyle: .Alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .Cancel, handler: nil))
            
            self.presentViewController(alert, animated: false, completion: nil)
            
        }//try ~ catch end
    }//callTheaterAPI end
    
    //=======================================테이블 뷰 구성=====================================================
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //테이블 뷰 행의 개수를 반환하는 메소드를 재정의한다.
        return self.list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //self.list 배열에서 행에 맞는 데이터를 꺼냄
        let obj = self.list[indexPath.row]
        
        //재사용 큐로부터 tCell 식별자에 맞는 셀 객체를 전달 받음
        let cell = tableView.dequeueReusableCellWithIdentifier("tCell") as! TheaterCell!
        
        
        //데이터 소스에 저장된 값을 각 레이블 변수에 할당
        cell.name?.text = obj["상영관명"] as? String
        cell.tel?.text = obj["연락처"] as? String
        cell.addr?.text = obj["소재지도로명주소"] as? String
        
        //구성된 셀을 반환함
        return cell
    }

    
}//TheaterListController end
