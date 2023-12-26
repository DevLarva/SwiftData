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
    
    init(sort: SortDescriptor<Destination>, searchString: String) {
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name),searchString: "")
}


/*
 SwiftData 쿼리를 정렬방법
 1. 이름에 따라 정렬
 - @Query(sort: \Destination.name)
 
 2.우선순위에 따라 내림차순으로 정렬
 - @Query(sort: \Destination.priority, order: .reverse) var destinations: [Destination]
 
 3. 둘 이상의 속성을 정렬 해야할때는 배열을 사용하는 예시
 @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destinations: [Destination]
 */
