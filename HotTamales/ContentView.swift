//
//  ContentView.swift
//  HotTamales
//
//  Created by anne WD on 2023/11/06.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var orderManager: OrderManager
    
    @State var name = ""
    var body: some View {
        TabView{
            MenuPage()
                .tabItem{
                    Image(systemName: "cup.and.saucer")
                    Text("Menu")
                }
            OffersPage()
                .tabItem{
                    Image(systemName: "tag")
                    Text("Offers")
                }
            OrderPage()
                .tabItem{
                    Image(systemName: "cart")
                    Text("Orders")
                }
                .badge(orderManager.order.count)
            InfoPage()
                .tabItem {
                    Image(systemName: "info")
                    Text("Info")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(OrderManager())
    }
}
