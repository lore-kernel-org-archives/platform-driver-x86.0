From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 2/4] dell-wmi: Sort WMI event codes and update comments
Date: Wed, 8 Jun 2016 00:03:24 +0200
Message-ID: <20160607220324.GN29844@pali>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <1463916983-12562-3-git-send-email-pali.rohar@gmail.com>
 <20160602104142.GA2456@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33694 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932652AbcFGWD2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2016 18:03:28 -0400
Content-Disposition: inline
In-Reply-To: <20160602104142.GA2456@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 02 June 2016 12:41:42 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>=20
> My guess is that Darren won't let you off without at least a short
> commit message.

I have no idea what else to write. I think that description is enough.

> > ---
> >  drivers/platform/x86/dell-wmi.c |   31 ++++++++++++++++++---------=
----
> >  1 file changed, 18 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86=
/dell-wmi.c
> > index 4d23c91..363d927 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -86,31 +86,32 @@ static const struct dmi_system_id dell_wmi_smbi=
os_list[] __initconst =3D {
> >   */
> > =20
> >  static const struct key_entry dell_wmi_legacy_keymap[] __initconst=
 =3D {
> > -	{ KE_IGNORE, 0x003a, { KEY_CAPSLOCK } },
> > =20
> > -	{ KE_KEY, 0xe009, { KEY_EJECTCD } },
> > +	{ KE_IGNORE, 0x003a, { KEY_CAPSLOCK } },
> > =20
> > -	/* These also contain the brightness level at offset 6 */
> > -	{ KE_KEY, 0xe006, { KEY_BRIGHTNESSUP } },
> > -	{ KE_KEY, 0xe005, { KEY_BRIGHTNESSDOWN } },
> > +	/* These also contain the brightness level after key code */
> > +	{ KE_KEY,    0xe006, { KEY_BRIGHTNESSUP } },
> > +	{ KE_KEY,    0xe005, { KEY_BRIGHTNESSDOWN } },
>=20
> These two entries were left unsorted.

Thanks, I will fix it.

> > =20
> >  	/* Battery health status button */
> > -	{ KE_KEY, 0xe007, { KEY_BATTERY } },
> > +	{ KE_KEY,    0xe007, { KEY_BATTERY } },
> > =20
> > -	/* Radio devices state change */
> > +	/* Radio devices state change, also contains additional informati=
on */
> >  	{ KE_IGNORE, 0xe008, { KEY_RFKILL } },
> > =20
> > -	/* The next device is at offset 6, the active devices are at
> > -	   offset 8 and the attached devices at offset 10 */
> > -	{ KE_KEY, 0xe00b, { KEY_SWITCHVIDEOMODE } },
> > +	{ KE_KEY,    0xe009, { KEY_EJECTCD } },
> > =20
> > +	/* After key code is: next device, active devices, attached devic=
es */
> > +	{ KE_KEY,    0xe00b, { KEY_SWITCHVIDEOMODE } },
> > +
> > +	/* Also contains keyboard illumination level after key code */
>=20
> I know I'm being really pedantic here, but as this is a cleanup patch=
,
> maybe it makes sense to unify the comments a bit?  After this patch i=
s
> applied, the comments are:
>=20
>     /* These also contain the brightness level after key code */
>     /* Radio devices state change, also contains additional informati=
on */
>     /* After key code is: next device, active devices, attached devic=
es */
>     /* Also contains keyboard illumination level after key code */
>=20
> How about changing them to something like:
>=20
>     /* Key code is followed by brightness level */
>     /* Radio devices state change, key code is followed by additional=
 information */
>     /* Key code is followed by: next device, active devices, attached=
 devices */
>     /* Key code is followed by keyboard illumination level */

No problem, I will change it.

> And looking at the bigger picture, do you think these comments
> (especially the generic one: "also contains additional information") =
are
> actually needed?  Anything that follows the key code is ignored by
> kernel code anyway.

Currently it is ignored, but it is the only documentation which we have
for these WMI events. Somebody in future can use these documentation
information and extend code to process also these information...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
