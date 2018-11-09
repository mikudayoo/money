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
    var doneNumber : String = "zero"
    var saveData : UserDefaults = UserDefaults.standard
//    var saveData2 : UserDefaults = UserDefaults.standard
    
    var keiyakuArray: [Dictionary<String, String>] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        
        yearTextField.delegate = self
        monthTextField.delegate = self
        dayTextField.delegate = self
        nameTextField.delegate = self
        enTextField.delegate = self
        whyTextField.delegate = self
//delegateはmainstorybordで繋いである

        keiyakuArray = saveData.array(forKey: "KEIYAKU") as! [Dictionary<String, String>]
        //keiyakuArray = saveData.object (forKey: "KEIYAKU") as! [Dictionary<String, String>]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done (){
//        performSegue(withIdentifier: "toKeiyakushoView", sender: nil)
        let keiyakuDictionary = ["day": dayTextField.text!,
                                 "month": monthTextField.text!,
                                 "year": yearTextField.text!,
                                 "name": nameTextField.text!,
                                 "en": enTextField.text!,
                                 "why": whyTextField.text!,
                                 "number":doneNumber
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
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
//selfをデリゲートにしているので、ここにデリゲートメソッドを書くらしい
    
    @IBAction func back (){
        self.dismiss(animated: true, completion: nil)
    }
    


}
