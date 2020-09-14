//
//  ProductCell.swift
//  ShoeShock
//
//  Created by Alvin Escobar on 9/13/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    
    func updateViews(product: Product) {
        productTitle.text = product.title
        productImage.image = UIImage(named: product.imageName)
        productPrice.text = product.price
    }
}
