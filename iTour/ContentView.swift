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
    
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView(sort: sortOrder, searchString:searchText)
                .navigationTitle("iTour")
                .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
                .searchable(text: $searchText)
                .toolbar {
                    Button("목적지 추가", systemImage: "plus", action: addDestionation)
                    
                    Menu("정렬", systemImage: "arrow.up.arrow.down") {
                        Picker("정렬", selection: $sortOrder) {
                            
                            Text("이름")
                                .tag(SortDescriptor(\Destination.name))
                            
                            Text("속성")
                                .tag(SortDescriptor(\Destination.priority, order: .reverse))
                            
                            Text("날짜")
                                .tag(SortDescriptor(\Destination.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    func addDestionation() {
        let destionation = Destination()
        modelContext.insert(destionation)
        path = [destionation]
    }
    
    
}

#Preview {
    ContentView()
}

//MARK: - @Query는 무엇인가?
/*
 SwiftData가 관리하는 모든 Destination개체를 읽는다.
 뷰가 나타나면 즉시 모든 대상을 로드하고 Destination개체가 추가, 삭제
 또는 변경될때마다 데이터베이스의 변경사항도 항시 감시한다. 그때 destinations의 속성도 업데이트한다.
 */

//MARK: - searchable

/*
 - 대소문자 상관 없이 검색하기 위해서 string.contains()가 아닌, string.localizedStandardContains()
 - https://ios-development.tistory.com/1124
 */

