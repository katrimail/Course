//
//  Likes.swift
//  Courses
//
//  Created by Катрин Маилян on 06.01.2021.
//

import SwiftUI

struct Likes: View {
    var body: some View {
        like()
    }
}

struct Likes_Previews: PreviewProvider {
    static var previews: some View {
        Likes()
    }
}
struct like : View {
    
    var body : some View{
        let items = ["11В", "7А", "9Б", "11A", "8A", "8Б", "10Г", "10А"]
        let surName = ["Дарья Романова", "Николай Зайцев", "Александр Пушкин", "Станислав Борисов", "Борис Птушкин", "Андрей Сорокин", "Никита Сафин", "Екатерина Павлова"]
        NavigationView{
            
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 6){
                        
                        ForEach(items, id: \.self){i in
                            ForEach(surName, id: \.self){p in
                            
                            HStack(spacing: 15){
                                
                                Image("5").renderingMode(.original)
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                VStack(alignment: .leading, spacing: 12) {
                                    
                                    Text("\(p)").bold()
                                    Text("Класс:  \(i)")
                                    
                                }
                                .foregroundColor(.gray)
                                
                                Spacer(minLength: 0)
                                
                            }.padding()
                            .cornerRadius(12)
                        }
                        
                        
                    }.padding(5)
                        .background(Color("Color-8"))
                    
                }.navigationBarTitle(Text("Друзья"))
                    
                }
        }
    }
}

