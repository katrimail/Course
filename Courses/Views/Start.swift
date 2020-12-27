//
//  Start.swift
//  Courses
//
//  Created by Катрин Маилян on 27.12.2020.
//

import SwiftUI
import UIKit

struct OnBoarding: View {

    @State var showSheetView = false
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = #colorLiteral(red: 0.2876688838, green: 0.5453916192, blue: 0.667065084, alpha: 1)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        }
    var body: some View {
        NavigationView {
            pages()
        }.sheet(isPresented: $showSheetView) {
            profile()
        }.animation(.none)
    }
    
}



struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}


struct pages: View {
    var body: some View {
        VStack {
                TabView {
                    ForEach(Data) { page in
                        GeometryReader { g in
                            VStack {
                                Image(page.image)
                                    .resizable()
                                    .frame(width: 300, height: 300, alignment: .center)
                                    .cornerRadius(100)
                                    .scaledToFit()
                                Text(page.title)
                                    .font(.title).bold()
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
                                Text(page.descrip)
                                    .multilineTextAlignment(.center)
                                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            }
                            .opacity(Double(g.frame(in : . global).minX)/200+1)
                        }
                    }
                }
                .padding(20)
                .edgesIgnoringSafeArea(.top)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            NavigationLink(
                destination: profile().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                label: {
                    Text("Start")
                        .font(.headline)
                        .frame(width: 200, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(10)
                })
            Spacer()
            
        }
        
        .navigationBarItems(trailing:
                                NavigationLink(
                                    destination: profile().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                                    label: {
                                        Image(systemName: "arrow.right")
                                            .font(Font.system(.title3))
                                            .foregroundColor(Color("Color"))
                                    })
        )
        .navigationBarBackButtonHidden(true)
    }
}
