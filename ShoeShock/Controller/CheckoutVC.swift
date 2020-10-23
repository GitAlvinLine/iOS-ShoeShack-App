//
//  CheckoutVC.swift
//  ShoeShock
//
//  Created by Alvin Escobar on 9/20/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import UIKit

class CheckoutVC: UIViewController {
    
    @IBOutlet weak var tableCheckout: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    
    var items: [Product] {
        return DataService.instance.getCart()
    }
    
    private var totalNumbers = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableCheckout.dataSource = self
        tableCheckout.delegate = self
        calculateTotalPrice()
    }
    
    func calculateTotalPrice() {
        var total = 0.0
        for item in items {
            if let price = Double(item.price){
                total += price
            }
        }
        
        let totalDouble = String(format: "%.2f", total)
        totalPrice.text = "$\(totalDouble)"
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "", message: "Your purchase is complete! Thank you! ", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            DataService.instance.removeAllCartItems()
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        present(alert, animated: true)
    }
    
    @IBAction func purchaseBtnTapped(_ sender: UIButton) {
        showAlert()
    }
    
}

extension CheckoutVC: UITableViewDelegate, UITableViewDataSource, CheckoutDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutCell") as? CheckoutCell {
            let item = items[indexPath.row]
            cell.updateViews(checkout: item)
            cell.updateTotalItems(in: items)
            cell.delegate = self
            return cell
        }
        
        return CheckoutCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
    func removeAtCell(btn: UIButton, itemQuantity: Int, itemPrice: Int) {
        let point = btn.convert(CGPoint.zero, to: tableCheckout)
        guard let indexPath = tableCheckout.indexPathForRow(at: point) else {
            return
        }
        
        DataService.instance.removeFromCartAt(index: indexPath.row)
        tableCheckout.deleteRows(at: [indexPath], with: .left)
        
        // update total price after removing a cell
        // loop through all the cells that are still left in the tableview
        // and calculate their price * quantity
        var total = 0.0
        for cell in tableCheckout.visibleCells {
            if let itemcell = cell as? CheckoutCell {
                itemcell.itemPrice.text?.removeFirst()
                if let price = Double(itemcell.itemPrice.text!),
                   let quantity = Double(itemcell.itemQuantity.text!) {
                    total += price * quantity
                }
                itemcell.itemPrice.text?.insert("$", at: itemcell.itemPrice.text!.startIndex)
            }
        }
        
        let totalDouble = String(format: "%.2f", total)
        totalPrice.text = "$\(totalDouble)"

        
    }
    
    func calculateCleatPriceAddingQuantity(btn: UIButton, itemPrice: String) {

        var price = itemPrice
        // remove dollar sign in front of item Price
        price.removeFirst()
        let priceToAdd = Double(price)!
        
        // remove dollar sign in front of totalPrice
        totalPrice.text?.removeFirst()
        
        if let totalIntialPrice = Double(totalPrice.text!) {
            let finalTotal = totalIntialPrice + priceToAdd
            let exactTotal = String(format: "%.2f", finalTotal)
            totalPrice.text = "$\(exactTotal)"
            
            // put the dollar sign back at itemPrice so it won't cause problems
            price.insert("$", at: price.startIndex)
        }
        
    }
    
    func calculateCleatPriceRemovingQuantity(btn: UIButton, itemPrice: String) {
        var price = itemPrice
        // remove dollar sign in front of item Price
        price.removeFirst()
        let priceToAdd = Double(price)!
        
        // remove dollar sign in front of total price
        totalPrice.text?.removeFirst()
        
        if let totalIntialPrice = Double(totalPrice.text!) {
            let finalTotal = totalIntialPrice - priceToAdd
            let exactTotal = String(format: "%.2f", finalTotal)
            totalPrice.text = "$\(exactTotal)"
            
            // put the dollar sign back at itemPrice so it won't cause problems
            price.insert("$", at: price.startIndex)
        }
    }
}
