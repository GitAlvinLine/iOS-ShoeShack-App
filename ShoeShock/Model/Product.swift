//
//  Cleat.swift
//  ShoeShock
//
//  Created by Alvin Escobar on 9/13/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import Foundation

struct Product {
    private(set) public var title: String
    private(set) public var imageName: String
    private(set) public var price: String
    private(set) public var description: String
    
    init(title: String, imageName: String, price: String, description: String) {
        self.title = title
        self.imageName = imageName
        self.price = price
        self.description = description
    }
}
