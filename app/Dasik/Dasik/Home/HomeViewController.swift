//
//  HomeViewController.swift
//  Dasik
//
//  Created by 희준이 on 2021/05/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        //APITest()
    }
    
    public func APITest(){
        print("APITEST Function Start!")
        let dic:Dictionary = ["message":"test"]
        
        guard let url = URL(string:"http://localhost:3000") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            print(request)
        }
        catch{
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let jsonToArray = try? JSONSerialization.jsonObject(with: data!, options: []) else{
                print("json to Any Error")
                return
            }
            
            
            print("data--------")
            print(data!)
            print("response------")
            print(response!)
            print("datajson-------")
            print(jsonToArray)
        }).resume()
    }
}
