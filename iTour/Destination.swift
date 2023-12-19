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
 
 */
