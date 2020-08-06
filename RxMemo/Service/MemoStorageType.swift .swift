//
//  MemoStorageType.swift .swift
//  RxMemo
//
//  Created by 강병우 on 2020/08/06.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

import RxSwift

protocol MemoStorageType {
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
