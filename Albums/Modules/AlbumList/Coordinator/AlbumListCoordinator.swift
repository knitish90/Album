//
//  TrackListCoordinator.swift
//  Albums
//
//  Created by Nitish.kumar on 23/08/20.
//  Copyright © 2020 Nitish.kumar. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator : class {
    var childCoordinators : [Coordinator] { get set }
    init(navigationController : UINavigationController)
    func start()
}

class AlbumListCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    let navigationController:UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController   =   navigationController
    }
    
    func start() {
        let controller = AlbumListViewController.instance()
        controller.viewModel    =  AlbumListViewModel(service: Albumservice(httpClient: HTTPClient()))
        self.navigationController.viewControllers   =   [controller]
    }
}

