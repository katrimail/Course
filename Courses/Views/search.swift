//
//  search.swift
//  Courses
//
//  Created by Катрин Маилян on 06.01.2021.
//

import SwiftUI

struct search: View {
    var body: some View {
        searchIcon()
    }
}

struct search_Previews: PreviewProvider {
    static var previews: some View {
        search()
    }
}


struct searchIcon : View {
    
    @State var search = ""
    @State var index = 0
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var body: some View{

        ScrollView(.vertical, showsIndicators: false) {
            
            LazyVStack{
                
                HStack{
                    
                    Text("Поиск курсов")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                TextField("Поиск", text: self.$search)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top,13)
                
                // Carousel List...
                
                TabView(selection: self.$index){
                    
                    ForEach(1...8,id: \.self){index in
                        
                        Image("g\(index)")
                            .resizable()
                            // adding animation...
                            .frame(height: self.index == index ?  250 : 280)
                            .cornerRadius(15)
                            .padding(.horizontal)
                            // for identifying current index....
                            .tag(index)
                    }
                }
                .frame(height: 230)
                .padding(.top,25)
                .tabViewStyle(PageTabViewStyle())
                .animation(.easeOut)
                
                // adding custom Grid....
                
                HStack{
                    
                    Text("Последние")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        
                        // reducing to row.....
                        
                        withAnimation(.easeOut){
                            
                            if self.columns.count == 2{
                                
                                self.columns.removeLast()
                            }
                            else{
                                
                                self.columns.append(GridItem(.flexible(), spacing: 15))
                            }
                        }
                        
                    } label: {
                    
                        Image(systemName: self.columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    }

                }
                .padding(.horizontal)
                .padding(.top,25)
                
                LazyVGrid(columns: self.columns,spacing: 25){
                    
                    ForEach(data){game in
                        
                        // GridView....
                        
                        GridView(game: game,columns: self.$columns)
                    }
                }
                .padding([.horizontal,.top])
                
            }
            .padding(.vertical)
        }
        .background(Color("Color-3").edgesIgnoringSafeArea(.all))
    }
}

struct GridView : View {

    var game : Game
    @Binding var columns : [GridItem]
    @Namespace var namespace
    
    var body: some View{
        

        VStack{
            
            if self.columns.count == 2{
                
                VStack(spacing: 15){
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        
                        Image(game.image)
                            .resizable()
                            .frame(height: 200)
                            .cornerRadius(15)
                        
                        Button {
                            
                        } label: {
                        
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding(.all,10)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.all,10)

                    }
                    .matchedGeometryEffect(id: "image", in: self.namespace)
                    
                    Text(game.name)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "title", in: self.namespace)
                    
                    Button {
                        
                    } label: {
                    
                        Text("Присоединиться")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal,10)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .matchedGeometryEffect(id: "buy", in: self.namespace)

                }
            }
            else{
                
                // Row View....
                
                // adding animation...
                
                HStack(spacing: 15){
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        
                        Image(game.image)
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width - 45) / 2,height: 200)
                            .cornerRadius(15)
                        
                        Button {
                            
                        } label: {
                        
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding(.all,10)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.all,10)

                    }
                    .matchedGeometryEffect(id: "image", in: self.namespace)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(game.name)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "title", in: self.namespace)
                        
                        // Rating Bar...
                        
                        HStack(spacing: 10){
                            
                            ForEach(1...5,id: \.self){rating in
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(self.game.rating >= rating ? .yellow : .gray)
                            }
                            
                            Spacer(minLength: 0)
                        }
                        
                        Button {
                            
                        } label: {
                        
                            Text("Присоединиться")
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .padding(.horizontal,10)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        .padding(.top,10)
                        .matchedGeometryEffect(id: "buy", in: self.namespace)
                    }
                }
                .padding(.trailing)
                .background(Color.white)
                .cornerRadius(15)
            }
        }
    }
}

// sample Model Data...

struct Game : Identifiable {
    
    var id : Int
    var name : String
    var image : String
    var rating : Int
}

var data = [

    Game(id: 0, name: "Физика", image: "g9", rating: 3),
    Game(id: 1, name: "Химия", image: "g2", rating: 5),
    Game(id: 2, name: "Моделирование 3D", image: "g7", rating: 3),
    Game(id: 3, name: "Информатика", image: "g5", rating: 2),
    Game(id: 4, name: "VR/AR", image: "g8", rating: 1),
    Game(id: 5, name: "Биология", image: "g4", rating: 2),
    Game(id: 6, name: "Сколтех", image: "g6", rating: 4),
    Game(id: 7, name: "Machine lerning", image: "g10", rating: 4),

]

