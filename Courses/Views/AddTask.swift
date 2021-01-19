//
//  AddTask.swift
//  Courses
//
//  Created by Катрин Маилян on 07.01.2021.
//

import SwiftUI
import Lottie
import UIKit

struct AddTask: View {
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    Text("Добро пожаловать в школу!")
                        .offset(y: -180)
                        .font(.title)
                }
                LottieView(animationName: "school")
                    .frame(width: 200, height: 200, alignment: .center)
                    .background(Color("Color"))
                NavigationLink(
                    destination: profile(),
                    label: {
                        Text("Начать")
                            .padding()
                            .background(Color("Color-3"))
                            .clipShape(Capsule())
                            .offset(y: 150)
                            .foregroundColor(.black)
                            .font(.title3)
                            
                    })
            }
            
        }
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask()
    }
}

struct LottieView: UIViewRepresentable {
    var animationName: String
    func makeUIView(context: Context) -> AnimationView {
        let view = AnimationView(name: animationName, bundle: Bundle.main)
        view.loopMode = .loop
        view.contentMode = .scaleAspectFill
        view.play()
        return view
    }
    
    func updateUIView(_ uiView:AnimationView, context: Context) {

    }
}

 
