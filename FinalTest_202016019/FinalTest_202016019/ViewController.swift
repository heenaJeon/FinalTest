//
//  ViewController.swift
//  FinalTest_202016019
//
//  Created by 203a15 on 2022/06/16.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var picView: UIImageView!
    @IBOutlet var lblPic: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    
    var images = ["피카츄.jpeg", "꼬부기.jpeg", "이상해씨.jpeg", "파이리.jpeg", "잠만보.jpeg", "푸린.jpeg"] //변수 images: 화면에 보여 줄 이미지 파일(포켓몬사진)의 이름 저장한 배열
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var lblDraw: UILabel!
    
    var lastPoint: CGPoint! //바로 전에 터치하거나 이동한 위치
    var lineSize:CGFloat = 2.0 //선의 두께
    var lineColor = UIColor.black.cgColor //선의 색상은 black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count // 페이지 컨트롤의 전체 페이지 수
        
        pageControl.currentPage = 0 //현재 페이지
        
        pageControl.pageIndicatorTintColor = UIColor.green //페이지 컨트롤의 페이지를 표시한 부분의 색상은 초록색
        
        pageControl.currentPageIndicatorTintColor = UIColor.blue //페이지 컨트롤의 현재 페이지를 표시하는 색상은 파란색
        
        picView.image = UIImage(named: images[0])
    }
    
    //사용자 화면 터치 시 스케치 시작하는 touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch //현재 발생한 터치 이벤트 가져오기
        
        lastPoint = touch.location(in: imgView) //터치된 위치를 lastPoint변수에 저장
    }
    
    //두 번째로 터치한 손가락 움직이면 따라서 스케치가 움직이도록 하는 touchesMoved
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round) //라인의 끝 모양 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch //현재 발생한 터치 이벤트 가져오기
        let currPoint = touch.location(in: imgView) //터치된 위치를 currPoint로 가져오기
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height)) //현재 이미지뷰에 있는 이미지를 이미지뷰의 크기로 그리기
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y)) //이전에 이동된 위치인 lastPoint로 시작 위치 이동시키기
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))//lastPoint에서 현재 위치인 currPoint까지 선을 추가
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint //현재 터치된 위치를 lastPoint변수에 할당
    }
    
    //사용자가 손가락을 떼었을 때 스케치 끝나도록 touchesEnded
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
        if motion == .motionShake { //셰이크 모션 이벤트 발생시
            imgView.image = nil //이미지 뷰의 이미지를 nil로 대체. 이미지 삭제됨
        }
    }

    @IBAction func btnClearImageView(_ sender: UIButton) {
        imgView.image = nil //이미지 뷰의 이미지 없애기(그림 그린 것 지우기)
    }
    
    //페이지가 변경될 때 동작할 pageChange함수 코딩
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        picView.image = UIImage(named: images[pageControl.currentPage])
    }
    //페이지 컨트롤의 현재 페이지 가져오고 현재 페이지에 해당하는 이미지 파일의 이름을 images배열에서 가져오고 UIImage타입의 이미지 만든 후 이미지 뷰에 만든 이미지 할당한다.
    
}

