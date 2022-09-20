//
//  Category.swift
//  ShoppingApp
//
//  Created by GreyResearch_design on 2022/09/20.
//

import Foundation
import UIKit

class Category{
    
    var id: String
    var name: String
    var image: UIImage?
    var imageName: String?
    
    init(_name: String, _imageName: String){
        id = ""
        name = _name
        imageName = _imageName
        image = UIImage(named: _imageName)
    }
    
    init(_dictionary: NSDictionary){
        id = _dictionary[kOBJECTID] as! String
        name = _dictionary[kNAME] as! String
        image = UIImage(named: _dictionary[kIMAGENAME] as? String ?? "")
    }
}

//MARK: Download Category

func downloadCategoriesFromFirebase(completion: @escaping (_ categoryArray: [Category]) -> Void) {
    var categoryArray: [Category] = []
    FirebaseReference(.Category).getDocuments { (snapshot, error) in
        guard let snapshot = snapshot else{
            completion(categoryArray)
            return
        }
        if !snapshot.isEmpty {
            for categoryDict in snapshot.documents{
                if let nameOfCategory = categoryDict.data()[kNAME] {
                    print("creared new category with name: \(nameOfCategory)")
                    categoryArray.append(Category(_dictionary: categoryDict.data() as NSDictionary))
                }
            }
        }
        completion(categoryArray)
    }
}

// MARK:  Save category function

func saveCategoryToFirebase(_ category: Category){
    let id = UUID().uuidString
    category.id = id
    FirebaseReference(.Category).document(id).setData(categoryDictionaryFrom(category) as! [String : Any])
}

// MARK:  Create category from dictionary

func categoryDictionaryFrom(_ category: Category) -> NSDictionary {
    
    if let imageName = category.imageName {
        return NSDictionary(
            objects: [
                category.id, category.name, imageName
            ],
            forKeys: [
                kOBJECTID as NSCopying,
                kNAME as NSCopying,
                kIMAGENAME as NSCopying
            ])
    }
    return NSDictionary()
}

