//
//  LoginViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 29/03/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    let apiCall = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickLogin(_ sender: UIButton) {
        if(username.text != "" && password.text != ""){
            let response: () = apiCall.Login(username: username.text!, password: password.text!)
            print(response)
            
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTabBarController") as! UITabBarController

                self.navigationController?.pushViewController(nextViewController, animated: true)
        }else{
            print("Empty field")
        }
    }
    

  

}
