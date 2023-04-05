//
//  RegisterViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 05/04/23.
//

import UIKit

class RegisterViewController: UIViewController {
    

//    @IBOutlet var register: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var fName: UITextField!
    @IBOutlet var lname: UITextField!
    @IBOutlet var dob: UITextField!
    @IBOutlet var profileDesc: UITextField!
    
    let apiCall = API()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerClicked(_ sender: Any) {
        if(username.text != "" && password.text != "" && email.text != "" && fName.text != "" && lname.text != "" && profileDesc.text != "" && dob.text != ""){
            let parameters = [ "username" :username.text!,
                               "password": password.text!,
                               "email": email.text!,
                               "firstname":fName.text!,
                               "lastname":lname.text!,
                               "dateOfBirth":dob.text!,
                               "profileDescription":profileDesc.text!]
            apiCall.POST(parameters: parameters,route:"/register") { result in
                switch result {
                case .success(let responseData):
                    if(responseData["msg"]! == "Welcome to the club!"){
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
