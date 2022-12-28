//
//  Mood.swift
//  CustomUIControl
//
//  Created by Tianbo Qiu on 12/28/22.
//

import UIKit

struct Mood {
    var name: String
    var image: UIImage
    var color: UIColor
}

// group all static properties
extension Mood {
    static let angry = Mood(name: "angry", image: UIImage(resource: .angry), color: UIColor.angry)
    static let confused = Mood(name: "confused", image: UIImage(resource: .confused), color: UIColor.confused)
    static let crying = Mood(name: "crying", image: UIImage(resource: .crying), color: UIColor.crying)
    static let goofy = Mood(name: "goofy", image: UIImage(resource: .goofy), color: UIColor.goofy)
    static let happy = Mood(name: "happy", image: UIImage(resource: .happy), color: UIColor.happy)
    static let meh = Mood(name: "meh", image: UIImage(resource: .meh), color: UIColor.meh)
    static let sad = Mood(name: "sad", image: UIImage(resource: .sad), color: UIColor.sad)
    static let sleepy = Mood(name: "sleepy", image: UIImage(resource: .sleepy), color: UIColor.sleepy)
}
