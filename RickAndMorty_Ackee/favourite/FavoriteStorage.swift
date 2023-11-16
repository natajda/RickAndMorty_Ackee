////
////  FavoriteStorage.swift
////  RickAndMorty_Ackee
////
////  Created by Natália Pohanková on 16/11/2023.
////
//
//import Foundation
//To avoid duplicating the code for encoding and decoding an array of integers using `JSONEncoder` and `JSONDecoder`, you can create a utility class or extension. Here's an example using an extension on `UserDefaults`:
//
//```swift
//import Foundation
//
//extension UserDefaults {
//    func setIntArray(_ array: [Int], forKey key: String) {
//        do {
//            let data = try JSONEncoder().encode(array)
//            set(data, forKey: key)
//        } catch {
//            print("Error encoding array: \(error)")
//        }
//    }
//
//    func getIntArray(forKey key: String) -> [Int] {
//        guard let data = data(forKey: key) else { return [] }
//
//        do {
//            return try JSONDecoder().decode([Int].self, from: data)
//        } catch {
//            print("Error decoding array: \(error)")
//            return []
//        }
//    }
//}
//
//struct ContentView: View {
//    @AppStorage("favorites") private var favorites: [Int] = []
//
//    var body: some View {
//        VStack {
//            // Example: Add a favorite
//            Button("Add Favorite") {
//                favorites.append(42)
//                UserDefaults.standard.setIntArray(favorites, forKey: "favorites")
//            }
//
//            // Example: Display favorites
//            Text("Favorites: \(favorites)")
//        }
//    }
//}
//```
//
//Now, you can use `UserDefaults.standard.setIntArray` and `UserDefaults.standard.getIntArray` throughout your code wherever you need to store or retrieve an array of integers. This reduces code duplication and makes it easier to maintain.
