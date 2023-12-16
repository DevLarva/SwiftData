//
//  ContentView.swift
//  iTour
//
//  Created by 백대홍 on 12/16/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var destinations: [Destination]
    var body: some View {
        NavigationStack {
            List {
                ForEach(destinations) { destinations in
                    VStack(alignment:.leading) {
                        Text(destinations.name)
                            .font(.headline)
                        
                        Text(destinations.date.formatted(date:.long, time: .shortened))
                    }
                    
                }
            }
            .navigationTitle("iTour")
            .toolbar {
                Button("샘플 추가", action: addSamples)
            }
        }
    }
    func addSamples() {
        let rome = Destination(name: "Rome")
        let florence = Destination(name: "Florence")
        let naples = Destination(name: "Naples")
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
}

#Preview {
    ContentView()
}
