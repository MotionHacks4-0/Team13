//
//  AddressRepo.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 03/05/25.
//

import Foundation

import Foundation
import FirebaseFirestore

final class AddressRepo {
    private let db = Firestore.firestore()
    private let collection = "addresses"

    func createAddress(_ address: Address, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            var newAddress = address
            newAddress.created_at = Timestamp(date: Date())
            newAddress.updated_at = Timestamp(date: Date())

            _ = try db.collection(collection).addDocument(from: newAddress) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }

    func fetchAddresses(completion: @escaping (Result<[Address], Error>) -> Void) {
        db.collection(collection).getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
            } else {
                let addresses = snapshot?.documents.compactMap { doc -> Address? in
                    try? doc.data(as: Address.self)
                } ?? []
                completion(.success(addresses))
            }
        }
    }

    func fetchAddress(by id: String, completion: @escaping (Result<Address, Error>) -> Void) {
        db.collection(collection).document(id).getDocument { document, error in
            if let error = error {
                completion(.failure(error))
            } else if let document = document, document.exists {
                do {
                    let address = try document.data(as: Address.self)
                    completion(.success(address))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError(domain: "AddressNotFound", code: 404, userInfo: nil)))
            }
        }
    }

    func updateAddress(_ address: Address, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let id = address.id else {
            completion(.failure(NSError(domain: "MissingAddressID", code: 400, userInfo: nil)))
            return
        }

        var updatedAddress = address
        updatedAddress.updated_at = Timestamp(date: Date())

        do {
            try db.collection(collection).document(id).setData(from: updatedAddress, merge: true) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }

    func deleteAddress(by id: String, completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection(collection).document(id).delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
