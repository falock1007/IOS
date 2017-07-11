//
//  PainterView.swift
//  falockAPP08
//
//  Created by user on 2017/6/23.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class PainterView: UIView {
    private var viewW:CGFloat = 0
    private var viewH:CGFloat = 0
    private var lines:Array<Array<(CGFloat,CGFloat)>> = []
    private var recycle:Array<Array<(CGFloat,CGFloat)>> = []
    private var isInit = false
    private var context:CGContext?
    
    private var img = UIImage(named:"oth208572992f46a037f8a4c459885487011f36c0d1d00300.jpg")
    private var imgW:CGFloat?
    private var imgH:CGFloat?
    private var ballImg = UIImage(named: "oth208572992f46a037f8a4c459885487011f36c0d1d00300.jpg")
    private var ballW:CGFloat?
    private var ballH:CGFloat?
    private var ballX:CGFloat = 1
    private var ballY:CGFloat = 1
    private var dx:CGFloat = 1
    private var dy:CGFloat = 1
    private var i = 0


    
    
    private func initState(_ rect:CGRect){
        isInit = true
        viewW = rect.size.width
        viewH = rect.size.height
        context = UIGraphicsGetCurrentContext()
        //draw中context那行就因此註解掉了
        
        
        
        //上下顛倒
//        let img = UIImage(named: "oth208572992f46a037f8a4c459885487011f36c0d1d00300.jpg")
        
        //        var temp = UIImageView(image: img)
        //        temp.frame = CGRect(x: 0, y: 0, width: imgW!, height: imgH!)
        //        addSubview(temp)
//        let imgCG = img?.cgImage
//        
//        img?.draw(in: CGRect(x: 0, y: 0, width: imgW!/3, height: imgH!/3))
        

        imgW = img?.size.width
        imgH = img?.size.height

        
        ballW = ballImg?.size.width
        ballH = ballImg?.size.height
        
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block:{
            (timer) in
            self.moveBall()
//            self.refreshView()
        })
        
    }
    

    
    func moveBall(){
        if ballX < 0 || ballX + ballW!/5 > viewW {
            dx *= -1
        }
        if ballY < 0 || ballY + ballH!/5 > viewH {
            dy *= -1
        }
        
        ballX += dx
        ballY += dy
        setNeedsDisplay()

        
        
    }
    
    
    
    // 呈現任何時候所看見的外觀（所以可以不斷更新）
    override func draw(_ rect: CGRect) {
       
        if !isInit {initState(rect)}
        
        backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 0, alpha: 1)
        
//        let context:CGContext? = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2)
        context?.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        
        img?.draw(in: CGRect(x: 0, y: 0, width: imgW!/3, height: imgH!/3))
        ballImg?.draw(in: CGRect(x: ballX, y: ballY, width:ballW!/5, height: ballH!/5))
        
        
        //越來越快
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block:{
//            (timer) in
//            self.moveBall()
//            //            self.refreshView()
//        })
//        
//    }
//    
//    func refreshView(){
//        i += 1
//        if i % 10 == 0 {
//            moveBall()
//        }
//        setNeedsDisplay()
//    }
//    
//    func moveBall(){
//        if ballX < 0 || ballX + ballW!/5 > viewW {
//            dx *= -1
//        }
//        if ballY < 0 || ballY + ballH!/5 > viewH {
//            dy *= -1
//        }
//        
//        ballX += dx
//        ballY += dy
//        setNeedsDisplay()
        
        
        
        
        for j in 0..<lines.count {
            if lines[j].count<=1 {continue}
            for i in 1..<lines[j].count {
                let(p0x,p0y) = lines[j][i-1]
                let(p1x,p1y) = lines[j][i]

//                let(p0x,p0y) = lines[j][0] //錯誤下意外試出的功能
//                let(p1x,p1y) = lines[j][i]

                context?.move(to: CGPoint(x: p0x,y: p0y))
                 context?.addLine(to: CGPoint(x: p1x,y: p1y))
                
                context?.drawPath(using: CGPathDrawingMode.stroke)
            }
        }
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let point:CGPoint = touch.location(in: self)
        recycle.removeAll()
        lines += [[]]
        lines[lines.count-1] += [(point.x,point.y)]
        //        print("\(point.x):\(point.y)")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first!
        let point:CGPoint = touch.location(in: self)
        //        print("\(point.x):\(point.y)")
        lines[lines.count-1] += [(point.x,point.y)]
        setNeedsDisplay()
    }
    //    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        print("UP")
    //        line.removeAll()
    //        
    //    }
    
    func clear(){
        lines.removeAll()
        recycle.removeAll()
        setNeedsDisplay()
    }
    
    func undo(){
        if lines.count > 0 {
            recycle += [lines.remove(at: lines.count-1)]
            setNeedsDisplay()
        }
    }
    
    func redo(){
        if recycle.count > 0 {
            lines += [recycle.remove(at: recycle.count-1)]
            setNeedsDisplay()
        }
    }
}
