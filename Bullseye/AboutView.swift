//
//  AboutView.swift
//  Bullseye
//
//  Created by Ricky Arora on 2020-11-24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
        VStack {
            Text("🎯 Bullseye 🎯").modifier(headingStyling())
            Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(textViewStyling())
            Text("Enjoy").modifier(textViewStyling())
        .navigationBarTitle("About Bullseye")
        }
        .background(Image("Background"))
    }
    }
    
    
    struct headingStyling: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.vertical, 20)
        }
    }
    
    struct textViewStyling: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.bottom, 20)
                .padding([.trailing,.leading], 60)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
