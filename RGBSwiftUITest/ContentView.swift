//
//  ContentView.swift
//  RGBSwiftUITest
//
//  Created by saeed on 3/8/21.
//

import SwiftUI

struct ContentView: View {
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert = false
    
    func computeScore() -> Int {
      let rDiff = rGuess - rTarget
      let gDiff = gGuess - gTarget
      let bDiff = bGuess - bTarget
      let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
      return Int((1.0 - diff) * 100.0 + 0.5)
    }

    var body: some View {
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget).cornerRadius(15).padding(.horizontal)
                    Text("Match this color")
                }
                
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess, opacity: 1.0).cornerRadius(15).padding(.horizontal)
                    Text("R: \(Int(rGuess*255.0))  G: \(Int(gGuess*255))  B: \(Int(bGuess*255))")
                }
            }
            Button(action: {
                self.showAlert = true
            }) {
                Text("TEST")
            }.alert(isPresented: $showAlert){
                    Alert(title: Text("Your Score"),
                          message: Text(String(computeScore())))

            }.padding().background(Color.blue).cornerRadius(15, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.8, gGuess: 0.5, bGuess: 0.5)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color

    var body: some View {
        HStack {
            Text("0").foregroundColor(.red)
            Slider(value: $value)
            Text("250").foregroundColor(textColor)
        }.padding()
    }
}
