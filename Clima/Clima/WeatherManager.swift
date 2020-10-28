
import  Foundation

protocol WeatherManagerDelegate {
    func didUpdate(_ weatherManager : WeatherManager,weather : WeatherModel)
    func didFailWithError(error : Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=39b7ca4ed12b7cad04e9939e31a7ed2a&units=metric"
    
    var delegate : WeatherManagerDelegate?
    
    func mergereURL(city: String)  {
        let urlString = "\(weatherURL)&q=\(city)"
        performRequest(with : urlString)
    }
    
    func mergereURL(_ latitude : Double , _ lontitude : Double)  {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(lontitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString : String)  {
        
        if let url = URL(string: urlString) {                    // create URL
            
            let sesstion = URLSession(configuration: .default)   // create URLsession
            
            let task = sesstion.dataTask(with: url, completionHandler:   handler(data:urlRespond:error:) )                // insert task
            
            task.resume()                                        // start
        }
        
    }
    
    func handler(data:Data?,urlRespond:URLResponse?,error:Error?)  {
        if error != nil {
            delegate?.didFailWithError(error: error!)
            return
        }
        
        if let safeData = data {
            if let weather = parseJSON(safeData)  { // decodeJSON
                delegate?.didUpdate(self, weather: weather)
            }
            
            
        }
    }
    
    
    func parseJSON(_ weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodeData.weather[0].id
            let cityName = decodeData.name
            let temperature = (decodeData.main.temp)
            
            let weatherModel = WeatherModel(id: id, ciytName: cityName, temperature: temperature)
            return weatherModel
            
        } catch  {
            delegate?.didFailWithError(error: error )
            return nil
        }
    }
    
    
    
}
