From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PROBLEM][PATCH] thinkpad_acpi: propagate acpi event for
 hardware radio switch (Thinkpad X220)
Date: Mon, 9 Jun 2014 12:45:22 -0300
Message-ID: <20140609154522.GB28174@khazad-dum.debian.net>
References: <CAGC361CVCLMxc-0vNG-WqWK0zH6fG+wi3W7=swPKs2-FC_q2xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36271 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754755AbaFIPpe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Jun 2014 11:45:34 -0400
Content-Disposition: inline
In-Reply-To: <CAGC361CVCLMxc-0vNG-WqWK0zH6fG+wi3W7=swPKs2-FC_q2xg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Tobias Stegmann <stegmannt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, 09 Jun 2014, Tobias Stegmann wrote:
> After upgrading the kernel toggling the hardware radio switch doesn't
> generate an acpi event anylonger.

Ideed.  But it should be generating an input event, and also whatever event
the rfkill core generates, if any (it used to generate an uevent, which udev
receives.  Nowadays, I don't know).

Can you test that?  You should receive a SW_EV SW_RFKILL_ALL event on the
thinkpad-acpi input event device, where all hotkeys go.

You will also receive a poll() event on the thinkpad-specific sysfs node for
the radio switch, but that's not a nice interface for shell script use.

You might also receive some sort of uevent over udev, if the rfkill core did
not stop issuing those, and I belive you can use "udevadm" to verify it.
Udev can launch scripts.

> [2.] Full description of the problem/report:
> I use a customized acpi event script to disable bluetooth on my
> Thinkpad x220, if I toggle the hardware wifi switch (not Fn+F5 but a
> physical switch). This used to work fine with v3.11, however it
> stopped working with 3.12+. More precisely the switch doesnt generate
> an acpi event anymore.

It is also deprecated since 2007.

> Looking at the commits it seems this behaviour is somehow intentional,
> even if it breaks existing scripts. Except I am missing something I
> cant think of any reason to not generate an acpi event for the radio
> switch.

Well, the logic is like this: there is a generic event for this type of
information, and it is an input event.  The thinkpad-acpi-specific event has
been, therefore, deprecated way back in 2007.

> From 9816355baeacbec590b2ef2d82061a4a311fce27 Mon Sep 17 00:00:00 2001
> From: Tobias Stegmann <stegmannt@gmail.com>
> Date: Sun, 8 Jun 2014 17:05:19 +0200
> Subject: [PATCH] propagate hw wireless switch acpi event
> 
> Signed-off-by: Tobias Stegmann <stegmannt@gmail.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 15e61c1..2fd7133 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3808,7 +3808,6 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
>  			if (tp_features.hotkey_wlsw &&
>  					hkey == TP_HKEY_EV_RFKILL_CHANGED) {
>  				tpacpi_send_radiosw_update();
> -				send_acpi_ev = 0;
>  				known_ev = true;
>  				break;
>  			}

Well, the patch is correct and it will cause the driver to send the event
over the new-style ACPI netlink event interface.  However, there isn't a
commit log.  This is unacceptable.  Just write a synthesis of your cover
email as the commit log, you explained the reasons for the patch rather
well.

Still, the global radio-kill switch event *really* doesn't belong in the
ACPI event stream, and it is duplicated with the input event.  I'd prefer
not to apply such a patch.

Too bad people hardcoded crap in acpid instead of providing a proper,
configurable interface to its input-device handler, or you could just use
that.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
