//
//  itiranViewController.swift
//  money
//
//  Created by 横尾美空 on 2018/09/22.
//  Copyright © 2018年 横尾美空. All rights reserved.
//

import UIKit

class itiranViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var table: UITableView!
    var keiyakuArray: [Dictionary<String,String>] = []
    var selectedInfo : Int!
//    var doneNumber : String = "zero" 
//    var doneNumber2 : Int = 0
    var doneNumber : String!
    var saveData : UserDefaults = UserDefaults.standard
    var saveData2 : UserDefaults = UserDefaults.standard
    var saveData3 : UserDefaults = UserDefaults.standard
 
    override func viewDidLoad() {
        super.viewDidLoad()
//        let cell = table.dequeueReusableCell(withIdentifier:"cell", for: IndexPath) as! ListTableViewCell
//        let nowIndexPathDictionary = keiyakuArray[IndexPath.row]
//        cell.listLabel.text = nowIndexPathDictonary[""]
        
//        let object = objects[IndexPath.row] as! NSDate
//        cell.textLabel!.text = object.description
//        return cell
        
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
        
//         saveData2.set(doneNumber,forKey:"number")
//         saveData3.set(doneNumber2,forKey:"number2")
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "KEIYAKU") != nil{
            keiyakuArray = saveData.array(forKey: "KEIYAKU") as! [Dictionary<String, String>]
        }
        table.reloadData()

    }
    
    func numberOfSections(in ListTableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) ->Int{
        return keiyakuArray.count
    }
//tableViewのセルの数を指定
    
    
    func tableView(_ tableView : UITableView, cellForRowAt indexpath:IndexPath) -> UITableViewCell{
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexpath) as! ListTableViewCell
        let nowIndexPathDictionary = keiyakuArray[indexpath.row]
        cell.textLabel?.text = nowIndexPathDictionary["name"]
        doneNumber = nowIndexPathDictionary["number"]
        

// 一覧にでるのを名前にしてる
        return cell
    }
//各セルの中身の表示の仕方設定
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedInfo = indexPath.row as Int
        if selectedInfo != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegue(withIdentifier: "toHenkyakuView",sender: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            keiyakuArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveData.set(keiyakuArray,forKey:"KEIYAKU")
        }
    }
// これはスライドしたらdelegateできる　ネットからコピペしたけどsaveDataの描き忘れに注意
    
    override func prepare (for segue:UIStoryboardSegue,sender : Any!){
        if (segue.identifier == "toHenkyakuView"){
            let  destinationVC: hemkyakuViewController = (segue.destination as? hemkyakuViewController)!
        destinationVC.selectedInfo = selectedInfo
        }
    }
    
    
    
    @IBAction func add (){
        performSegue(withIdentifier: "toNyuryokuView", sender: nil)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
