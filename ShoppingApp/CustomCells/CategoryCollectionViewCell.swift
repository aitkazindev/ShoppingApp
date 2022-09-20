//
//  CategoryCollectionViewCell.swift
//  ShoppingApp
//
//  Created by GreyResearch_design on 2022/09/20.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func generateCell(_ category: Category){
        nameLabel.text = category.name
        imageView.image = category.image
    }
}
