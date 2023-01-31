//
//  NumberOfText.swift
//  Week1
//
//  Created by JunHyuk Lim on 31/1/2023.
//

import SwiftUI

struct NumberOfText: View {
    @State var textCount : String
    var totalText : String
    
    var body: some View {
        
        HStack {
            Spacer()
            
            Text("\(textCount) / \(totalText)")
                .font(.system(size:12))
                .foregroundColor(Color("textCount"))
        }
    }
}

struct NumberOfText_Previews: PreviewProvider {
    static var previews: some View {
        NumberOfText(textCount: "0", totalText: "20")
    }
}
