//
//  ContentView.swift
//  Bullseye
//
//  Created by Ricky Arora on 2020-10-30.
//

import SwiftUI 

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var total = 0
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Put the bullseye as you can to:")
                    Text("\(target)")
                }
                Spacer()
                // Slider row
                HStack {
                    Text("1")
                    Slider(value: $sliderValue, in: 1...100)
                    Text("100")
                }
                Spacer()
                // Button row
                Button(action:  {
                    print("Button pressed!")
                    alertIsVisible = true
                }) {
                    Text("Hit me")
                    
                }
                .alert(isPresented: $alertIsVisible) {
                    () -> Alert in
                    return Alert(title: Text("Hello there!"), message: Text("The slider's value is: \(Int(slideValueRounded())). \n " +
                                                                                "You scored \(self.pointsForCurrentRound()) points this round"), dismissButton: .default(Text("Code")))
                }
                Spacer()
                HStack {
                        Button(action:  {
                            print("Button pressed!")
                        }) {
                            Text("Start Over")}
                        Spacer()
                        Text("Score:")
                        Text("\(total)")
                        Spacer()
                        Text("Round")
                        Text("999")
                        Spacer()
                        Button(action:  {
                            print("Button pressed!")
                        }) {
                            Text("Info")}
                    }
                .padding(.bottom, 20)
                }
            }
        }
    func slideValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let points = 100 - abs(target - slideValueRounded())
        addToTotalPoints(pointsToAdd: points)
        return points
    }
    
    func addToTotalPoints(pointsToAdd: Int) {
        total = pointsToAdd + total
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
