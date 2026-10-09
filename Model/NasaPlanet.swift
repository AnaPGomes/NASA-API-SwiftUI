//
//  NasaPlanet.swift
//  
//
//  Created by ANA PAULA BEZERRA GOMES on 09/10/26.
//

import Foundation

struct AstronomyPicture: Codable //transformar o json em obj dessa classe{
    let date: String
    let title: String
    let explanation: String
    let url: String
    let hdurl: String?
    let media_type: String
    let copyright: String?
}
