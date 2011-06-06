From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 23/25] sony-laptop: add ALS support
Date: Mon, 6 Jun 2011 22:08:03 +0900
Message-ID: <20110606130802.GB30602@kamineko.org>
References: <4DE8FC4A.9010401@absence.it>
 <4DE93AC0.3000506@absence.it>
 <20110605053110.GA21142@kamineko.org>
 <4DEC0186.5010209@absence.it>
 <BANLkTi=szZifnDJcfkDJpxcEuL+FY2B5iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:60020 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756839Ab1FFNIH convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Jun 2011 09:08:07 -0400
Received: by mail-pw0-f46.google.com with SMTP id 15so2073442pwi.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jun 2011 06:08:07 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <BANLkTi=szZifnDJcfkDJpxcEuL+FY2B5iA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Javier Achirica <achirica@gmail.com>
Cc: Marco Chiappero <marco@absence.it>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org

Marco,
Could you split the actual ALS driver and the modifications to the rest
in 2 separate patches?

On Mon, Jun 06, 2011 at 09:41:24AM +0200, Javier Achirica wrote:
> On Mon, Jun 6, 2011 at 12:21 AM, Marco Chiappero <marco@absence.it> w=
rote:
> > Il 05/06/2011 07:31, Mattia Dongili ha scritto:
> >>
> >> To my understanding, SNC will receive GPEs in two cases under mana=
ged
> >> mode:
> >> =A01. when the user request a backlight change via the standard ac=
pi_video
> >> =A02. when ambient light changes
> >
> > Right, more in detail:
> >
> > When managed mode is set to 1, automatic backlight is desired by th=
e user
> > and a userspace tool is supposed to take control of every backlight=
 change,
> > to be applied via als_backlight node (which offers a fine grain bac=
klight
> > control for smooth transitions). It will receive two different type=
s of ALS
> > events, depending on the source of the event, as you said: 1 - ambi=
ent light
> > change 2 - backlight change request via backlight device (in linux,=
 the
> > standard acpi_video backlight device). When either of the two event=
s occurs,
> > this software will calculate a new backlight level (using a model s=
pecific
> > formula) and set it by writing in the als_backlight file mentioned =
earlier.
> > (NOTE: this is how the hardware has been designed and it supposed t=
o work
> > even though workarounds are possible).

I don't think this is a feasible solution. sony-laptop already exposes
the fine grained backlight control and there is nothing preventing
userspace from doing the appropriate backlight calculation beforehand
without this back and forth with the kernel.
i.e. would it work if you always enable managed mode to receive the
ambient light events and just let userpace react for automatic dimming?
Also, userspace will intercept key-presses and scale the user
requested brightness change to an appropriate value using the current
lux values.

At this point you could have a generic software (modulo the not yet
standardized als interface) handling any laptop that has these simpler
features.

> > When managed mode is set to 0, no automatic backlight control is re=
quested
> > by the user and no userspace software is doing any backlight regula=
tion
> > based on the ALS readings. This implies that no ALS events are gene=
rated
> > (regardless the source) and the standard ACPI =A0backlight methods =
(used by
> > the acpi_video backlight device) will work properly as usual.
> >
> >> In both cases your code sends an acpi event to userspace. Let alon=
e the
> >> acpi event discussion that belongs to another thread, why aren't w=
e
> >> just setting the requested brightness?
> >
> > Simply because any calculation can be done in userspace, but if we =
can

the question was why sending a "user requested to change
brightness"-event instead of setting the brightness. The calculation
should be done in userspace but for what we know the user input could
already take ALS parameters into consideration so we should just set
that value.

> > include the calculation stuff inside the driver, then we can get ri=
d of the
> > daemon, everything will be easier and we can avoid the als_backligh=
t file
> > too. Is it possible? The formulas are a bit complex but just a few =
lines of
> > code, while the keyboard backlight based on the ambient light is ju=
st a
> > matter of a threshold check.
>=20
> It bothers me a bit that due to the fact that Sony implemented comple=
x
> formulas using floating point arithmetic, that would require us to us=
e
> floating point within the kernel. In fact in Sony Windows drivers
> everything is done in user-space. Hiding the calculation of the lux
> values and handling interrupt set-up in the kernel seems like a good
> thing, but moving all management there, not.

agreed, one such policy handling has little to do with the kernel.

--=20
mattia
:wq!
