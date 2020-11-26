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
    @State var roundNumber = 1
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }

    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .modifier(Shadow())
                .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: 2.0, y: 2.0)
        }
    }
    
    var body: some View {
        NavigationView {
        HStack {
            VStack {
                HStack {
                    Text("Put the bullseye as you can to:").modifier(LabelStyle())
                    Text("\(target)").modifier(ValueStyle())
                }
                Spacer()
                // Slider row
                HStack {
                    Text("1").modifier(LabelStyle())
                    Slider(value: $sliderValue, in: 1...100)
                    Text("100").modifier(LabelStyle())
                }
                Spacer()
                // Button row
                Button(action:  {
                    print("Button pressed!")
                    self.alertIsVisible = true
                }) {
                    Text("Hit me").modifier(ButtonLargeTextStyle())
                    
                }
                .alert(isPresented: $alertIsVisible) {
                    () -> Alert in
                    return Alert(title: Text(alertTitle()), message: Text("The slider's value is: \(Int(slideValueRounded())). \n " +
                                                                                "You scored \(self.pointsForCurrentRound()) points this round"), dismissButton: .default(Text("Code")) {
                                                                                    self.target = Int.random(in: 1...100)
                                                                                    self.total = self.total + self.pointsForCurrentRound()
                                                                                    self.roundNumber = self.roundNumber + 1
                                                                                })
                }
                .background(Image("Button")).modifier(Shadow())
                Spacer()
                HStack {
                        Button(action:  {
                            print("Button pressed!")
                            startOver()
                        }) {
                            Image("StartOverIcon")
                            Text("Start Over").modifier(ButtonSmallTextStyle())
                        }
                            .background(Image("Button")).modifier(Shadow())
                        Spacer()
                        Text("Score:").modifier(LabelStyle())
                        Text("\(total)").modifier(ValueStyle())
                        Spacer()
                        Text("Round").modifier(LabelStyle())
                        Text("\(roundNumber)").modifier(ValueStyle())
                        Spacer()
                        NavigationLink(
                            destination: AboutView()) {
                            HStack {
                            Image("InfoIcon")
                            Text("Info")}.modifier(ButtonSmallTextStyle())
                            .background(Image("Button")).modifier(Shadow())
                        }
                }
                .padding(.bottom, 20)
                .navigationBarTitle("Bullseye 🎯")
                }
            .background(Image("Background"), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
    func slideValueRounded() -> Int {
        Int(sliderValue.rounded())
    }

    
    func pointsForCurrentRound() -> Int {
        var result = 100 - amountOff()
        if result == 100 {
            result += 100
        }
        else if (result == 99) {
            result += 50
        }
        return result
    }
    
    func amountOff() -> Int {
        abs(target - slideValueRounded())
    }
    


func alertTitle() -> String {
    let difference = amountOff()
    let title: String
    if difference == 0 {
        title = "Perfect!"
    }
    else if difference < 5 {
        title = "You almost had it"
    }
    else if difference <= 10 {
        title = "Not bad."
    }
    else {
        title = "Are you even trying"
    }
    return title
}
    func startOver() {
        total = 0
        roundNumber = 1
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
}
