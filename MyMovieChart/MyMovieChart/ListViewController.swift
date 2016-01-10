//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by Nebula_MAC on 2016. 1. 1..
//  Copyright © 2016년 Nebula_MAC. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    //테이블 뷰를 구성할 리스트 데이터를 담을 배열 변수( = [MovieVO]())
    var list = Array<MovieVO>()
    
    //현재까지 읽어온 데이터의 페이지 정보
    var page = 1
    
    @IBOutlet var movieTable: UITableView!
    @IBOutlet var moreBtn: UIButton!
    
    
    //============초기화면========
    override func viewDidLoad() {
        //영화차트 API를 호출한다.
        self.callMovieAPI()
    }
    
    //================더보기 버튼===========================
    @IBAction func more(sender: AnyObject) {
        //현재 페이지의 다음 페이지 정보를 요청해야 하므로 +1
        self.page++
        
        //영화차트 API를 호출한다.
        self.callMovieAPI()
        
        //데이터를 다시 읽어오도록 테이블 뷰를 갱신
        self.movieTable.reloadData()
    }

    
    //=============================세그웨이=====================================
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //실행된 세그웨이의 식별자가  segu_detail이라면
        if(segue.identifier == "segue_detail") {
            //sender 인자를 캐스팅하여  테이블 셀 객체로 변환한다.
            let cell = sender as! MovieCell
            
            //세그웨이를 실행한 객체 정보를 이용하여 몇 번째 행이 선택되었는지 확인한다.
            let path  = self.movieTable.indexPathForCell(cell)
            
            //API 영화 데이터 배열 중에서 선택된 행에 대한 데이터를 얻는다.
            let param = self.list[path!.row]
            
            //세그웨이가 향할 목적지 뷰 컨트롤러 객체를 읽어와 mvo 변수에 데이터를 연결해준다.
            (segue.destinationViewController as? DetailViewController)?.mvo = param
            
            /*==========위 코드를 축약하면 ===========
            //실행된 세그웨이의 식별자가 viewDetail이라면
            if(segue.identifier == "segue_detail") {
            
            //세그웨이를 실행한 sender 인자값을 이용하여 사용자가 클릭한 행 정보를 얻는다.
            let path  = self.movieTable.indexPathForCell(sender as! MovieCell)
            
            //행 정보를 이용하여 사용자가 선택한 영화 데이터를 찾은 다음, 목적지 뷰 컨트롤러 mvo에 연결해준다.
            (segue.destinationViewController as? DetailViewController)?.mvo = self.list[path!.row]
            
            }
            */
            
        }
    }
    
    
    
    //=================섬네일 이미지 처리하는 메소드==================
    func getThumbnailImage(index : Int) -> UIImage {
        //인자값으로 받은 인덱스를 기반으로 해당하는 배열 데이터를 읽어옴
        let mvo = self.list[index]
        
        //메모제이션 처리: 저장된 이미지가 있을 경우 반환하고, 없을 경우 내려받아 저장한 후 반환함
        if let savedImage = mvo.thumbnailImage{
            return savedImage
        }else {
            let url = NSURL(string: mvo.thumbnail!)
            let imageData = NSData(contentsOfURL: url!)
            
            //UIImage 객체를 생성하여 MovieVO객체에 우선 저장함
            mvo.thumbnailImage = UIImage(data: imageData!)
            
            //저장된 이미지를 반환
            return mvo.thumbnailImage!
        }
    }
    
    //==========================================호출 API======================================================
    func callMovieAPI() {
        //호핀API 호출을 위한 URI를 생성
        let apiURI = NSURL(string:"http://apis.skplanetx.com/hoppin/movies?order=releasedateasc&count=10&page=\(self.page)&genreId=&version=1&appKey=/* 발급 받은 키*/")
        

        
        /*   <정렬 방식 코드>
        - onsaledateasc : 최근 등록순
        - onsaledatedesc : 최근 등록 역순
        - titleasc : 제목의 오름차순 (가나다 순)
        - titledesc : 제목의 내림차순 (가나다 역순)
        - ratingasc : 평균 별점이 낮은 순
        - ratingdesc : 평균 별점이 높은 순
        - releasedateasc : 최근 개봉 순
        - releasedatedesc : 최근 개봉 역순
        
        * 개봉 일은 영화개봉 날짜, 최근 등록순은 hoppin 서비스에 등록된 날짜*/
        
        //REST API를 호출
        let apidata : NSData? = NSData(contentsOfURL: apiURI!)
        
        //데이터 전송 결과를 로그로 출력(확인용)
        // NSLog("\n <more> API Result = %@", NSString(data: apidata!, encoding: NSUTF8StringEncoding)!)
        
        //JSON 객체를 파싱하여 NSDictionary 객체로 받음
        do{
            let apiDictionary = try NSJSONSerialization.JSONObjectWithData(apidata!, options: []) as! NSDictionary
            
            //데이터 구조에 따라 차례대로 캐스팅하며 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            
            //테이블 뷰 리스트를 구성할 데이터 형식
            var mvo : MovieVO
            
            // Iterator 처리를 하면서 API 데이터를 MovieVO객체에 저장한다.
            for row in movie{
                mvo = MovieVO()
                
                mvo.title       = row["title"] as? String
                mvo.description = row["genreNames"] as? String
                mvo.thumbnail   = row["thumbnailImage"] as? String
                mvo.detail      = row["linkUrl"] as? String
                mvo.rating      = (row["ratingAverage"] as? NSString)!.floatValue
                
                //개봉일이 없어서 개봉일 대신 별점 참여자수를 표기함
                mvo.opendate      = row["participant"] as? String

                self.list.append(mvo)
                
            }
            
            
            //전체 데이터 카운트를 얻는다.
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
            
            //totalCount가 읽어온 데이터 크기와 같거나 클 경우 더보기 버튼을 막는다.
            if(self.list.count >= totalCount) {
                self.moreBtn.hidden = true
            }
            
        } catch{
            NSLog("Parse Error!!")
        }
        
    }
    
    
    //=======================================테이블 뷰 구성=====================================================
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //테이블 뷰 행의 개수를 반환하는 메소드를 재정의한다.
        return self.list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //주어진 행에 맞는 데이터 소스를 가져옴
        let row = self.list[indexPath.row]
        
        // NSLog("result = \(row.title!), row index = \(indexPath.row)")
        
        /*여기서부터 변경 내용 시작*/
        //as! UITableViewCell => as! MovieCell로 캐스팅 타입 변경
        let cell = tableView.dequeueReusableCellWithIdentifier("ListCell") as! MovieCell!
        
        
        //데이터 소스에 저장된 값을 각 레이블 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = "\(row.opendate!)명 참여"
        cell.rating?.text = "\(row.rating!)점" //실수형 값을 문자열로 변환
        /*여기까지 변경 내용 끝*/
        
        //비동기 방식으로 섬네일 이미지를 읽어옴
        dispatch_async(dispatch_get_main_queue(),
            {
                cell.thumbanil.image = self.getThumbnailImage(indexPath.row)
                //NSLog("섬네일 이미지 읽어옴")
        })
        //구성된 셀을 반환함
        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //NSLog("Touch Table Row at %d", indexPath.row)
    }
}

















