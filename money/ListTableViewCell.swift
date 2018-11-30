//
//  ListTableViewCell.swift
//  money
//
//  Created by 横尾美空 on 2018/09/24.
//  Copyright © 2018年 横尾美空. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var listLabel : UILabel!
    @IBOutlet var kakuninimage : UIImageView!
    var selectedInfo : Int!
    var keiyakuArray :  [Dictionary<String,String>] = []
    var saveData : UserDefaults = UserDefaults.standard
    var doneNumber : String!

    override func awakeFromNib() {
        super.awakeFromNib()
        if saveData.array(forKey: "KEIYAKU") != nil{
            keiyakuArray = saveData.array(forKey: "KEIYAKU") as! [Dictionary<String, String>]
            //print(keiyakuArray[selectedInfo]["number"])
            doneNumber = keiyakuArray[selectedInfo]["number"] as! String
        }
        
//        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexpath) as! ListTableViewCell
//        let nowIndexPathDictionary = keiyakuArray[indexpath.row]
//        cell.textLabel?.text = nowIndexPathDictionary["name"]
        
        // Initialization code
        if doneNumber == "0"{
            kakuninimage.image = UIImage(named:"sumigreen.png")
        }else if doneNumber == "1"{
            kakuninimage.image = UIImage(named:"finishedred.png")
        }
    }
//    nibからの読み込みが完全に終わった時に呼び出される

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

