From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v4 4/5] dell-wmi: properly process Dell Instant Launch
 hotkey
Date: Mon, 29 Feb 2016 21:49:27 +0100
Message-ID: <20160229204927.GB23568@eudyptula.hq.kempniu.pl>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <20160229125948.GI21814@pali>
 <20160229203123.GB23395@eudyptula.hq.kempniu.pl>
 <201602292139.16006@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f194.google.com ([209.85.217.194]:36803 "EHLO
	mail-lb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752610AbcB2UsV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 15:48:21 -0500
Received: by mail-lb0-f194.google.com with SMTP id gn5so6659728lbc.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Feb 2016 12:48:20 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <201602292139.16006@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> On Monday 29 February 2016 21:31:23 Micha=C5=82 K=C4=99pie=C5=84 wrot=
e:
> > > > diff --git a/drivers/platform/x86/dell-wmi.c
> > > > b/drivers/platform/x86/dell-wmi.c index 65edd93..ffc957b5 10064=
4
> > > > --- a/drivers/platform/x86/dell-wmi.c
> > > > +++ b/drivers/platform/x86/dell-wmi.c
> > > > @@ -111,7 +111,7 @@ static const struct key_entry
> > > > dell_wmi_legacy_keymap[] __initconst =3D {
> > > >=20
> > > >  	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
> > > >  =09
> > > >  	/* Shortcut and audio panel keys */
> > > >=20
> > > > -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> > > > +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> > > >=20
> > > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > > >  =09
> > > >  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
> > > >=20
> > > > @@ -235,6 +235,9 @@ static void dell_wmi_process_key(int
> > > > reported_key)
> > > >=20
> > > >  	    acpi_video_handles_brightness_key_presses())
> > > >  	=09
> > > >  		return;
> > > >=20
> > > > +	if (key->keycode =3D=3D KEY_PROG4 && !wmi_requires_smbios_req=
uest)
> > > > +		return;
> > > > +
> > >=20
> > > Here I would rather test against reported_key, not keycode. If
> > > somebody in future adds KEY_PROG4 for something else we will have
> > > problem...
> >=20
> > As 0xe025 is currently the only event we know about that should be
> > ignored on some machines and processed on others, this makes sense,
> > at least for now.  If I change the first condition to:
> >=20
> >     reported_key =3D=3D 0xe025
>=20
> There will be need also change for 5/5 patch...

Why?  Are you aware of any model which sends a 0xe029 WMI event _and_
generates an i8042 interrupt?  If not, WMI event 0xe029 should always b=
e
turned into a key event, as per the keymap.

> > will you be okay with adding your Reviewed-by for this patch?  Then=
,
> > for Darren's convenience, I could post a v5 of the whole series wit=
h
> > the above change and all your Acked-by and Reviewed-by tags added.
>=20
> This is my suggestion as I'm thinking about future changes to this=20
> driver... But it is also on Darren as maintainer of platform x86=20
> subsystem.
>=20
> Basically you do not want to check if pressed key is KEY_PROG4. But y=
ou=20
> want to check if dell wmi sent event 0xe025. This is what I say.

Well, FWIW, I agree with you and I'll be happy to make that change.  It
would make the code and the commit message more coherent.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
