//
//  ViewController.swift
//  Agile-tech
//
//  Created by mahesh mannapperuma on R 2/10/13.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var _username: UITextField!
   
    @IBOutlet weak var _password: UITextField!
    
    @IBOutlet weak var _login_button: UIButton!
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    
    
    @IBAction func LoginButton(_ sender: Any) {
        
        let employeeId = _username.text
        let password = _password.text
        
        if (employeeId == "" || password == "") {
            print("Error")
        } else {
            
            DoLogin(employeeId!, password!)
            self.performSegue(withIdentifier: "portalPage", sender: self)
        }
                    
    }
    
    // Login Function
    func DoLogin(_ user:String, _ pwd:String) {
        let url = String (format: "http://192.168.3.6:8080/rest/login")
        guard let serviceUrl = URL(string: url) else {
            return
        }
        let parameters = ["employeeId": user, "password": pwd]

        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "content-type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        request.httpBody = httpBody
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: { (data, response, error) in
            if response != nil {
                print(String.init(data: data!, encoding: .utf8) as Any)
            }
            if let data = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }).resume()
        
    }
    

        //text field return
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
    

}


