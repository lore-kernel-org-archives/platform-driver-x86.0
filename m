From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/3] dell-wmi: Don't report keypresses on keybord illumination change
Date: Thu, 4 Dec 2014 00:31:39 +0100
Message-ID: <201412040031.39891@pali>
References: <1417648583-9336-1-git-send-email-gabriele.mzt@gmail.com> <1417648583-9336-4-git-send-email-gabriele.mzt@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3127090.YpJQJOho5P";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417648583-9336-4-git-send-email-gabriele.mzt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, pavel@ucw.cz, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--nextPart3127090.YpJQJOho5P
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 04 December 2014 00:16:23 Gabriele Mazzotta wrote:
> Keyboard illumination level changes are performed by the BIOS,
> so no events should be reported on keypress. This is already
> done on systems using the legacy keymap, do it also for
> systems that don't use it.
>=20
> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> ---

Tested-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
CC: stable@vger.kernel.org

Tested on Latitude E6440 and now userspace does not receive=20
KEY_KBDILLUMTOGGLE event, so does not try to change keyboard=20
backlight (which is already done by BIOS when key is pressed).

I suggest to backport this patch to stable kernels because this=20
problem is in all kernel versions which have dell-wmi.c driver.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3127090.YpJQJOho5P
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlR/nVsACgkQi/DJPQPkQ1KcsgCfYEbjT1sfxb5M8sjCKQ7WHr3I
os0AoJ+l+50oM5EcD4+AYg4UsOY7p8DX
=90J7
-----END PGP SIGNATURE-----

--nextPart3127090.YpJQJOho5P--
