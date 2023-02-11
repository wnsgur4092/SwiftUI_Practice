//
//  TodoCell.swift
//  Week2
//
//  Created by JunHyuk Lim on 11/2/2023.
//

import SwiftUI

struct TodoCell: View {
    var text : String = "오늘도 빡코딩을 한다"
    
    var body: some View {
        HStack {
            HStack{
                //텍스트
                Text(text)
                    .padding(.vertical, 9)
                    .padding(.horizontal, 17)
                
                Spacer()
            } //: 텍스트
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color("gray100"),lineWidth:  1))
            .frame(height: 40)
            
            Spacer()
            
            //삭제 버튼
            Button {
                
            } label: {
                Image("trash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)

            } //: 삭제 버튼

        }
    }
}

struct TodoCell_Previews: PreviewProvider {
    static var previews: some View {
        TodoCell()
    }
}
