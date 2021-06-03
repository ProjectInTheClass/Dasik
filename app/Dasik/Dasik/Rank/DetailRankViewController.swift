//
//  DetailRankViewController.swift
//  Dasik
//
//  Created by 이현민 on 2021/06/03.
//

import UIKit

class DetailRankViewController: UIViewController {

    @IBOutlet var detailname: UILabel!
    var detailnameString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankfoods.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankCell", for: indexPath) as! RankCell

        let item = rankfoods[indexPath.row]
        
        cell.foodimg.image = UIImage(named: item.foodimage)
        cell.foodname.text = item.name
        cell.foodprice.text = String(item.price)
        
        
        return cell
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let detailVC = segue.destination as? DetailRankViewController {
//
//            let cell = sender as! UITableViewCell
//            let indexPath = tableView.indexPath(for: cell)
//            detailVC.selectedMovie = movies[indexPath!.row]
//
//        }
//    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

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
