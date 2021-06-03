//
//  HomeViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/05/26.
//

import UIKit

class RankViewController: UITableView {
    
    var detailname: String = ""
    
    
    
    override func viewDidLoad() {
       // super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow,
           let subdetailVC = segue.destination as? SubDetailsViewController{
            subdetailVC.selectedFood = rankfoods[indexPath.row]
        }
    }
    
        
    @objc func viewRiceTapped(sender:UITapGestureRecognizer){
        print("rice click")
        detailname = "밥"
        performSegue(withIdentifier: "presentDetails", sender: self)
//        let pushVC = self.storyboard?.instantiateViewController(withIdentifier:            "detailsRanksb")
        
        
        //pushVC!.detailnamestring = "Rice"
//        present(pushVC!
//                , animated: true, completion: nil)
//        self.show(pushVC!, sender:self)
        
//        var nextVC = DetailsRankTableViewController()
//        nextVC.detailnamestring = "밥"
//
//        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func viewNoodleTapped(sender:UITapGestureRecognizer){
        print("noodle click")
        detailname = "면"
        performSegue(withIdentifier: "presentDetails", sender: self)
    }
    
    @objc func viewCookieTapped(sender:UITapGestureRecognizer){
        print("Cookie click")
        detailname = "간식류"
        performSegue(withIdentifier: "presentDetails", sender: self)
    }
    
    @objc func viewChickenTapped(sender:UITapGestureRecognizer){
        print("Chicken click")
        detailname = "닭가슴살"
        performSegue(withIdentifier: "presentDetails", sender: self)
    }
}
