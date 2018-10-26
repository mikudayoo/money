//
//  keiyakushoViewController.swift
//  money
//
//  Created by 横尾美空 on 2018/09/22.
//  Copyright © 2018年 横尾美空. All rights reserved.
//

import UIKit

class keiyakushoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var yearLabel : UILabel!
    @IBOutlet var monthLabel : UILabel!
    @IBOutlet var dayLabel : UILabel!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var nameLabel2 : UILabel!
    @IBOutlet var enLabel : UILabel!
    @IBOutlet var whyLabel : UILabel!
    
    var userDefaults : UserDefaults = UserDefaults.standard
    var keiyakuArray: [Dictionary<String,String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if userDefaults.array(forKey: "KEIYAKU") != nil{
            keiyakuArray = userDefaults.array(forKey: "KEIYAKU") as! [Dictionary<String, String>]
           
            yearLabel.text = keiyakuArray[keiyakuArray.count - 1]["year"] as! String
            monthLabel.text = keiyakuArray[keiyakuArray.count - 1]["month"] as! String
            dayLabel.text = keiyakuArray[keiyakuArray.count - 1]["day"] as! String
            nameLabel.text = keiyakuArray[keiyakuArray.count - 1]["name"] as! String
            nameLabel2.text = keiyakuArray[keiyakuArray.count - 1]["name"] as! String
            enLabel.text = keiyakuArray[keiyakuArray.count - 1]["en"] as! String
            whyLabel.text = keiyakuArray[keiyakuArray.count - 1]["why"] as! String
    
        }
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // スクショするため
    @IBAction func photo(){
        let rect : CGRect = CGRect(x: 16, y: 110, width: 343, height: 546)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil,nil)
    }
    
    
    @IBAction func back (){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        print("ここだよー")
        print(keiyakuArray)
    }
    
    //
    //
  
    //
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
