from xolpanel import *

@bot.on(events.NewMessage(pattern=r"(?:.start|/start)$"))
@bot.on(events.CallbackQuery(data=b'start'))
async def menu(event):
	inline = [
[Button.inline("[ Panel Menu ]","menu")],
[Button.url("[ Order ]","https://t.me/catzbury"),
Button.url("[ Support ]","https://t.me/catzbury")]]
	sender = await event.get_sender()
	val = valid(str(sender.id))
	if val == "false":
		try:
			await event.answer("Akses Ditolak", alert=True)
		except:
			await event.reply("Akses Ditolak")
	elif val == "true":
		msg = f"""
**━━━━━━━━━━━━━━━━**
**         ⟨ Panel Menu ⟩**
**━━━━━━━━━━━━━━━━**
**» 🤖Bot Version :** `v.1.0`
**» 🤖Bot By :** `@catzbury`
**━━━━━━━━━━━━━━━━**
"""
		x = await event.edit(msg,buttons=inline)
		if not x:
			await event.reply(msg,buttons=inline)
