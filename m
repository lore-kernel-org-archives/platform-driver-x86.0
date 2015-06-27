From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Sat, 27 Jun 2015 20:50:24 +0200
Message-ID: <201506272050.24352@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl> <20150624132303.GK21149@pali> <20150625090206.GA2554@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1920061.DhBO2M0oZB";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:37039 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752484AbbF0Su1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 27 Jun 2015 14:50:27 -0400
Received: by wicgi11 with SMTP id gi11so41839704wic.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2015 11:50:26 -0700 (PDT)
In-Reply-To: <20150625090206.GA2554@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

--nextPart1920061.DhBO2M0oZB
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 25 June 2015 11:02:06 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > Can you try to load wmi.ko with params debug_event=3D1 and
> > debug_dump_wdg=3D1 if you can see something in dmesg?
>=20
> I tried that too, to no avail (well, debug_dump_wdg obviously caused
> the parsed contents of _WDG to be printed out, but there was only
> one event GUID - the one already present in dell-wmi). Even
> inserting a pr_info() call at the beginning of acpi_wmi_notify()
> didn't make a difference.
>=20
> > Maybe we really need some hack/hook if this is firmware issue...
>=20
> Probably, but I have no elegant solution (note my lack of kernel and
> ACPI expertise, though), only two unholy abominations:
>=20
>  a) install a GPE 0x17 handler which would imitate the actions taken
> by the NEVT method and also handle any additional values which may
> be returned by ECG1; the 0x0400 branch would come out pretty
> lengthy, though,
>=20
>  b) override the ECG1 method (using ACPI method customization) so
> that it notifies some otherwise unused ACPI device [1] just before
> it returns if an event code not already handled by NEVT is detected;
> then implement a standard notify handler for that device; this
> requires CONFIG_ACPI_CUSTOM_METHOD or installing a precompiled DSDT
> using acpi_install_method(), which would just add to the insanity.
>=20
> [1] Creating a new one solely for this purpose sounds utterly
> bonkers.

Hi again,

now I looked deeply at your problem. I read that part of ACPI code and=20
it really looks like that NEVT method does not handle all possible=20
events.

But how can windows driver handle that? In my opinion it either do some=20
init magic so NEVT will receive event with mask 0x0800 or it overwrite=20
some ACPI method and handle it locally...

You can try to play with overwriting ACPI function NEVT at runtime and=20
patch it to call WMIA also for other masks.

Are you 100% sure that keypress is not sent to i8042 controller and that=20
linux kbd driver does not filter it somehow? Ideally test events with=20
userspace application input-events and not with some X utility (to be=20
sure that X does not consume that keypress too).

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1920061.DhBO2M0oZB
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlWO8HAACgkQi/DJPQPkQ1J4JgCfWJ3X2khQIx897TCZsRzWeUGe
wDAAni5BFG/J9Oc+cNCil/F3az84OXWV
=R3vB
-----END PGP SIGNATURE-----

--nextPart1920061.DhBO2M0oZB--
