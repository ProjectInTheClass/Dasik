//
//  HomeViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/05/26.
//

import UIKit

class RankViewController: UIViewController {
    
    @IBOutlet var rice: UIView!
    @IBOutlet var noodle: UIView!
    @IBOutlet var cookie: UIView!
    @IBOutlet var chicken: UIView!
    @IBOutlet var riceimage: UIImageView!
    @IBOutlet var noodleimage: UIImageView!
    @IBOutlet var cookieimage: UIImageView!
    @IBOutlet var chickenimage: UIImageView!
    
    var detailname: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        riceimage.image = UIImage(named:"testimage")
        noodleimage.image = UIImage(named:"testimage")
        cookieimage.image = UIImage(named:"testimage")
        chickenimage.image = UIImage(named:"testimage")
        
        let RicetapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewRiceTapped))
        rice.addGestureRecognizer(RicetapGestureRecognizer)
        
        let NoodletapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewNoodleTapped))
        noodle.addGestureRecognizer(NoodletapGestureRecognizer)
        
        let CookietapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewCookieTapped))
        cookie.addGestureRecognizer(CookietapGestureRecognizer)
        
        let ChickentapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewChickenTapped))
        chicken.addGestureRecognizer(ChickentapGestureRecognizer)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailsRankTableViewController else { return }
        print(sender!)
        detailVC.detailnamestring = self.detailname
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
