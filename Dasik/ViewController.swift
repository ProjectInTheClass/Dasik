//
//  ViewController.swift
//  Helloworld
//
//  Created by 이현민 on 2021/04/08.
// 
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            detailVC.selectedMovie = movies[3]
        }
    }


}

