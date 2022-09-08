//
//  SecondVC.swift
//  SwinjectDI
//
//  Created by deniz karahan on 23.08.2022.
//

import UIKit

final class SecondVC: UIViewController {
    private let providerProtocol : BackgroundColorProvider?
    
    init(providerProtocol: BackgroundColorProvider) {
        self.providerProtocol = providerProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = providerProtocol?.backgroundColor ?? .white

    }
}
