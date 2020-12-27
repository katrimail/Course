//
//  profile.swift
//  Courses
//
//  Created by Катрин Маилян on 26.12.2020.
//

import SwiftUI

struct profile: View {
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
            
            //        .background(Color("Color"))
            //        .ignoresSafeArea(.all)
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
            }
            else{
                teacher()
            }
            if index == 0{
                Button(action:{
                    
                }) {
                    Text("Forget Password?")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(5)
                }
                .padding(.top, 20)
            }
            HStack(spacing: 15){
                Color.white.opacity(0.7)
                    .frame(width: 35, height: 1)
                Text("OR")
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
                        .padding(10)
                }
                .background(Color.white)
                .clipShape(Circle())
                
                Button(action:{})
                    {
                    Image("google")
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .padding(10)
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
                TextField("Enter Email Address", text: $mail)
            }
            .padding(.vertical, 20)
            Divider()
            
            HStack(spacing: 15){
                Image(systemName: "lock")
                    .resizable()
                    .frame(width: 15, height: 18)
                    .foregroundColor(.black)
                SecureField("Password", text: $pass)
                
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
            Text("LOGIN")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical)
//                или - 100
                .frame(width: UIScreen.main.bounds.width - 20)
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
                      
                      TextField("Enter Email Address", text: self.$mail)
                      
                  }.padding(.vertical, 20)
                  
                  Divider()
                  
                  HStack(spacing: 15){
                      
                      Image(systemName: "lock")
                      .resizable()
                      .frame(width: 15, height: 18)
                      .foregroundColor(.black)
                      
                      SecureField("Password", text: self.$pass)
                      
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
                      
                      SecureField("Re-Enter", text: self.$repass)
                      
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
                  
                  Text("SIGNUP")
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
                      
                      TextField("Enter Email Address", text: self.$mail)
                      
                  }.padding(.vertical, 20)
                  
                  Divider()
                  
                  HStack(spacing: 15){
                      
                      Image(systemName: "lock")
                      .resizable()
                      .frame(width: 15, height: 18)
                      .foregroundColor(.black)
                      
                      SecureField("Password", text: self.$pass)
                      
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
                      
                      SecureField("Re-Enter", text: self.$repass)
                      
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
                  
                  Text("SIGNUP")
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
