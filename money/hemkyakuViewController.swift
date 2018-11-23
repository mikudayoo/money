//
//  ViewController.swift
//  money
//
//  Created by 横尾美空 on 2018/09/22.
//  Copyright © 2018年 横尾美空. All rights reserved.
//

import UIKit

class hemkyakuViewController: UIViewController {
    @IBOutlet var yearLabel : UILabel!
    @IBOutlet var monthLabel : UILabel!
    @IBOutlet var dayLabel : UILabel!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var nameLabel2 : UILabel!
    @IBOutlet var enLabel : UILabel!
    @IBOutlet var whyLabel : UILabel!
    @IBOutlet var myButton : UIButton!
    @IBOutlet var sumiImageView : UIImageView!
    @IBOutlet var enImageView : UIImageView!
    var doneNumber : String!
//    var doneNumber2 : Int!
    var selectedInfo : Int!
    var saveData : UserDefaults = UserDefaults.standard
//    var saveData2 : UserDefaults = UserDefaults.standard
//    var saveData3 : UserDefaults = UserDefaults.standard
    var keiyakuArray : [Dictionary<String,String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
        if saveData.array(forKey: "KEIYAKU") != nil{
            keiyakuArray = saveData.array(forKey: "KEIYAKU") as! [Dictionary<String, String>]
//            if saveData2.array(forKey: "number") != nil{
//                doneNumber = saveData2.array(forKey: "number") as! Int
//            }
//            if saveData3.array(forKey: "number2") != nil{
//                doneNumber2 = saveData2.array(forKey: "number2") as! Int
//            }
            
//            yearLabel.text = keiyakuArray[selectedInfo - 1]["year"] as! String
//            monthLabel.text = keiyakuArray[selectedInfo - 1]["month"] as! String
//            dayLabel.text = keiyakuArray[selectedInfo - 1]["day"] as! String
//            nameLabel.text = keiyakuArray[selectedInfo - 1]["name"] as! String
//            nameLabel2.text = keiyakuArray[selectedInfo - 1]["name"] as! String
//            enLabel.text = keiyakuArray[selectedInfo - 1]["en"] as! String
//            whyLabel.text = keiyakuArray[selectedInfo - 1]["why"] as! String
//            doneNumber = keiyakuArray[selectedInfo - 1]["done"] as! String
            
            yearLabel.text = keiyakuArray[selectedInfo]["year"] as! String
            monthLabel.text = keiyakuArray[selectedInfo]["month"] as! String
            dayLabel.text = keiyakuArray[selectedInfo]["day"] as! String
            nameLabel.text = keiyakuArray[selectedInfo]["name"] as! String
            nameLabel2.text = keiyakuArray[selectedInfo]["name"] as! String
            enLabel.text = keiyakuArray[selectedInfo]["en"] as! String
            whyLabel.text = keiyakuArray[selectedInfo]["why"] as! String
            doneNumber = keiyakuArray[selectedInfo]["number"] as! String
            
//            doneNumber2 = 0
//            doneNumber = saveData2.object(forKey:"number") as! Int
//            doneNumber2 = saveData3.object(forKey:"number2") as! Int
            print(keiyakuArray)
            print("test")
           
            sumiImageView.isHidden = true
            
            if doneNumber == "0"{
                sumiImageView.isHidden = true
                enImageView.isHidden = false
            }else if doneNumber == "1"{
                sumiImageView.isHidden = false
                enImageView.isHidden = true
                myButton.isHidden = true
                myButton.tintColor = UIColor.clear
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func photo(){
        let rect : CGRect = CGRect(x: 170, y: 16, width: 343, height: 546)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil,nil)
    }
    @IBAction func back (){
        self.dismiss(animated: true, completion: nil)
        print(doneNumber)
    }
    
    @IBAction func henkyaku(){
        sumiImageView.isHidden = false
        enImageView.isHidden = true
        doneNumber = "1"
//        keiyakuArray[selectedInfo]["number"] = "1"
        keiyakuArray[selectedInfo].updateValue("1", forKey: "number")
//        doneNumber2 = 1
//        saveData2.set(doneNumber,forKey: "number")
//        saveData3.set(doneNumber2,forKey:"number2")
        print(doneNumber)
        print(keiyakuArray)
//        print(doneNumber2)
        myButton.isHidden = true
        myButton.tintColor = UIColor.clear
        
//        userDefaults.set(doneNumber , forKey:"done")
//        userDefaults.set(keiyakuArray, forKey: "KEIYAKU")
//        userDefaults.removeObject(forKey:"done")
    }
}

