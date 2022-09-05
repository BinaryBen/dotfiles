function _updateWeatherData () {
  curl -s "wttr.in/Perth?format=j1" > $HOME/.local/state/weather.json
}

function _getCurrentWeatherTemperature () {
  echo $(cat ${HOME}/.local/state/weather.json | jq '.current_condition[0].temp_C' | tr -d \")${BEELINE_ICON_WEATHER_TEMP}
  # TODO: Add "feels like data"
}

function _getWeatherIcon () {

  # Print loading icon if data is out of date

  # Weather code enumeration list and meanings:
  # https://www.worldweatheronline.com/developer/api/docs/weather-icons.aspx

  WEATHER_CODE=$(cat ${HOME}/.local/state/weather.json | jq '.current_condition[0].weatherCode' | tr -d \")
  
  case $WEATHER_CODE in
  113) echo $BEELINE_ICON_WEATHER_CLOUDY;; # Sunny - TODO: Check time and switch to night icon if needed
  122|116|119) echo $BEELINE_ICON_WEATHER_CLOUDY;;
  176|263|266|281|185|284|293|296) echo $BEELINE_ICON_WEATHER_SPRINKLE;;
  299|302|305|308|311) echo $BEELINE_ICON_WEATHER_RAIN;;
  179|182|227|230) echo $BEELINE_ICON_WEATHER_SNOW;;
  200) echo $BEELINE_ICON_WEATHER_STORM;;
  *) echo $BEELINE_ICON_WEATHER_UNDEFINED
  esac

  # 248	Fog
  # 260	Freezing fog
  # 143	Mist

  # TODO: Add gust icon if winds are high
  # TODO: Add severe weather warning icon (how to get info from BOM though?)
}

function _getSimpleWeather () {
  echo $(_getWeatherIcon)" "$(_getCurrentWeatherTemperature)
  _updateWeatherData &
}

