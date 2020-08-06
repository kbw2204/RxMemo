//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by 강병우 on 2020/08/06.
//  Copyright © 2020 강병우. All rights reserved.
//

import UIKit

protocol ViewModelBindableType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController {
    
    mutating func bind(viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        bindViewModel()
    }
}

