//
//  Firestore.swift
//  Animation
//
//  Created by Валерий Никитин on 09.10.2023.
//


import Foundation
import Firebase
import Combine

class FirestoreManager: ObservableObject {
    private var db = Firestore.firestore()
    @Published var items: [String] = []
    @Published var error: String?
    
    func fetchData(collectionName: String) {
        db.collection(collectionName).getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                self.showError(err.localizedDescription)
            } else {
                self.items = querySnapshot!.documents.compactMap({$0.data()["name"] as? String})
            }
        }
    }

    func addData(collectionName: String, name: String) {
        var ref: DocumentReference? = nil
        ref = db.collection(collectionName).addDocument(data: [
            "name": name
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
                self.showError(err.localizedDescription)
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func deleteData(collectionName: String, documentId: String) {
        db.collection(collectionName).document(documentId).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
                self.showError(err.localizedDescription)
            } else {
                print("Document successfully removed!")
            }
        }
    }

    func showError(_ message: String) {
        error = message
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.error = nil
        }
    }
}
