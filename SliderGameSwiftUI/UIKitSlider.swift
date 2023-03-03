//
//  UIKitSlider.swift
//  SliderGameSwiftUI
//
//  Created by Vladimir Dvornikov on 03/03/2023.
//

import SwiftUI

// Подписываемся под протокол и реализуем 2 обязательных метода - makeUIView, updateUIView
struct UIKitSlider: UIViewRepresentable {
    
    @Binding var sliderValue: Double
    @Binding var thumbOpacity: Int
    
    
    func makeUIView(context: Context) -> UISlider {
        
        let uiSlider = UISlider()
        uiSlider.maximumValue = 0
        uiSlider.maximumValue = 100
        uiSlider.minimumTrackTintColor = UIColor.darkGray
        
        return uiSlider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
        uiView.thumbTintColor = UIColor.darkGray.withAlphaComponent(CGFloat(thumbOpacity) / 100)
    }

}

struct UIKitSlider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(sliderValue: .constant(66), thumbOpacity: .constant(100))
    }
}
