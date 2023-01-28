//
//  ContentView.swift
//  Week1
//
//  Created by JunHyuk Lim on 22/1/2023.
//

import SwiftUI
import PhotosUI
import UIKit
import Combine

struct ContentView: View {
    //MARK: - PROPERTIES
    @ObservedObject var vm = ViewModel()
    
    //웹사이트 파트
    @State var snsURL : String = ""
    @State var secondSnsURL : String = ""
    @State var thirdSnsURL : String = ""
    @State var textFieldCount = 0

    @State var showText = false
    
    @State var text : String = ""

    
    @State var textFields = [String](repeating: "", count: 2)
    @State var showMaxLimit = false
    
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                //프로필 이미지
                ZStack {
                    vm.image!
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 0.5))
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
                .onTapGesture(perform: {
                    vm.presentedActionSheet = true
                })
                
                .sheet(isPresented: $vm.presentImagePicker, content: {
                    SUImagePickerView(sourceType: vm.presentCamera ? .camera : .photoLibrary, image: $vm.image, isPresented: $vm.presentImagePicker)
                })
                
                
                
                .actionSheet(isPresented: $vm.presentedActionSheet) {
                    ActionSheet(title: Text(""), buttons:[
                        .default(Text("카메라")) {
                            vm.presentImagePicker = true
                            vm.presentCamera = true
                        },
                        .default(Text("앨범")) {
                            vm.presentImagePicker = true
                            vm.presentCamera = false
                        },
                        .cancel()])
                }
                
                
                
                
                
                
                
                VStack{
                    //닉네임
                    VStack(alignment: .leading, spacing: 10) {
                        Text("닉네임").font(.custom("NanumGothicBold", size: 16))
                        
                        ZStack {
                            TextField("쩡대리", text: $vm.nickName)
                                .font(.custom("NanumGothicRegular",size: 14))
                                .padding(16)
                            
                                .onTapGesture {
                                    
                                }
                            
                            
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color("border"), lineWidth: 1)
                                .frame(width: 340, height: 52)
                        }
                        
                        
                        HStack {
                            Spacer()
                            
                            Text("\(vm.nickNameCounted) / 20")
                                .font(.custom("NanumGothicRegular", size: 12))
                                .foregroundColor(Color("textCount"))
                        }
                    }
                    
                    
                    //한 줄 프로필
                    VStack(alignment: .leading, spacing: 10) {
                        Text("한 줄 프로필")
                            .font(.custom("NanumGothicBold", size: 16))
                        ZStack {
                            TextField("자신을 표현할 한 줄 소개입니다.", text: $vm.briefProfile)
                                .font(.custom("NanumGothicRegular",size: 14))
                                .padding(16)
                                .onTapGesture {
                                    
                                }
                            
                            
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color("border"), lineWidth: 1)
                                .frame(width: 340, height: 52)
                            
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text("\(vm.briefProfileCounted) / 20")
                                .font(.system(size:12))
                                .foregroundColor(Color("textCount"))
                        }
                        
                    }
                    
                    
                    
                    
                    //자기소개
                    VStack(alignment: .leading, spacing: 10) {
                        Text("자기소개")
                            .font(.custom("NanumGothicBold", size: 16))
                        
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 8).stroke( Color("border"), lineWidth: 1)
                            if text.isEmpty {
                                Text("다른 사람에게 나를 소개할 수 있도록\n자신의 활동을 자세하게 적어주세요")
                                    .padding(16)
                                    .offset(x:6, y: 7)
                                    .zIndex(1)
                                    .foregroundColor(Color("placeholder"))
                                    .font(.custom("NanumGothicRegular",size: 14))
                                    .lineSpacing(10)
                                    .frame(width: 340, height: 200, alignment: .topLeading)
                            }
                            
                            TextEditor(text: $text)
                                .font(.custom("NanumGothicRegular",size: 14))
                                .padding(16)
                                .frame(width: 340, height: 200)
                            
                            
                            
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text("\(vm.selfDescriptionCounted) / 1000")
                                .font(.system(size:12))
                                .foregroundColor(Color("textCount"))
                        }
                        .frame(width: 340, height: 18)
                    }
                    
                    //웹사이트
                    VStack(alignment: .leading) {
                        //첫번째 웹사이트
                        Text("웹사이트 연결")
                            .font(.custom("NanumGothicBold", size: 16))
                        ZStack {
                            TextField("SNS 또는 홈페이지를 연결해주세요.", text: $snsURL)
                                .font(.custom("NanumGothicRegular",size: 14))
                                .padding(16)
                                .onTapGesture {
                                    
                                }
                            
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color("border"), lineWidth: 1)
                                .frame(width: 340, height: 40)
                            
                        }
                        
                        
                        //두번째 & 세번째 웹사이트
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(0..<textFieldCount, id: \.self) { i in
                                HStack(spacing: 10) {
                                    ZStack {
                                        TextField("SNS 또는 홈페이지를 연결해주세요.", text: $text)
                                            .font(.custom("NanumGothicRegular",size: 14))
                                            .padding(.horizontal,24)
                                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                                            .fill(.clear)
                                            .frame(width: 290, height: 40)
                                            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke( Color("border"), lineWidth: 1))
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
                                    .font(.custom("NanumGothicRegular", size: 12))
                                    .padding(.horizontal,16)
                            }
                            
                            
                            Text("웹사이트는 3개까지 추가 가능합니다")
                                .font(.custom("NaumGothicRegular", size: 12))
                                .foregroundColor(.red)
                                .opacity(self.showMaxLimit ? 1 : 0)
                                .padding(.horizontal, 16)
            
                        }
                        .offset(x: -10, y: 0)
                    }
                }
                
                
                .padding(.top, 24)
                .padding(.horizontal, 17.5)
                //네비게이션 바
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 13, height: 11)
                                .foregroundColor(.black)
                            
                                .padding(.vertical, 13)
                                .padding()
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Text("저장")
                                .font(.custom("NaumGothicRegular ", size: 16))
                            
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
