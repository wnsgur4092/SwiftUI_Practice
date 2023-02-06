//
//  SearchView.swift
//  Week2
//
//  Created by JunHyuk Lim on 6/2/2023.
//

import SwiftUI

struct SearchView: View {
    @State var text : String = ""
    
    var body: some View {
        ZStack {
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("gray300"))
                
                TextField("할일을 검색해 보세요", text: $text)
                    .foregroundColor(Color("gray300"))
            }
            .border(Color.black)
             
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
