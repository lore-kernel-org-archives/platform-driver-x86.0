From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 4/5] dell-wmi: properly process Dell Instant Launch
 hotkey
Date: Mon, 29 Feb 2016 15:00:52 -0800
Message-ID: <20160229230052.GG7499@dvhart-mobl5.amr.corp.intel.com>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-5-git-send-email-kernel@kempniu.pl>
 <20160229125948.GI21814@pali>
 <20160229203123.GB23395@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44412 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbcB2XAz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 18:00:55 -0500
Content-Disposition: inline
In-Reply-To: <20160229203123.GB23395@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 29, 2016 at 09:31:23PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> > > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x=
86/dell-wmi.c
> > > index 65edd93..ffc957b5 100644
> > > --- a/drivers/platform/x86/dell-wmi.c
> > > +++ b/drivers/platform/x86/dell-wmi.c
> > > @@ -111,7 +111,7 @@ static const struct key_entry dell_wmi_legacy=
_keymap[] __initconst =3D {
> > >  	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
> > > =20
> > >  	/* Shortcut and audio panel keys */
> > > -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> > > +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > > =20
> > >  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
> > > @@ -235,6 +235,9 @@ static void dell_wmi_process_key(int reported=
_key)
> > >  	    acpi_video_handles_brightness_key_presses())
> > >  		return;
> > > =20
> > > +	if (key->keycode =3D=3D KEY_PROG4 && !wmi_requires_smbios_reque=
st)
> > > +		return;
> > > +
> >=20
> > Here I would rather test against reported_key, not keycode. If some=
body
> > in future adds KEY_PROG4 for something else we will have problem...
>=20
> As 0xe025 is currently the only event we know about that should be
> ignored on some machines and processed on others, this makes sense, a=
t
> least for now.  If I change the first condition to:
>=20
>     reported_key =3D=3D 0xe025
>=20
> will you be okay with adding your Reviewed-by for this patch?  Then, =
for
> Darren's convenience, I could post a v5 of the whole series with the
> above change and all your Acked-by and Reviewed-by tags added.

Yes, please do. That way I'm sure I have the right bits.

--=20
Darren Hart
Intel Open Source Technology Center
