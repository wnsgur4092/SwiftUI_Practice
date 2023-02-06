//
//  ContentView.swift
//  Week2
//
//  Created by JunHyuk Lim on 4/2/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            NavigationView()
                .padding(16)
            
            SearchView()
            
        }
        
    }
}

//MARK: - COMPONENTS



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
