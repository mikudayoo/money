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
    var saveData : UserDefaults = UserDefaults.standard
    var keiyakuArray: [Dictionary<String,String>] = []
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        let cell = table.dequeueReusableCell(withIdentifier:"cell", for: IndexPath) as! ListTableViewCell
        let nowIndexPathDictionary = keiyakuArray[IndexPath.row]
        cell.listLabel.text = nowIndexPathDictonary[""]
        
//        let object = objects[IndexPath.row] as! NSDate
//        cell.textLabel!.text = object.description
//        return cell
        
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
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
    
    
    func tableView(_ tableView : UITableView, cellForRowAt indexpath:IndexPath) -> UITableViewCell{
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexpath) as! ListTableViewCell
        let nowIndexPathDictionary = keiyakuArray[indexpath.row]
        cell.textLabel?.text = nowIndexPathDictionary["name"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "toHenkyakuView", sender: nil)
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
