//
//  WebsitTextField.swift
//  Week1
//
//  Created by JunHyuk Lim on 31/1/2023.
//

import SwiftUI

struct WebsitTextField: View {
    //MARK: - PROPERTIES
    var placeholder : String = "SNS 또는 홈페이지를 연결해주세요."
    @State var textFields : [Dictionary<String, String>] = []
    @State var textInTextField : String
    
    @State var isFocusing : Bool
    
    
    @State var firstSnsURL : String = ""
    @State var secondSnsURL : String = ""
    @State var thirdSnsURL : String = ""
    
    
    //MARK: - BODY
    var body: some View {
        VStack {
            ForEach(0..<textFields.count, id: \.self) { index in
                HStack {
                    ZStack {
         
                        
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(.clear)
                            .frame(width: 340, height: 40)
                            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(self.isFocusing ? Color.blue : Color("border"), lineWidth: 1))
                    }
                    Spacer()
                        .frame(width: 30)
                    
                    Button(action: {
                        self.textFields.remove(at: index)
                    }) {
                        Image("trash")
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke( Color("border"), lineWidth: 1).frame(width:40,height:40))
                    }
                }
                .frame(width: .infinity, height: 40)
            }
            
            Button(action: {
                if self.textFields.count < 2 {
                    self.textFields.append([self.placeholder: ""])
                }
            }) {
                Text("+웹사이트 추가")
                    .font(.custom("NanumGothicRegular", size: 12))
                    .padding(.horizontal,16)
            }
        }
        
    }
    
    
    
    var otherTextFields : some View {
        HStack {
            ZStack {
                FirstResponderTextField(text: $secondSnsURL, placeholder: placeholder, font: UIFont(name: "NanumGothicBold", size: 14), isFocused: $isFocusing)
                
                
                
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.clear)
                    .frame(width: 340, height: 40)
                    .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(isFocusing ? Color.blue : Color("border"), lineWidth: 1))
                
            }
            Spacer()
                .frame(width: 30)
            
            Button(action: {
                
            }) {
                Image("trash")
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke( Color("border"), lineWidth: 1).frame(width:40,height:40))
            }
        }
        .frame(width: .infinity, height: 40)
    }
    
    
    
    
    
    
    var firstTextField : some View {
        ZStack {
            FirstResponderTextField(text: $firstSnsURL, placeholder: placeholder, font: UIFont(name: "NanumGothicBold", size: 14), isFocused: $isFocusing)
                .foregroundColor(Color("text"))
                .padding(16)
                .onTapGesture {
                    
                }
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(isFocusing ? Color.blue : Color("border"), lineWidth: 1)
            
        }
    }
}




struct WebsitTextField_Previews: PreviewProvider {
    static var previews: some View {
        WebsitTextField(placeholder: "SNS 또는 홈페이지", textInTextField: "", isFocusing: false)
    }
}

