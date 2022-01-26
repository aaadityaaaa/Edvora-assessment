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

    @Environment(\.presentationMode) private var presentationMode

    func getUsersbyState() {
        filteredArray = vm.posts.filter({ (user) in
            return user.address.state == selectedString
        })
    }
    
    func getUsersbyCity() {
        filteredArray = vm.posts.filter({ (user) in
            return user.address.city == selectedString
        })
    }
    
    func getUsersbyProduct() {
        filteredArray = vm.posts.filter({ (user) in
            return user.product_name == selectedString
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
                            //somehting will come here
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
            .navigationBarTitle("Edvora")
            .actionSheet(isPresented: $showingSortOrder) {
                ActionSheet(title: Text("Sort items"), message: nil, buttons: [
                    .default(Text("Product")) { showProductSheet.toggle()
                        presentationMode.wrappedValue.dismiss()
                    },
                    .default(Text("State")) { showStateSheet.toggle()
                        presentationMode.wrappedValue.dismiss()

                    },
                    .default(Text("City")) { showCitySheet.toggle()
                        presentationMode.wrappedValue.dismiss()

                    }
                ])

            }
            //now i need to add 3 more action sheets in order to show the stuff
            
            
            
        }
        
    }
    
    //MARK:- Main data which is being presented
    
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
                    ForEach(vm.posts, id: \.self) { post in
                        
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
