//
//  ViewController.swift
//  DelegatePractice
//
//  Created by Nebula_MAC on 2015. 12. 30..
//  Copyright © 2015년 Nebula_MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate{
    
    @IBOutlet var selectedResult: UILabel!
    
    @IBAction func didAlert(sender: AnyObject) {
        /*
        //알림창 인스턴스를 생성한다.
        let alert = UIAlertView(title: "선택", message: "항목을 선택해 주세요", delegate: self, cancelButtonTitle: "취소", otherButtonTitles: "선택 A", "선택 B", "선택 C")
        //기본 스타일
        alert.alertViewStyle = UIAlertViewStyle.Default
        
        //입력 폼이 있는 스타일
        // alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        
        
        /*
        //로그인 입력폼 스타일
        let alert = UIAlertView(title: nil, message: "로그인 입력 폼", delegate: self, cancelButtonTitle: "Login")
        alert.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
        
        */
        
        /*
        //보안 입력폼 스타일
        let alert = UIAlertView(title: nil, message: "보안 입력 폼", delegate: self, cancelButtonTitle: "확인")
        alert.alertViewStyle = UIAlertViewStyle.SecureTextInput
        */
        
        //알림창을 표시한다.
        alert.show()
        */
        /*
        //메시지 알림창 구현 - UIAlertController
        //알림 컨트롤러 인스턴스를 생성한다.
        //let alert = UIAlertController(title: "알림", message: "UIAlertController 샘플 알림창입니다", preferredStyle: UIAlertControllerStyle.Alert)
        
        //ActionSheet 축약되지 않은 형태
        //let alert = UIAlertController(title: "알림", message: "UIAlertController 샘플 알림창입니다", preferredStyle: UIAlertControllerStyle.ActionSheet)
        //축약형태
        let alert = UIAlertController(title: "알림", message: "UIAlertController 샘플 알림창입니다", preferredStyle: .ActionSheet)
        
        
        //코드를 분리하여 작성하면
        let alert = UIAlertController()
        alert.title = "알림"
        alert.message = "UIAlertController 샘플 알림창입니다"
        //preferredStyle은 get-only속성으로 위와 같이 속성에 값을 직접할당할 수는 없고 오로지 생성자 인자값으로만 설정 가능하다. 기본값은 .ActionSheet이다.
        */
        let alert = UIAlertController(title: "알림", message: "UIAlertController 샘플 알림창입니다", preferredStyle: .Alert)
        
        //입력필드 추가
        alert.addTextFieldWithConfigurationHandler({
            (textfield : UITextField) in
            textfield.placeholder = "이름"
        })
        
        alert.addTextFieldWithConfigurationHandler({
            (textfield : UITextField) in
            textfield.placeholder = "비밀번호"
            textfield.secureTextEntry = true
        })
        
        
        //알림 컨트롤러에 들어갈 버튼 액션 객체를 생성한다.
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.Cancel, handler:
            {
                (_) in self.selectedResult.text = "취소 버튼이 눌림"
        })
        
        let destructiveAction = UIAlertAction(title: "Destructive", style: UIAlertActionStyle.Destructive, handler:
            {
                (_) in self.selectedResult.text = "Destructive 버튼이 눌림"
        })
        
        let defaultAction = UIAlertAction(title: "확인", style: .Default, handler:
            {
                (_) in //self.selectedResult.text = "Default 버튼이 눌림"
                
                //입력필드 값 가져옴
                let name = alert.textFields?[0].text
                let passwd = alert.textFields?[1].text
                
                if name != nil && passwd ==  "xx"
                {
                    self.selectedResult.text = "\(name!)님이 로그인 하였습니다."
                }
        })
        
        //알림 컨트롤러에 버튼 액션을 추가한다.
        alert.addAction(destructiveAction)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        
        //알림 컨트롤러에 버튼액션을 추가한다.
        self.presentViewController(alert, animated: false, completion: {(_) in})
        
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex {
        case alertView.cancelButtonIndex :
            self.selectedResult.text = "취소 버튼이 선택 되었습니다."
        case 1 :
            self.selectedResult.text = "선택 A 버튼이 선택 되었습니다."
        case 2 :
            self.selectedResult.text = "선택 B 버튼이 선택 되었습니다."
        case 3 :
            self.selectedResult.text = "선택 C 버튼이 선택 되었습니다."
            /*
            case 1:
            //입력폼 스타일
            //UIAlertView의 0번째 입력필드 데이터를 가져온다.
            //let data = alertView.textFieldAtIndex(0)?.text
            
            //로그인일때
            case 1:
            //로그인 아이디 필드 데이터를 읽어온다.
            let loginId = alertView.textFieldAtIndex(0)?.text
            //로그인 패스워드 필드 데이터를 읽어온다.
            let loginPw = alertView.textFieldAtIndex(1)?.text
            */
            
            
        default :
            self.selectedResult.text = "지정되지 않은 버튼이 선택 되었습니다."
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

