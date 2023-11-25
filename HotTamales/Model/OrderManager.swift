//
//  OrderManager.swift
//  HotTamales
//
//  Created by anne WD on 2023/11/20.
//

import Foundation

class OrderManager: ObservableObject {
    @Published var order: [(Product, Int)] = []
    
    func add(product: Product, quantity: Int){
        self.order.append( (product, quantity) )
    }
    
    func remove(product: Product) {
        self.order.removeAll { itemInCart in
            return itemInCart.0.id==product.id
        }
    }
}
