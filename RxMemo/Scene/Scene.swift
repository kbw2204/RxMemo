//
//  Scene.swift
//  RxMemo
//
//  Created by 강병우 on 2020/08/08.
//  Copyright © 2020 강병우. All rights reserved.
//

import UIKit

enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

extension Scene {
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .list(let viewModel):
            guard let navigationController = storyboard.instantiateViewController(withIdentifier: "MemoListNavigationController") as? UINavigationController else {
                fatalError()
            }
            guard var listViewController = navigationController.viewControllers.first as? MemoListViewController else {
                fatalError()
            }
            listViewController.bind(viewModel: viewModel)
            return navigationController
        case .detail(let viewModel):
            guard var detailVionController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? MemoDetailViewController else {
                fatalError()
            }
            detailVionController.bind(viewModel: viewModel)
            return detailVionController
            
            case .compose(let viewModel):
            guard let navigationController = storyboard.instantiateViewController(withIdentifier:
            "ComposNavigationController") as? UINavigationController else {
                fatalError()
            }
            guard var composeViewController = navigationController.viewControllers.first as?
            MemoComposeViewController else {
                fatalError()
            }
            
            composeViewController.bind(viewModel: viewModel)
            return navigationController
        }
    }
}
