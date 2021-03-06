import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


class WeatherModel {
  double longitude,latitude;
  String apiKey = '537f11bddd46d2905c0eebfd48f93795';

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getLocationWeather() async{
    Location location = new Location();
    await location.getLocation();
    longitude = location.longitude;
    latitude = location.latitude;
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude'
        '&appid=$apiKey&units=metric');
    var decodeData = await networkHelper.getData();
    return decodeData;
  }

  String getWeatherIcon(int condition) {
    if(condition == 0){
      return 'Error';
    } else if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if(temp == 0){
      return  'Unable to get Weather Data';
    }else if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
