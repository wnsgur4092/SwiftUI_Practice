//
//  TitleOfTextField.swift
//  Week1
//
//  Created by JunHyuk Lim on 31/1/2023.
//

import SwiftUI

struct Title: View {
    var title : String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.custom("NanumGothicBold", size: 16))
        }
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
