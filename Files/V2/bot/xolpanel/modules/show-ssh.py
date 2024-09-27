from xolpanel import *

@bot.on(events.CallbackQuery(data=b'show-ssh'))
async def login_ssh(event):
        async def login_ssh_(event):
                cmd = 'bash xolpanel/shell/member.sh'
                try:
                        x = subprocess.check_output(cmd, shell=True).decode("utf-8")
                except:
                        await event.respond(f"""
━━━━━━━━━━━━━━━━━
**    ⭐  SSH ACCOUNT ⭐ **
━━━━━━━━━━━━━━━━━
          `No Account Yet `
━━━━━━━━━━━━━━━━━
""",buttons=[[Button.inline("‹ Main Menu ›","menu")]])
                else:
                        await event.respond(f"""
━━━━━━━━━━━━━━━━━
**    ⭐  SSH ACCOUNT ⭐ **
━━━━━━━━━━━━━━━━━
** Username  |  Expired**
━━━━━━━━━━━━━━━━━
`{x}`━━━━━━━━━━━━━━━━━
""",buttons=[[Button.inline("‹ Main Menu ›","menu")]])
        sender = await event.get_sender()
        a = valid(str(sender.id))
        if a == "true":
                await login_ssh_(event)
        else:
                await event.answer("Access Denied",alert=True)
