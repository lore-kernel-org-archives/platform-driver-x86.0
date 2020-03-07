From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH] platform/x86: GPD pocket fan: Fix error message when
 temp-limits are out of range
Date: Sat, 7 Mar 2020 22:56:25 +0100
Message-ID: <20200307215625.GA487@duo.ucw.cz>
References: <20200306091724.55347-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200306091724.55347-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@denx.de>
List-Id: platform-driver-x86.vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-03-06 10:17:24, Hans de Goede wrote:
> Commit 1f27dbd8265d ("platform/x86: GPD pocket fan: Allow somewhat
> lower/higher temperature limits") changed the module-param sanity check
> to accept temperature limits between 20 and 90 degrees celcius.
>=20
> But the error message printed when the module params are outside this
> range was not updated. This commit updates the error message to match
> the new min and max value for the temp-limits.
>=20
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pavel Machek <pavel@denx.de>

Thanks!
							Pavel
						=09
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXmQYiQAKCRAw5/Bqldv6
8tb+AJ4yBCrpbQGEn2I8MQXX4qFv032j5wCfUVKB/C9JdupHUXxdBbUMQtxtnCI=
=k0AH
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
