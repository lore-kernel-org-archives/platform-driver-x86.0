From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v4 4/5] dell-wmi: properly process Dell Instant Launch
 hotkey
Date: Wed, 2 Mar 2016 13:35:04 +0100
Message-ID: <20160302123504.GB25223@eudyptula.hq.kempniu.pl>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <201602292139.16006@pali>
 <20160229204927.GB23568@eudyptula.hq.kempniu.pl>
 <201602292156.03876@pali>
 <20160229230015.GF7499@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160229230015.GF7499@dvhart-mobl5.amr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> On Mon, Feb 29, 2016 at 09:56:03PM +0100, Pali Roh=C3=A1r wrote:
> > On Monday 29 February 2016 21:49:27 you wrote:
> > > > On Monday 29 February 2016 21:31:23 Micha=C5=82 K=C4=99pie=C5=84=
 wrote:
> > > > > > > diff --git a/drivers/platform/x86/dell-wmi.c
> > > > > > > b/drivers/platform/x86/dell-wmi.c index 65edd93..ffc957b5
> > > > > > > 100644 --- a/drivers/platform/x86/dell-wmi.c
> > > > > > > +++ b/drivers/platform/x86/dell-wmi.c
> > > > > > > @@ -111,7 +111,7 @@ static const struct key_entry
> > > > > > > dell_wmi_legacy_keymap[] __initconst =3D {
> > > > > > >=20
> > > > > > >  	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
> > > > > > >  =09
> > > > > > >  	/* Shortcut and audio panel keys */
> > > > > > >=20
> > > > > > > -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> > > > > > > +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> > > > > > >=20
> > > > > > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > > > > > >  =09
> > > > > > >  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
> > > > > > >=20
> > > > > > > @@ -235,6 +235,9 @@ static void dell_wmi_process_key(int
> > > > > > > reported_key)
> > > > > > >=20
> > > > > > >  	    acpi_video_handles_brightness_key_presses())
> > > > > > >  	=09
> > > > > > >  		return;
> > > > > > >=20
> > > > > > > +	if (key->keycode =3D=3D KEY_PROG4 &&
> > > > > > > !wmi_requires_smbios_request) +		return;
> > > > > > > +
> > > > > >=20
> > > > > > Here I would rather test against reported_key, not keycode.=
 If
> > > > > > somebody in future adds KEY_PROG4 for something else we wil=
l
> > > > > > have problem...
> > > > >=20
> > > > > As 0xe025 is currently the only event we know about that shou=
ld
> > > > > be ignored on some machines and processed on others, this mak=
es
> > > > > sense,
> > > > >=20
> > > > > at least for now.  If I change the first condition to:
> > > > >     reported_key =3D=3D 0xe025
> > > >=20
> > > > There will be need also change for 5/5 patch...
> > >=20
> > > Why?  Are you aware of any model which sends a 0xe029 WMI event _=
and_
> > > generates an i8042 interrupt?  If not, WMI event 0xe029 should al=
ways
> > > be turned into a key event, as per the keymap.
> >=20
> > No, but your current patch 4/5 and 5/5 do that (because it checks=20
> > KEY_PROG4). But if it is not needed, I'm happy because of one hook =
less.
>=20
> From my reading, patch 5/5 adds 0xe029 to the reported keys that need=
 to be
> ignored, so the test would need to include both if it isn't using the=
 common
> keycode KEY_PROG4. I believe that is what Pali is saying as well. Is =
this not
> the correct reading of 5/5?

It's the other way round :)  Perhaps explaining the issue once again
will help.

Until this patch series, dell-wmi was only "aware" of laptops which
generate _both_ an i8042 interrupt and a WMI event when Dell Instant
Launch is pressed.  Thus, as the i8042 interrupt already caused a key
event to be generated, there was no point in generating another one for
the WMI event, hence the KE_IGNORE entry for 0xe025 in the keymap.

Enter Vostro V131, which does _not_ generate an i8042 interrupt when
Dell Instant Launch is pressed, yet still generates a WMI event.  In
other words, there was no way of generating a key event for Dell Instan=
t
Launch on that model without changing the relevant keymap entry into a
KE_KEY one.  However, I still needed to ensure that for most machines
that WMI event would _not_ be turned into a key event.  That's why patc=
h
4/5 changes the keymap entry to a KE_KEY one, while also adding a
conditional return to the key processing function, thus making sure tha=
t
the previous behavior (ignoring WMI event 0xe025) is preserved on most
machines.

I used KEY_PROG4 in the conditional expression because a mapped keycode
is also used in a comparison just above the code inserted by patch 4/5.
=46or event 0xe029, however, the conditional expression added by patch =
4/5
should always evaluate to false.  Note that if we use KEY_PROG4 in the
comparison, the second condition will be false; if we use 0xe025 in the
comparison, the first condition will be false.  The latter variant
(suggested by Pali) will work fine until we hear of a model which
generates _both_ WMI event 0xe029 and an i8042 interrupt upon pressing
some hotkey.

I was hoping the commit message for patch 4/5 would be clear enough to
convey my intent, yet it seems I managed to confuse you.  Maybe that's =
a
sign that the commit message and/or code should be rephrased, but I
can't be a judge on this one myself.  Let me know what you think.  Pali=
,
if you think this is good enough as it is, please add your Reviewed-by.
If you have doubts, I'm all ears.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
