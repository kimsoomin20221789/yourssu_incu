//
//  Contents.swift
//  Memo
//
//  Created by 김수민 on 2023/05/22.
//

import Foundation
class UserInformation {
    //싱글톤 활용하여 데이터 모아놓기
    //타입프로퍼티 생성
    static let shared: UserInformation = UserInformation()
    
    var memoTitle: [String] = []
    var memoContent: [String] = []
    
}
