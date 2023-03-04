//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Vladimir Dvornikov on 03/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var targetValue = Int.random(in: 0...100)
    @State var currentValue = 50.0
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Подвинь слайдер, как можно ближе к \(targetValue)")
            HStack {
                Text("0")
                UIKitSlider(sliderValue: $currentValue,
                            thumbOpacity: computeScore())
                Text("100")
            }
            
            Button(" ПРОВЕРЬ МЕНЯ ", action: {
                showAlert = true
            })
            .buttonStyle(.bordered)
            .font(.title2)
            .padding(.top, 150)
            .alert("Ваш результат \(computeScore())", isPresented: $showAlert, actions: {}) {
                Text("\(getAdvice())")
            }
            
            Button("НАЧАТЬ ЗАНОВО") {
                targetValue = Int.random(in: 0...100)
            }
            .buttonStyle(.bordered)
            .font(.title2)
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func getAdvice() -> String {
        var advice = ""
        if computeScore() < 50 {
            advice = "Слишком далеко, будь внимательней и у тебя получится!"
        } else if computeScore() < 75 {
            advice = "Неплохо, попробуй еще!"
        } else if computeScore() < 95 {
            advice = "Хорошо, попробуй еще!"
        } else if computeScore() < 100 {
            advice = "Супер, ты почти у цели, попробуй еще!"
        } else {
            advice = "Точно в цель!"
        }
        return advice
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
