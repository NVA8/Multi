//
//  FirestoreView.swift
//  Animation
//
//  Created by Валерий Никитин on 09.10.2023.
//

import SwiftUI

struct FirestoreView: View {
    @ObservedObject var firestoreManager = FirestoreManager()
    @State private var newItemName = ""
    @State private var isEditing = false
    @State private var currentItemName = ""
    @State private var currentDocumentID = ""

    var body: some View {
        VStack {
            if let error = firestoreManager.error {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
            
            List(firestoreManager.items, id: \.self) { item in
                Text(item)
                    .onTapGesture {
                        currentItemName = item
                        isEditing = true
                    }
            }
            .onAppear(perform: {
                firestoreManager.fetchData(collectionName: "items")
            })

            HStack {
                TextField("New Item", text: $newItemName)
                Button(action: {
                    firestoreManager.addData(collectionName: "items", name: newItemName)
                }) {
                    Text("Add")
                }
            }.padding()
        }
        .sheet(isPresented: $isEditing) {
            VStack {
                TextField("Edit Item", text: $currentItemName)
                Button("Update") {
                    // Здесь должен будет код для обновления данных в Firestore.
                    isEditing = false
                }
                Button("Cancel") {
                    isEditing = false
                }
            }
            .padding()
        }
    }
}

struct FirestoreView_Previews: PreviewProvider {
    static var previews: some View {
        FirestoreView()
    }
}

