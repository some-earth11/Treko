//
//  NewExploreViewController.swift
//  Treko-New
//
//  Created by Aryan Singh on 07/04/23.
//

import UIKit

class NewExploreViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let userInstance = logged_in_user()

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Explore"
        table.dataSource = self
        table.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row){
        case 0:
            return 150
        case 1:
            return 350
        default:
            return 200
        }

    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.row){
        case 0:
            let cell = table.dequeueReusableCell(withIdentifier: "cellStory", for: indexPath) as! StoriesFeedTableViewCell
            cell.collectionView.tag = indexPath.section
            cell.encircle = true
            
            let sV = storiesView(imageName: "profile", imageTitle: "Story")
            cell.arrDataF = [sV,sV,sV,sV,sV,sV,sV,sV,sV,sV,sV,sV]
            switch(indexPath.row){
            case 0:
                cell.numOfElements = 5
                break;
            default:
                break;
            }
            cell.isSelected = true
            return cell
        case 3:
            let cell = table.dequeueReusableCell(withIdentifier: "cellStory", for: indexPath) as! StoriesFeedTableViewCell
            cell.collectionView.tag = indexPath.section
            cell.encircle = true
            
            let sV = storiesView(imageName: "image_story", imageTitle: "Story")
            cell.arrDataF = [sV,sV,sV,sV,sV,sV,sV,sV,sV,sV,sV,sV]
            switch(indexPath.row){
            case 0:
                cell.numOfElements = 5
                break;
            default:
                break;
            }
            cell.isSelected = true
            return cell
        case 1:
            let cell = table.dequeueReusableCell(withIdentifier: "cellMain", for: indexPath) as! ExploreMainTableViewCell
            cell.collectionView.tag = indexPath.section
            return cell
        case 5:
            let cell = table.dequeueReusableCell(withIdentifier: "cellMain", for: indexPath) as! ExploreMainTableViewCell
            cell.collectionView.tag = indexPath.section
            return cell

        default:
            let cell = table.dequeueReusableCell(withIdentifier: "cellLabel", for: indexPath) as! ExploreLabelCellTableViewCell
            cell.collectionView.tag = indexPath.section
            return cell

        }
       

    }
}
