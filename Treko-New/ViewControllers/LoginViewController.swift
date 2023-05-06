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
        username.text = "aryansingh920"
        password.text = "1234567890"
        super.viewDidLoad()
        defaults = UserDefaults.standard

//        if(defaults.string(forKey: "user") != nil && defaults.string(forKey: "user")!.count>0){
//            print("here if statement",defaults.string(forKey: "user")!)
//            self.handleLogin()
//        }
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
            self.defaults.set(self.username.text!,forKey: "user")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "HomeTabBarController") as! UITabBarController
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true, completion: nil)
        }

    }
    func handleError(msg:String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler: {action in print("Tapped dismiss")}))
            self.present(alert,animated: true)
        }
    }
    

  

}
