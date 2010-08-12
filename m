From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Lenovo IdeaPAD ACPI driver
Date: Thu, 12 Aug 2010 13:24:46 +0100
Message-ID: <1281615886.12475.92.camel@localhost>
References: <1281480758.5887.33.camel@localhost>
	 <AANLkTin=Dwbe3gPDGd89Oc25mfOVVvc2_goP77sSVNeo@mail.gmail.com>
	 <1281533999.3236.8.camel@localhost>
	 <AANLkTinBqq+0rDE8DM0wz-FvUQqzH2Rf0F=YJgqVLHqM@mail.gmail.com>
	 <1281606151.12475.57.camel@localhost>
	 <AANLkTikC3_YgMabbDeJnFi66VvQQHp1CcyKgFUT_ji7h@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:42750 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751386Ab0HLMYv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 Aug 2010 08:24:51 -0400
In-Reply-To: <AANLkTikC3_YgMabbDeJnFi66VvQQHp1CcyKgFUT_ji7h@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Thu, 2010-08-12 at 13:49 +0200, Corentin Chary wrote:
> On Thu, Aug 12, 2010 at 11:42 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> > On Wed, 2010-08-11 at 15:51 +0200, Corentin Chary wrote:
> >> And you should probably make it a platform driver (being the parent of
> >> acpi, wmi, input, backlight, rfkill, etc..).
> >>
> >> Is there a lot of thing hidden in ACPI / WMI on these models (like
> >> hotkeys, backlight, light sensors)  ?
> >
> > I hooked up something (below) to dump the AE or IO WMI blocks each time
> > we get a notification on the VPC2004 device. Although the notification
> > happens when we press a key, nothing ever changes in either of them.
> 
> They is probably something interesting in the u32 event var.

It's always 0x80.

> To get wmi events, you need to use wmi_install_notify_handler.

I didn't bother hooking that up -- according to the discussion back in
April, the WMI is never triggered.

http://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg00034.html

> For example, the hardware rfkill state may change due to some keypress,
> and an event may be sent via acpi or wmi, but if you don't catch it, the rfkill
> class won't be updated.

The notify gets called then too, and we resync the rfkill state.

> Could you send the output of acpidump ?

Attached to http://bugs.meego.com/show_bug.cgi?id=4086 --
http://bugs.meego.com/attachment.cgi?id=1860

It's much the same as what you were looking at before on the S10-3t, as
far as I can tell.

> > I *did* notice that we're actually getting proper keycodes for the
> > hotkeys though, so for now I've lost what little interest I already had
> > in doing anything with WMI. If anyone (Florian?) wants to do more, I'd
> > be happy to do some testing.
> 
> keycodes are sent from the keyboard input device for all specials keys
> ? (especially Fn+Fx keys) ?

All but the external display hotkey.

The brightness up/down (Fn-up, Fn-down) don't do anything but they do
report:
[10608.863641] atkbd.c: Unknown key pressed (translated set 2, code 0xb9 on isa0060/serio0).
[10608.863655] atkbd.c: Use 'setkeycodes e039 <keycode>' to make it known.
[10609.002143] atkbd.c: Unknown key released (translated set 2, code 0xb9 on isa0060/serio0).
[10609.002157] atkbd.c: Use 'setkeycodes e039 <keycode>' to make it known.
[10609.225721] atkbd.c: Unknown key pressed (translated set 2, code 0xba on isa0060/serio0).
[10609.225735] atkbd.c: Use 'setkeycodes e03a <keycode>' to make it known.
[10609.332264] atkbd.c: Unknown key released (translated set 2, code 0xba on isa0060/serio0).
[10609.332278] atkbd.c: Use 'setkeycodes e03a <keycode>' to make it known.

The camera enable/disable (Fn-Esc) toggles the camera power (which is
also readable/writable through sysfs with my driver) and also reports:
[10633.222832] atkbd.c: Unknown key pressed (translated set 2, code 0xf1 on isa0060/serio0).
[10633.222846] atkbd.c: Use 'setkeycodes e071 <keycode>' to make it known.
[10633.329105] atkbd.c: Unknown key released (translated set 2, code 0xf1 on isa0060/serio0).
[10633.329119] atkbd.c: Use 'setkeycodes e071 <keycode>' to make it known.
[10633.451208] usb 1-8: USB disconnect, address 5

The sleep button (Fn-F1) just puts it to sleep; that'll be reported
through a separate ACPI event. I haven't investigated but I assume
that's working correctly.

The 'display off' button (Fn-F2) works and:
[10788.130877] atkbd.c: Unknown key pressed (translated set 2, code 0x83 on isa0060/serio0).
[10788.130891] atkbd.c: Use 'setkeycodes e003 <keycode>' to make it known.
[10788.269195] atkbd.c: Unknown key released (translated set 2, code 0x83 on isa0060/serio0).
[10788.269209] atkbd.c: Use 'setkeycodes e003 <keycode>' to make it known.

What I assume is the external display key (Fn-F3) seems to do nothing,
whether I have an external display connected or not. If I connect an
external display (even if it's powered off), X switches over to it
automatically. That's probably just X under MeeGo doing that though.

Fn-F4 has no special marking

The rfkill hotkey (Fn-F5) which under Windows just brings up the Lenovo
GUI tool, does nothing except:
[10835.095618] atkbd.c: Unknown key pressed (translated set 2, code 0x81 on isa0060/serio0).
[10835.095631] atkbd.c: Use 'setkeycodes e001 <keycode>' to make it known.
[10835.233979] atkbd.c: Unknown key released (translated set 2, code 0x81 on isa0060/serio0).
[10835.233994] atkbd.c: Use 'setkeycodes e001 <keycode>' to make it known.

What looks like a 'trackpad kill' (Fn-F6) just does:
[10910.931021] atkbd.c: Unknown key pressed (translated set 2, code 0xf2 on isa0060/serio0).
[10910.931036] atkbd.c: Use 'setkeycodes e072 <keycode>' to make it known.
[10911.048135] atkbd.c: Unknown key released (translated set 2, code 0xf2 on isa0060/serio0).
[10911.048148] atkbd.c: Use 'setkeycodes e072 <keycode>' to make it known.

The multimedia keys on Fn-F{7,8,9,10} seems to be generating 'known'
keycodes which don't cause a complaint, although they don't seem to show
up as anything useful in 'xev'.
[11135.784840] drivers/input/serio/i8042.c: e0 <- i8042 (interrupt, 0, 1) [11135374]
[11135.789916] drivers/input/serio/i8042.c: 22 <- i8042 (interrupt, 0, 1) [11135379]
[11135.901911] drivers/input/serio/i8042.c: e0 <- i8042 (interrupt, 0, 1) [11135491]
[11135.907035] drivers/input/serio/i8042.c: a2 <- i8042 (interrupt, 0, 1) [11135497]
[11135.949906] drivers/input/serio/i8042.c: e0 <- i8042 (interrupt, 0, 1) [11135539]
[11135.954976] drivers/input/serio/i8042.c: 24 <- i8042 (interrupt, 0, 1) [11135544]
[11136.125383] drivers/input/serio/i8042.c: e0 <- i8042 (interrupt, 0, 1) [11135715]
[11136.130516] drivers/input/serio/i8042.c: a4 <- i8042 (interrupt, 0, 1) [11135720]
[11136.395678] drivers/input/serio/i8042.c: e0 <- i8042 (interrupt, 0, 1) [11135985]
[11136.400910] drivers/input/serio/i8042.c: 10 <- i8042 (interrupt, 0, 1) [11135990]
[11136.523555] drivers/input/serio/i8042.c: e0 <- i8042 (interrupt, 0, 1) [11136113]
[11136.528676] drivers/input/serio/i8042.c: 90 <- i8042 (interrupt, 0, 1) [11136118]
[11136.864389] drivers/input/serio/i8042.c: e0 <- i8042 (interrupt, 0, 1) [11136454]
[11136.869477] drivers/input/serio/i8042.c: 19 <- i8042 (interrupt, 0, 1) [11136459]
[11136.944201] drivers/input/serio/i8042.c: e0 <- i8042 (interrupt, 0, 1) [11136534]
[11136.949322] drivers/input/serio/i8042.c: 99 <- i8042 (interrupt, 0, 1) [11136539]


If I press and hold the Fn key, after a while I get a stream of
[11231.859281] drivers/input/serio/i8042.c: e0 <- i8042 (interrupt, 0, 1) [11231449]
[11231.864363] drivers/input/serio/i8042.c: 63 <- i8042 (interrupt, 0, 1) [11231454]

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
