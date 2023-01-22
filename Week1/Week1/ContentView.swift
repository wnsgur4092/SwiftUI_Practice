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
                
                VStack{
                    //닉네임
                    VStack(alignment: .leading, spacing: 10) {
                        Text("닉네임").font(.custom("NanumGothic-Bold", size: 16))
                        
                        ZStack {
                            TextField("쩡대리", text: $nickname)
                                .font(.custom("NanumGothic-Regular",size: 14))
                                .padding(16)
                            
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(.clear)
                                .frame(width: 340, height: 52)
                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color.black, lineWidth: 1))
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text("3 / 20")
                                .font(.custom("NanumGothic-Regular", size: 12))
                        }
                    }
                    
                    
                    //한 줄 프로필
                    VStack(alignment: .leading, spacing: 10) {
                        Text("한 줄 프로필")
                        ZStack {
                            TextField("자신을 표현할 한 줄 소개입니다.", text: $briefProfile)
                                .font(.custom("NanumGothic-Regular",size: 14))
                                .padding(16)
                            
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(.clear)
                                .frame(width: 340, height: 52)
                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color.black, lineWidth: 1))
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text("0 / 20")
                                .font(.system(size:12))
                        }
                        
                    }
                    
                    
                    //자기소개
                    VStack(alignment: .leading, spacing: 10) {
                        Text("자기소개")
                        
                        ZStack {
                            TextField("다른 사람에게 나를 소개할 수 있도록 자신의 활동을 자세하게 적어주세요", text: $selfDescription, axis: .vertical)
                                .font(.custom("NanumGothic-Regular",size: 14))
                                .padding(16)
                            
                            
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(.clear)
                                .frame(width: 340, height: 200)
                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color.black, lineWidth: 1))
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text("0 / 1000")
                                .font(.system(size:12))
                        }
                        .frame(width: 340, height: 18)
                    }
                    
                    //웹사이트
                    VStack(alignment: .leading, spacing: 0) {
                        Text("웹사이트 연결")
                        
                        ZStack {
                            TextField("SNS 또는 홈페이지를 연결해주세요.", text: $snsURL)
                                .font(.custom("NanumGothic-Regular",size: 14))
                                .padding(16)
                            
                            
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(.clear)
                                .frame(width: 340, height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color.black, lineWidth: 1))
                        }
                        
                        VStack(spacing: 10) {
                            ForEach(0..<textFieldCount, id: \.self) { _ in
                                HStack(spacing: 10) {
                                    ZStack {
                                        TextField("SNS 또는 홈페이지를 연결해주세요.", text: $snsURL)
                                            .font(.custom("NanumGothic-Regular",size: 14))
                                            .padding(24)
                                        
                                        
                                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                                            .fill(.clear)
                                            .frame(width: 290, height: 40)
                                            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color.black, lineWidth: 1))
                                    }

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
                            .offset(x: -10, y: 0)
                        }
                        
                        Button {
                            if self.textFieldCount < 2 {
                                self.textFieldCount += 1
                            }
                        } label: {
                            Text("+웹사이트 추가")
                            .font(.custom("NanumGothic", size: 12))                        }
                        
                        if textFieldCount == 2 {
                            Text("웹사이트는 3개까지 추가 가능합니다")
                                .foregroundColor(.red)
                        }
                        
                    }
                }
                .padding(.horizontal, 17.5)
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
