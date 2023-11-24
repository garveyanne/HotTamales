//
//  ContentView.swift
//  HotTamales
//
//  Created by anne WD on 2023/11/06.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    var body: some View {
        TabView{
            Text("Welcome")
                .tabItem{
                    Image(systemName: "cup.and.saucer")
                    Text("Home")
                }
            OffersPage()
                .tabItem{
                    Image(systemName: "tag")
                    Text("Offers")
                }
            Text("Order Page")
                .tabItem{
                    Image(systemName: "cart")
                    Text("Orders")
                }
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
