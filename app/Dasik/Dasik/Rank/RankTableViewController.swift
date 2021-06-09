//
//  RankTableViewController.swift
//  Dasik
//
//  Created by 이현민 on 2021/06/03.
//

import UIKit


class RankTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        APITest()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryfoods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCategory", for: indexPath) as! foodCategory
        
        
        let item = categoryfoods[indexPath.row]
        
        cell.categoryImage.image = UIImage(named: item.categoryimage)
        cell.categoryName.text = item.categoryname
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = self.tableView.indexPathForSelectedRow,
           let detailVC = segue.destination as? DetailsRankTableViewController{
            detailVC.selectedcategory = categoryfoods[indexPath.row]
            if indexPath.row == 0 {detailVC.selectedfoodArray = foodData.ricefoods}
            else if indexPath.row == 1 {detailVC.selectedfoodArray = foodData.noodlefoods}
            else if indexPath.row == 2 {detailVC.selectedfoodArray = foodData.saladfoods}
            else if indexPath.row == 3 {detailVC.selectedfoodArray = foodData.chickenfoods}
            else if indexPath.row == 4 {detailVC.selectedfoodArray = foodData.hmrfoods}
            else if indexPath.row == 5 {detailVC.selectedfoodArray = foodData.cookiefoods}
        }
    }
    
    public func APITest(){
        
        
        print("APITEST Function Start!")
        let dic:Dictionary = ["message":"test"]
        
        guard let url = URL(string:"http://222.108.114.91:8080/foods".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do{
            //request.httpBody = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            print(request)
        }
        catch{
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept-Type")
        
//        do{
//            let json:Data = try Data.init(contentsOf: url)
//            var products = [String :[RankFood2]]()
//
//            products = try JSONDecoder().decode([String : [RankFood2]].self, from: json)
//
////            products.
//
//        }
//        catch{
//            print(error.localizedDescription)
//        }

        
        var products = [RankFood]()
        
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: { (data, response, error) in


            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as! [String:[Any]]
            let foodjsons = json!["foods"] as! [Any]
                            
            foodjsons.forEach{ item in
                guard let object = item as? [String : Any] else { return }
                // 가지고 있는 string key값을 이용하여 값을 가져온다.
                let name = object["name"] as! String
                let type = object["type"] as! String
                let ingredient = object["ingredient"] as! String
                let kcal = object["kcal"] as! Double
                let carbo = object["carbo"] as! Double
                let protein = object["protein"] as! Double
                let fat = object["fat"] as! Double
                let price = object["price"] as! Int
                let siteurl = object["siteurl"] as! String
                let foodimage = object["foodimage"] as! String
                
                var newElement = RankFood(name:name, type: type, ingredient: ingredient, kcal:kcal, carbo: carbo, protein:protein, fat:fat, price:price,siteurl: siteurl, foodimage: foodimage)
                if type == "밥"{foodData.ricefoods.append(newElement)}
                else if type == "면"{foodData.noodlefoods.append(newElement)}
                else if type == "샐러드"{foodData.saladfoods.append(newElement)}
                else if type == "닭가슴살"{foodData.chickenfoods.append(newElement)}
                else if type == "간편식"{foodData.hmrfoods.append(newElement)}
                else if type == "간식"{foodData.cookiefoods.append(newElement)}
                                
            }
//            products.forEach{
//                print("name : \($0.name), type : \($0.type), kcal : \($0.kcal), siteurl: \($0.siteurl)")
//            }
        }).resume()
        
        
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

class foodCategory:UITableViewCell{
    @IBOutlet var categoryImage: UIImageView!
    @IBOutlet var categoryName: UILabel!
}
