1	do
2	
3	local BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
4	
5	local function get_weather(location)
6	  print("Finding weather in ", location)
7	  location = string.gsub(location," ","+")
8	  local url = BASE_URL
9	  url = url..'?q='..location
10	  url = url..'&units=metric'
11	  url = url..'&appid=bd82977b86bf27fb59a04b61b657fb6f'
12	
13	  local b, c, h = http.request(url)
14	  if c ~= 200 then return nil end
15	
16	  local weather = json:decode(b)
17	  local city = weather.name
18	  local country = weather.sys.country
19	  local temp = 'The temperature in '..city
20	    ..' (' ..country..')'
21	    ..' is '..weather.main.temp..'°C'
22	  local conditions = 'Current conditions are: '
23	    .. weather.weather[1].description
24	
25	  if weather.weather[1].main == 'Clear' then
26	    conditions = conditions .. ' ?'
27	  elseif weather.weather[1].main == 'Clouds' then
28	    conditions = conditions .. ' ??'
29	  elseif weather.weather[1].main == 'Rain' then
30	    conditions = conditions .. ' ?'
31	  elseif weather.weather[1].main == 'Thunderstorm' then
32	    conditions = conditions .. ' ????'
33	  end
34	
35	  return temp .. '\n' .. conditions
36	end
37	
38	local function run(msg, matches)
39	  local city = 'Madrid,ES'
40	
41	  if matches[1] ~= '!weather' then
42	    city = matches[1]
43	  end
44	  local text = get_weather(city)
45	  if not text then
46	    text = 'Can\'t get weather from that city.'
47	  end
48	  return text
49	end
50	
51	return {
52	  description = "weather in that city (Madrid is default)",
53	  usage = "!weather (city)",
54	  patterns = {
55	    "^!weather$",
56	    "^!weather (.*)$"
57	  },
58	  run = run
59	}
60	
61	end
