From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Mon, 6 Jul 2015 15:43:28 -0700
Message-ID: <20150706224328.GB111639@vmdeb7>
References: <20150626145621.GU2890@pali>
 <CAJ=jqub8adCQBWPsmg+Wov0G4WqZbhsjxttWq6CA8Uddqmj4Cw@mail.gmail.com>
 <20150629122953.GF16230@pali>
 <CAJ=jquZr8tPOcL-vr3Q_pYaQZf73-BPvBAoaVjoMALj_sF4rfw@mail.gmail.com>
 <20150630085814.GE27720@pali>
 <CAJ=jquYNQ=R0K+OR538_Tm-E0sNbL6VcAvN_zc99-Z5X1WmCmA@mail.gmail.com>
 <20150701114849.GE17577@pali>
 <CAJ=jquaDCaGv8PXuib7CFZAWUCTCZhkju0RZn-6v4MRCJhfgkA@mail.gmail.com>
 <20150703072523.GB1841@pali>
 <CAJ=jquYo018MiO8V+jjkr778vuuXjoQ9AWrKW=z5dpRuw1DwtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45195 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755941AbbGFWnc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Jul 2015 18:43:32 -0400
Content-Disposition: inline
In-Reply-To: <CAJ=jquYo018MiO8V+jjkr778vuuXjoQ9AWrKW=z5dpRuw1DwtQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Mon, Jul 06, 2015 at 09:35:40AM +0800, Alex Hung wrote:
> ATK4001 is an ACPI device for wireless hotkey, similar to how Dell an=
d
> HP are doing it.  It is just ASUS who decides LED should be controlle=
d
> by software unlike HP whose LED is driven by hardware pins on mini
> card.

Alex, please refrain from top posting on Linux kernel mailing lists, it=
 breaks
the established practice the readers are setup for.

Regarding the ATK4001 device, it did sound like it did more than contro=
l the
radios and the associcated LED. If that is all it does, then asus-rbtn =
is fine.
If it does something beyond that, we need understand what that is, as a=
 more
platform-centric name would be more appropriate.

Thanks,

>=20
> On Fri, Jul 3, 2015 at 3:25 PM, Pali Roh=E1r <pali.rohar@gmail.com> w=
rote:
> > On Thursday 02 July 2015 15:10:39 Alex Hung wrote:
> >> Thanks for the support.  I will create v3 based with LED triggers.
> >>
> >> Just for information.  ASUS's wording is as below:
> >>
> >> Fn+F2 can be used to turn on or off all radio capabilities in the
> >> device (as known as airplane mode switch).  I don't have any
> >> preferences on the name.  We may use the term airplane-mode do if
> >> asus-rbtn is not preferred.  Let me know if there are any suggesti=
ons.
> >>
> >
> > This is OK, but I though that ACPI ATK4001 device is some
> > multifunctional device, which is doing more then LED control... (At
> > least I understand it from your comments). So in this case I would =
not
> > call driver led/radio related. Right?
> >
> >>
> >> On Wed, Jul 1, 2015 at 7:48 PM, Pali Roh=E1r <pali.rohar@gmail.com=
> wrote:
> >> > On Wednesday 01 July 2015 00:09:41 Alex Hung wrote:
> >> >> ATK4001 is an independent ACPI device, and Method(HSWC) is its =
method
> >> >> to control LED (actually it has other functions but only LED is=
 needed
> >> >> so far).
> >> >
> >> > If this driver is for supporting ACPI ATK4001 device (which has =
couple
> >> > of methods, not only LED) it is really good idea to name it asus=
-rbtn?
> >> >
> >> > Darren, you as maintainer of platform drivers, what do you think=
? I
> >> > believe in future this driver will be extended to support more f=
unctions
> >> > and so name asus-rbtn will be confusing.
> >> >
> >> > --
> >> > Pali Roh=E1r
> >> > pali.rohar@gmail.com
> >>
> >
> > --
> > Pali Roh=E1r
> > pali.rohar@gmail.com
>=20
>=20
>=20
> --=20
> Cheers,
> Alex Hung
>=20

--=20
Darren Hart
Intel Open Source Technology Center
