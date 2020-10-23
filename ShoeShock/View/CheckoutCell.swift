//
//  CheckoutCell.swift
//  ShoeShock
//
//  Created by Alvin Escobar on 9/20/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import UIKit

protocol CheckoutDelegate {
    func removeAtCell(btn: UIButton, itemQuantity: Int, itemPrice: Int)
    func calculateCleatPriceAddingQuantity(btn: UIButton, itemPrice: String)
    func calculateCleatPriceRemovingQuantity(btn: UIButton, itemPrice: String)
}

class CheckoutCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemQuantity: UILabel!
    @IBOutlet weak var totalItems: UILabel!
    
    var delegate: CheckoutDelegate?
    
    func updateViews(checkout: Product) {
        itemTitle.text = checkout.title
        itemPrice.text = "$\(checkout.price)"
        itemImage.image = UIImage(named: checkout.imageName)
    }
    
    func updateTotalItems(in cart: [Product]) {
        totalItems.text = "Total items \(cart.count)"
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        var itemCount = Int(itemQuantity.text!)
        itemCount! -= 1
        var item = itemPrice.text
        item?.removeFirst()
        let itemTotal = Int(item!)!
        if (itemCount == 0) {
            // remove from tableview
            self.delegate?.removeAtCell(btn: sender, itemQuantity: itemCount!, itemPrice: itemTotal)
            updateTotalItems(in: DataService.instance.getCart())
        } else {
            itemQuantity.text = String(itemCount!)
            // Call an updateView for calculating totalPrice
            self.delegate?.calculateCleatPriceRemovingQuantity(btn: sender, itemPrice: itemPrice.text!)
            
        }
        
    }
    
    @IBAction func plusBtn(_ sender: UIButton) {
        var itemAmount = Int(itemQuantity.text!)
        itemAmount! += 1
        itemQuantity.text = String(itemAmount!)
        // Call an updateView for calculating totalPrice
        self.delegate?.calculateCleatPriceAddingQuantity(btn: sender, itemPrice: itemPrice.text!)
    }


}
