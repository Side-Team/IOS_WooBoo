//
//  ImageViewController.swift
//  WooBoo_Project
//
//  Created by 이민우 on 2021/02/27.
//

import UIKit

var imageFileName_ImageView = ""

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1.이미지와 이미지 뷰 객체 생성

        if imageFileName_ImageView == ""{
            self.preferredContentSize = CGSize(width:-100,height:-100)

        }else{
            //url에 정확한 이미지 url 주소를 넣는다.
            let url = URL(string: "http://localhost:8080/Images/\(imageFileName_ImageView)")
            print("image url : \("http://localhost:8080/Images/\(imageFileName_ImageView)")")
            var image : UIImage?
            //DispatchQueue를 쓰는 이유 -> 이미지가 클 경우 이미지를 다운로드 받기 까지 잠깐의 멈춤이 생길수 있다. (이유 : 싱글 쓰레드로 작동되기때문에)
            //DispatchQueue를 쓰면 멀티 쓰레드로 이미지가 클경우에도 멈춤이 생기지 않는다.
            DispatchQueue.global().async { let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check /try-catch
                DispatchQueue.main.async { [self] in image = UIImage(data: data!)
                    //            let icon = UIImage(named: "image1.jpeg") //실제 이미지를 저장하는 객체
                    let icon = image
                    
                    // Resize
//                    let size = CGSize(width: CGFloat((icon!.size.width)), height: CGFloat(icon!.size.height))
                    //            let size = sizeOfImageAt(url: url!)
                    
                    if (icon?.size.width)! >= 200 || (icon?.size.height)! >= 200{
                        
                    }
                    let size = CGSize(width: 200, height: 100)

                    
//                    let rect = CGRect(x: 0, y: 0, width: size.width / 2 , height: size.height / 2 )
                    let rect = CGRect(x: 0, y: 0, width: size.width , height: size.height )
                    
                    UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
                    
                    icon!.draw(in: rect)
                    
                    let new_image = UIGraphicsGetImageFromCurrentImageContext()!
                    
                    UIGraphicsEndImageContext()
                    //----------------
                    
                    let iconV = UIImageView(image:new_image) // 이미지 객체를 이용해서 화면에 표시하는 뷰의 일종
                    
                    
                    
                    //2. 이미지 뷰의 영역과 위치를 지정
                    iconV.frame = CGRect(x:0, y:0, width:(new_image.size.width ),height:(new_image.size.height))
//                    iconV.frame = CGRect(x:10, y:0, width:200,height:200)
                    
                    
                    //3. 루트뷰에 이미지 뷰를 추가
                    self.view.addSubview(iconV)
                    
                    //preferredContentSize 속성을 통해 외부 객체가 ImageViewController를 나타낼 때 참고할 사이즈 지정
                    
                    //4.  외부에서 참조할 뷰 컨트롤러 사이즈를 이미지 크기와 동일하게 설정 + 10은 알림창에 이미지가 표시될때 아래 여백 주기
                    self.preferredContentSize = CGSize(width:(new_image.size.width),height:(new_image.size.height) - 160)
//                    self.preferredContentSize = CGSize(width:200,height:200)
                    
        }

            }
        }
    }
    
        func sizeOfImageAt(url: URL) -> CGSize? {
          // with CGImageSource we avoid loading the whole image into memory
          guard let source = CGImageSourceCreateWithURL(url as CFURL, nil) else {
              return nil
          }

          let propertiesOptions = [kCGImageSourceShouldCache: false] as CFDictionary
          guard let properties = CGImageSourceCopyPropertiesAtIndex(source, 0, propertiesOptions) as? [CFString: Any] else {
              return nil
          }

          if let width = properties[kCGImagePropertyPixelWidth] as? CGFloat,
              let height = properties[kCGImagePropertyPixelHeight] as? CGFloat {
              return CGSize(width: width, height: height)
          } else {
              return nil
          }
      }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//extension UIImageView {
//    func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}
