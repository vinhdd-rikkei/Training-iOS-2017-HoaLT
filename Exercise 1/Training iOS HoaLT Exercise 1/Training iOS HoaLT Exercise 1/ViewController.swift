//
//  ViewController.swift
//  Training iOS HoaLT Exercise 1
//
//  Created by Vinh Dang Duc on 7/20/17.
//  Copyright © 2017 Vinh Dang Duc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Start coding exercises
        self.doExercises()
    }
    
    func doExercises() {
        //1.1
        print("[1.1]\nHello world\n")
        
        //1.2
        print("[1.2]")
        let horizontalNumber = 15
        let verticalNumber = 12
        for i in 1...verticalNumber {
            var temp = ""
            for j in 1...horizontalNumber {
                if j == 1 || j == horizontalNumber || i == 1 || i == verticalNumber {
                    temp += "*"
                } else {
                    temp += " "
                }
            }
            print(temp)
        }
        print("\n")
        
        //1.3
        print("[1.3]")
        var stringArr = ["VinhDD", "HoaLT", "ThangVD", "DatPT2", "ThanhNT3", "NamHV", "SonBX", "CuHT"]
        print("> Array before: \(self.getArrayContentString(arr: stringArr))")
        stringArr.append("ThanhLH")
        stringArr.append("HoaiLTT")
        print("> Array after: \(self.getArrayContentString(arr: stringArr))\n")
        
        //1.4
        print("[1.4]")
        var userDic = Dictionary<String, Any>()
        userDic["name"] = "VinhDD"
        userDic["age"] = 23
        userDic["address"] = "Ha Noi"
        userDic["phoneNumber"] = "0123456789"
        print("> Name of user is: \(userDic["name"] ?? "unknown")")
        
        //1.5
        print("[1.5]")
        var dicArr = [Dictionary<String, Any>]()
        dicArr.append(self.getUserDictionaryWith(name: "Vinh", age: 23, address: "Ha Noi", phoneNumber: "0196472569"))
        dicArr.append(self.getUserDictionaryWith(name: "Hung", age: 19, address: "Bac Ninh", phoneNumber: "0914208791"))
        dicArr.append(self.getUserDictionaryWith(name: "Tien", age: 38, address: "Lao Cai", phoneNumber: "0963583942"))
        dicArr.append(self.getUserDictionaryWith(name: "Long", age: 30, address: "Vung Tau", phoneNumber: "0165486581"))
        dicArr.append(self.getUserDictionaryWith(name: "Trung", age: 32, address: "Can Tho", phoneNumber: "0914528292"))
        
        dicArr.sort(by: {
            if let firstAge = $0["age"] as? Int, let secondAge = $1["age"] as? Int {
                return firstAge < secondAge
            }
            return false
        })
        
        for userDic in dicArr {
            if let name = userDic["name"] as? String, let age = userDic["age"] as? Int {
                print("> Name: \(name), age: \(age)")
            }
        }
    }
    
    func getArrayContentString(arr: [String]) -> String {
        var returnStr = ""
        for element in arr {
            returnStr += "\(element) "
        }
        return returnStr
    }
    
    func getUserDictionaryWith(name: String, age: Int, address: String, phoneNumber: String) -> Dictionary<String, Any> {
        let returnDic: Dictionary<String, Any> = [
            "name" : name,
            "age" : age,
            "address" : address,
            "phoneNumber" : phoneNumber
        ]
        return returnDic
    }
    
}

