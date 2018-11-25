From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/3] x86: add support for Huawei WMI hotkeys.
Date: Sun, 25 Nov 2018 10:38:25 +0100
Message-ID: <20181125093825.GA24150@amd>
References: <20181031191938.7513-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181031191938.7513-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ayman Bagabas <ayman.bagabas@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-10-31 15:19:36, Ayman Bagabas wrote:
> This driver adds support for missing hotkeys on some Huawei laptops.
> Currently, only Huawei Matebook X Pro is supported. The driver
> recognizes the following keys: brightness keys, micmute, wlan, and
> Huawei special key. The brightness keys are ignored since they work out
> of the box.
>=20
> Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
> ---
>  drivers/platform/x86/Kconfig      |  13 ++
>  drivers/platform/x86/Makefile     |   1 +
>  drivers/platform/x86/huawei_wmi.c | 225 ++++++++++++++++++++++++++++++
>  3 files changed, 239 insertions(+)
>  create mode 100644 drivers/platform/x86/huawei_wmi.c
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0c1aa6c314f5..c6813981e45c 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1229,6 +1229,19 @@ config I2C_MULTI_INSTANTIATE
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called i2c-multi-instantiate.
> =20
> +config HUAWEI_LAPTOP
> +	tristate "Huawei WMI hotkeys driver"
> +	depends on ACPI
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	help
> +	  This driver provides support for Huawei WMI hotkeys.
> +	  It enables the missing keys and adds support to micmute
> +	  led found on these laptops.q
> +	  Supported devices are:
> +	  - Matebook X Pro

Extra q. Plus we normally say module name in Kconfig help text. See
above.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlv6bZAACgkQMOfwapXb+vLFMwCfWoagSZsq60Ju+s6g8MEyIOSp
RXQAnj8oyLlHKRXoXhfJe3NM5nW/zBw7
=hpUx
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
