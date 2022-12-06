//
//  ContentView.swift
//  mapTest
//
//  Created by Giovanni Russo on 27/05/22.
//  For Apple Foundation Program

import SwiftUI
import MapKit

struct ContentView: View {
    
    var body: some View {
        
        
        TabView{
            Map01()
                .tabItem{
                    
                    Label("Map", systemImage: "map.fill")
                }.onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
            Tips()
            
                .tabItem{ Label("Tips", systemImage: "leaf.fill")
                
                }
            
          
        }
        
        .onAppear(){
            UITabBar.appearance().backgroundColor = UIColor.black
        }
        .accentColor(.green)
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}



