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
                    NavigationLink(value: destinations) {
                        VStack(alignment:.leading) {
                            Text(destinations.name)
                                .font(.headline)
                            
                            Text(destinations.date.formatted(date:.long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteDestinations)
            }
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
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
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    ContentView()
}


/*
 @Query는 무엇인가?
 SwiftData가 관리하는 모든 Destination개체를 읽는다.
 뷰가 나타나면 즉시 모든 대상을 로드하고 Destination개체가 추가, 삭제
 또는 변경될때마다 데이터베이스의 변경사항도 항시 감시한다. 그때 destinations의 속성도 업데이트한다.
 */
