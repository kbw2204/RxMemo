//
//  Memo.swift
//  RxMemo
//
//  Created by 강병우 on 2020/08/06.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

struct Memo: Equatable {
    var content: String
    var insertDate: Date
    var identity: String
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}

