From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 00/38] platform/x86: Rework intel_scu_ipc and
 intel_pmc_ipc drivers
Date: Tue, 21 Jan 2020 16:45:15 +0000
Message-ID: <20200121164515.GG4656@sirena.org.uk>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
 <20200121162157.GD4656@sirena.org.uk>
 <20200121163312.GZ2665@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9Iq5ULCa7nGtWwZS"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200121163312.GZ2665@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--9Iq5ULCa7nGtWwZS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2020 at 06:33:12PM +0200, Mika Westerberg wrote:

> Sorry about that. I included you because there was suggestion from Lee
> to convert the MFD driver in patch 37 to use regmap but the registers
> are all 64-bit and it was not clear whether regmap supports that:

>   https://www.spinics.net/lists/platform-driver-x86/msg20652.html

> Looking at the regmap API it seems to deal mostly with "unsigned int"
> which does not work well with the 64-bit MMIO registers but I may be
> missing something.

It should work fine on architectures with 64 bit ints but otherwise it's
not supported (and doing so would hurt the API pretty badly so I'm not
sure it would make sense but patches welcome).

--9Iq5ULCa7nGtWwZS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4nKpsACgkQJNaLcl1U
h9Bt5Af/QyzVXCniWdmBKvrgQk57SA0AWT37A8AaOWRRAWBF5VU7EHCMfBJDto54
CtZB00hbRMlbyw+NHfCmKRXaWp2KAqxaUJWA3gIDZj7CSKlDZdX7OukBTBahWKxB
nRKOlNV81hPjFaxcOyrBuPux5XPcnXV0MiUJTJpu8GNIZmqX2aVGLFpVbjBRgo7p
Ncau9lZpCbuf95g4AeAXQ9XD53fxscYLgzK+DARcHzduLLqfbszJZKkU4kocdxVc
j8INw6jUPr8ZpvB73D42GqI/eUMYmLd3QHJRU/eLMQCD351ngFM5nftFeYmZos7i
LUr1CryLRKePqnHZS0ULQRj+8tBZwA==
=+u+6
-----END PGP SIGNATURE-----

--9Iq5ULCa7nGtWwZS--
