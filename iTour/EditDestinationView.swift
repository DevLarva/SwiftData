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
    @State private var newSightName = ""
    
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
            Section("Sight") {
                ForEach(destination.sights) { sight in
                    Text(sight.name)
                }
                HStack {
                    TextField("Add a new sight in \(destination.name)", text:   $newSightName)
                    
                    Button("추가",action: addSight)
                }
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addSight() {
        guard newSightName.isEmpty == false else { return }
        
        withAnimation {
            let sight = Sight(name: newSightName)
            destination.sights.append(sight)
            newSightName = ""
        }
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
 관찰 가능한 객체의 변경 가능한 속성에 대한 바인딩 생성을 지원하는 속성 래퍼
 유형입니다.
 
 그럼 바인딩과의 차이점은?
 https://www.donnywals.com/whats-the-difference-between-binding-and-bindable/
 */
