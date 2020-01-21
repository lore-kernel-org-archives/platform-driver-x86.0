From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 00/38] platform/x86: Rework intel_scu_ipc and
 intel_pmc_ipc drivers
Date: Tue, 21 Jan 2020 16:21:57 +0000
Message-ID: <20200121162157.GD4656@sirena.org.uk>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q9KOos5vDmpwPx9o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2020 at 07:00:36PM +0300, Mika Westerberg wrote:

> Currently both intel_scu_ipc.c and intel_pmc_ipc.c implement the same SCU
> IPC communications with minor differences. This duplication does not make
> much sense so this series reworks the two drivers so that there is only a
> single implementation of the SCU IPC. In addition to that the API will be

This is a 40 (!) patch series and looking at the subjects and diffstat I
can't tell if there's something in particular that you're looking for me
to review?

--q9KOos5vDmpwPx9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4nJSUACgkQJNaLcl1U
h9BLZQf/VjNChJv9k7JPur4zWfGS9+F5nNaFNi/af//akiLUMZatxAjyHirSeg4w
ijrObLzU6lw/gTnSukoe7UMUK36nerMpELth4L6PYNl1xUGX3YI/nvNY8kUu3TuA
HqKDeckqzB17Mxqel0BWiieLSNBxtQiNm/kpPnAmXV8lxFKeAcbfJQPlqg3DbYb0
7axbbqExSm8QBYbi4sbsXS+s5rRhVvCF1WBUqIckF8ui+P58pXuTTN1IiCSghXlB
BID9lv+jXGFAdzS0db11i/qpJnLY1Bq7uX6/i4KwhNq+62Mnb+IhxKrxNgoEkQY3
I3vQWHmuJqIED0G0Uqv9o1kZHx4zig==
=d0Tm
-----END PGP SIGNATURE-----

--q9KOos5vDmpwPx9o--
