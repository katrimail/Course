//
//  Stat.swift
//  Courses
//
//  Created by Катрин Маилян on 06.01.2021.
//

import SwiftUI

struct Stat: View {
    var body: some View {
        Statistics()
    }
}

struct Stat_Previews: PreviewProvider {
    static var previews: some View {
        Stat()
    }
}

struct Statistics : View {
    
    @State var selected = 0
    var colors = [Color("Color1"),Color("Color")]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View{
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    HStack{
                        
                        Text("Статистика по физике")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer(minLength: 0)
                        
                        NavigationLink(
                            destination: OnBoarding(),
                            label: {
                                Label(
                                    title: { Text("Меню")
                                        .fontWeight(.bold)
 },
                                    icon: { Image(systemName: "list.bullet")
                                        .font(.system(size: 20, weight: .bold))
                                    }
                                        
)
                            })
//                        Button(action: {}) {
//
//                            Image("menu")
//                                .renderingMode(.template)
//                                .foregroundColor(.white)
//                        }
                    }
                    .padding()
                    
                    // Bar Chart...
                    
                    VStack(alignment: .leading, spacing: 25) {
                        
                        Text("Производительность в часах")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        HStack(spacing: 15){
                            
                            ForEach(workout_Data){work in
                                
                                // Bars...
                                
                                VStack{
                                    
                                    VStack{
                                        
                                        Spacer(minLength: 0)
                                        
                                        if selected == work.id{
                                            
                                            Text(getHrs(value: work.workout_In_Min))
                                                .foregroundColor(Color("Color"))
                                                .padding(.bottom,5)
                                        }
                                        
                                        RoundedShape()
                                            .fill(LinearGradient(gradient: .init(colors: selected == work.id ? colors : [Color.white.opacity(0.06)]), startPoint: .top, endPoint: .bottom))
                                        // max height = 200
                                            .frame(height: getHeight(value: work.workout_In_Min))
                                    }
                                    .frame(height: 220)
                                    .onTapGesture {
                                        
                                        withAnimation(.easeOut){
                                            
                                            selected = work.id
                                        }
                                    }
                                    
                                    Text(work.day)
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(10)
                    .padding()
                    
                    HStack{
                        
                        Text("Общая статистика")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer(minLength: 0)
                    }
                    .padding()
                    
                    // stats Grid....
                    
                    LazyVGrid(columns: columns,spacing: 30){
                        
                        ForEach(stats_Data){stat in
                            
                            VStack(spacing: 32){
                                
                                HStack{
                                    
                                    Text(stat.title)
                                        .font(.system(size: 22))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                    Spacer(minLength: 0)
                                }
                                
                                // Ring...
                                
                                ZStack{
                                    
                                    Circle()
                                        .trim(from: 0, to: 1)
                                        .stroke(stat.color.opacity(0.05), lineWidth: 10)
                                        .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
                                    
                                    Circle()
                                        .trim(from: 0, to: (stat.currentData / stat.goal))
                                        .stroke(stat.color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                        .frame(width: (UIScreen.main.bounds.width - 150) / 2, height: (UIScreen.main.bounds.width - 150) / 2)
                                    
                                    Text(getPercent(current: stat.currentData, Goal: stat.goal) + " %")
                                        .font(.system(size: 22))
                                        .fontWeight(.bold)
                                        .foregroundColor(stat.color)
                                        .rotationEffect(.init(degrees: 90))
                                }
                                .rotationEffect(.init(degrees: -90))
                                
                                Text(getDec(val: stat.currentData) + " " + getType(val: stat.title))
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .background(Color.white.opacity(0.06))
                            .cornerRadius(15)
                            .shadow(color: Color.white.opacity(0.2), radius: 10, x: 0, y: 0)
                        }
                    }
                    .padding()
                }
            }
            .background(Color("Color-9").edgesIgnoringSafeArea(.all))
        }
//        .preferredColorScheme(.dark)
        // status bar color is not changing
        // its still in beta...
    
    
    // calculating Type...
    
    func getType(val: String)->String{
        
        switch val {
        case "Water": return "L"
        case "Sleep": return "Hrs"
        case "Running": return "Km"
        case "Cycling": return "Km"
        case "Steps": return "stp"
        default: return "часов"
        }
    }
    
    // converting Number to decimal...
    
    func getDec(val: CGFloat)->String{
        
        let format = NumberFormatter()
        format.numberStyle = .decimal
        
        return format.string(from: NSNumber.init(value: Float(val)))!
    }
    
    // calculating percent...
    
    func getPercent(current : CGFloat,Goal : CGFloat)->String{
        
        let per = (current / Goal) * 100
        
        return String(format: "%.1f", per)
    }
    
    // calculating Hrs For Height...
    
    func getHeight(value : CGFloat)->CGFloat{
        
        // the value in minutes....
        // 24 hrs in min = 1440
        
        let hrs = CGFloat(value / 1440) * 200
        
        return hrs
    }
    
    // getting hrs...
    
    func getHrs(value: CGFloat)->String{
        
        let hrs = value / 60
        
        return String(format: "%.1f", hrs)
    }
}

struct RoundedShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        

        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 5, height: 5))
        
        return Path(path.cgPath)
    }
}

// sample Data...

struct Daily : Identifiable {
    
    var id : Int
    var day : String
    var workout_In_Min : CGFloat
}

var workout_Data = [

    Daily(id: 0, day: "Day 1", workout_In_Min: 480),
    Daily(id: 1, day: "Day 2", workout_In_Min: 880),
    Daily(id: 2, day: "Day 3", workout_In_Min: 250),
    Daily(id: 3, day: "Day 4", workout_In_Min: 360),
    Daily(id: 4, day: "Day 5", workout_In_Min: 1220),
    Daily(id: 5, day: "Day 6", workout_In_Min: 750),
    Daily(id: 6, day: "Day 7", workout_In_Min: 950)
]

// stats Data...

struct Stats : Identifiable {
    
    var id : Int
    var title : String
    var currentData : CGFloat
    var goal : CGFloat
    var color : Color
}

var stats_Data = [

    Stats(id: 0, title: "Физика", currentData: 6.8, goal: 15, color: Color("running")),
    
    Stats(id: 1, title: "Химия", currentData: 3.5, goal: 5, color: Color("water")),
    
    Stats(id: 2, title: "Machine learning", currentData: 585, goal: 1000, color: Color("energy")),
    
    Stats(id: 3, title: "Сколтех", currentData: 6.2, goal: 10, color: Color("sleep")),
    
    Stats(id: 4, title: "VR/AR", currentData: 12.5, goal: 25, color: Color("cycle")),
    
    Stats(id: 5, title: "Биология", currentData: 16889, goal: 20000, color: Color("steps")),
]


struct menuOfCourse: View {
    var body: some View {
        Text("Menu")
    }
    
}
