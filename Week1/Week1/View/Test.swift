//
//  Test.swift
//  Week1
//
//  Created by JunHyuk Lim on 24/1/2023.
//

import SwiftUI

struct Test: View {
    enum FormFields : Hashable {
        case inputText
        case name
    }
    
    
    @FocusState var focusedField : FormFields?
    
    
    @State var text : String = ""
    @State var focusedTextField : String = ""
    
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                ZStack {
                    TextField("SNS 또는 홈페이지를 연결해주세요.", text: $text)
                        .font(.custom("NanumGothicRegular",size: 14))
                        .padding(24)
                        .onTapGesture {
                            
                            
                            
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(.clear)
                                .frame(width: 290, height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke( Color("border"), lineWidth: 1))
                        }
                    Button {
                        
                    } label: {
                        Image("trash")
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("border"), lineWidth: 1).frame(width:40,height:40))
                    }
                    
                    
                    
                    
                }
            }
            .offset(x: -10, y: 0)
        }
    }
}


struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
