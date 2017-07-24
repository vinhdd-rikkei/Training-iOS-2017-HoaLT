//
//  RatioView.swift
//  Training iOS HoaLT Exercise 2
//
//  Created by Vinh Dang Duc on 7/24/17.
//  Copyright © 2017 Vinh Dang Duc. All rights reserved.
//

import UIKit

@objc protocol RatioViewDelegate {
    func ratioView(view: RatioView, didCheck check: Bool)
}

class RatioView: UIView {
    //* Lưu ý: Với mọi đối tượng giao diện (button, view, label, table view, collection view, ...) thì đều phải set WEAK để tránh tình trạng retain cycles dẫn đến leak bộ nhớ
    weak var ratioButton: UIButton!
    
    //* Lưu ý: Khi khai báo protocol delegate, phải dùng WEAK để tránh tình trạng retain cycles
    weak var delegate: RatioViewDelegate?
    
    // Biến này dùng để check xem ratio đã check hay chưa
    var isChecked = false {
        //Subscript bắt sự kiện biến này sắp được set (willSet) một giá trị là (value)
        willSet(value) {
            guard self.ratioButton != nil else { return }
            let newBgImage = value ? UIImage(named: "ic_ratio_check") : UIImage(named: "ic_ratio_uncheck")
            self.ratioButton.setBackgroundImage(newBgImage, for: .normal)
        }
    }
    
    // Khi một view được khởi tạo ở interface, nó sẽ nhảy vào hàm này 1 lần duy nhất
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Khởi tạo ratio button
        self.createRatioButton()
    }
    
    private func createRatioButton() {
        // Thiết lập ban đầu
        let button = UIButton(frame: self.bounds)
        button.setBackgroundImage(UIImage(named: "ic_ratio_uncheck"), for: .normal)
        button.backgroundColor = .clear
        
        // Add sự kiện tap cho button
        button.addTarget(self, action: #selector(self.ratioButtonAction(sender:)), for: .touchUpInside)
        
        // Add button vào view
        self.addSubview(button)
        self.ratioButton = button
    }
    
    // MARK: - Actions
    func ratioButtonAction(sender: UIButton) {
        if !self.isChecked {
            self.isChecked = true
            self.delegate?.ratioView(view: self, didCheck: self.isChecked)
        }
    }

}
