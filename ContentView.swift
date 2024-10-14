//
//  ContentView.swift
//  Lists
//
//  Created by Daniel Gehrman on 10.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var newWord = ""
    @State private var words = [String]()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter a new word", text: $newWord)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: {
                        addWord()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 25))
                            .padding(.trailing)
                    }
                    .disabled(newWord.isEmpty) // Disable button if input is empty
                }

                List {
                    ForEach(words, id: \.self) { word in
                        Text(word)
                    }
                    .onDelete(perform: deleteWord)
                }
                .navigationTitle("My List")
            }
        }
    }

    func addWord() {
        if !newWord.isEmpty {
            words.append(newWord)
            newWord = "" // Clear the input field
        }
    }

    func deleteWord(at offsets: IndexSet) {
        words.remove(atOffsets: offsets)
    }
}
