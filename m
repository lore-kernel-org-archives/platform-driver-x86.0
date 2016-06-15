From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI event codes
Date: Wed, 15 Jun 2016 21:51:07 +0200
Message-ID: <201606152151.07407@pali>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com> <01b8e172bca546728b596c8cc4ebd932@ausx13mpc124.AMER.DELL.COM> <0d5a8762-b849-41c6-bfe5-e00da25d26d5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5045724.ocuDoGeBxd";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33670 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752726AbcFOTvK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Jun 2016 15:51:10 -0400
In-Reply-To: <0d5a8762-b849-41c6-bfe5-e00da25d26d5@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario_Limonciello@dell.com
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, mjg59@srcf.ucam.org, dvhart@infradead.org, kernel@kempniu.pl, luto@kernel.org, alex.hung@canonical.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart5045724.ocuDoGeBxd
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 08 June 2016 12:44:44 Gabriele Mazzotta wrote:
> On 08/06/2016 08:02, Mario_Limonciello@Dell.com wrote:
> >> -----Original Message-----
> >> From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> >> Sent: Tuesday, June 7, 2016 6:00 PM
> >> To: Gabriele Mazzotta <gabriele.mzt@gmail.com>; Limonciello, Mario
> >> <Mario_Limonciello@Dell.com>
> >> Cc: Matthew Garrett <mjg59@srcf.ucam.org>; Darren Hart
> >> <dvhart@infradead.org>; Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.p=
l>; Andy
> >> Lutomirski <luto@kernel.org>; Alex Hung
> >> <alex.hung@canonical.com>; platform-driver- x86@vger.kernel.org;
> >> linux-kernel@vger.kernel.org
> >> Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI
> >> event codes
> >>=20
> >> On Friday 27 May 2016 00:04:23 Gabriele Mazzotta wrote:
> >>> On 22/05/2016 13:36, Pali Roh=C3=A1r wrote:
> >>>> ACPI DSDT tables have defined other WMI codes, but does not
> >>>> contain any description when those codes are emitted. Some
> >>>> other codes can be found in logs on internet. In this patch are
> >>>> all which I saw, but lot of them are not tested properly (e.g.
> >>>> for duplicate events with AT keyboard). Now we have all WMI
> >>>> event codes at one place and in future after proper testing
> >>>> those codes can be correctly enabled or
> >>=20
> >> disabled...
> >>=20
> >>>> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> >>>> ---
> >>>>=20
> >>>>  drivers/platform/x86/dell-wmi.c |   32
> >>=20
> >> ++++++++++++++++++++++++++++++++
> >>=20
> >>>>  1 file changed, 32 insertions(+)
> >>>>=20
> >>>> diff --git a/drivers/platform/x86/dell-wmi.c
> >>>> b/drivers/platform/x86/dell-wmi.c index 363d927..7aac1dc 100644
> >>>> --- a/drivers/platform/x86/dell-wmi.c
> >>>> +++ b/drivers/platform/x86/dell-wmi.c
> >>>> @@ -110,6 +110,9 @@ static const struct key_entry
> >>=20
> >> dell_wmi_legacy_keymap[] __initconst =3D {
> >>=20
> >>>>  	/* BIOS error detected */
> >>>>  	{ KE_IGNORE, 0xe00d, { KEY_RESERVED } },
> >>>>=20
> >>>> +	/* Unknown, defined in ACPI DSDT */
> >>>> +	/* { KE_IGNORE, 0xe00e, { KEY_RESERVED } }, */
> >>>> +
> >>>=20
> >>> I'm interested in knowing what's the meaning of this 0xe00e. This
> >>> event is sent multiple times when I suspend/resume my laptop and
> >>> it's definitely not a keypress.
> >>=20
> >> From DSDT dumps which I have seen, I guess it could be something
> >> with battery charging... but that is only my guess.
> >>=20
> >> Mario, do you have any idea, what these unknown events are?
> >=20
> > Off-hand I'm not sure, it would require some more digging.
> >=20
> > Can you please remind me what model numbers and BIOS combinations
> > you have found e00e in DSDT and what context the events are
> > actually happening? Anything released in the past two years?
>=20
> XPS13 9333, BIOS A07.
>=20
> I think I saw the event only after resuming from suspend and
> it's sent four times in a row.
>=20
> As Pali says, it seems to be related to the battery. There are
> three _Qxx ACPI methods in my DSDT sending this event: one stops
> battery charging, one detaches the battery and the last one stores
> a value on the GNVS.

Mario, were you able to identify something?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart5045724.ocuDoGeBxd
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldhsasACgkQi/DJPQPkQ1IqiQCfQmjUJRs09VdB4pvPD++ty3jO
SdwAnj8uoNIMFZSba7qdHGTkJwaxyd3C
=d9QG
-----END PGP SIGNATURE-----

--nextPart5045724.ocuDoGeBxd--
