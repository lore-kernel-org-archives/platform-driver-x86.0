From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: dell-laptop and separate AC timeouts on some Dell systems
Date: Fri, 7 Apr 2017 23:55:20 +0200
Message-ID: <201704072355.20831@pali>
References: <ac73b849a1de43b28ea87f92f4f95c1c@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1575376.bSu48zKBhQ";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:35588 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756367AbdDGVzZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 17:55:25 -0400
Received: by mail-wm0-f49.google.com with SMTP id w64so1700775wma.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Apr 2017 14:55:24 -0700 (PDT)
In-Reply-To: <ac73b849a1de43b28ea87f92f4f95c1c@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: platform-driver-x86@vger.kernel.org

--nextPart1575376.bSu48zKBhQ
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Friday 07 April 2017 21:33:53 Mario.Limonciello@dell.com wrote:
> Pali,
>=20
> For some time there have been folks reporting some issues where
> keyboard backlight setting is failing on various Dell systems
> (https://github.com/dell/libsmbios/issues/3).  I've been circling
> around internally to find out what's going on. This affects a number
> of systems from the last year or so.

Great!

> What is happening is that some platforms support an alternate
> keyboard timeout while on AC.  The old "timeout" value is treated as
> just a battery timeout and the separate value is the AC timeout.
> Unfortunately if the AC timeout is /not/ set in the timeout
> setting/update request, this will fail.

So in case notebook is running on AC and we want to change timeout for=20
keyboard backlight, we need to tell smbios two timeouts, one for battery=20
and one for AC?

> As a result I prototyped a few changes for this at the libsmbios
> branch here:
> https://github.com/dell/libsmbios/commits/fix-g8-keyboard-backlight

Can you update also documentation which is at the end of file? It would=20
help for kernel implementation.

> It's not yet requested for merging because I still don't know why
> the request to supported features returns "Always On" still (that
> shouldn't be supported).

It looks like that "Always On" mode is reported by smbios by supported,=20
but setting it will cause failure. Any idea where is a problem? Probably=20
Dell firmware bug? Or needs to be that mode handled specially?

> As far as I can tell this doesn't really map well to how the keyboard
> backlight driver in the kernel works today, so I wanted to raise
> this to you to discuss what the best way to handle it is. One of
> these systems can be detected by the presence of the token 0x451.=20
> When that is found, the additional timeout unit and value should be
> sent with the requests.
>=20
> Can you let me know your thoughts?

I think that extending struct kbd_state should work.

There are already functions dell_send_intensity() and=20
dell_get_intensity() which handle state based on battery/AC mode.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1575376.bSu48zKBhQ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAljoCsgACgkQi/DJPQPkQ1Ks0ACcDWcczCpiwEmngrekk42mRlLa
fW8AoKr4xhN+2e2fsF4B8DRQEb790/Py
=zAD/
-----END PGP SIGNATURE-----

--nextPart1575376.bSu48zKBhQ--
