//
//  NavigationView.swift
//  Week2
//
//  Created by JunHyuk Lim on 6/2/2023.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
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

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
