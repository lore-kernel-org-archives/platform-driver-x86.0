From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] module 'dell-laptop': quirk for laptop Dell Inspiron 3179: problem with keyboard controller for keys: Home, End, PgUp, PgDn
Date: Sat, 7 Jan 2017 22:21:42 +0100
Message-ID: <201701072221.42852@pali>
References: <20170107205240.11836-1-polymorphm@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8209204.X7NyWNrCQy";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34707 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932341AbdAGVVp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Jan 2017 16:21:45 -0500
Received: by mail-wm0-f65.google.com with SMTP id c85so12776575wmi.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Jan 2017 13:21:45 -0800 (PST)
In-Reply-To: <20170107205240.11836-1-polymorphm@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrei Antonov <polymorphm@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, "
        =?utf-8?b?0LzQsNGB0YLQtdGAINC40L3RgdGC0YDRg9C60YbQuNC4INC+INGC0L7QvA==?=
        =?utf-8?b?INC60LDQuiDQvtGC0YHRi9C70LDRgtGMINC/0LDRgtGH0Lgg0LI=?=
        =?utf-8?b?INGP0LTRgNC+?= (
        =?utf-8?b?0LXRgdC70Lgg0YfRgtC+INGC0L4g0LLQuNC90LjQvCDQstC+INCy0YHRkdC8?=
        =?utf-8?b?INGN0YLQvtCz0L4=?= =?utf-8?b?INC/0LDRgNC90Y8=?=)" <i.gnatenko.brain@gmail.com>

--nextPart8209204.X7NyWNrCQy
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 07 January 2017 21:52:40 Andrei Antonov wrote:
> +	/*
> +	 * kbd_missing_release_interrupts=3D1 means bug in keyboard
> controller for additional keys: +	 * Home, End, PgUp, PgDn. These
> four keys only -- from all keyboard. +	 * These keys does not send
> key-release interrupts (send key-press interrupts only). +	 *
> kbd_missing_release_interrupts=3D<...> (!=3D0) -- for other variations
> of similar issues +	 */

NACK. There is "no new force-release quirks" policy in linux kernel.

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=
=3D8b8a518ef16be2de27207991e32fc32b0475c767

"force release" quirks are handled by userspace e.g. by udev rule. There=20
is hwdb database where can be put DMI of problematic/broken machines=20
together with keys which should be force-released.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart8209204.X7NyWNrCQy
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlhxW+YACgkQi/DJPQPkQ1JuzwCdFAhQpkndm5HRE1L49P0CjfNG
bD4Anjauxrxtmbyb3xMGms70Hmud1xdw
=nABO
-----END PGP SIGNATURE-----

--nextPart8209204.X7NyWNrCQy--
