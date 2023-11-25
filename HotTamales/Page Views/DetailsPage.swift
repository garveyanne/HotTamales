//
//  DetailsPage.swift
//  HotTamales
//
//  Created by anne WD on 2023/11/20.
//

import SwiftUI

struct DetailsPage: View {
    @State var quantity: Int = 1
    @EnvironmentObject var orderManager: OrderManager
    var product: Product
    
    var body: some View {
        ScrollView {
            AsyncImage(url: product.imageURL)
                .frame(width: 300, height: 150)
                .background(Color("AccentColor"))
            Text(product.name)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .padding(24)
            Text(product.description)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .padding(24)
                .foregroundColor(Color("CardBackground"))
            HStack {
                Text("$ \(product.price, specifier: "%.2f")")
                Stepper(value: $quantity, in: 1...10) { }
            }
            .frame(maxWidth: .infinity)
            .padding(30)
            
            Text("Subtotal $\(Double(quantity)*product.price, specifier: "%.2f")")
                .bold()
                .padding(12)
            
            Button("Add \(quantity) to Order") {
                orderManager.add(product: product, quantity: quantity)
            }
            .padding()
            .frame(width: 250.0)
            .background(Color("Alternative2"))
            .foregroundColor(Color.black)
            .cornerRadius(25)
            
        }
    }
}
#Preview {
    DetailsPage(product: Product(id: 1, name: "Coffee", description: "So good", price: 3.55, image: ""))
        .environmentObject(OrderManager())
}
