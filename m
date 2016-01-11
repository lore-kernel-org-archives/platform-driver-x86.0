From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 11 Jan 2016 17:28:00 -0200
Message-ID: <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160104201231.GB5847@amd>
 <1452361154.673684.487414482.6CCEAE4B@webmail.messagingengine.com>
 <1452361601.676356.487415834.4652D305@webmail.messagingengine.com>
 <20160111190411.GE10643@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:39108 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932632AbcAKT2B convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 14:28:01 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3857C209BE
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jan 2016 14:28:01 -0500 (EST)
In-Reply-To: <20160111190411.GE10643@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Pavel Machek <pavel@ucw.cz>, =?ISO-8859-1?Q?Pali=20Roh=E1r?= <pali.rohar@gmail.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Mon, Jan 11, 2016, at 17:04, Darren Hart wrote:
> On Sat, Jan 09, 2016 at 03:46:41PM -0200, Henrique de Moraes Holschuh
> wrote:
> > On Sat, Jan 9, 2016, at 15:39, Henrique de Moraes Holschuh wrote:
> > > On Mon, Jan 4, 2016, at 18:12, Pavel Machek wrote:
> > > > > This patch adds support for controlling keyboard backlight vi=
a standard
> > > > > linux led class interface (::kbd_backlight). It uses ACPI HKE=
Y device with
> > > > > MLCG and MLCS methods.
> > > > >=20
> > > > > Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> > > > > Tested-by: Fabio D'Urso <fabiodurso@hotmail.it>
> > > >=20
> > > > On my thinkpad, keyboard light is controlled by
> > > >=20
> > > > /sys/class/leds/tpacpi\:\:thinklight/brightness
> > > >=20
> > > > (that's a bad name).
> > >=20
> > > That's because the driver was not updated to support your laptop,=
 AND I
> > > don't recall if someone mapped the full behavior of the ACPI thin=
klight
> > > interface in your thinkpad :-(
> >=20
> > Argh.  If by "keyboard light" you mean the LED above the *screen* t=
hat
> > shines down on the whole keyboard, please disregard my previous rep=
ly...
> >=20
> > As for the naming, the idea of a LED up there shining in the keyboa=
rd
> > is:
> >  1. patented by IBM
> >  2. named "ThinkLight" by IBM, one of the "Think Technologies" in t=
he
> >  "ThinkPad" (add TM after everything :p)  and every
> >      old-timer thinkpad user knew it by that name.
> >  4. called "thinklight" by the driver since before the LED sysfs cl=
ass
> >  even existed :p
> >=20
> > ibm-acpi, since then renamed thinkpad-acpi *predates* most generic
> > interfaces.  Heck, it predates sysfs.
> >=20
> > So, this is ABI set in stone.  If there is a way to add an "alias" =
of
> > kbd_backlight that won't drive userspace crazy, we might do that th=
ough.
> >  But it looks quite risky to me...
>=20
> Henrique, so are you taking back your Ack from 10 minutes prior?

Hmm? No, the ACK stands.

Pavel was talking about another feature altogether, apparently: older
thinkpads did not have "keyboard backlight" (as in light from below the
keys).  They had a "ThinkLight", which is an overhead light that shines
down on the keyboard.

The two features are not the same (and are handled differently by the
firmware, for whatever reason), although they do serve the same purpose=
=2E
 I don't think a thinkpad will ever have both features at the same time=
,
so I have no idea why they changed the firmware interface.

The patch adds support to the "keyboard backlight" feature, which was
previously NOT supported.

> I've dropped this patch. Please let me know if I should pick it back =
up.

Please pick it back up.

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
