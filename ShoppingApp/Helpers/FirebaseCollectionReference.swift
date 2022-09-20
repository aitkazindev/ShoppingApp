//
//  FirebaseCollectionReference.swift
//  ShoppingApp
//
//  Created by GreyResearch_design on 2022/09/20.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String{
    case User
    case Category
    case Items
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
