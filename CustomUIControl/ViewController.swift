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
    
    var moodsConfigurable: MoodsConfigurable!
    
    var moods: [Mood] = [] {
        didSet {
            currentMood = moods.first
            moodSelector.images = moods.map { $0.image }
            moodSelector.highlightColors = moods.map { $0.color }
        }
    }
    
    var currentMood: Mood? {
        didSet {
            guard let currentMood = currentMood else {
                addMoodButton.setTitle(nil, for: .normal)
                addMoodButton.backgroundColor = nil
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
        addMoodButton.layer.cornerRadius = addMoodButton.bounds.height / 2
    }
    
    @IBAction private func moodSelectionChanged(_ sender: ImageSelector) {
        currentMood = moods[sender.selectedIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "embededList":
            guard let moodsConfigurable = segue.destination as? MoodsConfigurable else {
                preconditionFailure("Not MoodsConfigurable")
            }
            self.moodsConfigurable = moodsConfigurable
            
            segue.destination.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)
        default:
            preconditionFailure("Unexpected segue")
        }
    }
    
    @IBAction func addMoodTapped(_ sender: UIButton) {
        guard let currentMood = currentMood else { return }
        moodsConfigurable.add(MoodEntry(mood: currentMood, timestamp: Date()))
    }
}

