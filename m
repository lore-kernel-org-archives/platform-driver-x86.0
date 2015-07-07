From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Tue, 7 Jul 2015 16:25:18 +0200
Message-ID: <20150707142518.GI12087@pali>
References: <CAJ=jqub8adCQBWPsmg+Wov0G4WqZbhsjxttWq6CA8Uddqmj4Cw@mail.gmail.com>
 <20150629122953.GF16230@pali>
 <CAJ=jquZr8tPOcL-vr3Q_pYaQZf73-BPvBAoaVjoMALj_sF4rfw@mail.gmail.com>
 <20150630085814.GE27720@pali>
 <CAJ=jquYNQ=R0K+OR538_Tm-E0sNbL6VcAvN_zc99-Z5X1WmCmA@mail.gmail.com>
 <20150701114849.GE17577@pali>
 <CAJ=jquaDCaGv8PXuib7CFZAWUCTCZhkju0RZn-6v4MRCJhfgkA@mail.gmail.com>
 <20150703072523.GB1841@pali>
 <CAJ=jquYo018MiO8V+jjkr778vuuXjoQ9AWrKW=z5dpRuw1DwtQ@mail.gmail.com>
 <20150706224328.GB111639@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:34199 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932222AbbGGOZV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jul 2015 10:25:21 -0400
Content-Disposition: inline
In-Reply-To: <20150706224328.GB111639@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Alex Hung <alex.hung@canonical.com>, Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Monday 06 July 2015 15:43:28 Darren Hart wrote:
> On Mon, Jul 06, 2015 at 09:35:40AM +0800, Alex Hung wrote:
> > ATK4001 is an ACPI device for wireless hotkey, similar to how Dell =
and
> > HP are doing it.  It is just ASUS who decides LED should be control=
led
> > by software unlike HP whose LED is driven by hardware pins on mini
> > card.
>=20
> Alex, please refrain from top posting on Linux kernel mailing lists, =
it breaks
> the established practice the readers are setup for.
>=20
> Regarding the ATK4001 device, it did sound like it did more than cont=
rol the
> radios and the associcated LED. If that is all it does, then asus-rbt=
n is fine.
> If it does something beyond that, we need understand what that is, as=
 a more
> platform-centric name would be more appropriate.
>=20
> Thanks,

Yes, I understand too that ATK4001 device has more functions as one for
LED control. And in this case it is not good to use name from one
specific functionality.

And about name:

I chose name rbtn for dell driver because ACPI device in DSDT table is
named RBTN and acpi id is DELRBTN.

I think that acpi-rbtn.c (radio button) is not ideal name for driver
which at SW level controls LED device associated with wireless devices.

I would rather follow acpi device name, but in this case ATK4001 is eve=
n
worse name which does not say anything...

Maybe better name could be asus-wireless? Still I do not have any good
name, so choose something...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
