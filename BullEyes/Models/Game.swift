//
//  Game.swift
//  BullEyes
//
//  Created by Khanh Thieu on 22/06/2021.
//

import Foundation
struct LeaderboardEntry{
    let score : Int
    let date : Date
}
struct Game{
    var target = Int.random(in: 1...100)
    var score  = 0
    var round  = 1
    var leaderboardEntries : [LeaderboardEntry] = []
    init(loadTestData : Bool = false){
        if loadTestData{
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 300, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 400, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 500, date: Date()))
            leaderboardEntries.sort{
                $0.score > $1.score
            }
        }
    }
    func points(sliderValue : Int)->Int{
        let point = 100 - abs(sliderValue - target)
        if point == 100
        {
            return 200
        }
        else if point == 98{
            return 98 + 50
        }
        return point
    }
    mutating func addToLeaderBoard(point: Int){
        leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
        leaderboardEntries.sort{
            $0.score > $1.score
        }
    }
    mutating func startNewRound(points: Int) {
        addToLeaderBoard(point: points)
        self.score += points
        self.round += 1
        target = Int.random(in: 1...100)
    }
    mutating func restart(){
        self.score = 0
        self.round = 1
        target = Int.random(in: 1...100)
    }
}
