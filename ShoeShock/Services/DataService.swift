//
//  DataService.swift
//  ShoeShock
//
//  Created by Alvin Escobar on 9/13/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private var products: [Product] = [
        Product(title: "Nike Phantom GT", imageName: "nikePhantomGT.jpg", price: "$250"),
        Product(title: "Nike Tiempo Legend 8", imageName: "tiempoLegend8.jpg", price: "$230"),
        Product(title: "Nike Mercurial Superfly 7", imageName: "mercurialSuperfly7.jpg", price: "$275"),
        Product(title: "Nike Mercurial Vapor 13", imageName: "mercurialVapor13", price: "$117"),
        Product(title: "Mercurial Vapor 13 CLUB", imageName: "mercurialVapor13Club", price: "$150"),
        Product(title: "Nike Mercurial Vapor 13 CR7 Safari", imageName: "mercurialVapor13CR7Safari", price: "$260"),
        Product(title: "Nike Mercurial 13 Elite Mbappe Rosa", imageName: "mercurialVapor13EliteMbappéRosa", price: "$270"),
        Product(title: "Nike Mercurial Vapor 13 Neymar Jr.", imageName: "mercurialVapor13NeymarJr.jpg", price: "$270")
        
    ]
    
    func getProducts() -> [Product] {
        return products
    }
}
