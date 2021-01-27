//
//  ContentView.swift
//  SwiftUI-MVVM-Example
//
//  Created by Zak Barlow on 26/01/2021.
//

import SwiftUI

struct Book: Identifiable, Codable {
    var id = UUID()
    let title: String
}

class ContentViewModel: ObservableObject {
    
    @Published var books: [Book] = [
        Book(title: "Harry Potter and the Philosopher's Stone"),
        Book(title: "Thunderball"),
        Book(title: "The Fellowship of the Ring")
    ]
    
    func fetchBooks() {
        //Get more books from your lovely API, decode using Codable etc...
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
            self.books = [
                Book(title: "Harry Potter and the Philosopher's Stone"),
                Book(title: "Harry Potter and the Chamber of Secrets"),
                Book(title: "Dr. No"),
                Book(title: "Goldfinger"),
                Book(title: "Thunderball"),
                Book(title: "The Fellowship of the Ring"),
                Book(title: "The Two Towers"),
                Book(title: "The Return of the King"),
                Book(title: "Wolf Hall"),
                Book(title: "Bring Up the Bodies"),
                Book(title: "The Mirror & the Light"),
                Book(title: "The Hobbit"),
                Book(title: "Mistborn Book 1: The Final Empire"),
                Book(title: "Mistborn Book 2: The Well of Ascension"),
                Book(title: "Mistborn Book 3: The Hero of Ages"),
                Book(title: "Seveneves"),
                Book(title: "The Last Wish"),
                Book(title: "Sword of Destiny"),
                Book(title: "A Game of Thrones"),
                Book(title: "A Clash of Kings"),
                Book(title: "A Storm of Swords"),
                Book(title: "A Feast for Crows"),
                Book(title: "A Dance with Dragons"),
                Book(title: "Past Tense"),
                Book(title: "Blue Moon"),
                Book(title: "The Sentinel")
            ].shuffled()
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.books) { book in
                    Text(book.title)
                }
            }.navigationBarTitle("Books")
            .navigationBarItems(trailing: Button(action: {
                viewModel.fetchBooks()
            }, label: {
                Text("Fetch Books")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
