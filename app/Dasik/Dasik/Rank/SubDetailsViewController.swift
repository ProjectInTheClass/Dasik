//
//  SubDetailsViewController.swift
//  Dasik
//
//  Created by 이현민 on 2021/06/03.
//

import UIKit

class SubDetailsViewController: UIViewController {

    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var foodName: UILabel!
    @IBOutlet var foodType: UILabel!
    @IBOutlet var foodIngredient: UILabel!
    @IBOutlet var foodKcal: UILabel!
    @IBOutlet var foodCPF: UILabel!
    @IBOutlet var foodPrice: UILabel!
    @IBOutlet var foodURL: UILabel!
    var selectedFood: RankFood!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImage.image = UIImage(named:"testimage")
        foodName.text = selectedFood.name
        foodType.text = selectedFood.type
        foodIngredient.text = selectedFood.ingredient
        foodKcal.text = String(selectedFood.kcal)
        foodCPF.text = String(selectedFood.carbohydrate) + "/" + String(selectedFood.protein) + "/" + String(selectedFood.fat)
        foodPrice.text = String(selectedFood.price)
        foodURL.text = selectedFood.siteurl
        
        // Do any additional setup after loading the view.
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
