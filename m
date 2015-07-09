From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Thu, 9 Jul 2015 13:52:03 -0700
Message-ID: <20150709205203.GD111846@vmdeb7>
References: <20150629122953.GF16230@pali>
 <CAJ=jquZr8tPOcL-vr3Q_pYaQZf73-BPvBAoaVjoMALj_sF4rfw@mail.gmail.com>
 <20150630085814.GE27720@pali>
 <CAJ=jquYNQ=R0K+OR538_Tm-E0sNbL6VcAvN_zc99-Z5X1WmCmA@mail.gmail.com>
 <20150701114849.GE17577@pali>
 <CAJ=jquaDCaGv8PXuib7CFZAWUCTCZhkju0RZn-6v4MRCJhfgkA@mail.gmail.com>
 <20150703072523.GB1841@pali>
 <CAJ=jquYo018MiO8V+jjkr778vuuXjoQ9AWrKW=z5dpRuw1DwtQ@mail.gmail.com>
 <20150706224328.GB111639@vmdeb7>
 <20150707142518.GI12087@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56706 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753668AbbGIUwG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Jul 2015 16:52:06 -0400
Content-Disposition: inline
In-Reply-To: <20150707142518.GI12087@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Tue, Jul 07, 2015 at 04:25:18PM +0200, Pali Roh=E1r wrote:
> On Monday 06 July 2015 15:43:28 Darren Hart wrote:
> > On Mon, Jul 06, 2015 at 09:35:40AM +0800, Alex Hung wrote:
> > > ATK4001 is an ACPI device for wireless hotkey, similar to how Del=
l and
> > > HP are doing it.  It is just ASUS who decides LED should be contr=
olled
> > > by software unlike HP whose LED is driven by hardware pins on min=
i
> > > card.
> >=20
> > Alex, please refrain from top posting on Linux kernel mailing lists=
, it breaks
> > the established practice the readers are setup for.
> >=20
> > Regarding the ATK4001 device, it did sound like it did more than co=
ntrol the
> > radios and the associcated LED. If that is all it does, then asus-r=
btn is fine.
> > If it does something beyond that, we need understand what that is, =
as a more
> > platform-centric name would be more appropriate.
> >=20
> > Thanks,
>=20
> Yes, I understand too that ATK4001 device has more functions as one f=
or
> LED control. And in this case it is not good to use name from one
> specific functionality.
>=20
> And about name:
>=20
> I chose name rbtn for dell driver because ACPI device in DSDT table i=
s
> named RBTN and acpi id is DELRBTN.
>=20
> I think that acpi-rbtn.c (radio button) is not ideal name for driver
> which at SW level controls LED device associated with wireless device=
s.
>=20
> I would rather follow acpi device name, but in this case ATK4001 is e=
ven
> worse name which does not say anything...
>=20
> Maybe better name could be asus-wireless? Still I do not have any goo=
d
> name, so choose something...

I suggested rbtn to try and start showing some kind of consistency in t=
he
directory - however, it's no better than many of the other existing opt=
ions,
including -rfkill -wireless -laptop, etc.

Speaking of -laptop, the asus-laptop driver supports ATK0100 and ATK010=
1. This
ATK4001 device appears to perform the same type of features. The questi=
on is
whether or not it can be reasonably incorporated into the existing asus=
-laptop
driver or not.

(I intended to do that review myself, but I haven't found the time in 4=
8 hours,
so I'm just going to send this out and ask that Alex have a look and pr=
ovide his
thoughts on asus-laptop)

--=20
Darren Hart
Intel Open Source Technology Center
