from xolpanel import *

@bot.on(events.CallbackQuery(data=b'delete-ssh'))
async def delete_ssh(event):
	async def delete_ssh_(event):
		async with bot.conversation(chat) as user:
			cm = "awk -F: '($3>=1000)&&($1!=nobody){print $1}' /etc/passwd | sed '/nobody/d' | sed 's/^/`/' | sed 's/$/`/' | nl -s '. ' "
			x = subprocess.check_output(cm, shell=True).decode("ascii")
			msg = f"""
━━━━━━━━━━━━━━━━
🔰 Delete SSH Account 🔰
━━━━━━━━━━━━━━━━
{x}━━━━━━━━━━━━━━━━
Chose Username :
"""
			await event.respond(msg)
			user = user.wait_event(events.NewMessage(incoming=True, from_users=sender.id))
			user = (await user).raw_text
			cmd = f'printf "%s\n" "{user}" | bash /root/xolpanel/shell/bot-delssh.sh'
		try:
			a = subprocess.check_output(cmd, shell=True).decode("utf-8")
		except:
			await event.respond(f"**User** `{user}` **Not Found**",buttons=[[Button.inline("‹ Main Menu ›","menu")]])
		else:
			await event.respond(f"**Successfully Deleted** `{user}`",buttons=[[Button.inline("‹ Main Menu ›","menu")]])
	chat = event.chat_id
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await delete_ssh_(event)
	else:
		await event.answer("Akses Ditolak",alert=True)

