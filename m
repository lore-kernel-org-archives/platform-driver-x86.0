From: Pavel Machek <pavel@ucw.cz>
Subject: Re: ThinkPad T480s & LED_MUTE, LED_MICMUTE
Date: Sat, 16 Jun 2018 09:33:34 +0200
Message-ID: <20180616073334.GA13880@amd>
References: <20180608111057.4wxpg7m7nm7suf6n@pali>
 <20180615112606.GA3986@amd>
 <20180615113728.h7snxhe2juaqvjyx@pali>
 <20180615123007.nxsymdvr3nj3it5i@khazad-dum.debian.net>
 <20180615190915.cdntdeesc52ei35u@pali>
 <20180615233628.gy2ffgupctheyqof@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180615233628.gy2ffgupctheyqof@khazad-dum.debian.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Fri 2018-06-15 20:36:28, Henrique de Moraes Holschuh wrote:
> On Fri, 15 Jun 2018, Pali Roh=E1r wrote:
> > This means that kernel should not export any led class device. Or when
> > exported, then "set" operation should always fail.
>=20
> "not export" is right.
>=20
> > > 2. Otherwise implement it in-kernel, so that userspace cannot unmute
> > >    when the human has activated the "mute" switch, and the LED cannot=
 be
> > >    controlled by userspace to lie (report mute when it is not mute).
> >=20
> > This looks like a good candidate to use led "trigger" interface. Create
> > a mute trigger and attach it to that led device.
>=20
> Maybe, as long as done in-kernel and not possible to mess with from
> userspace.

Question is if we want flexibility or security.

If we want security, going through LED subsystem makes no sense, just
control the LED as hardware would, or let hardware do it.

For full flexibility, just export the LED and use normal mechanisms we
have (such as triggers). root should be allowed to configure the LEDs,
and he can change the kernel, too, so...

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlskvU4ACgkQMOfwapXb+vK1RQCeLVrYE7V2GyAon12ifTwHynuY
BBgAoLNGg86oMopWJezrgikBQEkW/03t
=g9hn
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
