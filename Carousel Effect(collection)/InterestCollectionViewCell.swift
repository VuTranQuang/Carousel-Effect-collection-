//
//  InterestCollectionViewCell.swift
//  Carousel Effect(collection)
//
//  Created by RTC-HN154 on 10/11/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    var interest: Interest? {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        interestTitleLabel.text = interest?.title
        imageViewCell.image = interest?.featureImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
