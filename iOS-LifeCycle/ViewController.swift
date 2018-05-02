//
//  ViewController.swift
//  iOS-LifeCycle
//
//  Created by mn(D128) on 2018/05/02.
//  Copyright © 2018年 mn(D128). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    deinit {
        print("\(self.presentingVCDesc()) \(self.title ?? "") deinit")
    }
    
    override func loadView() {
        super.loadView()
        
        print("\(self.presentingVCDesc()) \(self.title ?? "") loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(self.presentingVCDesc()) \(self.title ?? "") viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("\(self.presentingVCDesc()) \(self.title ?? "") viewWillAppear")

        if self.navigationController?.presentingViewController != nil,
            self.navigationController?.viewControllers.first == self {
            let item: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel,
                                                        target: self,
                                                        action: #selector(dismissDidTap(_:)))
            self.navigationItem.leftBarButtonItem = item
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("\(self.presentingVCDesc()) \(self.title ?? "") viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("\(self.presentingVCDesc()) \(self.title ?? "") viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("\(self.presentingVCDesc()) \(self.title ?? "") viewDidDisappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        print("\(self.presentingVCDesc()) \(self.title ?? "") didReceiveMemoryWarning")
        
        if self.view.window == nil {
            self.view = nil
        }
    }
    
    @IBAction private func pushDidTap(_ sender: Any) {
        let sb: UIStoryboard = UIStoryboard(name: "ViewController", bundle: nil)
        if let vc: UIViewController = sb.instantiateInitialViewController() {
            vc.title = "画面\(self.navigationController?.viewControllers.count ?? 0)"
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction private func modalDidTap(_ sender: Any) {
        let sb: UIStoryboard = UIStoryboard(name: "ViewController", bundle: nil)
        if let vc: UIViewController = sb.instantiateInitialViewController() {
            vc.title = "画面0"
            
            let nc: UINavigationController = UINavigationController(rootViewController: vc)
            self.present(nc, animated: true, completion: nil)
        }
    }
    
    @objc private func dismissDidTap(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func presentingVCDesc() -> String {
        if let vc: UIViewController = self.navigationController?.presentingViewController {
            return "\(Unmanaged.passUnretained(vc).toOpaque())"
        }
        
        return ""
    }

}

