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
    
    @State var textFields = [String]()
    @State var focused = [Bool]()
    @State var toDelete = [Int]()
    
    
    @State var firstSnsURL : String = ""
    
    @State var secondSnsURL : String = ""
    @State var focusedSecondSnsURL = false
    
    
    @State var isFocusing : Bool = false
    
    @State var thirdSnsURL : String = ""
    @State var focusedThirdSnsURL = false
    
    
    
    var body: some View {
        VStack {
            ForEach(0..<textFields.count, id: \.self) { index in
                otherTextFields(index: index, text: self.$textFields[index], isFocusing: self.$focused[index])
            }
            
            Button(action: {
                self.textFields.append("")
                self.focused.append(false)
            }) {
                Text("Add TextField")
            }
        }
    }
    
    func otherTextFields(index: Int, text : Binding<String>, isFocusing : Binding<Bool>) -> some View {
        HStack {
            ZStack {
                FirstResponderTextField(text: text, placeholder: "Placeholder", font: UIFont(name: "NanumGothicBold", size: 14), isFocused: isFocusing)
                
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.clear)
                    .frame(width: 340, height: 40)
                    .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color("border"), lineWidth: 1))
                
            }
            Spacer()
                .frame(width: 30)
            
            Button(action: {
//                self.toDelete.append(index)
//                self.textFields.remove(atOffsets: self.toDelete)
//                self.focused.remove(atOffsets: self.toDelete)
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
        WebsitTextField()
    }
}

