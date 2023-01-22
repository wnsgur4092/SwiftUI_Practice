//
//  ContentView.swift
//  Week1
//
//  Created by JunHyuk Lim on 22/1/2023.
//

import SwiftUI
import PhotosUI
import UIKit

struct ContentView: View {
    //MARK: - PROPERTIES
    @State var nickname : String = ""
    @State var briefProfile : String = ""
    @State var selfDescription : String = ""
    @State var snsURL : String = ""
    
    @State var textFieldCount = 0
    
    @State var selectedItems : [PhotosPickerItem] = []
    
    @State var showSelection : Bool = false
    
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    
                    //프로필 이미지
                    ZStack {
                        Image("profile")
                            .frame(width: 80, height:80)
                            .padding(.top, 16)
                            .padding(.horizontal, 147.5)
                        
                        Image(systemName: "camera.fill")
                            .renderingMode(.original)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width:13.33,height:12)
                            .background(Circle().fill(Color.blue).frame(width:24,height:24))
                            .offset(x: 30, y: 35)
                    }
                    .onTapGesture {
                        showSelection = true
                    }
                    .confirmationDialog("", isPresented: $showSelection) {
                        Button {
                            
                        } label: {
                            Text("카메라")
                        }
                        
                        Button {

                        } label: {
                            Text("앨범")
                        }
                    }
                    
                    
                    //닉네임
                    VStack(alignment: .leading) {
                        Text("닉네임")
                        TextField("쩡대리", text: $nickname)
                            .textFieldStyle(.roundedBorder)
                        
                        HStack {
                            Spacer()
                            
                            Text("3/20")
                                .font(.system(size:12))
                            
                            
                            
                        }
                        .frame(width: 340, height: 18)
                        
                    }
                    
                    //한 줄 프로필
                    VStack(alignment: .leading) {
                        Text("한 줄 프로필")
                        TextField("자신을 표현할 한 줄 소개입니다.", text: $briefProfile)
                            .textFieldStyle(.roundedBorder)
                        
                        HStack {
                            Spacer()
                            
                            Text("3/20")
                                .font(.system(size:12))
                        }
                        .frame(width: 340, height: 18)
                    }
                    
                    //자기소개
                    VStack(alignment: .leading) {
                        Text("자기소개")
                        TextField("다른 사람에게 나를 소개할 수 있도록 자신의 활동을 자세하게 적어주세요", text: $selfDescription, axis: .vertical)
                            .lineLimit(3)
                            .frame(height: 200, alignment: .top)
                            .padding(16)
                        
                        
                        
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 0.5))
                        
                        HStack {
                            Spacer()
                            
                            Text("3/20")
                                .font(.system(size:12))
                        }
                        .frame(width: 340, height: 18)
                    }
                    
                    //웹사이트
                    VStack(alignment: .leading) {
                        Text("웹사이트 연결")
                        
                        HStack {
                            TextField("SNS 또는 홈페이지를 연결해주세요.", text: $snsURL)
                            
                                .textFieldStyle(.roundedBorder)
                        }
                        
                        ForEach(0..<textFieldCount, id: \.self) { _ in
                            HStack(spacing: 10) {
                                TextField("SNS 또는 홈페이지를 연결해주세요.", text: $snsURL)
                                    .frame(width: 290)
                                    .padding(.vertical, 10)
                                    .padding(.leading, 16)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray, lineWidth: 1).frame(width:290, height: 40))
                                
                                Button {
                                    if self.textFieldCount > 0 {
                                        self.textFieldCount -= 1
                                    }
                                } label: {
                                    Image("trash")
                                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1).frame(width:40,height:40))
                                }
                                
                            }
                            
                            
                        }
                        
                        Button {
                            if self.textFieldCount < 2 {
                                self.textFieldCount += 1
                            }
                        } label: {
                            Text("+웹사이트 추가")
                                .font(.system(size:12))
                        }
                        
                        if textFieldCount == 2 {
                            Text("웹사이트는 3개까지 추가 가능합니다")
                                .foregroundColor(.red)
                        }
                        
                    }
                }
                //네비게이션 바
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Text("저장")
                        }
                        
                    }
                }
            }
        }
    }
}




//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
