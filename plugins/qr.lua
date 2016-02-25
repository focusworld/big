1	--[[
2	* qr plugin uses:
3	* - http://goqr.me/api/doc/create-qr-code/
4	* psykomantis
5	]]
6	
7	local function get_hex(str)
8	  local colors = {
9	    red = "f00",
10	    blue = "00f",
11	    green = "0f0",
12	    yellow = "ff0",
13	    purple = "f0f",
14	    white = "fff",
15	    black = "000",
16	    gray = "ccc"
17	  }
18	
19	  for color, value in pairs(colors) do
20	    if color == str then
21	      return value
22	    end
23	  end
24	
25	  return str
26	end
27	
28	local function qr(receiver, text, color, bgcolor)
29	
30	  local url = "http://api.qrserver.com/v1/create-qr-code/?"
31	    .."size=600x600"  --fixed size otherways it's low detailed
32	    .."&data="..URL.escape(text:trim())
33	
34	  if color then
35	    url = url.."&color="..get_hex(color)
36	  end
37	  if bgcolor then
38	    url = url.."&bgcolor="..get_hex(bgcolor)
39	  end
40	
41	  local response, code, headers = http.request(url)
42	
43	  if code ~= 200 then
44	    return "Oops! Error: " .. code
45	  end
46	
47	  if #response > 0 then
48		  send_photo_from_url(receiver, url)
49		return
50	
51	  end
52	  return "Oops! Something strange happened :("
53	end
54	
55	local function run(msg, matches)
56	  local receiver = get_receiver(msg)
57	
58	  local text = matches[1]
59	  local color
60	  local back
61	
62	  if #matches > 1 then
63	    text = matches[3]
64	    color = matches[2]
65	    back = matches[1]
66	  end
67	
68	  return qr(receiver, text, color, back)
69	end
70	
71	return {
72	  description = {"qr code plugin for telegram, given a text it returns the qr code"},
73	  usage = {
74	    "!qr [text]",
75	    '!qr "[background color]" "[data color]" [text]\n'
76	      .."Color through text: red|green|blue|purple|black|white|gray\n"
77	      .."Colors through hex notation: (\"a56729\" is brown)\n"
78	      .."Or colors through decimals: (\"255-192-203\" is pink)"
79	  },
80	  patterns = {
81	    '^!qr "(%w+)" "(%w+)" (.+)$',
82	    "^!qr (.+)$"
83	  },
84	  run = run
85	}
