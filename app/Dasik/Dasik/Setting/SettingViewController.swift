//
//  HomeViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/05/26.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userHeightLabel: UILabel!
    @IBOutlet weak var userWeightLabel: UILabel!
    
    override func viewDidLoad() {
        userNameLabel.text = TmpUser.name
        userWeightLabel.text = String(TmpUser.weight)
        userHeightLabel.text = String(TmpUser.height)
        super.viewDidLoad()
    // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        userNameLabel.text = TmpUser.name
        userWeightLabel.text = String(TmpUser.weight)
        userHeightLabel.text = String(TmpUser.height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
}
