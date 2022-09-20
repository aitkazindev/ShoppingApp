//
//  CategoryCollectionViewController.swift
//  ShoppingApp
//
//  Created by GreyResearch_design on 2022/09/20.
//

import UIKit
 

class CategoryCollectionViewController: UICollectionViewController {
    
    //MARK: Vars
    var categoryArray: [Category] = []
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadCategories()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryCollectionViewCell
        
        //cell.generateCell(categoryArray[indexPath.row])
        
        return cell
    }
    
    //MARK: Download categories
    private func loadCategories(){
        downloadCategoriesFromFirebase { (allCategories) in
            self.categoryArray = allCategories
            self.collectionView.reloadData()
        }
    }
    
}
