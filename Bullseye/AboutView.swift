//
//  AboutView.swift
//  Bullseye
//
//  Created by Ricky Arora on 2020-11-24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
        Text("🎯 Bullseye 🎯")
        Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.")
        Text("Enjoy")
        }
        .navigationBarTitle("About Bullseye")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
