//
//  FirestoreHelper.swift
//  ITP344-Spring2021-W4
//
//  Created by Jack Xu on 3/11/21.
//

import Foundation
import Firebase

class FirestoreHelper {
    
    private init() {}
    static let shared = FirestoreHelper()
    private let db = Firestore.firestore()
    
    func onUserSignIn(completion: @escaping (Error?) -> Void) {
        guard let user = Auth.auth().currentUser else { return }
        db.collection("users").document(user.uid).setData(["email": user.email ?? "", "name": user.displayName ?? ""]) { (error) in
            completion(error)
        }
    }
    
    func getUserDetails(completion: @escaping ([String: Any]?, Error?) -> Void) {
        guard let user = Auth.auth().currentUser else { return }
        db.collection("users").document(user.uid).getDocument { (snapshot, error) in
            completion(snapshot?.data(), error)
        }
    }
    
}
