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
    
    private(set) public var product = Product(title: "", imageName: "", price: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        addNavBarCartBtn()
    }
    
    func initializeProduct(item: Product) {
        product = item
    }
    
    func addNavBarCartBtn() {
        let cartButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(pressedCartBtn))
        cartButton.image = UIImage(systemName: "cart")
        navigationItem.rightBarButtonItem = cartButton
    }
    
    @objc func pressedCartBtn(){
        performSegue(withIdentifier: "CleatCheckoutVC", sender: self)
    }
        
    func updateView() {
        cleatImage.image = UIImage(named: product.imageName)
        cleatTitle.text = product.title
        cleatPrice.text = "$\(product.price)"
        cleatDescription.text = product.description
    }
    
    @IBAction func addCartPressed(_ sender: UIButton) {
        DataService.instance.addToItems(cleat: product)
    }

}
