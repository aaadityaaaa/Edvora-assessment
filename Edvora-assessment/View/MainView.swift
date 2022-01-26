//
//  MainView.swift
//  Edvora-assessment
//
//  Created by Aaditya Singh on 25/01/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = DataViewModel()
    var body: some View {
       
        NavigationView {
            ZStack{

                Color("darkGrey")
                    .ignoresSafeArea()
                
            VStack{
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(vm.posts, id: \.self) { post in
                            
                            ImageRow(model: post)
                                .cornerRadius(15)
                                .padding()
                        }
                    }
                }
            }
            //.frame(alignment: .leading)
                .navigationBarTitle("Edvora")
               
            }
        }
        
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.light)
    }
}
