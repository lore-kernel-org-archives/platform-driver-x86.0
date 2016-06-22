From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI event codes
Date: Wed, 22 Jun 2016 09:56:02 +0200
Message-ID: <20160622075602.GA29844@pali>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <01b8e172bca546728b596c8cc4ebd932@ausx13mpc124.AMER.DELL.COM>
 <0d5a8762-b849-41c6-bfe5-e00da25d26d5@gmail.com>
 <201606152151.07407@pali>
 <efa30ea0242d4d2fa1b1f594b2e238c5@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <efa30ea0242d4d2fa1b1f594b2e238c5@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario_Limonciello@Dell.com
Cc: gabriele.mzt@gmail.com, mjg59@srcf.ucam.org, dvhart@infradead.org, kernel@kempniu.pl, luto@kernel.org, alex.hung@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 21 June 2016 19:51:06 Mario_Limonciello@Dell.com wrote:
> > -----Original Message-----
> > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > Sent: Wednesday, June 15, 2016 2:51 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>; mjg59@srcf.ucam.org=
;
> > dvhart@infradead.org; kernel@kempniu.pl; luto@kernel.org;
> > alex.hung@canonical.com; platform-driver-x86@vger.kernel.org; linux=
-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI =
event
> > codes
> >=20
> > On Wednesday 08 June 2016 12:44:44 Gabriele Mazzotta wrote:
> > > On 08/06/2016 08:02, Mario_Limonciello@Dell.com wrote:
> > > >> -----Original Message-----
> > > >> From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > > >> Sent: Tuesday, June 7, 2016 6:00 PM
> > > >> To: Gabriele Mazzotta <gabriele.mzt@gmail.com>; Limonciello, M=
ario
> > > >> <Mario_Limonciello@Dell.com>
> > > >> Cc: Matthew Garrett <mjg59@srcf.ucam.org>; Darren Hart
> > > >> <dvhart@infradead.org>; Micha=C5=82 K=C4=99pie=C5=84 <kernel@k=
empniu.pl>; Andy
> > > >> Lutomirski <luto@kernel.org>; Alex Hung
> > > >> <alex.hung@canonical.com>; platform-driver- x86@vger.kernel.or=
g;
> > > >> linux-kernel@vger.kernel.org
> > > >> Subject: Re: [PATCH 3/4] dell-wmi: Add information about other=
 WMI
> > > >> event codes
> > > >>
> > > >> On Friday 27 May 2016 00:04:23 Gabriele Mazzotta wrote:
> > > >>> On 22/05/2016 13:36, Pali Roh=C3=A1r wrote:
> > > >>>> ACPI DSDT tables have defined other WMI codes, but does not
> > > >>>> contain any description when those codes are emitted. Some
> > > >>>> other codes can be found in logs on internet. In this patch =
are
> > > >>>> all which I saw, but lot of them are not tested properly (e.=
g.
> > > >>>> for duplicate events with AT keyboard). Now we have all WMI
> > > >>>> event codes at one place and in future after proper testing
> > > >>>> those codes can be correctly enabled or
> > > >>
> > > >> disabled...
> > > >>
> > > >>>> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > >>>> ---
> > > >>>>
> > > >>>>  drivers/platform/x86/dell-wmi.c |   32
> > > >>
> > > >> ++++++++++++++++++++++++++++++++
> > > >>
> > > >>>>  1 file changed, 32 insertions(+)
> > > >>>>
> > > >>>> diff --git a/drivers/platform/x86/dell-wmi.c
> > > >>>> b/drivers/platform/x86/dell-wmi.c index 363d927..7aac1dc 100=
644
> > > >>>> --- a/drivers/platform/x86/dell-wmi.c
> > > >>>> +++ b/drivers/platform/x86/dell-wmi.c
> > > >>>> @@ -110,6 +110,9 @@ static const struct key_entry
> > > >>
> > > >> dell_wmi_legacy_keymap[] __initconst =3D {
> > > >>
> > > >>>>  	/* BIOS error detected */
> > > >>>>  	{ KE_IGNORE, 0xe00d, { KEY_RESERVED } },
> > > >>>>
> > > >>>> +	/* Unknown, defined in ACPI DSDT */
> > > >>>> +	/* { KE_IGNORE, 0xe00e, { KEY_RESERVED } }, */
> > > >>>> +
> > > >>>
> > > >>> I'm interested in knowing what's the meaning of this 0xe00e. =
This
> > > >>> event is sent multiple times when I suspend/resume my laptop =
and
> > > >>> it's definitely not a keypress.
> > > >>
> > > >> From DSDT dumps which I have seen, I guess it could be somethi=
ng
> > > >> with battery charging... but that is only my guess.
> > > >>
> > > >> Mario, do you have any idea, what these unknown events are?
> > > >
> > > > Off-hand I'm not sure, it would require some more digging.
> > > >
> > > > Can you please remind me what model numbers and BIOS combinatio=
ns
> > > > you have found e00e in DSDT and what context the events are
> > > > actually happening? Anything released in the past two years?
> > >
> > > XPS13 9333, BIOS A07.
> > >
> > > I think I saw the event only after resuming from suspend and
> > > it's sent four times in a row.
> > >
> > > As Pali says, it seems to be related to the battery. There are
> > > three _Qxx ACPI methods in my DSDT sending this event: one stops
> > > battery charging, one detaches the battery and the last one store=
s
> > > a value on the GNVS.
> >=20
> > Mario, were you able to identify something?
> >
> Pali,
>=20
> You aren't seeing this on the DSDT of your Latitude right?

Yes, I do not see it on Latitude.

> Gabriele,
>=20
> Your machine is from the year before XPS switched over to running
> the Dell business client (eg Latitude, Precision, Optiplex) BIOS.
>=20
> The EC in that machine does have support for "Battery Health" via
> that scancode.  On Windows it's used for relaying battery information
> to an application called Quick Set.

Do you have some details when it is send to OS? And how to read that
that "battery health"?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
