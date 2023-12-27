//
//  ViewController.swift
//  UIFaster
//
//  Created by 0000 on 2023/12/5.
//

import UIKit
//import GrowingTextView
import IQKeyboardManagerSwift
import SnapKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let array = [Person.init(name: "福利卡司法拘留可视对讲理发扩大升级漏发的设计拉法基手打理发", age: 2),
                 Person.init(name: "福利卡漏发的设计拉法基手打理发", age: 2),
                 Person.init(name: "福利卡司法拘留可视对讲理发\n扩大升级漏发的设计拉法基手打理发", age: 1),
                 Person.init(name: "福利卡司法\n拘留可视对讲理发扩大升级漏发\n的设计拉法基手打理发", age: 1),
                 Person.init(name: "福利卡司法拘留扩大升级漏发的设\n计拉法基手打理发", age: 2),
                 Person.init(name: "福利卡司法拘留可视kfsdfjlksdjflksdjl对讲理发扩大升级漏发的设计拉法基手打理发", age: 2)]
   
    var iconImv = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: "NormalCell")
        // Do any additional setup after loading the view.
        loadTestDataFromBundle()
        let url = ""
//        let a = URL(string: url)!
//        print("\(a)")
        
        view.addSubview(iconImv)
        iconImv.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        iconImv.contentMode = .scaleAspectFill
        iconImv.layer.cornerRadius = 50.0
        iconImv.clipsToBounds = true
        iconImv.image = UIImage(named: "demo_person")
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.bringSubviewToFront(iconImv)
        
        
    }

    func setupViews() {
        let bb = BBC(aaa: BBC.AAA(bbb: true))
        guard let enableChecked = bb.aaa?.bbb, enableChecked else {
           print("Not Pass")
            return
        }
        print("Pass")
    }
}

struct BBC {
    let aaa: AAA?
    struct AAA {
        let bbb: Bool?
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell", for: indexPath) as! NormalCell
        cell.person = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        ImageBrowser.showImage(image: iconImv.image!, begingView: iconImv, currentVC: self)
        
        let vc = LMSearchVC.instantiate()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    
    
    private func loadTestDataFromBundle() {
//       let json = """
//       {
//          "status_code": 200,
//          "error_code": null,
//          "message": "User profile fetched successfully",
//          "data": {
//             "user_id": "f6b5f123-84e8-476e-9c02-538a907d231e",
//             "username": "269744",
//             "unique_id": 269744,
//             "display_name": "269744",
//             "bio": "My bio",
//             "profile_image_url": "",
//             "credits": 15,
//             "free_credits": 0,
//             "face_model_training_status": 2,
//             "image_generation_status": 0,
//             "gender": "female",
//             "wechat_openid": null,
//             "wechat_unionid": null,
//             "likes": 0,
//             "follower": 0,
//             "following": 0,
//             "public": false,
//             "created_date": "2023-12-19T02:14:59",
//             "updated_date": "2023-12-22T02:25:07",
//             "last_activity_time": null,
//             "last_activity_level": null,
//             "device_token": "",
//             "android_device_token": "",
//             "notification_level": null,
//             "phone_number": null,
//             "timezone": "",
//             "lang_code": "en",
//             "app_code": "en",
//             "country_code": "US",
//             "gpu_region": null,
//             "restore_face": false,
//             "ratio": 0,
//             "promotion_purchased": true,
//             "region": "intl",
//             "promotion_purchaseable": false,
//             "watermark": false,
//             "aspect_ratio": "2:3",
//             "image_quality": "Standard",
//             "parallel_generations": true,
//             "skip_generation_queue": true,
//             "image_quantity": 1,
//             "pre_trained_model": "Rachel",
//             "tutorial_finish_status": true,
//             "sandbox": 0,
//             "subscription": {
//                "subscription_id": "com.artsseai.sub2.pro",
//                "subscription_name": "Pro",
//                "status": "active",
//                "purchase_token": "460001739966719",
//                "expiration_date": null
//             },
//             "preferences": {
//                "image_quantity": null,
//                "skin_tone": "Medium",
//                "weight": "Medium",
//                "height": "Tall",
//                "hair": "Black",
//                "ai_model": "Pro",
//                "realistic_images": true,
//                "auto_face_smoothing": "Default",
//                "lighting": "None",
//                "photo_type": "None",
//                "shot_type": "None",
//                "bust_size": "Big",
//                "hair_style": "Not Specified",
//                "nsfw_filter": true
//             },
//             "generated_images": 477,
//             "hair": "Black",
//             "email": "",
//             "device_id": "",
//             "ai_avatar": "https://storage.mumuxiang.cloud/user_images/f6b5f123-84e8-476e-9c02-538a907d231e/145de129-edfb-4a28-b90f-270482b40c45.jpg",
//             "platform": "",
//             "version": "",
//             "wechat": "",
//             "phone": "",
//             "credits_free": 0,
//             "credits_paid": 0,
//             "trained_image_list": "",
//             "saved_template_list": "",
//             "updated_username": false,
//             "credits_pre_image": 1
//          }
//       }
//       """
        
        let json = """
        {
            "name": "ABC",
            "age": 102
        }
        """
       
       // 将 JSON 字符串转换为 Data
       if let jsonData = json.data(using: .utf8) {
           do {
               // 使用 JSONDecoder 进行解码
               let person = try JSONDecoder().decode(Person.self, from: jsonData)
               
               // 打印解码后的结构体实例
               print(person)
           } catch {
               print("Error decoding JSON: \(error)")
           }
       } else {
           print("Failed to convert JSON string to Data.")
       }
    }
}
