//
//  APICaller.swift
//  Netflix 
//
//  Created by Yessimkhan Zhumash on 04.11.2022.
//
// https://api.themoviedb.org/3/trending/all/day?api_key=697d439ac993538da4e3e60b54e762cd

// https://api.themoviedb.org/3/movie/upcoming?api_key=697d439ac993538da4e3e60b54e762cd&language=en-US%page=1
import Foundation


struct Constants{
    static let API_KEY = "697d439ac993538da4e3e60b54e762cd"
    static let baseURL = "https://api.themoviedb.org"
    static let YouTubeAPI_KEY = "AIzaSyBDuRhnJ_nEIGPjApHwO8Z4kHYbQhZ-o-M"
    static let YouTubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}
enum APIError: Error{
    case failedTorgetData
}


class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(compeletion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
    
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let results = try decoder.decode(TrendingTitleResponse.self,from: data)
                compeletion(.success(results.results))
                
            }catch{
                compeletion(.failure(APIError.failedTorgetData ))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(compeletion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let results = try decoder.decode(TrendingTitleResponse.self,from: data)
                compeletion(.success(results.results))


                
            }catch{
                compeletion(.failure(APIError.failedTorgetData ))
            }
        }
        task.resume()
    }
    
    
    func getUpcomingMovies(compeletion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let results = try decoder.decode(TrendingTitleResponse.self,from: data)
                compeletion(.success(results.results))
                
                
                
            }catch{
                compeletion(.failure(APIError.failedTorgetData ))
            }
        }
        task.resume()
    }
    
    func getPopular(compeletion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let results = try decoder.decode(TrendingTitleResponse.self,from: data)
                compeletion(.success(results.results))
                
                
                
            }catch{
                compeletion(.failure(APIError.failedTorgetData ))
            }
        }
        task.resume()
    }
    
    func getTopRated(compeletion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let results = try decoder.decode(TrendingTitleResponse.self,from: data)
                compeletion(.success(results.results))
                
                
                
            }catch{
                compeletion(.failure(APIError.failedTorgetData ))
            }
        }
        task.resume()
    }
    func getDiscoverMovies(compeletion: @escaping (Result<[Title], Error>) -> Void){
        // https://api.themoviedb.org/3/discover/movie?api_key=697d439ac993538da4e3e60b54e762cd&language=en-US&sort_by=popularity.desc&include_adult=false&page=1&with_watch_monetization_types=flatrate
        
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&page=1&with_watch_monetization_types=flatrate") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let results = try decoder.decode(TrendingTitleResponse.self,from: data)
                compeletion(.success(results.results))
                
                
                
            }catch{
                compeletion(.failure(APIError.failedTorgetData ))
            }
        }
        task.resume()
    }
    func search (with query: String, compeletion: @escaping (Result<[Title], Error>) -> Void){
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)else{
            return
        }
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)")else{
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let results = try decoder.decode(TrendingTitleResponse.self,from: data)
                compeletion(.success(results.results))
                
                
                
            }catch{
                compeletion(.failure(APIError.failedTorgetData ))
            }
        }
        task.resume()
    }
    func getMovie(with query: String,compeletion: @escaping (Result<ViedeoElement, Error>) -> Void){
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)else{return}
        guard let url = URL(string: "\(Constants.YouTubeBaseURL)q=\(query)&key=\(Constants.YouTubeAPI_KEY)")else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){
            data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(YouTubeSearchResponse.self, from:data)
                compeletion(.success(results.items[0 ]))
                
                
                
            }catch{
                compeletion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

}





