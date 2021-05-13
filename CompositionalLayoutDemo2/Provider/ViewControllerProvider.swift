//
//  ViewControllerProvider.swift
//  CompositionalLayoutDemo2
//
//  Created by Julio Collado on 4/23/21.
//

import UIKit

struct Tool {
    let name: String?
    let image: UIImage?
}

struct ToolSet {
    var isExpanded: Bool?
    let image: [UIImage]
}

class ViewControllerProvider {
    let section1: [UIImage] = [
        UIImage(named: "banner1"),
        UIImage(named: "banner2"),
        UIImage(named: "banner3")
    ].compactMap({ $0 })
    
    let tools: [Tool] = [
        Tool(name: "Hammer", image: UIImage(named: "hammer")),
        Tool(name: "Gripper", image: UIImage(named: "gripper")),
        Tool(name: "Screwdriver", image: UIImage(named: "screwdriver")),
        Tool(name: "Circular Saw", image: UIImage(named: "CircularSaw")),
        Tool(name: "Tape Measure", image: UIImage(named: "TapeMeasure")),
        Tool(name: "Clamp", image: UIImage(named: "clamp")),
        Tool(name: "Saw", image: UIImage(named: "saw")),
        Tool(name: "Pipe Wrench", image: UIImage(named: "PipeWrench")),
    ]
    
    private let imageSet: [UIImage] = [
        UIImage(named: "set1"),
        UIImage(named: "set2"),
        UIImage(named: "set3"),
        UIImage(named: "set4")
    ].compactMap({ $0 })
    
    var set: ToolSet
    
    let hotSection: [HotSell] = [
        HotSell(image: UIImage(named: "drill1"), name: "Model xt2", price: "$12,99", isNew: true),
        HotSell(image: UIImage(named: "drill2"), name: "Model 1000", price: "$100,99", isNew: false),
        HotSell(image: UIImage(named: "drill3"), name: "Model T22", price: "$7,99", isNew: false),
        HotSell(image: UIImage(named: "drill4"), name: "Model Nimbus", price: "$22,99", isNew: true),
    ]
    
    init() {
        set = ToolSet(isExpanded: false, image: imageSet)
    }
    
}
