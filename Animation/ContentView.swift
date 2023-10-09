//
//  ContentView.swift
//  Animation
//
//  Created by Валерий Никитин on 09.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var rotationAmount: Double = 0
    @State private var scaleAmount: CGFloat = 1
    @State private var isAccentColor: Bool = true
    @State private var globeOffsetY: CGFloat = 0
    @State private var globe3DRotation: Double = 0
    @State private var textRotation: Double = 0
    @State private var buttonOpacity: Double = 1.0

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(isAccentColor ? .accentColor : .red)
                .rotationEffect(.degrees(rotationAmount))
                .rotation3DEffect(
                    .degrees(globe3DRotation),
                    axis: (x: 0, y: 1, z: 0)
                )
                .offset(y: globeOffsetY)
                .onTapGesture {
                    withAnimation {
                        rotationAmount += 45
                        globe3DRotation += 180
                    }
                }

            Text("Push me!")
                .rotationEffect(.degrees(textRotation))
                .scaleEffect(scaleAmount)
                .padding(.top, 20)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1)) {
                        scaleAmount = (scaleAmount == 1 ? 1.5 : 1)
                        isAccentColor.toggle()
                        textRotation += 360
                    }
                }
            
            Button(action: {
                withAnimation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 5)) {
                    globeOffsetY = (globeOffsetY == 0 ? -30 : 0)
                }
            }) {
                Text("Make Globe Jump!")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .opacity(buttonOpacity)
            .onHover(perform: { hovering in
                withAnimation {
                    buttonOpacity = hovering ? 0.7 : 1.0
                }
            })
            .padding(.top, 20)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



