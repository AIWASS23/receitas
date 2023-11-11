//
//  RotateView.swift
//  Receitas
//
//  Created by Marcelo de Araújo on 08/11/2023.
//

import SwiftUI

struct DetectOrientationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
        .onReceive(
            NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            action(UIDevice.current.orientation)
        }
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DetectOrientationViewModifier(action: action))
    }
}
