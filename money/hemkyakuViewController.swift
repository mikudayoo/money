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
    var doneNumber : String!
    var selectedInfo : Int!
    
    var userDefaults : UserDefaults = UserDefaults.standard
    var keiyakuArray : [Dictionary<String,String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
        if userDefaults.array(forKey: "KEIYAKU") != nil{
            keiyakuArray = userDefaults.array(forKey: "KEIYAKU") as! [Dictionary<String, String>]
            
//            yearLabel.text = keiyakuArray[selectedInfo - 1]["year"] as! String
//            monthLabel.text = keiyakuArray[selectedInfo - 1]["month"] as! String
//            dayLabel.text = keiyakuArray[selectedInfo - 1]["day"] as! String
//            nameLabel.text = keiyakuArray[selectedInfo - 1]["name"] as! String
//            nameLabel2.text = keiyakuArray[selectedInfo - 1]["name"] as! String
//            enLabel.text = keiyakuArray[selectedInfo - 1]["en"] as! String
//            whyLabel.text = keiyakuArray[selectedInfo - 1]["why"] as! String
//            doneNumber = keiyakuArray[selectedInfo - 1]["done"] as! String
            
            yearLabel.text = keiyakuArray[selectedInfo - 1]["year"] as! String
            monthLabel.text = keiyakuArray[selectedInfo - 1]["month"] as! String
            dayLabel.text = keiyakuArray[selectedInfo - 1]["day"] as! String
            nameLabel.text = keiyakuArray[selectedInfo - 1]["name"] as! String
            nameLabel2.text = keiyakuArray[selectedInfo - 1]["name"] as! String
            enLabel.text = keiyakuArray[selectedInfo - 1]["en"] as! String
            whyLabel.text = keiyakuArray[selectedInfo - 1]["why"] as! String
//            doneNumber = keiyakuArray[selectedInfo - 1]["done"] as! String
            
            print(keiyakuArray)
           
            if doneNumber == String("zero"){
                sumiImageView.isHidden = true
            }else if doneNumber == String("ichi"){
                sumiImageView.isHidden = false
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func photo(){
        let rect : CGRect = CGRect(x: 16, y: 110, width: 343, height: 546)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil,nil)
    }
    @IBAction func back (){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func henkyaku(){
        sumiImageView.isHidden = false
        doneNumber = String("ichi")
//        userDefaults.removeObject(forKey:"done")
        userDefaults.set(doneNumber , forKey:"done")
        myButton.isHidden = true
        myButton.tintColor = UIColor.clear
        
    }

}

