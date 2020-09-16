//
//  CleatVC.swift
//  ShoeShock
//
//  Created by Alvin Escobar on 9/14/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import UIKit

class CleatVC: UIViewController {
    
    @IBOutlet weak var cleatImage: UIImageView!
    @IBOutlet weak var cleatTitle: UILabel!
    @IBOutlet weak var cleatPrice: UILabel!
    @IBOutlet weak var cleatDescription: UILabel!
    
    var product = Product(title: "", imageName: "", price: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Hey Nate I tried making a separate file to put into the "Views" folder
        // to organize better and update the views through the updateView() function from there
        // But I couldn't figure out how to reference the IBOutlets to storyboard without
        // crashing and getting a "nil" error. So I tried to make independent files of UILabel class
        // and UIImageView class to connect to the storyboard so that I can reference @IBOutlets
        // but it couldn't connect. I had to connect it through the "UIViewController"
        // in order to reference the IBOutlets. That's why I declared the IBOutlets here
        // and had to update the View here as well. 
    }
    
    func updateView() {
        cleatImage.image = UIImage(named: product.imageName)
        cleatTitle.text = product.title
        cleatPrice.text = product.price
        cleatDescription.text = product.description
    }
    
    

}
