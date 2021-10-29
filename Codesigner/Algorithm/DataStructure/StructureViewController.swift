//
//  StructureViewController.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/21.
//

import UIKit

class StructureViewController: UIViewController {
    @IBOutlet weak var displayView: UIView!
    
    @IBOutlet weak var codeTextView: UITextView!
    @IBOutlet weak var operationTextView: UITextView!
    var array:[Int] = [0,15,24,39,34]
    var nodeViews:[CircleView] = []
    var lineLayers:[CAShapeLayer] = []

    
    var index4Delete = 0
    var index4Add = 0
    var num4Add = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        // Do any additional setup after loading the view.
    }
    
    func load()
    {
        for i in 0..<self.array.count - 1
        {
            //100 -> width
            let nodeView = CircleView(frame: CGRect(x: CGFloat(i) * 100 + CGFloat(i)*10, y: displayView.frame.maxY-100, width: 100, height: 100))
            nodeView.updateText(int4Text: array[i])
            displayView.addSubview(nodeView)
            nodeViews.append(nodeView)
            drawArrowAndAdd(startPoint: CGPoint(x:nodeView.frame.maxX+displayView.frame.minX,y: nodeView.frame.midY), endPoint: CGPoint(x:nodeView.frame.maxX+displayView.frame.minX+10,y: nodeView.frame.midY))
        }
        let nodeView = CircleView(frame: CGRect(x: CGFloat(self.array.count - 1) * 100 + CGFloat(self.array.count - 1)*10, y: displayView.frame.maxY-100, width: 100, height: 100))
        nodeView.updateText(int4Text: array[self.array.count - 1])
        displayView.addSubview(nodeView)
        nodeViews.append(nodeView)
    }
    
    func drawArrowAndAdd(startPoint:CGPoint,endPoint:CGPoint)
    {
        let linePath = UIBezierPath.init()
        
        linePath.move(to: startPoint)
        linePath.addLine(to: endPoint)
        linePath.lineCapStyle = CGLineCap.square
        
        let lineLayer = CAShapeLayer.init()
        
        lineLayer.lineWidth = 5
        lineLayer.strokeColor = UIColor.black.cgColor
        lineLayer.path = linePath.cgPath
        lineLayer.lineCap = .square
        lineLayer.fillColor = UIColor.clear.cgColor
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        lineLayer.add(animation, forKey: "")
        self.view.layer.addSublayer(lineLayer)
        lineLayers.append(lineLayer)
    }
    
    func drawArrow(startPoint:CGPoint,endPoint:CGPoint) ->CAShapeLayer
    {
        let linePath = UIBezierPath.init()
        
        linePath.move(to: startPoint)
        linePath.addLine(to: endPoint)
        linePath.lineCapStyle = CGLineCap.square
        
        let lineLayer = CAShapeLayer.init()
        
        lineLayer.lineWidth = 5
        lineLayer.strokeColor = UIColor.black.cgColor
        lineLayer.path = linePath.cgPath
        lineLayer.lineCap = .square
        lineLayer.fillColor = UIColor.clear.cgColor
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        lineLayer.add(animation, forKey: "")
        self.view.layer.addSublayer(lineLayer)
        return lineLayer
    }
    
    func showAlert(message:String)->UIAlertController{
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "好的", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        return alert
    }
    
    func removeNode(index:Int) {
        if index == 0
        {
            array.remove(at: index)
            nodeViews[index].removeFromSuperview()
            lineLayers[index].removeFromSuperlayer()
            nodeViews.remove(at: index)
            lineLayers.remove(at: index)
            codeTextView.text = String(format: """
                                            0_node.next = nil
                                            header.next = 1_node
                                            """)
            operationTextView.text = String(format: """
                                            删除第0个节点
                                            第0个节点的next指向nil
                                            头部节点的next指向第1个节点
                                            """)
        }
        else if index == array.count-1
        {
            array.remove(at: index)
            nodeViews[index].removeFromSuperview()
            nodeViews.remove(at: index)
        }
        else if index >= array.count
        {
            codeTextView.text = "error"
            operationTextView.text = "删除位置不能超出范围"
        }
        else if index < 0
        {
            codeTextView.text = "error"
            operationTextView.text = "删除位置不能小于0"
        }
        else
        {
            array.remove(at: index)
            
            nodeViews[index].removeFromSuperview()
            lineLayers[index].removeFromSuperlayer()
//            path
//            var temp = lineLayers[index-1].path
//            let linePath = UIBezierPath.init()
//            linePath.move(to: CGPoint(x:nodeViews[index-1].frame.maxX+displayView.frame.minX,y: (lineLayers[index].path?.currentPoint.y)!))
//            linePath.addLine(to: CGPoint(x:nodeViews[index+1].frame.minX+displayView.frame.minX,y: (lineLayers[index].path?.currentPoint.y)!))
//            linePath.lineCapStyle = CGLineCap.square
//            lineLayers[index-1].path = linePath.cgPath
//            //animation
//            let group = CAAnimationGroup()
//            let animation = CABasicAnimation(keyPath: "strokeEnd")
//            animation.fromValue = 0
//            animation.toValue = 1
//            animation.duration = 2
//            //return animation
//            let animationReturn = CABasicAnimation(keyPath: "strokeEnd")
//            animationReturn.fromValue = 1
//            animationReturn.toValue = 0.5
//            animationReturn.duration = 2
//            group.animations = [animation,animationReturn]
//            group.duration = 4
//            lineLayers[index-1].add(group, forKey: "")
//            move node
            var tempXForNode = nodeViews[index].frame.minX
            let tempLinePath = UIBezierPath.init()
            tempLinePath.move(to: CGPoint(x:nodeViews[index].frame.maxX+displayView.frame.minX,y: (lineLayers[index].path?.currentPoint.y)!))
            tempLinePath.addLine(to: CGPoint(x:nodeViews[index+1].frame.minX+displayView.frame.minX,y: (lineLayers[index].path?.currentPoint.y)!))
            tempLinePath.lineCapStyle = CGLineCap.square
            var tempCGLinePath = tempLinePath.cgPath
            var tempPos = lineLayers[index].position
            for i in index+1..<nodeViews.count-1
            {
                let temp4Node = self.nodeViews[i].frame.minX
                let tempLine = self.lineLayers[i].path
                let tempPos4Line = self.lineLayers[i].position
                UIView.animate(withDuration: 2, animations: {
                    self.nodeViews[i].frame = CGRect(x: tempXForNode, y: self.nodeViews[i].frame.minY, width: 100, height: 100)
                })
//                let animation = CABasicAnimation(keyPath: "position")
//                animation.fromValue = tempPos4Line
//                animation.toValue = tempPos
//                animation.duration = 2
//                self.lineLayers[i].add(animation, forKey: "")
                self.lineLayers[i].path = tempCGLinePath
                tempXForNode = temp4Node
                tempCGLinePath = tempLine!
                tempPos = tempPos4Line
            }
            UIView.animate(withDuration: 2, animations: { [self] in
                nodeViews[nodeViews.count-1].frame = CGRect(x: tempXForNode, y: nodeViews[nodeViews.count-1].frame.minY, width: 100, height: 100)
            })
            nodeViews.remove(at: index)
            lineLayers.remove(at: index)
            codeTextView.text = String(format: """
                                            %d_node.next = nil
                                            %d.next = %d_node
                                            """,index,index-1,index+1)
            operationTextView.text = String(format: """
                                            删除第%d个节点
                                            第%d个节点的next指向nil
                                            第%d个节点的next指向第%d个节点
                                            """,index,index,index-1,index+1)
        }
    }
    
    func addNode(index:Int,value:Int) {
        if index == array.count
        {
            array.append(value)
            let nodeView = CircleView(frame: CGRect(x: CGFloat(index) * 100 + CGFloat(index)*10, y: displayView.frame.maxY-100, width: 100, height: 100))
            nodeView.updateText(int4Text: array[index])
            displayView.addSubview(nodeView)
            nodeViews.append(nodeView)
            drawArrowAndAdd(startPoint: CGPoint(x:nodeView.frame.minX+displayView.frame.minX-10,y: nodeView.frame.midY), endPoint: CGPoint(x:nodeView.frame.minX+displayView.frame.minX,y: nodeView.frame.midY))
            codeTextView.text = String(format: """
                                            let node = Node(value: %d)
                                            theLastNode.next = node
                                            node.next = nil
                                            """, value)
            operationTextView.text = String(format: """
                                            在最后一个位置插入值为%d的节点
                                            产生值为%d的节点
                                            最后一个节点的next指向值为%d的节点
                                            值为%d的节点的next指向nil
                                            """, value,value,index-1,value,index+1)
                                        
        }
        else if index < 0
        {
            codeTextView.text = "error"
            operationTextView.text = "插入位置不能小于0"
        }
        else if index > array.count
        {
            codeTextView.text = "error"
            operationTextView.text = "插入位置不能大于数组元素个数"
        }
        else
        {
            array.insert(value, at: index)
            let nodeView = CircleView(frame: CGRect(x: CGFloat(index) * 100 + CGFloat(index)*10, y: displayView.frame.maxY-100, width: 100, height: 100))
            nodeView.updateText(int4Text: array[index])
            displayView.addSubview(nodeView)
            nodeViews.insert(nodeView, at: index)
            for i in index+1..<array.count
            {
                UIView.animate(withDuration: 2, animations: {
                    self.nodeViews[i].frame = CGRect(x: CGFloat(i) * 100 + CGFloat(i)*10, y: 100
                                                     , width: 100, height: 100)
                })
            }
            let shaper = drawArrow(startPoint: CGPoint(x:nodeViews[array.count-1].frame.minX+displayView.frame.minX-10,y: nodeView.frame.midY), endPoint: CGPoint(x:nodeViews[array.count-1].frame.minX+displayView.frame.minX,y: nodeView.frame.midY))
            lineLayers.append(shaper)
            codeTextView.text = String(format: """
                                            let node = Node(value: %d)
                                            %d_Node.next = node
                                            node.next = %d_Node
                                            """, value,index-1,index+1)
            operationTextView.text = String(format: """
                                            在%d的位置插入值为%d的节点
                                            产生值为%d的节点
                                            第%d个节点的next指向值为%d的节点
                                            值为%d的节点的next指向第%d个节点
                                            """, index,value,value,index-1,value,value,index+1)
                                
        }
    }
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        
        if let sourceViewController = unwindSegue.source as? DeletePresentViewController
        {
            removeNode(index: sourceViewController.index4Delete)
        }
        else if let sourceViewController = unwindSegue.source as? AddPresentViewController
        {
            addNode(index: sourceViewController.index4Add, value: sourceViewController.value4Add)
        }
        // Use data from the view controller which initiated the unwind segue
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
