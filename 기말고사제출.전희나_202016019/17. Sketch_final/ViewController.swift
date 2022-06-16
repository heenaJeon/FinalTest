//
//  ViewController.swift
//  17. Sketch_final
//
//  Created by 203a15 on 2022/06/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblPic: UILabel!
    @IBOutlet var lblDraw: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var picView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    var images = ["피카츄.jpeg", "꼬부기.jpeg", "이상해씨.jpeg", "파이리.jpeg", "잠만보.jpeg", "푸린.jpeg"]
    
    var lastPoint: CGPoint! //바로 전에 터치하거나 이동한 위치
    var lineSize:CGFloat = 2.0 //선의 두께 2.0
    var lineColor = UIColor.black.cgColor //선의 색상 빨간색
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count //전체 페이지 수
        pageControl.currentPage = 0 //현재 페이지
        pageControl.pageIndicatorTintColor = UIColor.green //페이지 컨트롤의 페이지 표시 부분의 색상 초록색으로 설정
        pageControl.currentPageIndicatorTintColor = UIColor.blue //페이지 컨트롤의 현재 페이지 표시 부분의 색상 파란색으로 설정
        
        picView.image = UIImage(named: images[0])
        
    }

    @IBAction func btnClearImageView(_ sender: UIButton) {
        imgView.image = nil //nil: 아무것도 없다는 뜻. 이미지 뷰의 이미지를 삭제.
    }
    
    
    /* 터치 이벤트 사용을 위해 터치 이벤트 발생 시 호출되는 메서드 재정의: touchesBegan, touchesMoved, touchesEnded */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch //현재 발생한 터치 이벤트 가져오기
        
        lastPoint = touch.location(in: imgView)//터치한 위치를 lastPoint라는 변수에 저장
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size) //그림을 그리기 위한 콘텍스트 생성
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor) //선 색상 설정
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round) //라인의 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)//선 두께를 설정
        
        let touch = touches.first! as UITouch //현재 발생한 터치 이벤트를 가지고 온다.
        let currPoint = touch.location(in: imgView) //터치된 위치를 currPoint로 가지고 온다.
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height)) //현재 이미지뷰에 있는 이미지를 이미지뷰의 크기로 그린다.
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y)) //lastpoint로 시작 위치를 이동시킨다.
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))//lastPoint에서 현재 위치인 currPoint까지 선 추가.
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() //현재 콘텍스트에 그려진 이미지를 가지고 와서 이미지 뷰에 할당
        UIGraphicsEndImageContext()// 그림 그리기를 끝냄
        
        lastPoint = currPoint //현재 터치된 위치를 lastPoint라는 변수에 할당한다.
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake //셰이크라는 모션 이벤트가 발생한 경우
        {
            imgView.image = nil //이미지 뷰의 이미지를 nil로 대체하여 이미지를 삭제한다.
        }
    }
    @IBAction func pageChange(_ sender: UIPageControl) {
        picView.image = UIImage(named: images[pageControl.currentPage])//페이지컨트롤의 현재 페이지를 가지고 오고 현재 페이지에 해당하는 이미지 파일의 이름을 images 배열에서 가져오고 UIImage타입의 이미지를 만든 후 그 이미지를 이미지 뷰에 할당한다.
    }
}

