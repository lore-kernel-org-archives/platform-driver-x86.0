From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Sat, 9 Apr 2016 19:30:20 -0700
Message-ID: <20160410023020.GA27081@dvhart-mobl5.amr.corp.intel.com>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
 <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
 <20160324113513.GA5129@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from [198.137.202.9] ([198.137.202.9]:44933 "EHLO
	bombadil.infradead.org" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750811AbcDJCdU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Apr 2016 22:33:20 -0400
Content-Disposition: inline
In-Reply-To: <20160324113513.GA5129@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 24, 2016 at 10:05:14PM +1030, Jonathan Woithe wrote:
> This is a quick reply with preliminary information.  I'll follow up i=
n the
> next few days with further details.
>=20
> On Tue, Mar 22, 2016 at 02:30:51PM +0100, Micha?? K??pie?? wrote:
> > > > As for detecting whether the LED is present on a given machine,=
 I had to
> > > > resort to educated guesswork.  I assumed this LED is present on=
 all
> > > > devices which have a radio toggle button instead of a slider.  =
My
> > > > Lifebook E744 holds 0x01010001 in BTNI.  By comparing the bits =
and
> > > > buttons with those of a Lifebook E8420 (BTNI=3D0x000F0101, has =
a slider),
> > > > I put my money on bit 24 as the indicator of the radio toggle b=
utton
> > > > being present.
> > >=20
> > > The other question is how consistent the bit layout is across all=
 devices
> > > which might make use of this driver.  The set of potential device=
s spans
> > > nearly 10 years, and in many ways it would be surprising if the b=
it
> > > definitions were kept the same over that time.  Testing would be =
the only
> > > way to get a feeling for that.
> >=20
> > My thoughts exactly.
> >=20
> > > If you could let me know how you went about
> > > acquiring the values on your machine I could try the exact same s=
teps on the
> > > S7020 to see what we get.
> >=20
> > The BTNI value is printed to the kernel log buffer by
> > acpi_fujitsu_hotkey_add(), so all it takes to retrieve it is:
> >=20
> >     dmesg | grep BTNI
>=20
> Here's what's reported by the S7020:
>=20
>   fujitsu_laptop: BTNI: [0xf0001]
>=20
> The S7020 doesn't have any LEDs.  It also has a physical slider to en=
able RF
> and an "RF enabled" indicator in the LCD panel.  The LCD indicator is=
 under
> hardware control; software cannot influence it.
>=20
> Clearly bit 24 is *not* set on the S7020.  Using this bit as a test f=
or the
> button's presence therefore should not cause trouble for the S7020 an=
d
> probably other similar models from that time.  Obviously we don't hav=
e
> access to every single model, but the apparent consistency back to th=
e S7020
> is encouraging.
>=20
> > > > While it's not essential, it would be nice to initialize soft r=
fkill
> > > > state of all radio transmitters to the value of RFSW upon boot.
> > >=20
> > > I think this would only be necessary for those machines with the =
RF button
> > > in place of the hard slider switch, right?
> >=20
> > Yes.  On the E8420 I tested, moving the slider switch to "off" posi=
tion
> > caused the Bluetooth device to be removed from the system altogethe=
r
> > while iwlwifi reacted by hard-blocking phy0.
>=20
> I haven't noticed anything that dramatic on the S7020, but anything's
> possible.

Jonathan, Micha=C5=82,

Where are we with this? The above reads as "Doesn't appear to break exi=
sting
systems on hand". Jonathan, are you happy with this patch?

Micha=C5=82, do you have plans for a v2?

--=20
Darren Hart
Intel Open Source Technology Center
