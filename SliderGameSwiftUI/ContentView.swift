//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Vladimir Dvornikov on 03/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State var targetValue = Int.random(in: 0...100)
    @State var curentValue = 25.0
    @State var opacity = 100
    @State var alert = false
    
    var body: some View {
        VStack {
            HStack {
                Text("0")
                UIKitSlider(sliderValue: $curentValue, thumbOpacity: $opacity)
                Text("100")
            }
            Button("Проверь меня", action: {})
            Button("Начать заново", action: {})
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
