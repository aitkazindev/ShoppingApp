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
