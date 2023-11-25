//
//  OrderItem.swift
//  HotTamales
//
//  Created by anne WD on 2023/11/24.
//

import SwiftUI

struct OrderItem: View {
    @EnvironmentObject var orderManager: OrderManager
    var item: (Product, Int)
    
    var body: some View {
        HStack {
            Text("\(item.1)x")
            Text(item.0.name)
            Spacer()
            Text("$\(Double(item.1)*item.0.price, specifier: "%.2f")")
            Image(systemName: "trash")
                .foregroundColor(Color("Ternary"))
                .padding()
                .onTapGesture {
                    orderManager.remove(product: item.0)
                }
        }
    }
}

#Preview {
    OrderItem(item:( (Product(id: 1, name: "COFFEE", description: "", price: 2.55, image: "")), 2))
        .padding()
}
