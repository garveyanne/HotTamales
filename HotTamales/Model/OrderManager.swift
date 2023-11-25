//
//  OrderManager.swift
//  HotTamales
//
//  Created by anne WD on 2023/11/20.
//

import Foundation

class OrderManager: ObservableObject {
    @Published var order: [(Product, Int)] = []
}
