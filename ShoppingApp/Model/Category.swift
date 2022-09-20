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


func createCategory(){
    let womenClothing = Category(_name: "Women's clothing & Accessories", _imageName: "womenCloth")
    let camera = Category(_name: "Cameras & Optics", _imageName: "camera")
    let health = Category(_name: "Health & Beauty", _imageName: "health")
    let garden = Category(_name: "Garden supplies", _imageName: "garden")
    let electronics = Category(_name: "Electronics", _imageName: "electronics")
    let home = Category(_name: "Home & Kitchen", _imageName: "home")
    let luggage = Category(_name: "Luggage & bags", _imageName: "luggage")
    let hobby = Category(_name: "Hobby, Sport, Travelling", _imageName: "hobby")
    let industry = Category(_name: "Industry & Business", _imageName: "industry")
    let baby = Category(_name: "Baby Stuff", _imageName: "baby")
    let jewerely = Category(_name: "Jewerely", _imageName: "jewerely")
    let pet = Category(_name: "Pet products", _imageName: "pet")
    let footwear = Category(_name: "Footwear", _imageName: "footwear")
    let car = Category(_name: "Cars & Accessories", _imageName: "car")
    let menClothing = Category(_name: "Men's Clothing & Accessories", _imageName: "menClothing")
    
    let arrayOfCategories = [womenClothing,footwear,electronics,menClothing,home,health,baby,car,luggage,jewerely,hobby,industry,garden,camera,pet]
    
    for category in arrayOfCategories {
        saveCategoryToFirebase(category)
    }

}
