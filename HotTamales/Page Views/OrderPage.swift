//
//  OrderPage.swift
//  HotTamales
//
//  Created by anne WD on 2023/11/20.
//

import SwiftUI

struct OrderPage: View {
    
    @EnvironmentObject var menuManager: MenuManager
    @EnvironmentObject var orderManager: OrderManager
    
    @AppStorage("name") var name = ""
    @AppStorage("phone") var phone = ""
    
    @State var orderConfirmed = false

    var body: some View {
        
        NavigationView {
            if $orderManager.order.count == 0 {
                Text("Your order is empty")
                    .navigationTitle("Your Order")
            } else {
                List {
                    Section("ITEMS") {
                        ForEach(orderManager.order, id:\.0.id) { item in
                            OrderItem()
                        }
                    }.listRowBackground(Color("Background"))
                                        
                    Section("YOUR DETAILS") {
                        VStack {
                            TextField("Your Name", text: $name)
                                .textFieldStyle(.roundedBorder)
                            Spacer().frame(height: 20)
                            TextField("Your Phone #", text: $phone)
                                .keyboardType(.phonePad)
                                .textFieldStyle(.roundedBorder)
                        }.padding(.top)
                         .padding(.bottom)
                    }.listRowBackground(Color("Background"))
                    
                    Section() {
                        HStack {
                            Spacer()
                            Text("Total")
                            Spacer()
//                            Text("$ \(orderManager.total(), specifier: "%.2f")")
//                                .bold()
//                            Spacer()
                        }
                    }.listRowBackground(Color.clear)
                    
                    Section {
                        HStack {
                            Spacer()
                            Button("Place Order") {
                                //TODO: Validation
                                orderConfirmed = true
                            }
                                .padding()
                                .frame(width: 250.0)
                                .background(Color("Alternative2"))
                                .foregroundColor(Color.black)
                                .cornerRadius(25)
                                
                            Spacer()
                        }
                    }.listRowBackground(Color.clear)
                }
                .listSectionSeparatorTint(Color("AccentColor"))
                .listStyle(.insetGrouped)
                .navigationTitle("Your Order")
                .alert("Order", isPresented: $orderConfirmed, actions: {
                    Button("OK", role: .cancel) {
                        //TODO: send order
                        orderConfirmed = false
//                        $orderManager.clear
                    }
                }, message: {
                    Text("Your order is being prepared.")
                        .font(.title)
                })
            }
        }
    }
}

#Preview {
    OrderPage()
        .environmentObject(OrderManager())
}
