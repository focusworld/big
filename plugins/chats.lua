local function run(msg)
if msg.text == "hi" then
	return "Hello bb"
end
if msg.text == "Hi" then
	return "Hello honey"
end
if msg.text == "Hello" then
	return "Hi bb"
end
if msg.text == "hello" then
	return "Hi honey"
end
if msg.text == "Salam" then
	return "Salam aleykom"
end
if msg.text == "salam" then
	return "va aleykol asalam"
end
if msg.text == "سلام" then
	return "سلام علیکم"
end
if msg.text == "سلام" then
	return "علیک سلام"
end
if msg.text == "zac" then
	return "Barash bezan sak"
end
if msg.text == "Zac" then
	return "Barash bezan sak"
end
if msg.text == "ZAC" then
	return "Barash bezan sak"
end
if msg.text == "focus" then
	return "Yes?"
end
if msg.text == "focus" then
	return "What?"
end
if msg.text == "bot" then
	return "hum?"
end
if msg.text == "Bot" then
	return "Huuuum?"
end
if msg.text == "?" then
	return "Hum??"
end
if msg.text == "Bye" then
	return "Babay"
end
if msg.text == "bye" then
	return "Bye Bye"
end
if msg.text == "ممل" then
	return "ممل بیا این یارو کارت داره"
end
if msg.text == "مملی" then
	return "ممل بیا این یارو کارت داره"
end
if msg.text == "mamal" then
	return "ممل بیا این یارو کارت داره"
end
if msg.text == "mamali" then
	return "ممل بیا این یارو کارت داره"
end
end

return {
	description = "Chat With Robot Server", 
	usage = "chat with robot",
	patterns = {
		"^[Hh]i$",
		"^[Hh]ello$",
		"^[Zz]ac$",
		"^ZAC$",
		"^[Bb]ot$",
		"^[Ff]focus$",
		"^[Bb]ye$",
		"^?$",
		"^[Ss]alam$",
		"^[Mm]amal$",
		"^ممل$",
		"^مملی$",
		"^[Mm]amali$",
		"^سلام$",
		}, 
	run = run,
    --privileged = true,
	pre_process = pre_process
}
