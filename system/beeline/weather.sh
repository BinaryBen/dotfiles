function _updateWeatherData () {
  curl -s "wttr.in/Perth?format=j1" > $HOME/.local/state/weather.json
}

function _getWeatherTemperature () {
  echo $(cat ${HOME}/.local/state/weather.json | jq '.current_condition[0].temp_C' | tr -d \")${D6S_ICON_WEATHER_TEMP}
}

function _getWeatherIcon () {

  # Weather code enumeration list and meanings:
  # https://www.worldweatheronline.com/developer/api/docs/weather-icons.aspx

  WEATHER_CODE=$(cat ${HOME}/.local/state/weather.json | jq '.current_condition[0].weatherCode' | tr -d \")
  
  case $WEATHER_CODE in
  122|116|119) echo $D6S_ICON_WEATHER_CLOUDY;;
  176|263|266|281|185|284|293|296) echo $D6S_ICON_WEATHER_SPRINKLE;;
  299|302|305|308|311) echo $D6S_ICON_WEATHER_RAIN;;
  179|182|227|230) echo $D6S_ICON_WEATHER_SNOW;;
  200) echo $D6S_ICON_WEATHER_STORM;;
  *) echo $D6S_ICON_WEATHER_UNDEFINED
  esac

  # 113	Sunny

  # 248	Fog
  # 260	Freezing fog
  # 143	Mist
}

function _getSimpleWeather () {
  _updateWeatherData &
  echo $(_getWeatherIcon)" "$(_getWeatherTemperature)
}

