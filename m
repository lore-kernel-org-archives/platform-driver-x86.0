From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH]amilo-rfkill: add depends on i8042 in Kconfig
Date: Tue, 18 Jun 2013 14:04:40 +0100
Message-ID: <1371560680.3495.121.camel@deadeye.wl.decadent.org.uk>
References: <alpine.DEB.2.02.1306181705530.28460@M2420>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qrCzgLNKPYJOigAJkzo6"
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1306181705530.28460@M2420>
Sender: linux-next-owner@vger.kernel.org
To: Xiong Zhou <jencce.kernel@gmail.com>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, jim.epost@gmail.com
List-Id: platform-driver-x86.vger.kernel.org


--=-qrCzgLNKPYJOigAJkzo6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-06-18 at 17:21 +0800, Xiong Zhou wrote:
> From: Xiong Zhou <jencce.kernel@gmail.com>
>=20
> Fix randconfig build failure for Amilo x86 platform driver.
> AMILO_RFKILL requires SERIO_I8042 being available.
>=20
> amilo-rfkill.c:(.text+0x108b5b): undefined reference to `i8042_lock_chip'
> amilo-rfkill.c:(.text+0x108b69): undefined reference to `i8042_command'
> amilo-rfkill.c:(.text+0x108b71): undefined reference to `i8042_unlock_chi=
p'
>=20
> Reported-by: Jim Davis <jim.epost@gmail.com>
> Signed-off-by: Xiong Zhou <jencce.kernel@gmail.com>

Acked-by: Ben Hutchings <ben@decadent.org.uk>

But I thought somehow sent this same fix a while back...

Ben.

> ---
>  drivers/platform/x86/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 8577261..37645b9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -176,6 +176,7 @@ config FUJITSU_TABLET
>  config AMILO_RFKILL
>  	tristate "Fujitsu-Siemens Amilo rfkill support"
>  	depends on RFKILL
> +	depends on SERIO_I8042
>  	---help---
>  	  This is a driver for enabling wifi on some Fujitsu-Siemens Amilo
>  	  laptops.

--=20
Ben Hutchings
Humans are not rational beings; they are rationalising beings.

--=-qrCzgLNKPYJOigAJkzo6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUcBa6Oe/yOyVhhEJAQpvVw//QZ9lY/nuK8R7PL+FF5tnikbBTNScDP2h
XFvI608KOplFe6ym6eTE5VSpd6195Go/kCjX+fpCzhjfJeRG92GSdYEWzKNw20oB
FtZHsoH8yVRcIg0lAnVNfdpkMFQmjE74yWgXdYPzerZjHszX1H8/iUeRTFsXeuW6
wPHpYEpAVX/NJB/vjSso/oVJ1g5QohFQOR+k5xY7e1PB5Oqd2oOl3y/K6+5VzBl0
nXsexwCF9w7Yl8UP3iwCpMVWQSYY//0pcVdpPZzOZI53Sf9a21MoRHgfeXZZwuKu
jOgCLAUAhfOBhpKBJ67OFepQ2vySr9JJ+el2d2nfqxyWlJ+ihJujiHE7wNyB/QRb
cTh7KVorT1w06PDP/XKGqfm3BCvQZNCH3yLkIbLLtDuYCGsoL8S+au0ppr0W8c3X
KmY6c752ULrlRn4hXtx2YVdJJeslkCtaxoaTgBlVEjZBC8fajlRDuF9lscTrbq3K
x1d0V2MSVCqGedmrGJulUsi7JsAQU1S9nqH+fbYeRgiiLEEsOLRMcBmPKoPoG7Ad
JC8bW5SEVZywwPf00soEkNvKK33aplQqgj28glhflyoH2lGL0oQLGP2/Vyb67K72
WqSEWCXmvcD5QnxfMDN92o3mViBfQogTFIbjPC/AHGokaqdW+GrcITSrO9po/C43
GC8nrJzNU0U=
=UHac
-----END PGP SIGNATURE-----

--=-qrCzgLNKPYJOigAJkzo6--
