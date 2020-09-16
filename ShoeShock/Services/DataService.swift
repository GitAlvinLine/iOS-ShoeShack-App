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
        Product(title: "Nike Phantom GT", imageName: "nikePhantomGT.jpg", price: "$250", description: "The Nike Phantom GT Elite FG is a data-driven design engineered for precise attacks. Grippy texture across the Flyknit top and specialized traction on the bottom let you take control of the game." ),
        Product(title: "Nike Tiempo Legend 8", imageName: "tiempoLegend8.jpg", price: "$230", description: "The Nike Tiempo Legend 8 Elite Tech Craft FG gives you excellent touch and control of the ball in wet and dry conditions, thanks to a special finish on the kangaroo leather. The mesh lining hugs your foot for a comfortable feel right out of the box." ),
        Product(title: "Nike Mercurial Superfly 7", imageName: "mercurialSuperfly7.jpg", price: "$275", description: "Building on the 360 innovation of the 6, the Nike Mercurial Superfly 7 Elite FG Cleat adds a Nike Aerotrak zone to the forefoot and a slightly stiffer chassis to help supercharge traction." ),
        Product(title: "Nike Mercurial Vapor 13", imageName: "mercurialVapor13", price: "$117", description: "Building on the 360-degree Flyknit innovation of the 12, the Nike Mercurial Vapor 13 Pro FG adds a Nike Aerotrak zone that grips the tirf to help supercharge the traction."),
        Product(title: "Mercurial Vapor 13 CLUB", imageName: "mercurialVapor13Club", price: "$150", description: "The Nike Mercurial Vapor 13 Club MG wraps your foot for streamlined speed. A versatile multi-ground plate provides traction on natural and artificial grass surfaces." ),
        Product(title: "Nike Mercurial Vapor 13 CR7 Safari", imageName: "mercurialVapor13CR7Safari", price: "$260", description: "The Nike Mercurial Vapor 13 Elite CR7 Safari brings back an iconic colorway while wrapping your foot in high-tenacity yarn for streamlined speed.The treated surface means you get reliable touch in wet or dry conditions."),
        Product(title: "Nike Mercurial 13 Elite Mbappe Rosa", imageName: "mercurialVapor13EliteMbappéRosa", price: "$270", description: "The Nike Mercurial Vapor 13 Elite Mbappe Rosa borrows design details from the Mercurial Superfly 4. A strechy material wraps your foot for support, while specialized traction is designed to wear on firm-ground fields."),
        Product(title: "Nike Mercurial Vapor 13 Neymar Jr.", imageName: "mercurialVapor13NeymarJr.jpg", price: "$270", description: "The NIke Mercurial Vapor 13 Elite Neymar Jr. adds a Nike Aerotrak zone to the forefoot and a slightly stiffer chassis to help supercharge traction. Inside, an insole with NikeGrip technology provides maximum interior traction underfoot and lightwieght cushioning.")
        
    ]
    
    func getProducts() -> [Product] {
        return products
    }
    
}
