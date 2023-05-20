import UIKit

class RegisterViewController: UIViewController {
    var defaults = UserDefaults.standard
    
    private let scrollView: UIScrollView = {
          let scrollView = UIScrollView()
          scrollView.translatesAutoresizingMaskIntoConstraints = false
          return scrollView
      }()
      
      private let contentView: UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()

    // Add the target action functions
    @objc private func textFieldEditingDidBegin(_ textField: UITextField) {
        animatePlaceholder(textField, moveUp: true)
    }

    @objc private func textFieldEditingDidEnd(_ textField: UITextField) {
        animatePlaceholder(textField, moveUp: false)
    }

    // Function to animate the placeholder
    private func animatePlaceholder(_ textField: UITextField, moveUp: Bool) {
        let placeholderLabel = textField.subviews.compactMap { $0 as? UILabel }.first
        
        // Define the initial and final transform values
        let initialTransform = moveUp ? CGAffineTransform(translationX: 0, y: -textField.bounds.height / 2) : .identity
        let finalTransform = moveUp ? .identity : CGAffineTransform(translationX: 0, y: textField.bounds.height / 2)
        
        // Perform the animation
        UIView.animate(withDuration: 0.3) {
            placeholderLabel?.transform = moveUp ? initialTransform : finalTransform
            placeholderLabel?.alpha = moveUp ? 0.6 : 1.0
        }
    }

    
    
    private let usernameTextField: UITextField = {
         let textField = UITextField()
         textField.placeholder = "Username"
         textField.translatesAutoresizingMaskIntoConstraints = false
         textField.borderStyle = .none
//         textField.layer.cornerRadius = 20
         textField.layer.borderWidth = 1.0
         textField.layer.borderColor = UIColor.lightGray.cgColor
         textField.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
         textField.translatesAutoresizingMaskIntoConstraints = false
         
         // Add left icon
         let imageView = UIImageView(image: UIImage(systemName: "person.fill"))
         imageView.tintColor = .lightGray
         imageView.contentMode = .scaleAspectFit
         textField.leftView = imageView
         textField.leftViewMode = .always
         
         // ...
         
         return textField
     }()
     
     private let passwordTextField: UITextField = {
         let textField = UITextField()
         textField.placeholder = "Password"
         textField.isSecureTextEntry = true
         textField.translatesAutoresizingMaskIntoConstraints = false
         textField.borderStyle = .none
//         textField.layer.cornerRadius = 20
         textField.layer.borderWidth = 1.0
         textField.layer.borderColor = UIColor.lightGray.cgColor
         textField.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
         textField.translatesAutoresizingMaskIntoConstraints = false
         
         // Add left icon
         let imageView = UIImageView(image: UIImage(systemName: "lock.fill"))
         imageView.tintColor = .lightGray
         imageView.contentMode = .scaleAspectFit
         textField.leftView = imageView
         textField.leftViewMode = .always
         
         // ...
         
         return textField
     }()
     
     private let retypePasswordTextField: UITextField = {
         let textField = UITextField()
         textField.placeholder = "Retype Password"
         textField.isSecureTextEntry = true
         textField.translatesAutoresizingMaskIntoConstraints = false
         textField.borderStyle = .none
//         textField.layer.cornerRadius = 20
         textField.layer.borderWidth = 1.0
         textField.layer.borderColor = UIColor.lightGray.cgColor
         textField.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
         textField.translatesAutoresizingMaskIntoConstraints = false
         
         // Add left icon
         let imageView = UIImageView(image: UIImage(systemName: "lock.fill"))
         imageView.tintColor = .lightGray
         imageView.contentMode = .scaleAspectFit
         textField.leftView = imageView
         textField.leftViewMode = .always
         
         // ...
         
         return textField
     }()
    
    private let emailTextField: UITextField = {
          let textField = UITextField()
          textField.placeholder = "Email"
          textField.translatesAutoresizingMaskIntoConstraints = false
          textField.borderStyle = .none
//          textField.layer.cornerRadius = 20
          textField.layer.borderWidth = 1.0
          textField.layer.borderColor = UIColor.lightGray.cgColor
          textField.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
          textField.translatesAutoresizingMaskIntoConstraints = false
          
          // Add left icon
          let imageView = UIImageView(image: UIImage(systemName: "envelope.fill"))
          imageView.tintColor = .lightGray
          imageView.contentMode = .scaleAspectFit
          textField.leftView = imageView
          textField.leftViewMode = .always
          
          // ...
          
          return textField
      }()
    
    
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "First Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
//        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        // Add left icon
        let imageView = UIImageView(image: UIImage(systemName: "person.fill"))
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        textField.leftView = imageView
        textField.leftViewMode = .always
        
        // Add the target action to handle text field editing events
        textField.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
        
        return textField
    }()

    private let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Last Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
//        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        // Add left icon
        let imageView = UIImageView(image: UIImage(systemName: "person.fill"))
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        textField.leftView = imageView
        textField.leftViewMode = .always
        
        // Add the target action to handle text field editing events
        textField.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
        
        return textField
    }()

    private let dobTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Date of Birth"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
//        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        // Add left icon
        let imageView = UIImageView(image: UIImage(systemName: "calendar"))
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        textField.leftView = imageView
        textField.leftViewMode = .always
        
        // Add the target action to handle text field editing events
        textField.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
        
        return textField
        
    }()
    private let dobDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()


    private let profileDescTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Profile Description"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
//        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        // Add left icon
        let imageView = UIImageView(image: UIImage(systemName: "person.fill.text"))
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        textField.leftView = imageView
        textField.leftViewMode = .always
        
        // Add the target action to handle text field editing events
        textField.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
        
        return textField
    }()

    
    private let registerButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Register", for: .normal)
        button.backgroundColor =  UIColor(red: 96/255, green: 74/255, blue: 152/255, alpha: 1.0)
         button.setTitleColor(.white, for: .normal)
//         button.layer.cornerRadius = 20
         button.translatesAutoresizingMaskIntoConstraints = false
        
         return button
     }()
    
    private let loginButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Login", for: .normal)
        button.backgroundColor =  UIColor(red: 96/255, green: 74/255, blue: 152/255, alpha: 1.0)
         button.setTitleColor(.white, for: .normal)
//         button.layer.cornerRadius = 20
         button.translatesAutoresizingMaskIntoConstraints = false
        
         return button
     }()
    
    private let imageIcon:UIImageView = {
        let image = UIImage(named: "AppIcon")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        return imageView
    }()
    
    private let apiCall = API()
    
    override func viewDidLoad() {
        defaults = UserDefaults.standard
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupDatePicker()
        setupActions()
        
    }
    private func setupActions() {
          registerButton.addTarget(self, action: #selector(registerClicked), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)
      }
    private func setupDatePicker() {
         dobTextField.inputView = dobDatePicker

         let toolbar = UIToolbar()
         toolbar.sizeToFit()
         let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(datePickerDoneButtonTapped))
         let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
         toolbar.setItems([flexibleSpace, doneButton], animated: true)
         dobTextField.inputAccessoryView = toolbar
     }

     @objc private func datePickerDoneButtonTapped() {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd"
         dobTextField.text = dateFormatter.string(from: dobDatePicker.date)
         dobTextField.resignFirstResponder()
     }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Register"
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        let iconContainerView = UIView()
         iconContainerView.translatesAutoresizingMaskIntoConstraints = false
         iconContainerView.addSubview(imageIcon)
         contentView.addSubview(iconContainerView)
//        contentView.addSubview(imageIcon)
        contentView.addSubview(usernameTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(emailTextField)
        contentView.addSubview(firstNameTextField)
        contentView.addSubview(lastNameTextField)
        contentView.addSubview(dobTextField)
        contentView.addSubview(profileDescTextField)
        contentView.addSubview(registerButton)
        contentView.addSubview(loginButton)

            scrollView.addSubview(contentView)
            contentView.addSubview(usernameTextField)
            contentView.addSubview(passwordTextField)

            contentView.addSubview(registerButton)
        
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imageIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            imageIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: imageIcon.topAnchor, constant: 16),
            usernameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            usernameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            firstNameTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            firstNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            firstNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 8),
            lastNameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lastNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            dobTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 8),
            dobTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dobTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dobTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            profileDescTextField.topAnchor.constraint(equalTo: dobTextField.bottomAnchor, constant: 8),
            profileDescTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileDescTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            profileDescTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: profileDescTextField.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            contentView.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16)
        ])
    }
    
    @objc private func loginClicked(){
        print("here")
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true, completion: nil)
        }
    }
    
    @objc private func registerClicked() {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              let email = emailTextField.text,
              let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let dob = dobTextField.text,
              
              let profileDesc = profileDescTextField.text else {
                  print("Empty field")
                  return
        }
        let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "yyyy-MM-dd"
              guard let dobDate = dateFormatter.date(from: dob) else {
                  print("Invalid date format")
                  return
              }
              let epochTimestamp = Int(dobDate.timeIntervalSince1970)
        
        print("Epooch",epochTimestamp)
        let parameters = [
            "username": username,
            "password": password,
            "email": email,
            "firstname": firstName,
            "lastname": lastName,
            "dateOfBirth": "\(epochTimestamp)",
            "profileDescription": profileDesc
        ]
        
        apiCall.POST(parameters: parameters, route: "/register") { result in
            switch result {
            case .success(let responseData):
                if responseData["msg"] == "Welcome to the club!" {
                    let parameters = [ "username" :username,
                                       "password": password ]
                    self.apiCall.POST(parameters: parameters,route:"/login") { result in
                        switch result {
                        case .success(let responseData):
                            if(responseData["msg"]! == "Welcome back!"){

                                self.handleLogin(username: username)
                            }else{
                                self.handleError(msg: responseData["msg"]!)
                            }
                        case .failure(let error):
                            print("Err",error)
                            self.handleError(msg: "Error in server")
                        }
                    }
                }
            case .failure(let error):
                print("Error", error)
                self.handleError(msg: "Error in server")
            }
        }
    }
    
    private func handleLogin(username:String) {
        DispatchQueue.main.async {
            self.defaults.set(username,forKey: "user")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "HomeTabBarController") as! UITabBarController
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true, completion: nil)
        }
    }
    private func handleError(msg:String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler: {action in print("Tapped dismiss")}))
            self.present(alert,animated: true)
        }
    }
}
