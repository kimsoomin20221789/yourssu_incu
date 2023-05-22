//
//  Contents.swift
//  Memo
//
//  Created by 김수민 on 2023/05/22.
//

import Foundation
class UserInformation {
    //타입프로퍼티 생성
    static let shared: UserInformation = UserInformation()
    
    var memoTitle: [String] = []
    var memoContent: [String] = []
    
}
