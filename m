From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 4/5] dell-wmi: properly process Dell Instant Launch
 hotkey
Date: Mon, 29 Feb 2016 15:00:15 -0800
Message-ID: <20160229230015.GF7499@dvhart-mobl5.amr.corp.intel.com>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <201602292139.16006@pali>
 <20160229204927.GB23568@eudyptula.hq.kempniu.pl>
 <201602292156.03876@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43133 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750712AbcB2XAT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 18:00:19 -0500
Content-Disposition: inline
In-Reply-To: <201602292156.03876@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 29, 2016 at 09:56:03PM +0100, Pali Roh=C3=A1r wrote:
> On Monday 29 February 2016 21:49:27 you wrote:
> > > On Monday 29 February 2016 21:31:23 Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> > > > > > diff --git a/drivers/platform/x86/dell-wmi.c
> > > > > > b/drivers/platform/x86/dell-wmi.c index 65edd93..ffc957b5
> > > > > > 100644 --- a/drivers/platform/x86/dell-wmi.c
> > > > > > +++ b/drivers/platform/x86/dell-wmi.c
> > > > > > @@ -111,7 +111,7 @@ static const struct key_entry
> > > > > > dell_wmi_legacy_keymap[] __initconst =3D {
> > > > > >=20
> > > > > >  	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
> > > > > >  =09
> > > > > >  	/* Shortcut and audio panel keys */
> > > > > >=20
> > > > > > -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> > > > > > +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> > > > > >=20
> > > > > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > > > > >  =09
> > > > > >  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
> > > > > >=20
> > > > > > @@ -235,6 +235,9 @@ static void dell_wmi_process_key(int
> > > > > > reported_key)
> > > > > >=20
> > > > > >  	    acpi_video_handles_brightness_key_presses())
> > > > > >  	=09
> > > > > >  		return;
> > > > > >=20
> > > > > > +	if (key->keycode =3D=3D KEY_PROG4 &&
> > > > > > !wmi_requires_smbios_request) +		return;
> > > > > > +
> > > > >=20
> > > > > Here I would rather test against reported_key, not keycode. I=
f
> > > > > somebody in future adds KEY_PROG4 for something else we will
> > > > > have problem...
> > > >=20
> > > > As 0xe025 is currently the only event we know about that should
> > > > be ignored on some machines and processed on others, this makes
> > > > sense,
> > > >=20
> > > > at least for now.  If I change the first condition to:
> > > >     reported_key =3D=3D 0xe025
> > >=20
> > > There will be need also change for 5/5 patch...
> >=20
> > Why?  Are you aware of any model which sends a 0xe029 WMI event _an=
d_
> > generates an i8042 interrupt?  If not, WMI event 0xe029 should alwa=
ys
> > be turned into a key event, as per the keymap.
>=20
> No, but your current patch 4/5 and 5/5 do that (because it checks=20
> KEY_PROG4). But if it is not needed, I'm happy because of one hook le=
ss.

=46rom my reading, patch 5/5 adds 0xe029 to the reported keys that need=
 to be
ignored, so the test would need to include both if it isn't using the c=
ommon
keycode KEY_PROG4. I believe that is what Pali is saying as well. Is th=
is not
the correct reading of 5/5?

>=20
> --=20
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
Darren Hart
Intel Open Source Technology Center
