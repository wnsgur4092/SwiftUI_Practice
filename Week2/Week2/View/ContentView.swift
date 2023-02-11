//
//  ContentView.swift
//  Week2
//
//  Created by JunHyuk Lim on 4/2/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            mainHeader
            
            SearchBar()
            
            VStack{
                TodoCell()
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        
    }
    
    //MARK: - COMPONENTS
    fileprivate var mainHeader : some View {
        HStack{
            Text("할일 목록")
            
            Spacer()
            
            Button {
                
            } label: {
                Text("추가")
            }
        }
    }
    
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
