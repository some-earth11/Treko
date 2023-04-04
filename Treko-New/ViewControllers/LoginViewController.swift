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
            let parameters = [ "username" :username.text!,
                               "password": password.text! ]
            apiCall.POST(parameters: parameters,route:"/login") { result in
                switch result {
                case .success(let responseData):
                    if(responseData["msg"]! == "Welcome back!"){
                        self.handleLogin()
                    }
                case .failure(let error):
                    print("Err",error)
                }
            }
        }else{
            print("Empty field")
        }
    }
    func handleLogin(){
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "HomeTabBarController") as! UITabBarController
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true, completion: nil)
        }

    }
    

  

}
