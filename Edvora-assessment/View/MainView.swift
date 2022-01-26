//
//  MainView.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedString = ""
    @State private var showingSortOrder = false
    @State private var filteredArray: [ProductModel] = []
    @State private var showProductSheet: Bool = false
    @State private var showStateSheet: Bool = false
    @State private var showCitySheet: Bool = false

    @Environment(\.presentationMode) var presentationMode

    func getUsersbyState() {
        filteredArray = vm.posts.filter({ (user) in
            user.address.state == selectedString
        })
    }
    
    func getUsersbyCity() {
        filteredArray = vm.posts.filter({ (user) in
            user.address.city == selectedString
        })
    }
    
    func getUsersbyProduct() {
        filteredArray = vm.posts.filter({ (user) in
             user.product_name == selectedString
        })
    }
    
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    
    
    
    
    @StateObject var vm = DataViewModel()
    var body: some View {
       
        NavigationView {
            ZStack{

                Color("darkGrey")
                    .ignoresSafeArea()
                VStack(spacing: 20){
                    HStack {
                        HStack {
                            Menu("Filters") {
                                Button {
                                    showProductSheet.toggle()
                                   
                                } label: {
                                    Text("Product")
                                }
                                Button {
                                    showStateSheet.toggle()
                                } label: {
                                    Text("State")
                                }
                                Button {
                                    showCitySheet.toggle()
                                } label: {
                                    Text("City")
                                }
                                
                            }
                            .font(.title3)
                            .padding()
                    
                          
                            Image(systemName: "arrowtriangle.down.fill")
                                .foregroundColor(.white)
                                .padding(.horizontal)
                        }
                        .background(RoundedRectangle(cornerRadius: 15))
                        Spacer()
                        Button {
                            filteredArray = []
                        } label: {
                            Text("clear filter")
                                .font(.title3)
                                //.foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.black))
                        }

                    }
                    .padding(.horizontal)
                    
               ScrollView{
                    stack
                    stack
                    stack
                }
                }
            //.frame(alignment: .leading)
           
               
            }
            .sheet(isPresented: $showProductSheet, content: {
                productsNameisShowing
            })
            .sheet(isPresented: $showStateSheet, content: {
                productsStateisShowing
            })
            .sheet(isPresented: $showCitySheet, content: {
                productsCityisShowing
            })
            .navigationBarTitle("Edvora")
        }
        
    }
  
    
    //MARK:- Main data which is being presented
    
    private var productsNameisShowing: some View {
        
        VStack {
//            Button("Dismiss") {
//                self.presentationMode.wrappedValue.dismiss()
//            }
//            .foregroundColor(.red)
//            .frame(height: 55)
//            .frame(maxWidth: .infinity)
//            .buttonStyle(.bordered)
            
            List {
                ForEach(vm.posts, id: \.self) { item in
                    Text(item.product_name)
                        .onTapGesture {
                            selectedString = item.product_name
                            getUsersbyProduct()
                            //self.presentationMode.wrappedValue.dismiss()
                            
                        }
                }
                
            }
       
        }
        
    }
    private var productsStateisShowing: some View {
        VStack {
//            Button("Dismiss") {
//                self.presentationMode.wrappedValue.dismiss()
//            }
//            .foregroundColor(.red)
//            .frame(height: 55)
//            .frame(maxWidth: .infinity)
//            .buttonStyle(.bordered)

      
            List {
                ForEach(vm.posts, id: \.self) { item in
                    Text(item.address.state)
                        .onTapGesture {
                            selectedString = item.address.state
                            getUsersbyState()
                            //self.presentationMode.wrappedValue.dismiss()
                        }
                }
                
            }
       
        }
        
    }
     private var productsCityisShowing: some View {
        VStack {
//            Button("Dismiss") {
//                self.presentationMode.wrappedValue.dismiss()
//            }
//            .foregroundColor(.red)
//            .frame(height: 55)
//            .frame(maxWidth: .infinity)
//            .buttonStyle(.bordered)
      
            List {
                ForEach(vm.posts, id: \.self) { item in
                    Text( item.address.city)
                        .onTapGesture {
                            selectedString = item.address.city
                            getUsersbyCity()
                            //self.presentationMode.wrappedValue.dismiss()
                        }
                }
                
            }
       
        }
        
    }
    
    private var stack: some View {
        VStack{
       
            HStack {
                Text("Product Name")
                    .font(.title2)
                .foregroundColor(.white)
                .padding(.horizontal)
                Spacer()
                  
            }
              Rectangle()
                .frame(height: 3)
                .foregroundColor(.gray)
                .padding(.horizontal)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(filteredArray.isEmpty ? vm.posts : filteredArray, id: \.self) { post in
                        
                        ImageRow(model: post)
                            .cornerRadius(15)
                            .padding()
                            
                    }
                }
            }
            Spacer()
       
        }
    }
    
 
    
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            
    }
}
