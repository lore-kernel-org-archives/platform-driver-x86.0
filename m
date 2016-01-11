From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 11 Jan 2016 11:04:11 -0800
Message-ID: <20160111190411.GE10643@malice.jf.intel.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160104201231.GB5847@amd>
 <1452361154.673684.487414482.6CCEAE4B@webmail.messagingengine.com>
 <1452361601.676356.487415834.4652D305@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39280 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933295AbcAKTEO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 14:04:14 -0500
Content-Disposition: inline
In-Reply-To: <1452361601.676356.487415834.4652D305@webmail.messagingengine.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Pavel Machek <pavel@ucw.cz>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Sat, Jan 09, 2016 at 03:46:41PM -0200, Henrique de Moraes Holschuh w=
rote:
> On Sat, Jan 9, 2016, at 15:39, Henrique de Moraes Holschuh wrote:
> > On Mon, Jan 4, 2016, at 18:12, Pavel Machek wrote:
> > > > This patch adds support for controlling keyboard backlight via =
standard
> > > > linux led class interface (::kbd_backlight). It uses ACPI HKEY =
device with
> > > > MLCG and MLCS methods.
> > > >=20
> > > > Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> > > > Tested-by: Fabio D'Urso <fabiodurso@hotmail.it>
> > >=20
> > > On my thinkpad, keyboard light is controlled by
> > >=20
> > > /sys/class/leds/tpacpi\:\:thinklight/brightness
> > >=20
> > > (that's a bad name).
> >=20
> > That's because the driver was not updated to support your laptop, A=
ND I
> > don't recall if someone mapped the full behavior of the ACPI thinkl=
ight
> > interface in your thinkpad :-(
>=20
> Argh.  If by "keyboard light" you mean the LED above the *screen* tha=
t
> shines down on the whole keyboard, please disregard my previous reply=
=2E..
>=20
> As for the naming, the idea of a LED up there shining in the keyboard
> is:
>  1. patented by IBM
>  2. named "ThinkLight" by IBM, one of the "Think Technologies" in the
>  "ThinkPad" (add TM after everything :p)  and every
>      old-timer thinkpad user knew it by that name.
>  4. called "thinklight" by the driver since before the LED sysfs clas=
s
>  even existed :p
>=20
> ibm-acpi, since then renamed thinkpad-acpi *predates* most generic
> interfaces.  Heck, it predates sysfs.
>=20
> So, this is ABI set in stone.  If there is a way to add an "alias" of
> kbd_backlight that won't drive userspace crazy, we might do that thou=
gh.
>  But it looks quite risky to me...

Henrique, so are you taking back your Ack from 10 minutes prior?

I've dropped this patch. Please let me know if I should pick it back up=
=2E

--=20
Darren Hart
Intel Open Source Technology Center
