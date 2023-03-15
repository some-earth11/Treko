//
//  ChatPageViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 12/03/23.
//

import UIKit

class ChatingPageViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var description_profile: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var profile_Image = UIImage()
    var profile_name = ""
    var profile_description = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.text = profile_name
        description_profile.text = profile_description
        profileImage.image = profile_Image

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
