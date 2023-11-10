//
//  ContentView.swift
//  Msigma Gokulam
//
//  Created by Vikash on 09/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            HomePageView()
                .tabItem {
                    Label("Menu", systemImage: "house.fill")
                }
            
                
            Text("My Courses")
                .tabItem {
                    Label("MyCourse", systemImage: "book.fill")
                }
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
