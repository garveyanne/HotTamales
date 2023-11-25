//
//  HotTamalesApp.swift
//  HotTamales
//
//  Created by anne WD on 2023/11/06.
//

import SwiftUI

@main
struct HotTamalesApp: App {
    var menuManager = MenuManager()
    var orderManager = OrderManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(menuManager)
                .environmentObject(orderManager)
        }
    }
}

