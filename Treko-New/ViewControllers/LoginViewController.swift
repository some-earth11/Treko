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
    var defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = UserDefaults.standard
        if(defaults.string(forKey: "user")! != ""){
            self.handleLogin()
        }
    }
    
    @IBAction func clickLogin(_ sender: UIButton) {
        if(username.text != "" && password.text != ""){
            let parameters = [ "username" :username.text!,
                               "password": password.text! ]
            apiCall.POST(parameters: parameters,route:"/login") { result in
                switch result {
                case .success(let responseData):
                    if(responseData["msg"]! == "Welcome back!"){
                        self.defaults.set(self.username.text!,forKey: "user")
                        self.handleLogin()
                    }else{
                        self.handleError(msg: responseData["msg"]!)
                    }
                case .failure(let error):
                    print("Err",error)
                    self.handleError(msg: "Error in server")
                }
            }
        }else{
            print("Empty field")
            handleError(msg: "Error empty Field")
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
    func handleError(msg:String){
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler: {action in print("Tapped dismiss")}))
        present(alert,animated: true)
    }
    

  

}
