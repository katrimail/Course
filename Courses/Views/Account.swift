//
//  Account.swift
//  Courses
//
//  Created by Катрин Маилян on 05.01.2021.
//

import SwiftUI

struct Account: View {
    @State var selected = 0
         
         var body: some View {
            
             VStack(spacing: 8){
                 
                Accountprofile(selected: self.$selected).padding(.top)
                 
                 if self.selected == 0{
                     
                     Home1()
                 }
                 else{
                     
                     AccountMy()
                 }
                 
             }.background(Color("Color-3").edgesIgnoringSafeArea(.all))
         }}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
    }
}

struct Accountprofile : View {
      
      @Binding var selected : Int
      @State private var icon = 0
      
      var body : some View{
          
          HStack{
              
              Button(action: {

                  self.selected = 0

              }) {

                  Image("book")
                      .resizable()
                      .frame(width: 25, height: 25)
                      .padding(.vertical,12)
                      .padding(.horizontal,30)
                      .background(self.selected == 0 ? Color.white : Color.clear)
                      .clipShape(Capsule())
              }
              .padding(.horizontal,50)
              .foregroundColor(self.selected == 0 ? .pink : .gray)

              Button(action: {

                  self.selected = 1

              }) {

                  Image("acc")
                  .resizable()
                  .frame(width: 25, height: 25)
                  .padding(.vertical,12)
                  .padding(.horizontal,30)
                  .background(self.selected == 1 ? Color.white : Color.clear)
                    .clipShape(Capsule())
              }
              .padding(.horizontal,50)
              .foregroundColor(self.selected == 1 ? .pink : .gray)

              }
          .pickerStyle(SegmentedPickerStyle())
          .background(Color("Color-5"))
              .clipShape(Capsule())
              .animation(.default)
      }
  }

struct Home1 : View {
    
    var body : some View{
        let books = ["Физика", "Химия", "Биология", "VR/AR", "Machine learning", "Моделирование 3D", "Сколтех", "Высшая проба"]
        
        let bookDescription = ["Дополнительное пособие"]
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 6){
                
                ForEach(books,id: \.self){i in
                    ForEach(bookDescription,id: \.self){p in
                        
                        HStack(spacing: 15){
                            
//
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text("\(i)").bold()
                                
                                HStack {
                                    Text("\(p)").opacity(0.7)
                                    Spacer()
                                    Image("arrow").renderingMode(.original)
                                        .resizable()
                                        .frame(width: 17, height: 17, alignment: .trailing)
                                }
                                Spacer(minLength: 0)
                            }
                                
                            }
                        .padding(.horizontal,40)
                        .padding(.vertical,20)
                        
                            .background(Color.white)
                            //                      .opacity(0.8)
                            .cornerRadius(12)
                        }
                        
                    }
                }

            }
            
        }
    }

  struct AccountMy : View {
      
      var body : some View{
          
          VStack(spacing: 15){
              
              HStack(spacing: 15){
                  
                  Image("profile").renderingMode(.original)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 70, height: 70, alignment: .center)
                  
                  VStack(alignment: .leading, spacing: 10) {
                      
                      Text("Катрин Маилян")
                    Text("@Katrin").opacity(0.6)
                  }
                  
                  
                  Spacer()
              }
            .clipShape(Capsule())
            .padding(10)
              .background(Color("Color-8"))
            .foregroundColor(.black)
            .cornerRadius(15)
            
              HStack(spacing: 15){
                  
                  HStack{
                      
                      VStack(alignment: .leading){
                          
                          Text("Подписки").fontWeight(.bold)
                          
                          Text("128").fontWeight(.bold).font(.system(size: 22))
                      }
                      
                      Spacer(minLength: 0)
                      
                  }.padding()
                  .frame(width: (UIScreen.main.bounds.width - 45) / 2)
                  .background(Color("energy"))
                  .cornerRadius(15)
                  
                  HStack{
                      
                      VStack(alignment: .leading){
                          
                          Text("Подписчики").fontWeight(.bold)
                          
                          Text("228").fontWeight(.bold).font(.system(size: 22))
                      }
                      
                      Spacer(minLength: 0)
                      
                  }.padding()
                  .frame(width: (UIScreen.main.bounds.width - 45) / 2)
                  .background(Color("water"))
                  .cornerRadius(15)
                  
              }.foregroundColor(.white)
               .padding(.top, 1)
              
              Button(action: {
                  
              }) {
                  
                  HStack(spacing: 15){
                      
                      Image("map")
                        .renderingMode(.original)
                        .padding()
                        .background(Color("Color-7"))
                        .clipShape(Circle())
                    
                      Text("Электронная почта")
                      
                      Spacer()
                      
                      Image("arrow").renderingMode(.original)
                      
                  }
                  .padding()
                  .background(Color.white)
                  .foregroundColor(.black)
                  
              }.cornerRadius(15)
              .padding(.top)
              
              Button(action: {
                  
              }) {
                  
                  HStack(spacing: 15){
                      
                      Image("world")
                          .renderingMode(.original)
                          .padding()
                        .background(Color("Color-7"))
                          .clipShape(Circle())
                      
                      Text("Язык")
                      
                      Spacer()
                      
                      Image("arrow").renderingMode(.original)
                      
                  }
                  .padding()
                  .background(Color.white)
                  .foregroundColor(.black)
                  
              }.cornerRadius(15)
              
              Button(action: {
                  
              }) {
                  
                  HStack(spacing: 15){
                      
                      Image("log")
                          .renderingMode(.original)
                          .padding()
                          .background(Color("Color-7"))
                          .clipShape(Circle())
                      
                      Text("Выйти")
                      
                      Spacer()
                      
                      Image("arrow").renderingMode(.original)
                      
                  }
                  .padding()
                  .background(Color.white)
                  .foregroundColor(.black)
                  
              }.cornerRadius(15)
              
              Spacer()
              
          }.padding()
      }
  }
