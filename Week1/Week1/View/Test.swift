//
//  Test.swift
//  Week1
//
//  Created by JunHyuk Lim on 24/1/2023.
//

import SwiftUI

struct Test: View {
    
    @State var text = ""
    @State var textFieldCount = 0
    @State var textFields = [String](repeating: "", count: 2)
    @State var showMaxLimit = false
    @State var focusedTextField = -1
    
    var body: some View {
        
        
        VStack {
            ForEach(0..<textFieldCount, id: \.self) { i in
                HStack(spacing: 10) {
                    ZStack {
                        TextField("SNS 또는 홈페이지를 연결해주세요.", text: $text, onEditingChanged: { isEditing in
                            if isEditing {
                                self.focusedTextField = i
                            } else {
                                self.focusedTextField = -1
                            }
                        })
                        .font(.custom("NanumGothicRegular",size: 14))
                        .padding(.horizontal,24)

                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(.clear)
                            .frame(width: 290, height: 40)
                            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(self.focusedTextField == i ? Color.blue : Color("border"), lineWidth: 1))
                    }
                    
                    Button(action: {
                        self.textFieldCount -= 1
                        self.showMaxLimit = false
                    }) {
                        Image("trash")
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("border"), lineWidth: 1).frame(width:40,height:40))
                    }
                }
            }
            
            Button(action: {
                if self.textFieldCount == 2 {
                    self.showMaxLimit = true
                } else {
                    self.textFieldCount += 1
                    self.textFields.append("")
                }
            }) {
                Text("+웹사이트 추가")
                    .font(.custom("NanumGothic", size: 12))
            }
            
            
            Text("웹사이트는 3개까지 추가 가능합니다")
                .font(.custom("NaumGothic", size: 12))
                .opacity(self.showMaxLimit ? 1 : 0)
        }
    }
}


struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
