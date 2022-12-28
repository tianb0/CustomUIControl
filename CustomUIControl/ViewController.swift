//
//  ViewController.swift
//  CustomUIControl
//
//  Created by Tianbo Qiu on 12/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var addMoodButton: UIButton!
    @IBOutlet var moodSelector: ImageSelector!
    
    var moods: [Mood] = [] {
        didSet {
            currentMood = moods.first
            moodSelector.images = moods.map { $0.image }
        }
    }
    
    var currentMood: Mood? {
        didSet {
            guard let currentMood = currentMood else {
                addMoodButton.setTitle("Add mood", for: .normal)
                addMoodButton.backgroundColor = .systemCyan
                return
            }
            addMoodButton.setTitle("I'm \(currentMood.name)", for: .normal)
            // do not set background color from storyboard otherwise the background and radius won't change
            addMoodButton.backgroundColor = currentMood.color
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        moods = [.happy, .sad, .angry, .goofy, .crying, .confused, .sleepy, .meh]
        addMoodButton.backgroundColor = .systemCyan
        addMoodButton.layer.cornerRadius = addMoodButton.bounds.height / 2
    }
    
    @IBAction private func moodSelectionChanged(_ sender: ImageSelector) {
        currentMood = moods[sender.selectedIndex]
    }
}

