//
//  ProductCell.swift
//  ShoeShock
//
//  Created by Alvin Escobar on 9/13/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import UIKit

protocol ProductCellDelegate {
    func fillHeartBtn(btn: UIButton)
    func addToCart(item: ProductCell)
}

protocol ProductCellUnfillHeartDelegate {
    func unfillHeartBtn(btn: UIButton)
}

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var heartBtn: UIButton!
    
    var delegate: ProductCellDelegate?
    var heartdelegate: ProductCellUnfillHeartDelegate?
    
    func updateViews(product: Product) {
        productTitle.text = product.title
        productImage.image = UIImage(named: product.imageName)
        productPrice.text = "$\(product.price)"
    }
    
    
    
    @IBAction func pressedHeartBtn(_ sender: UIButton) {
        self.delegate?.fillHeartBtn(btn: heartBtn)
        self.delegate?.addToCart(item: self)
    }
    
    
    
}
