//
//  DetailsRankTableViewController.swift
//  Dasik
//
//  Created by 이현민 on 2021/06/03.
//

import UIKit

class DetailsRankTableViewController: UITableViewController {

    @IBOutlet weak var detailNameNavigation: UINavigationItem!
    var detailnamestring:String = ""
    var selectedcategory:RankCategory!
    var selectedfoodArray:[RankFood2]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailNameNavigation.title = selectedcategory.categoryname
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return selectedfoodArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankCell1", for: indexPath) as! RankCell

        let item = selectedfoodArray[indexPath.row]
        
        cell.foodimg.image = UIImage(named: "testimage")
        cell.foodname.text = item.name
        cell.foodprice.text = String(item.price)
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = self.tableView.indexPathForSelectedRow,
           let subdetailVC = segue.destination as? SubDetailsViewController{
            subdetailVC.selectedFood = selectedfoodArray[indexPath.row]
        }
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

class RankCell: UITableViewCell{
    
    @IBOutlet var foodimg: UIImageView!
    @IBOutlet var foodname: UILabel!
    @IBOutlet var foodprice: UILabel!
}
