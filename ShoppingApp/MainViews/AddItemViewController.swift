//
//  AddItemViewController.swift
//  ShoppingApp
//
//  Created by GreyResearch_design on 2022/09/21.
//

import UIKit
import InstantSearch
import JGProgressHUD
import NVActivityIndicatorView
class AddItemViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    //MARK: Vars
       var category: Category!
       //var gallery: GalleryController!
       var hud = JGProgressHUD(style: .dark)
       var activityIndicator: NVActivityIndicatorView?
       var itemImages: [UIImage?] = []
    
    //MARK: IBActions
    @IBAction func doneBarButtonItemPressed(_ sender: Any) {
        dismissKeyboard()
        if fieldsAreCompleted() {
            saveToFirebase()
        }else{
            print("Error are fields are required")
//          self.hud.textLabel.text = "All fields are required"
//            self.hud.indicatorView = JGProgressHUDIndicatorView()
//            self.hud.show(in: self.view)
//            self.hud.dismiss(afterDelay: 2.0)
        }
    }
        
    @IBAction func cameraButtonPressed(_ sender: Any) {
        //showImageGallery()
    }
    
    @IBAction func backgroundTapped(_ sender: Any) {
            dismissKeyboard()
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(category.name)
        // Do any additional setup after loading the view.
    }
    

    //MARK: Helper functions
    
    private func dismissKeyboard(){
        self.view.endEditing(false)
    }
    
    private func fieldsAreCompleted() -> Bool{
        return (titleTextField.text != "" && priceTextField.text != "" && descriptionTextView.text != "")
    }
    
    private func popTheView(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: Save Item
    
    private func saveToFirebase() {
        
//        showLoadingIndicator()
//
        let item = Item()
        item.id = UUID().uuidString
        item.name = titleTextField.text!
        item.categoryId = category.id
        item.description = descriptionTextView.text
        item.price = Double(priceTextField.text!)
        if itemImages.count > 0 {
//            uploadImages(images: itemImages, itemId: item.id) { (imageLinkArray) in
//                item.imageLinks = imageLinkArray
 //               saveItemToFirestore(item)
//                self.popTheView()
 //           }
        }else{
            saveItemToFirestore(item)
//            self.hideLoadingIndicator()
            popTheView()
        }
    }

}
