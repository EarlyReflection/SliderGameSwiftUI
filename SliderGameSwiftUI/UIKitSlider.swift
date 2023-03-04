//
//  UIKitSlider.swift
//  SliderGameSwiftUI
//
//  Created by Vladimir Dvornikov on 03/03/2023.
//

import SwiftUI

// Подписываемся под протокол и реализуем обязательные методы: makeUIView, updateUIView
struct UIKitSlider: UIViewRepresentable {
    @Binding var sliderValue: Double
    var thumbOpacity: Int
    
    func makeUIView(context: Context) -> UISlider {
        let uiSlider = UISlider()
        uiSlider.maximumValue = 0
        uiSlider.maximumValue = 100
        uiSlider.minimumTrackTintColor = UIColor.darkGray
        
        uiSlider.addTarget(context.coordinator,
                           action: #selector(Coordinator.valueChanged),
                           for: .valueChanged)
        
        return uiSlider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
        uiView.thumbTintColor = UIColor.darkGray.withAlphaComponent(CGFloat(thumbOpacity) / 100)
    }
    
    // обязательный метод для инициализации Coordinator
    func makeCoordinator() -> Coordinator {
        Coordinator.init(value: $sliderValue)
    }
}

//класс Coordinator - это посредник для передачи и приема данных в SwiftUI
extension UIKitSlider {
    final class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        // принимает UISlider и передает его значение в переменную value
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct UIKitSlider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(
            sliderValue: .constant(66),
            thumbOpacity: 100
        )
    }
}
