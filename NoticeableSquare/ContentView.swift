//
//  ContentView.swift
//  NoticeableSquare
//
//  Created by Maxim Keegan on 11.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var rectPosition = CGPoint(x: 100, y: 400)
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.white)
                Rectangle()
                    .fill(.pink)
                Rectangle()
                    .fill(.yellow)
                Rectangle()
                    .fill(.black)
                
            }
            let rect = RoundedRectangle(cornerRadius: 15)
                .frame(width: 100, height: 100)
                .position(rectPosition)
                .gesture(DragGesture().onChanged({ value in
                    self.rectPosition = value.location
                }))
            
            rect.foregroundColor(.white)
                .blendMode(.difference)
                .overlay(rect.blendMode(.hue))
                .overlay(rect.foregroundColor(.white).blendMode(.overlay))
                .overlay(rect.foregroundColor(.black).blendMode(.overlay))
        }
    }
}

#Preview {
    ContentView()
}
