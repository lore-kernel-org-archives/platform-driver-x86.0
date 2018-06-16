From: Pavel Machek <pavel@ucw.cz>
Subject: Re: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Sat, 16 Jun 2018 17:58:44 +0200
Message-ID: <20180616155844.GA19005@amd>
References: <20180608111057.4wxpg7m7nm7suf6n@pali>
 <20180615112606.GA3986@amd>
 <20180615113728.h7snxhe2juaqvjyx@pali>
 <20180615123007.nxsymdvr3nj3it5i@khazad-dum.debian.net>
 <20180615190915.cdntdeesc52ei35u@pali>
 <20180615233628.gy2ffgupctheyqof@khazad-dum.debian.net>
 <20180616073334.GA13880@amd>
 <20180616141231.dy4mvirgeax2tviq@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180616141231.dy4mvirgeax2tviq@khazad-dum.debian.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Question is if we want flexibility or security.
>=20
> For thinkpad-acpi, it is security by default.  Flexibility is allowed as
> *compile*-time (Kconfig) option, and only as long as it defaults to
> secure *and* the help text is very explicit at instructing distros to
> NOT enable this option.

Yep, no problem with that.

> That said, if mic-mute is under HDA mixer control, it will only be
> "secure" if ALSA is also blocking userspace access to the relevant bits,
> and if that is not possible to do properly, might as well go for
> flexibility.  But only in that case.

That also makes sense.

> That would be why I use phisical shutters on embedded webcams unless the
> hardware actually airgaps them from the USB bus when the privacy switch
> is active.

And yes, I use them, too.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlslM7QACgkQMOfwapXb+vKv7ACeNF8ycrtZ5XA1zZHP2yYDaEl4
YykAni8e6gJHApjHWmbYWW6GqZye1+pG
=4Cg/
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
