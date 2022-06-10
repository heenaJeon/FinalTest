//
//  ViewController.swift
//  DrawGraphics
//
//  Created by 203a15 on 2022/06/03.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Line
        context.setLineWidth(2.0) //선의 굵기
        context.setStrokeColor(UIColor.red.cgColor) //선 색상(빨강) 설정
        
        context.move(to: CGPoint(x: 70, y: 50)) //시작 위치 (70,50)
        context.addLine(to: CGPoint(x: 270, y:250))
        
        context.strokePath() //콘텍스트에 그리기
        
        
        //Draw Triangle
        context.setLineWidth(4.0) //선의 굵기
        context.setStrokeColor(UIColor.blue.cgColor) //선 색상(파랑)
        
        context.move(to: CGPoint(x:170, y: 200))
        context.addLine(to: CGPoint(x: 270, y: 350))
        context.addLine(to: CGPoint(x: 70, y: 350))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext() //현재 콘텍스트에 그려진 이미지 가지고서 이미지 뷰에 나타내기
        UIGraphicsEndImageContext() //그림그리기 끝내기
    }
    
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200)) //(70,100)시작, 폭이 200픽셀, 높이가 200픽셀인 사각형
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Ellipse
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))
        context.strokePath() //(70,50)에서 시작하고, 폭 200픽셀, 높이 100픽셀 사각형 안에 내접하는 타원
        
        //Draw Circle
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor) //선 색상(초록)
        
        context.addEllipse(in: CGRect(x: 70, y:200, width: 200, height: 200))
        context.strokePath() //정사각형에 내접하는 원 그리기
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Arc
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 250, y: 50), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50)) //두 접점 사이에 내접한 반지름이 50인 호
        context.addLine(to: CGPoint(x: 250, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x:270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Rectangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor)
        
        let rectangle = CGRect(x: 70, y: 50, width: 200, height: 100)
        context.addRect(rectangle)
        context.fill(rectangle)
        context.strokePath()
        
        //Draw Circle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.blue.cgColor)
        
        let circle = CGRect(x: 70, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle)
        context.strokePath()
        
        //Draw Triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 350))
        context.addLine(to: CGPoint(x: 270, y:450))
        context.addLine(to: CGPoint(x: 70, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 350))
        context.fillPath()
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
}

