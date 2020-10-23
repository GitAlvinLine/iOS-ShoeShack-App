//
//  CheckoutProducts.swift
//  ShoeShock
//
//  Created by Alvin Escobar on 9/20/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import Foundation

struct CheckoutProducts {
    private(set) public var title: String
    private(set) public var price: String
    private(set) public var imageName: String
    
    init(title: String, price: String, imageName: String) {
        self.title = title
        self.price = price
        self.imageName = imageName
    }
}
