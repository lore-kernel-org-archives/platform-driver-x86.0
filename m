From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v4 4/5] dell-wmi: properly process Dell Instant Launch
 hotkey
Date: Mon, 29 Feb 2016 21:31:23 +0100
Message-ID: <20160229203123.GB23395@eudyptula.hq.kempniu.pl>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-5-git-send-email-kernel@kempniu.pl>
 <20160229125948.GI21814@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33166 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750973AbcB2UaR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 15:30:17 -0500
Received: by mail-lf0-f68.google.com with SMTP id l83so5003572lfd.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Feb 2016 12:30:16 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160229125948.GI21814@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86=
/dell-wmi.c
> > index 65edd93..ffc957b5 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -111,7 +111,7 @@ static const struct key_entry dell_wmi_legacy_k=
eymap[] __initconst =3D {
> >  	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
> > =20
> >  	/* Shortcut and audio panel keys */
> > -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> > +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > =20
> >  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
> > @@ -235,6 +235,9 @@ static void dell_wmi_process_key(int reported_k=
ey)
> >  	    acpi_video_handles_brightness_key_presses())
> >  		return;
> > =20
> > +	if (key->keycode =3D=3D KEY_PROG4 && !wmi_requires_smbios_request=
)
> > +		return;
> > +
>=20
> Here I would rather test against reported_key, not keycode. If somebo=
dy
> in future adds KEY_PROG4 for something else we will have problem...

As 0xe025 is currently the only event we know about that should be
ignored on some machines and processed on others, this makes sense, at
least for now.  If I change the first condition to:

    reported_key =3D=3D 0xe025

will you be okay with adding your Reviewed-by for this patch?  Then, fo=
r
Darren's convenience, I could post a v5 of the whole series with the
above change and all your Acked-by and Reviewed-by tags added.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
