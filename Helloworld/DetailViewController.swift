//
//  DetailViewController.swift
//  Helloworld
//
//  Created by 이현민 on 2021/04/08.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var decsLabel: UILabel!
    var selectedMovie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        decsLabel.text = selectedMovie.desc
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
