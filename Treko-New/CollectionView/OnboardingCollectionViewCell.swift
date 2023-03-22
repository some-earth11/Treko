//
//  OnboardingCollectionViewCell.swift
//  Treko-New
//
//  Created by Samarth Kumar on 22/03/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideDescLabel: UILabel!
    
    func setup(_ slide:OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescLabel.text = slide.description
    }
}
