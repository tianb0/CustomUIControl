//
//  MoodListViewController.swift
//  CustomUIControl
//
//  Created by Tianbo Qiu on 12/28/22.
//

import UIKit

class MoodListViewController: UITableViewController {
    var entries: [MoodEntry] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entry = entries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoodCell", for: indexPath)

        // Configure content.
//        var content = cell.defaultContentConfiguration()
//        content.image = UIImage(systemName: "star")
//        content.text = "Favorites"
//
//        // Customize appearance.
//        content.imageProperties.tintColor = .purple
//
//        cell.contentConfiguration = content
        
        var content = cell.defaultContentConfiguration()
        content.text = "I was \(entry.mood.name)"
        content.secondaryText = DateFormatter.localizedString(from: entry.timestamp,
                                                              dateStyle: .medium,
                                                              timeStyle: .short)
        content.image = entry.mood.image
        content.imageProperties.maximumSize.height = 50
        cell.contentConfiguration = content
        
        return cell
    }
}

extension MoodListViewController: MoodsConfigurable {
    func add(_ newEntry: MoodEntry) {
        entries.insert(newEntry, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}
