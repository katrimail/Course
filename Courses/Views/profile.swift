//
//  profile.swift
//  Courses
//
//  Created by Катрин Маилян on 26.12.2020.
//

import SwiftUI
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

struct profile: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var delegate 
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [Color("Color-3"), Color("Color")]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
            if UIScreen.main.bounds.height > 800{
            Homes()
            }
            else{
                ScrollView(.vertical, showsIndicators: false){
                    Homes()
                }
            }

        }
    }
}

struct profile_Previews: PreviewProvider {
    static var previews: some View {
        profile()
    }
}

struct Homes: View {
    @State var index = 0
//    @ObservedObject var info : AppDelegate
    var body: some View{
        VStack{
            Image("1")
                .resizable()
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(100)
                .opacity(0.7)
           
            HStack{
                Button(action: {
                    
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                        
                        self.index = 0
                    }
                }) {
                    Text("Ученик")
                        .foregroundColor(self.index == 0 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50)/3)
                }
                .background(self.index == 0 ? Color.white : Color.clear)
                .clipShape(Capsule())
                
                Button(action: {
                    
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                        
                        self.index = 1
                    }
                }) {
                    Text("Родитель")
                        .foregroundColor(self.index == 1 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50)/3)
                }
                .background(self.index == 1 ? Color.white : Color.clear)
                .clipShape(Capsule())
                
                Button(action: {
                    
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){
                        
                        self.index = 2
                    }
                }) {
                    Text("Учитель")
                        .foregroundColor(self.index == 2 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50)/3)
                }
                .background(self.index == 2 ? Color.white : Color.clear)
                .clipShape(Capsule())
            }
            .background(Color.black.opacity(0.1))
            .clipShape(Capsule())
            .padding(.top, 25)
            if index == 0{
                Login()
            }
            else if index == 1{
                SignUp()
                HStack{
                Text("Нет аккаунта?")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Button(action:{
                    
                }) {
                    Text("Регистрация")
                        .foregroundColor(.blue)
                        .fontWeight(.semibold)
                        .padding(1)
                    
                }
//                .padding(.top, 20)
            }.padding(.top, 20)
            }
            else{
                teacher()
                HStack{
                Text("Нет аккаунта?")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Button(action:{
                    
                }) {
                    Text("Регистрация")
                        .foregroundColor(.blue)
                        .fontWeight(.semibold)
                        .padding(1)
                    
                }
//                .padding(.top, 20)
            }.padding(.top, 20)
            }
            if index == 0{
                HStack{
                Text("Нет аккаунта?")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Button(action:{
                    
                }) {
                    Text("Регистрация")
                        .foregroundColor(.blue)
                        .fontWeight(.semibold)
                        .padding(1)
                    
                }
//                .padding(.top, 20)
            }.padding(.top, 20)
            }
            HStack(spacing: 15){
                Color.white.opacity(0.7)
                    .frame(width: 35, height: 1)
                Text("или")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Color.white.opacity(0.7)
                    .frame(width: 35, height: 1)
            }
            .padding(.top, 10)
            
            HStack{
                Button(action:{})
                    {
                    Image("facebook")
                        .renderingMode(.original)
//                        .padding(10)
                        .frame(width: 50, height: 50)
                }
                .background(Color.white)
                .clipShape(Circle())
                
                Button(action:{
                    GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                    
                    GIDSignIn.sharedInstance()?.signIn()
                })
                    {
                    Image("google")
                        .renderingMode(.original)
//                        .padding(10)
//                        .frame(width: 50, height: 50)
                }
                .background(Color.white)
                .clipShape(Circle())
                .padding(.leading, 25)
                
                    
            }
            .padding(.top, 10)
        }
        .padding()
    }
}

struct Login: View {
    @State var mail = ""
    @State var pass = ""
    var body: some View{
        VStack{
            HStack(spacing: 15){
                Image(systemName: "envelope")
                    .foregroundColor(.black)
                TextField("Электрольная почта", text: $mail)
            }
            .padding(.vertical, 20)
            Divider()
            
            HStack(spacing: 15){
                Image(systemName: "lock")
                    .resizable()
                    .frame(width: 15, height: 18)
                    .foregroundColor(.black)
                SecureField("Пароль", text: $pass)
                
                Button(action: {
                }) {
                    Image(systemName: "eye")
                        .foregroundColor(.black)
                }
            }
            .padding(.vertical, 20)
        }
        .padding(.vertical)
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.top, 25)
        
        Button(action:{
        }) {
            Text("Войти")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 100)
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color-3")]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(8)
        .offset(y: -25)
        .padding(.bottom, -40)
        .shadow(radius: 15)
    }
}

struct SignUp : View {
      
      @State var mail = ""
      @State var pass = ""
      @State var repass = ""
      
      var body : some View{
          
          VStack{
              
              VStack{
                  
                  HStack(spacing: 15){
                      
                      Image(systemName: "envelope")
                          .foregroundColor(.black)
                      
                      TextField("Электронная почта", text: self.$mail)
                      
                  }.padding(.vertical, 20)
                  
                  Divider()
                  
                  HStack(spacing: 15){
                      
                      Image(systemName: "lock")
                      .resizable()
                      .frame(width: 15, height: 18)
                      .foregroundColor(.black)
                      
                      SecureField("Пароль", text: self.$pass)
                      
                      Button(action: {
                          
                      }) {
                          
                          Image(systemName: "eye")
                              .foregroundColor(.black)
                      }
                      
                  }.padding(.vertical, 20)
                  
                  Divider()
                  
                  HStack(spacing: 15){
                      
                      Image(systemName: "lock")
                      .resizable()
                      .frame(width: 15, height: 18)
                      .foregroundColor(.black)
                      
                      SecureField("Повторите пароль", text: self.$repass)
                      
                      Button(action: {
                          
                      }) {
                          
                          Image(systemName: "eye")
                              .foregroundColor(.black)
                      }
                      
                  }.padding(.vertical, 20)
                  
              }
              .padding(.vertical)
              .padding(.horizontal, 20)
              .padding(.bottom, 40)
              .background(Color.white)
              .cornerRadius(10)
              .padding(.top, 25)
              
              
              Button(action: {
                  
              }) {
                  
                  Text("Войти")
                      .foregroundColor(.white)
                      .fontWeight(.bold)
                      .padding(.vertical)
                      .frame(width: UIScreen.main.bounds.width - 100)
                  
              }.background(
              
                  LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color-3")]), startPoint: .leading, endPoint: .trailing)
              )
              .cornerRadius(8)
              .offset(y: -40)
              .padding(.bottom, -40)
              .shadow(radius: 15)
          }
      }
  }

struct teacher : View {
      
      @State var mail = ""
      @State var pass = ""
      @State var repass = ""
      
      var body : some View{
          
          VStack{
              
              VStack{
                  
                  HStack(spacing: 15){
                      
                      Image(systemName: "envelope")
                          .foregroundColor(.black)
                      
                      TextField("Электронная почта", text: self.$mail)
                      
                  }.padding(.vertical, 20)
                  
                  Divider()
                  
                  HStack(spacing: 15){
                      
                      Image(systemName: "lock")
                      .resizable()
                      .frame(width: 15, height: 18)
                      .foregroundColor(.black)
                      
                      SecureField("Пароль", text: self.$pass)
                      
                      Button(action: {
                          
                      }) {
                          
                          Image(systemName: "eye")
                              .foregroundColor(.black)
                      }
                      
                  }.padding(.vertical, 20)
                  
                  Divider()
                  
                  HStack(spacing: 15){
                      
                      Image(systemName: "lock")
                      .resizable()
                      .frame(width: 15, height: 18)
                      .foregroundColor(.black)
                      
                      SecureField("Повторите пароль", text: self.$repass)
                      
                      Button(action: {
                          
                      }) {
                          
                          Image(systemName: "eye")
                              .foregroundColor(.black)
                      }
                      
                  }.padding(.vertical, 20)
                  
              }
              .padding(.vertical)
              .padding(.horizontal, 20)
              .padding(.bottom, 40)
              .background(Color.white)
              .cornerRadius(10)
              .padding(.top, 25)
              
              
              Button(action: {
                  
              }) {
                  
                  Text("Войти")
                      .foregroundColor(.white)
                      .fontWeight(.bold)
                      .padding(.vertical)
                      .frame(width: UIScreen.main.bounds.width - 100)
                  
              }.background(
              
                  LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color-3")]), startPoint: .leading, endPoint: .trailing)
              )
              .cornerRadius(8)
              .offset(y: -40)
              .padding(.bottom, -40)
              .shadow(radius: 15)
          }
      }
  }
