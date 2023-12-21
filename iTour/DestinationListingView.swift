//
//  DestinationListingView.swift
//  iTour
//
//  Created by 백대홍 on 12/21/23.
//

import SwiftData
import SwiftUI

struct DestinationListingView: View {
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse),SortDescriptor(\Destination.name)]) var destinations: [Destination]
    @Environment(\.modelContext) var modelContext
    var body: some View {
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
    }
    
    init(sort: SortDescriptor<Destination>) {
        _destinations = Query(sort: [sort])
    }
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name))
}
