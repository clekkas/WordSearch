//
//  ViewController.swift
//  Word Search
//
//  Created by Lekkas, Chris (Hillsboro) on 2/17/19.
//  Copyright © 2019 Lekkas, Chris (Hillsboro). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.url(forResource: "capitals", withExtension: "json")!
        let contents = try! Data(contentsOf: path)
        let words = try! JSONDecoder().decode([Word].self, from: contents)
        
        let wordSearch = WordSearch()
        wordSearch.words = words
//        wordSearch.buildGrid()
        
        let output = wordSearch.render()
        let url = getDocumentsDirectory().appendingPathComponent("output.pdf")
        try? output.write(to: url)
        print(url)
    }

    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask)
        return path[0]
    }

}

