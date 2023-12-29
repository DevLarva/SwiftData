//
//  Destination.swift
//  iTour
//
//  Created by 백대홍 on 12/16/23.
//

import Foundation
import SwiftData

@Model
class Destination {
    var name: String
    var details: String
    var date: Date
    var priority: Int
    @Relationship(deleteRule: .cascade) var sights = [Sight]()
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}


/*
 새로운 프로젝트를 시작하고 가장 먼저 데이터 모델을 정의하는 이유는 일반적으로 나머지 앱흐름이 모델로 부터 진행되기 때문.
 
 그럼 여기서 @Model은 어디에 쓰느냐?
 SwiftData 데이터베이스를 써서 Destination객체를 로드 및 저장할때 사용한다.
 
 
 @Relationship?
 Relationship은 어떤 entity가 변화될 때 다른 entity들에 미치는 변화를 표현한 것
 - 참고 링크
 
 https://medium.com/@youable.framios/swiftdata%EC%97%90%EC%84%9C-relationship-query-macro-%EC%95%8C%EC%95%84%EB%B3%B4%EA%B8%B0-9242058ba3a6
 */
