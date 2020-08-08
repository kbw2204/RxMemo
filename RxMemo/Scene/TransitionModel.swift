//
//  TransitionModel.swift
//  RxMemo
//
//  Created by 강병우 on 2020/08/08.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}
enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
