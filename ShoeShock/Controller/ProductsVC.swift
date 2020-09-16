//
//  ViewController.swift
//  ShoeShock
//
//  Created by Alvin Escobar on 9/12/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var productsCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollection.dataSource = self
        productsCollection.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.getProducts().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
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
            assert(sender as? Product != nil)
            cleatVC.product = sender as! Product
//            cleatVC.initializeCleat(product: sender as! Product)
        }
    }


}

