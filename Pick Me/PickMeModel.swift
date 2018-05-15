//
//  PickMeModel.swift
//  Pick Me
//
//  Created by James Young on 1/18/18.
//  Copyright © 2018 James Young. All rights reserved.
//

import Foundation

class PickMeModel
{
    var verbs:[String] = []
    var numbers:[String] = []
    var nouns:[String] = []
    
    init()
    {
       // test()
        //verbs = [ "see", "ate", "slept", "cut" ]
        //numbers = [ "7", "3" ]
        //nouns = [ "clowns", "apples", "days" ]
        verbs = [String]()
        let pathVerb = Bundle.main.path(forResource: "Data", ofType: "plist")
        let dictVerb = NSDictionary(contentsOfFile: pathVerb!)
        verbs = dictVerb!.object(forKey: "Verbs") as! [String]
        
        numbers = [String]()
        let pathNum = Bundle.main.path(forResource: "Data", ofType: "plist")
        let dictNum = NSDictionary(contentsOfFile: pathNum!)
        numbers = dictNum!.object(forKey: "Numbers") as! [String]
        
        nouns = [String]()
        let pathNoun = Bundle.main.path(forResource: "Data", ofType: "plist")
        let dictNoun = NSDictionary(contentsOfFile: pathNoun!)
        nouns = dictNoun!.object(forKey: "Nouns") as! [String]
    }
    /*
    func readPlist(_ fileURL: URL) -> [String]?
    {
        guard fileURL.pathExtension == "plist", let data = try? Data(contentsOf: fileURL)
        else
        {
            return nil
        }
        guard let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil)
        else
        {
            return nil
        }
        debugPrint(result)
        return result as! [String]
    }
    */
    func getVerbs(_ index : Int) -> String?
    {
        return verbs[index]
    }
    
    func getVerbsCount() -> Int
    {
        return verbs.count
    }
    
    func getNumbers(_ index : Int) -> String?
    {
        return numbers[index]
    }
    
    func getNumbersCount() -> Int
    {
        return numbers.count
    }
    
    func getNouns(_ index : Int) -> String?
    {
        return nouns[index]
    }
    
    func getNounsCount() -> Int
    {
        return nouns.count
    }
}
