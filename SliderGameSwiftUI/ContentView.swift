//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Vladimir Dvornikov on 03/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var targetValue = Int.random(in: 0...100)
    @State var curentValue = 50.0
    @State var opacity = 100
    @State var alert = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("\(curentValue)") // временноое поле
            Text("Подвинь слайдер, как можно ближе к \(targetValue)")
            HStack {
                Text("0")
                UIKitSlider(sliderValue: $curentValue, thumbOpacity: $opacity)
                Text("100")
            }
            
            Button(" ПРОВЕРЬ МЕНЯ ", action: {})
                .buttonStyle(.bordered)
                .font(.title2)
                .padding(.top, 150)
            Button("НАЧАТЬ ЗАНОВО") {
                targetValue = Int.random(in: 0...100)
            }
            .buttonStyle(.bordered)
            .font(.title2)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
