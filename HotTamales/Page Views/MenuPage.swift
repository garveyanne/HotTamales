//
//  MenuPage.swift
//  HotTamales
//
//  Created by anne WD on 2023/11/20.
//

import SwiftUI

struct MenuPage: View {
    @EnvironmentObject var menuManager: MenuManager
    var body: some View {
        NavigationView{
            List{
                ForEach(menuManager.menu) { category in
                    Text(category.name)
                    
                    ForEach(category.products) { product in
                        NavigationLink {
                            DetailsPage()
                        } label: {
                            ProductItem(product: product)
                        }
                    }
                   
                }
            }.navigationTitle("Products")
        }
    }
}

#Preview {
    MenuPage().environmentObject(MenuManager())
}
