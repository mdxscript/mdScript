from xolpanel import *

@bot.on(events.NewMessage(pattern=r"(?:.menu|/menu)$"))
@bot.on(events.CallbackQuery(data=b'menu'))
async def menu(event):
	inline = [
[Button.inline("SSH","ssh"),
Button.inline("XRAY","xray")],
[Button.inline("SHADOWSOCKS","shadowsocks")],
[Button.inline(" CHECK SERVICE ","info"),
Button.inline(" OTHER SETTING ","setting")]]
	sender = await event.get_sender()
	val = valid(str(sender.id))
	if val == "false":
		try:
			await event.answer("Akses Ditolak", alert=True)
		except:
			await event.reply("Akses Ditolak")
	elif val == "true":
		sh = f' cat /etc/ssh/.ssh.db | wc -l'
		ssh = subprocess.check_output(sh, shell=True).decode("ascii")
		vm = f' cat /etc/vmess/.vmess.db | wc -l'
		vms = subprocess.check_output(vm, shell=True).decode("ascii")
		vl = f' cat /etc/vless/.vless.db | wc -l'
		vls = subprocess.check_output(vl, shell=True).decode("ascii")
		tr = f' cat /etc/trojan/.trojan.db | wc -l'
		trj = subprocess.check_output(tr, shell=True).decode("ascii")
		sdss = f" cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/PRETTY_NAME//g'"
		namaos = subprocess.check_output(sdss, shell=True).decode("ascii")
		ipvps = f" curl -s ipv4.icanhazip.com"
		ipsaya = subprocess.check_output(ipvps, shell=True).decode("ascii")
		citsy = f" cat /etc/xray/city"
		city = subprocess.check_output(citsy, shell=True).decode("ascii")
		hap1 = subprocess.check_output('systemctl is-active haproxy', shell=True).decode("ascii")
		if hap1 != "active":
		   hap = f'✅'
		else:
		   hap = f'⛔'
		nginx1 = subprocess.check_output('systemctl is-active nginx', shell=True).decode("ascii")
		if nginx1 != "active":
		   nginx = f'✅'
		else:
		   nginx = f'⛔'
		xray1 = subprocess.check_output('systemctl is-active xray', shell=True).decode("ascii")
		if xray1 != "active":
		   xray = f'✅'
		else:
		   xray = f'⛔'
		drop1 = subprocess.check_output('systemctl is-active dropbear', shell=True).decode("ascii")
		if drop1 != "active":
		   drop = f'✅'
		else:
		   drop = f'⛔'

		msg = f"""
━━━━━━━━━━━━━━━━
**   🔰 ⟨ Panel Menu ⟩ 🔰  **
━━━━━━━━━━━━━━━━
**» OS           : ** `{namaos.strip().replace('"','')}`
**» CITY        : ** `{city.strip()}`
**» DOMAIN : ** `{DOMAIN}`
**» IP VPS     : ** `{ipsaya.strip()}`
━━━━━━━━━━━━━━━━
**» HAPROXY    ** {hap}  **» NGINX  ** {nginx}
**» DROPBEAR  ** {drop}  **» XRAY     ** {xray}
━━━━━━━━━━━━━━━━
**» SSH      :** `{ssh.strip()}`   **» VMESS    :** `{vms.strip()}`
**» VLESS  :** `{vls.strip()}`   **» TROJAN :** `{trj.strip()}`
━━━━━━━━━━━━━━━━
"""
		x = await event.edit(msg,buttons=inline)
		if not x:
			await event.reply(msg,buttons=inline)



