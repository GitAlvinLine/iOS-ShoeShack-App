//
//  ViewController.swift
//  ShoeShock
//
//  Created by Alvin Escobar on 9/12/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import UIKit

@IBDesignable
class ProductsVC: UIViewController {
    
    @IBOutlet weak var productsCollection: UICollectionView!
    
    private var productItem = Product(title: "", imageName: "", price: "", description: "")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollection.dataSource = self
        productsCollection.delegate = self
        addNavBarCartBtn()
    }
    
    func addNavBarCartBtn() {
        let cartButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(pressedCartBtn))
        cartButton.image = UIImage(systemName: "cart")
        navigationItem.rightBarButtonItem = cartButton
    }
    
    @objc func pressedCartBtn(){
        performSegue(withIdentifier: "CheckoutVC", sender: self)
    }

}



extension ProductsVC: UICollectionViewDelegate, UICollectionViewDataSource, ProductCellDelegate {
    
    func fillHeartBtn(btn: UIButton) {
        btn.setTitle("♥", for: .normal)
    }
    
    
    func addToCart(item: ProductCell) {
        let indexPath = self.productsCollection.indexPath(for: item)
        let product = DataService.instance.getProducts()[indexPath!.row]
        DataService.instance.addToItems(cleat: product)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.getProducts().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            cell.delegate = self
            let product = DataService.instance.getProducts()[indexPath.row]
            cell.updateViews(product: product)
            return cell
        }
        
        return ProductCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = DataService.instance.getProducts()[indexPath.row]
        performSegue(withIdentifier: "ShoeItemVC", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cleatVC = segue.destination as? CleatVC {
            cleatVC.initializeProduct(item: sender as! Product)
        }
    }
}
