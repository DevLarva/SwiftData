//
//  EditDestinationView.swift
//  iTour
//
//  Created by 백대홍 on 12/17/23.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    @Bindable var destination: Destination
    var body: some View {
        Form {
            TextField("이름", text: $destination.name)
            TextField("상세정보", text: $destination.details, axis: .vertical)
            DatePicker("날짜",selection: $destination.date)
            
            Section("속성") {
                Picker("속성",selection: $destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Ex Destination", details: "Ex")
        return EditDestinationView(destination: example)
            .modelContainer(container)
    } catch {
        fatalError("Error tp create model container")
    }
}


/*
 @Bindable?
 
 */
