//
//  nyuryokuViewController.swift
//  money
//
//  Created by 横尾美空 on 2018/09/22.
//  Copyright © 2018年 横尾美空. All rights reserved.
//

import UIKit

class nyuryokuViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var yearTextField: UITextField!
    @IBOutlet var monthTextField: UITextField!
    @IBOutlet var dayTextField : UITextField!
    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var enTextField : UITextField!
    @IBOutlet var whyTextField : UITextField!
    @IBOutlet var scrollView : UIScrollView!
    
    var doneNumber : String!
//    var doneNumber2 : Int = 0
    var saveData : UserDefaults = UserDefaults.standard
//    var saveData2 : UserDefaults = UserDefaults.standard
    var keiyakuArray: [Dictionary<String, String>] = []
    var selectedTextField :UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

         self.selectedTextField = self.yearTextField
        self.yearTextField.delegate = self
        self.monthTextField.delegate = self
        self.dayTextField.delegate = self
        self.nameTextField.delegate = self
        self.enTextField.delegate = self
        self.whyTextField.delegate = self
//delegateはmainstorybordで繋いである

        
        if saveData.array(forKey: "KEIYAKU") != nil{
            keiyakuArray = saveData.array(forKey: "KEIYAKU") as! [Dictionary<String, String>]}
        //keiyakuArray = saveData.object (forKey: "KEIYAKU") as! [Dictionary<String, String>]
        // Do any additional setup after loading the view.
    }
    
    override  func  viewWillAppear(_ animated:Bool){
        super.viewWillAppear(animated)
        
        // キーボードイベントの監視開始
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeShown(notification:)),
                                               name:UIResponder.keyboardWillShowNotification,//サイトと違うところ
            object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden(notification:)),
                                               name:UIResponder.keyboardWillHideNotification,//サイトと違うところ
            object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name:UIResponder.keyboardWillShowNotification,//サイトと違うところ
            object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,//サイトと違うところ
            object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyboardWillBeShown(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue, let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue {
                //↑サイトと違うところ
                restoreScrollViewSize()
                
                let convertedKeyboardFrame = scrollView.convert(keyboardFrame, from: nil)
                // 現在選択中のTextFieldの下部Y座標とキーボードの高さから、スクロール量を決定
                let offsetY: CGFloat = self.selectedTextField!.frame.maxY - convertedKeyboardFrame.minY
                if offsetY < 0 { return }
                updateScrollViewSize(moveSize: offsetY, duration: animationDuration)
            }
        }
    }
    
    @objc func keyboardWillBeHidden(notification: NSNotification) {
        restoreScrollViewSize()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // 選択されているTextFieldを更新
        self.selectedTextField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    func updateScrollViewSize(moveSize: CGFloat, duration: TimeInterval) {
        UIView.beginAnimations("ResizeForKeyboard", context: nil)
        UIView.setAnimationDuration(duration)
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: moveSize, right: 0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.scrollView.contentOffset = CGPoint(x: 0, y: moveSize)
        
        UIView.commitAnimations()
    }
    
    func restoreScrollViewSize() {
        // キーボードが閉じられた時に、スクロールした分を戻す
        self.scrollView.contentInset = UIEdgeInsets.zero
        self.scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    @IBAction func done (){
//     performSegue(withIdentifier: "toKeiyakushoView", sender: nil)
        let keiyakuDictionary = ["day": dayTextField.text!,
                                 "month": monthTextField.text!,
                                 "year": yearTextField.text!,
                                 "name": nameTextField.text!,
                                 "en": enTextField.text!,
                                 "why": whyTextField.text!,
                                 "number": "0"
                                ]
        
        keiyakuArray.append(keiyakuDictionary)
        
        saveData.set(keiyakuArray, forKey: "KEIYAKU")
//        saveData2.set(doneNumber,forKey:"number")
        
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        nameTextField.text = ""
        enTextField.text = ""
        whyTextField.text = ""
    }
    
    

//selfをデリゲートにしているので、ここにデリゲートメソッドを書くらしい
    
    @IBAction func back (){
        self.dismiss(animated: true, completion: nil)
    }
    
}
