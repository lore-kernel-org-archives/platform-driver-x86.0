From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 4/5] dell-wmi: properly process Dell Instant Launch
 hotkey
Date: Thu, 3 Mar 2016 09:16:55 -0800
Message-ID: <20160303171655.GD1092@dvhart-mobl5.amr.corp.intel.com>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <201602292139.16006@pali>
 <20160229204927.GB23568@eudyptula.hq.kempniu.pl>
 <201602292156.03876@pali>
 <20160229230015.GF7499@dvhart-mobl5.amr.corp.intel.com>
 <20160302123504.GB25223@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48612 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754218AbcCCRQ6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 Mar 2016 12:16:58 -0500
Content-Disposition: inline
In-Reply-To: <20160302123504.GB25223@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 02, 2016 at 01:35:04PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> > On Mon, Feb 29, 2016 at 09:56:03PM +0100, Pali Roh=C3=A1r wrote:
> > > On Monday 29 February 2016 21:49:27 you wrote:
> > > > > On Monday 29 February 2016 21:31:23 Micha=C5=82 K=C4=99pie=C5=
=84 wrote:

I understand this better now, thank you for the additional explanation.

> > > > > > > > diff --git a/drivers/platform/x86/dell-wmi.c
> > > > > > > > b/drivers/platform/x86/dell-wmi.c index 65edd93..ffc957=
b5
> > > > > > > > 100644 --- a/drivers/platform/x86/dell-wmi.c
> > > > > > > > +++ b/drivers/platform/x86/dell-wmi.c
> > > > > > > > @@ -111,7 +111,7 @@ static const struct key_entry
> > > > > > > > dell_wmi_legacy_keymap[] __initconst =3D {
> > > > > > > >=20
> > > > > > > >  	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
> > > > > > > >  =09
> > > > > > > >  	/* Shortcut and audio panel keys */
> > > > > > > >=20
> > > > > > > > -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> > > > > > > > +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
> > > > > > > >=20

Your description below helped explain why the KE_KEY change was necessa=
ry, the
commit message didn't do that for me. Just explicitly stating "when the=
re is no
i8042 interrupt, the WMI even must generate a valid KE_KEY" or somethin=
g along
those lines would help.

> > > > > > > >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> > > > > > > >  =09
> > > > > > > >  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
> > > > > > > >=20
> > > > > > > > @@ -235,6 +235,9 @@ static void dell_wmi_process_key(in=
t
> > > > > > > > reported_key)
> > > > > > > >=20
> > > > > > > >  	    acpi_video_handles_brightness_key_presses())
> > > > > > > >  	=09
> > > > > > > >  		return;
> > > > > > > >=20
> > > > > > > > +	if (key->keycode =3D=3D KEY_PROG4 &&
> > > > > > > > !wmi_requires_smbios_request) +		return;
> > > > > > > > +
> > > > > > >=20
> > > > > > > Here I would rather test against reported_key, not keycod=
e. If
> > > > > > > somebody in future adds KEY_PROG4 for something else we w=
ill
> > > > > > > have problem...

And ultimately, that is under our control. So let's just not do that :-=
)

A comment by the definition of KEY_PROG4 that notes it's meaning in thi=
s driver
should prevent any future attempts at overloading it and breaking this.

> > > > > >=20
> > > > > > As 0xe025 is currently the only event we know about that sh=
ould
> > > > > > be ignored on some machines and processed on others, this m=
akes
> > > > > > sense,
> > > > > >=20
> > > > > > at least for now.  If I change the first condition to:
> > > > > >     reported_key =3D=3D 0xe025
> > > > >=20
> > > > > There will be need also change for 5/5 patch...
> > > >=20
> > > > Why?  Are you aware of any model which sends a 0xe029 WMI event=
 _and_
> > > > generates an i8042 interrupt?  If not, WMI event 0xe029 should =
always
> > > > be turned into a key event, as per the keymap.
> > >=20
> > > No, but your current patch 4/5 and 5/5 do that (because it checks=
=20
> > > KEY_PROG4). But if it is not needed, I'm happy because of one hoo=
k less.
> >=20
> > From my reading, patch 5/5 adds 0xe029 to the reported keys that ne=
ed to be
> > ignored, so the test would need to include both if it isn't using t=
he common
> > keycode KEY_PROG4. I believe that is what Pali is saying as well. I=
s this not
> > the correct reading of 5/5?
>=20
> It's the other way round :)  Perhaps explaining the issue once again
> will help.

Got it! Thanks! A couple of comments and I think this is a reasonable s=
olution.


>=20
> Until this patch series, dell-wmi was only "aware" of laptops which
> generate _both_ an i8042 interrupt and a WMI event when Dell Instant
> Launch is pressed.  Thus, as the i8042 interrupt already caused a key
> event to be generated, there was no point in generating another one f=
or
> the WMI event, hence the KE_IGNORE entry for 0xe025 in the keymap.
>=20
> Enter Vostro V131, which does _not_ generate an i8042 interrupt when
> Dell Instant Launch is pressed, yet still generates a WMI event.  In
> other words, there was no way of generating a key event for Dell Inst=
ant
> Launch on that model without changing the relevant keymap entry into =
a
> KE_KEY one.  However, I still needed to ensure that for most machines
> that WMI event would _not_ be turned into a key event.  That's why pa=
tch
> 4/5 changes the keymap entry to a KE_KEY one, while also adding a
> conditional return to the key processing function, thus making sure t=
hat
> the previous behavior (ignoring WMI event 0xe025) is preserved on mos=
t
> machines.
>=20
> I used KEY_PROG4 in the conditional expression because a mapped keyco=
de
> is also used in a comparison just above the code inserted by patch 4/=
5.
> For event 0xe029, however, the conditional expression added by patch =
4/5
> should always evaluate to false.  Note that if we use KEY_PROG4 in th=
e
> comparison, the second condition will be false; if we use 0xe025 in t=
he
> comparison, the first condition will be false.  The latter variant
> (suggested by Pali) will work fine until we hear of a model which
> generates _both_ WMI event 0xe029 and an i8042 interrupt upon pressin=
g
> some hotkey.
>=20
> I was hoping the commit message for patch 4/5 would be clear enough t=
o
> convey my intent, yet it seems I managed to confuse you.  Maybe that'=
s a
> sign that the commit message and/or code should be rephrased, but I
> can't be a judge on this one myself.  Let me know what you think.  Pa=
li,
> if you think this is good enough as it is, please add your Reviewed-b=
y.
> If you have doubts, I'm all ears.
>=20
> --=20
> Best regards,
> Micha=C5=82 K=C4=99pie=C5=84
>=20

--=20
Darren Hart
Intel Open Source Technology Center
