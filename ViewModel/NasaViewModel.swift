//
//  NasaViewModel.swift
//  
//
//  Created by ANA PAULA BEZERRA GOMES on 09/10/26.
//

//controle de dados ex: carregamento, ou falhas caso nao tenha nd apenas vai passando os dados para proxima etapa
class NasaViewModel {
    var carregou: Bool = false
    //Planetas=  await NasaService.PegandoInformacoesPlanetais() //ela ira esperar, aqui eu tinha deixado fora da funcao
    //mas n e bom pois o msm carregamento estara preso, so seria bom aqui como atributo se fosse utlizado em outras funcoes 
    
    
    func QualidadePlanetario() async -> [nasaPlanet] { //uma funcao assicrona que espera a net receber a requisicao dela e responder, o await e pra esperar a resposta chegar
        
        Planetas=  await NasaService.PegandoInformacoesPlanetais()
        if Planetas.isEmpty {
            carregou=false
            print("Nao foi possivel carregar os dados, Lamentamos :c")
            
        }else{
            carregou=true
        }
        return Planetas
    
}
