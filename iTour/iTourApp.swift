//
//  iTourApp.swift
//  iTour
//
//  Created by 백대홍 on 12/16/23.
//

import SwiftUI
import SwiftData

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for:Destination.self)
    }
}


/*
 .modelContatiner란?
 Sets the model container in this scene for storing the provided model type, creating a new container if necessary, and also sets a model context for that container in this scene’s environment.
 
 모든 창에서 사용할 공유 모델 컨테이너를 설정해서 전역으로 사용
 
 1. Destination 개체에 대한 저장소를 생성하거나, 이전에 생성된 경우 로드합니다.
 2. 해당 저장소를 사용하여 전체 앱인 창 그룹 내부의 모든 데이터를 사용하세요.
 */
