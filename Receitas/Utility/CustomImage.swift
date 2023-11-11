//
//  CustomImag.swift
//  Receitas
//
//  Created by Marcelo de Araújo on 11/11/2023..
//

import SwiftUI

struct CustomImage: View {
    var url: String
    var maxWidth: CGFloat
    var maxHeight: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { img in
            img.resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "photo")
        }.clipShape(RoundedRectangle(cornerRadius: 5))
            .frame(maxWidth: maxWidth, maxHeight: maxHeight)
            .shadow(radius: 5)
    }
}

#Preview {
    CustomImage(url: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", maxWidth: 150, maxHeight: 150)
}


