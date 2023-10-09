//
//  CustomTabView.swift
//  Animation
//
//  Created by Валерий Никитин on 09.10.2023.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if selectedTab == 0 {
                    ContentView()
                } else if selectedTab == 1 {
                    FirestoreView()
                }
            }

            Divider() // Линия разделения между содержимым и TabBar

            HStack {
                Button(action: {
                    selectedTab = 0
                }) {
                    VStack {
                        Image(systemName: "globe")
                        Text("Animation")
                    }
                }
                .padding()
                .foregroundColor(selectedTab == 0 ? .blue : .gray)

                Spacer() // Промежуток между кнопками

                Button(action: {
                    selectedTab = 1
                }) {
                    VStack {
                        Image(systemName: "flame.fill")
                        Text("Firestore")
                    }
                }
                .padding()
                .foregroundColor(selectedTab == 1 ? .blue : .gray)
            }
            .background(Color.white)
        }
    }
}


struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
