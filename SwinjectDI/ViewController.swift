//
//  ViewController.swift
//  SwinjectDI
//
//  Created by deniz karahan on 19.08.2022.
//

import UIKit
import Swinject

protocol BackgroundColorProvider{
    var backgroundColor : UIColor {get}
}

final class ViewController: UIViewController {
    //swinject part
    let container : Container = {
        let container = Container()
        container.register(BackgroundColorProviding.self) { resolver in
            return BackgroundColorProviding()
        }
     
        container.register(SecondVC.self){ resolver in
            let vc = SecondVC.init(providerProtocol: resolver.resolve(BackgroundColorProviding.self)!)
            return vc
        }
     
        return container
        
    }(
)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.setTitle("click here", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(openNewVC), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func openNewVC(){
        guard let vc = container.resolve(SecondVC.self) else {return}
        present(vc, animated: true)
    }
}

