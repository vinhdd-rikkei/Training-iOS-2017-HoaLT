//
//  ViewController.swift
//  Training iOS HoaLT Exercise 2
//
//  Created by Vinh Dang Duc on 7/21/17.
//  Copyright © 2017 Vinh Dang Duc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTf: UITextField!
    @IBOutlet weak var lastNameTf: UITextField!
    @IBOutlet weak var firstNameKanaTf: UITextField!
    @IBOutlet weak var lastNameKanaTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var dobTf: UITextField!
    @IBOutlet weak var firstTelTf: UITextField!
    @IBOutlet weak var secondTelTf: UITextField!
    @IBOutlet weak var thirdTelTf: UITextField!
    @IBOutlet weak var maleRatioView: RatioView!
    @IBOutlet weak var femaleRatioView: RatioView!
    @IBOutlet weak var registerBtn: UIButton!
    
    
    // MARK: - View life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Setup basic information for view
        self.setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        // Tìm mọi text field trong view và add delegate
        // Dùng cách này vì có quá nhiều text field, add delegate cho từng text field thì sẽ rất tù
        for subview in self.view.subviews {
            if subview is UITextField, let tf = subview as? UITextField {
                tf.delegate = self
            }
        }
        
        // Add delegate cho các nút ratio
        self.maleRatioView.delegate = self
        self.femaleRatioView.delegate = self
        self.maleRatioView.isChecked = true

    }
    
    // MARK: - Actions
    @IBAction func registerBtnAction(_ sender: UIButton) {
        // Kiểm tra tất cả các text field đã được điền hết chưa
        //* Gợi ý: Cú pháp guard (condition) else { ... return } là cú pháp điều kiện mới của Swift
        //         Ý nghĩa của nó là: Trừ khi (condition) hợp lệ còn không thì thực hiện { ... return }
        guard self.allTextFieldsHaveFilled() else {
            self.showQuickAlertWith(title: "Cảnh báo", message: "Chưa nhập đủ đầu vào")
            return
        }
        
        self.showQuickAlertWith(title: "Thông báo", message: "Đăng ký thành công")
        print("- Tên: \(self.firstNameTf.text!) \(self.lastNameTf.text!)")
        print("- Tên Kana: \(self.firstNameKanaTf.text!) \(self.lastNameKanaTf.text!)")
        print("- Email: \(self.emailTf.text!)")
        print("- Ngày sinh: \(self.dobTf.text!)")
        print("- Giới tính: \(self.maleRatioView.isChecked ? "Nam" : "Nữ")")
        print("- Số điện thoại 1: \(self.firstTelTf.text!)")
        print("- Số điện thoại 2: \(self.secondTelTf.text!)")
        print("- Số điện thoại 3: \(self.thirdTelTf.text!)")
    }
    
    // MARK: - UI
    func showQuickAlertWith(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Supporting methods
    
    // Kiểm tra xem chuỗi truyền vào có phải là 1 email không
    func isEmail(string: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: string)
    }
    
    // Kiểm tra xem tất cả các field đã được nhập chưa
    func allTextFieldsHaveFilled() -> Bool {
        for subview in self.view.subviews {
            if subview is UITextField, let tf = subview as? UITextField {
                if (tf.text == nil || tf.text == "") {
                    return false
                }
            }
        }
        return true
    }
}

//* Lưu ý: Với mọi delegate, nên để riêng ra extension cho view controller như bên dưới
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isFirstResponder {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.emailTf, let text = textField.text, text != "" {
            if !self.isEmail(string: text) {
                self.showQuickAlertWith(title: "Lỗi", message: "Email sai định dạng")
                self.emailTf.text = nil
            }
        }
    }
}

extension ViewController: RatioViewDelegate {
    func ratioView(view: RatioView, didCheck check: Bool) {
        if view == self.maleRatioView {
            self.femaleRatioView.isChecked = !check
        } else {
            self.maleRatioView.isChecked = !check
        }
    }
}
