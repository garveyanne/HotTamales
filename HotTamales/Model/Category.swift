//
//  Category.swift
//  HotTamales
//
//  Created by anne WD on 2023/11/20.
//

import Foundation

struct Category: Decodable, Identifiable {
    var name: String
    var products: [Product]
    var id: String {
        return self.name
    }
}
