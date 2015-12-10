//
//  FirstViewController.swift
//  TestTabPj
//
//  Created by n.katou on 2015/12/01.
//  Copyright © 2015年 n.katou. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var fbLabel: UILabel!
    @IBOutlet weak var fbSubLabel: UILabel!
    @IBOutlet weak var fbTxtField: UITextField!
    @IBOutlet weak var scrView: UIScrollView!
    
    let subLabelDefault: String = "Loaded by Facebook tab"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fbLabel.text = "Facebook"
        fbSubLabel.text = subLabelDefault
        
        //AutoresizingMaskをオフにする
        scrView.translatesAutoresizingMaskIntoConstraints = false
        fbTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        scrView.delegate = self
        fbTxtField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 画面が表示される直前の処理
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        
        notificationCenter.addObserver(self, selector: "handleKeyboardWillShowNotification:", name: UIKeyboardWillShowNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: "handleKeyboardWillHideNotification:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    // 画面が表示された直後の処理
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        
        notificationCenter.removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        
        notificationCenter.removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    // fbTextFieldが編集された直後に呼ばれるデリゲードメソッド
    func textFieldDidBeginEditing(textField: UITextField) {
        fbSubLabel.text = textField.text
        
    }
    
    // テキストフィールド編集開始時の処理
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        if(fbTxtField.text != ""){
            fbSubLabel.text = textField.text
        } else {
            fbSubLabel.text = subLabelDefault
        }
        
        return true
    }
    
    // テキスト編集終了時の処理
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("ShouldReturn")
        // Enterでキーボードを閉じる
        fbTxtField.resignFirstResponder()
        
        return true
    }

    // キーボードが出てきた時の処理
    func handleKeyboardWillShowNotification(notification: NSNotification){
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        
        let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
        let txtLimit = fbTxtField.frame.origin.y + fbTxtField.frame.height + 8.0
        let kbdLimit = myBoundSize.height - keyboardScreenEndFrame.size.height
        
        if txtLimit >= kbdLimit {
            scrView.contentOffset.y = txtLimit - kbdLimit
        }
        
    }
    
    // キーボードが引っ込む時の処理
    func handleKeyboardWillHideNotification(notification: NSNotification){
        scrView.contentOffset.y = 0
    }
    
    
}

