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
    @State var textFieldCount = 0
    @State var textFields = [String]()
    @State var showText = false
    

    @State var focusedTextField : String = ""

    
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
                                    self.focusedTextField = "nickName"
                                }
                            
                            
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(.clear)
                                .frame(width: 340, height: 52)
                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(focusedTextField == "nickName" ? Color.blue : Color("border"), lineWidth: 1))
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
                                    self.focusedTextField = "profile"
                                }
                            
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(.clear)
                                .frame(width: 340, height: 52)
                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(focusedTextField == "profile" ? Color.blue : Color("border"), lineWidth: 1))
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
                        ZStack {
                            TextField("다른 사람에게 나를 소개할 수 있도록\n자신의 활동을 자세하게 적어주세요", text: $vm.selfDescription)
                                .font(.custom("NanumGothicRegular",size: 14))
                                .frame(width: 308, height: 168, alignment: .top)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .onTapGesture {
                                    self.focusedTextField = "description"
                                }
                            
                            
                            
                            
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(.clear)
                                .frame(width: 340, height: 200)
                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(focusedTextField == "description" ? Color.blue : Color("border"), lineWidth: 1))
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
                    VStack(alignment: .leading, spacing: 10) {
                        Text("웹사이트 연결")
                            .font(.custom("NanumGothicBold", size: 16))
                        ZStack {
                            TextField("SNS 또는 홈페이지를 연결해주세요.", text: $snsURL)
                                .font(.custom("NanumGothicRegular",size: 14))
                                .padding(16)
                                .onTapGesture {
    
                                    self.focusedTextField = "website"
                                }
                            
                            
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(.clear)
                                .frame(width: 340, height: 40)
                                .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(focusedTextField == "website" ? Color.blue : Color("border"), lineWidth: 1))
                        }
                        
                        VStack(spacing: 0) {
                            ForEach(0..<textFields.count, id: \.self) { index in
                                HStack(spacing: 10) {
                                    ZStack {
                                        TextField("SNS 또는 홈페이지를 연결해주세요.", text: self.$textFields[index])
                                            .font(.custom("NanumGothicRegular",size: 14))
                                            .padding(24)
                                            .onTapGesture {
                                                self.focusedTextField = String(index)
                                            }
                                        
                                        
                                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                                            .fill(.clear)
                                            .frame(width: 290, height: 40)
                                            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(focusedTextField == String(index) ? Color.blue : Color("border"), lineWidth: 1))
                                    }
                                    
                                    Button {
                                        if self.textFields.count > 0 {
                                            self.textFields.removeLast()
                                            
                                            self.showText = false
                                        }
                                        
                                        print(showText)
                                    } label: {
                                        Image("trash")
                                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("border"), lineWidth: 1).frame(width:40,height:40))
                                    }
                                    
                                }
                            }
                            .offset(x: -10, y: 0)
                        }
                        
                        Button {
                            if self.textFields.count < 2 {
                                self.textFields.append("")
                            }
                            
                            else {
                                self.showText = true
                            }
                            
                            print(showText)
                            
                        } label: {
                            Text("+웹사이트 추가")
                                .font(.custom("NanumGothic", size: 12))
                            
                        }
                        .onTapGesture {
                            if self.textFields.count == 2 {
                                self.showText.toggle()
                            }
                        }
                        
                        if showText == true {
                            Text("웹사이트는 3개까지 추가 가능합니다")
                                .font(.custom("NaumGothic", size: 12))
                                .foregroundColor(.red)
                        } else {
                            Text("")
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
