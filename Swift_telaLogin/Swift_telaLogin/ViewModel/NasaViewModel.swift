//
//  NasaViewModel.swift
//  Swift_telaLogin
//
//  Created by ANA PAULA BEZERRA GOMES on 14/10/26.
//



import Observation

@Observable
class NasaViewModel {
    var carregou: Bool = false
    var Planetas: [NasaPlanet] = []
    //Planetas=  await NasaService.PegandoInformacoesPlanetais() //ela ira esperar, aqui eu tinha deixado fora da funcao
    //mas n e bom pois o msm carregamento estara preso, so seria bom aqui como atributo se fosse utlizado em outras funcoes

    func QualidadePlanetario(categoria: String) async -> [NasaPlanet] {
        do {
            let dados = try await NasaService().PegandoInformacoesPlanetais()

            switch categoria {
            case "Imagem do dia":
                Planetas = Array(dados.prefix(1))

            case "Galáxias e nebulosas":
                Planetas = dados.filter {
                    $0.title.lowercased().contains("galaxy") ||
                    $0.title.lowercased().contains("nebula") ||
                    $0.title.lowercased().contains("galáxia") ||
                    $0.title.lowercased().contains("nebulosa")
                }

            case "Universo e espaço":
                Planetas = dados.filter {
                    $0.title.lowercased().contains("space") ||
                    $0.title.lowercased().contains("planet") ||
                    $0.title.lowercased().contains("star") ||
                    $0.title.lowercased().contains("espaço") ||
                    $0.title.lowercased().contains("planeta") ||
                    $0.title.lowercased().contains("estrela")
                }

            default:
                Planetas = dados
            }

            carregou = !Planetas.isEmpty
            return Planetas

        } catch {
            carregou = false
            print("Erro ao carregar os dados:", error)
            Planetas = []
            return []
        }
    }
}
