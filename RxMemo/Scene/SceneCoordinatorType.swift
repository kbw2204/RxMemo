//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by 강병우 on 2020/08/08.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool)
    -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}
