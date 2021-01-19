//
//  CoursesApp.swift
//  Courses
//
//  Created by Катрин Маилян on 18.12.2020.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct CoursesApp: App {
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self)
//    var delegate 
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//ObservedObject

class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate{
    @Published var email = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        guard let user = user else {return}
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
        
        Auth.auth().signIn(with: credential) {(result, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            self.email = (result?.user.email)!
            print(result?.user.email)
        }
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print(error.localizedDescription)
    }
}
