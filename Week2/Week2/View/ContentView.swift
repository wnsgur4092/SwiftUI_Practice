//
//  ContentView.swift
//  Week2
//
//  Created by JunHyuk Lim on 4/2/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("할일 목록")
            }
            navigationTitle("할 일 목록")
        }
        .navigationBarTitleDisplayMode(.large)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
