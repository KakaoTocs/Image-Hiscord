//
//  HomeViewController.swift
//  Image Hiscord
//
//  Created by 김진우 on 2022/10/11.
//

import UIKit

import RxCocoa
import Then

final class HomeViewController: UIViewController {
    
    private let viewModel: ViewModel
    private let viewHolder: ViewHolder = .init()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindOutput()
        bindInput()
    }
    
    func bindInput() {
        
    }
    
    func bindOutput() {
        
    }
}
