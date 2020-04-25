From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 2/2] platform/mellanox: mlxreg-hotplug: convert to use
 i2c_new_client_device()
Date: Sat, 25 Apr 2020 22:54:08 +0200
Message-ID: <20200425205407.GA6774@kunai>
References: <20200326210952.12857-1-wsa+renesas@sang-engineering.com>
 <20200326210952.12857-3-wsa+renesas@sang-engineering.com>
 <CAHp75Vfw4_0ttE2F-WxdULf7hRGsQvqzCLdCNVy7RBaFdEsCGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vfw4_0ttE2F-WxdULf7hRGsQvqzCLdCNVy7RBaFdEsCGA@mail.gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c <linux-i2c@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 09:38:21AM +0200, Andy Shevchenko wrote:
> On Thu, Mar 26, 2020 at 11:10 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > Move away from the deprecated API and return the shiny new ERRPTR where
> > useful.
> >
>=20
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks, Andy! Is there a platform-x86-tree where this can go in? Or
shall I take it via the I2C tree? Same question for the similar patch
for x86/platform/intel-mid?


--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6ko2sACgkQFA3kzBSg
KbZL+BAAivHnLwlKT5ihGFOpYc2ysvV5Pe4TXJS4vuBDj2n+ETxpkYbEzhWiary6
3yIsBzNbq/aDLYk91y5N+si7jj4oN/6hK754BNzHKplZahAaYxzZWn1FbqVejkcl
/zawMYGz3KEpFsyYqxEVR/AbYz0bINF3xx9cKewdJoeA05ev15LicTgiOdK1aXg9
6g4xvhRWYgLFdqCWcmiIKfUTEvrBWQxNxfQRTMjGTP6bMfq38JOdf+6hWMOQqHbG
AG/vdQzUCoqh6dbmRC0Rmn9Yi27BWaOLpJwc7TGID9B0gzJIj8Z6VeXgN//d7BBb
gc+uk7ZBlZlxsHElWoY6xInz8sipuTv+O5K30Tq7zVHQ6E/3IBCEDBYrWwyz5LxU
cWN7F1wLUMXSywGVBWhtf8zwYt4u4OJygq+aEcj3DRr4ZziXtj77zLAZMjRQD+aA
dtq/Ifu0rPI8zY4JbcxlXjuByJCULiUxmW9g21LlzKXtNKe+oj7d3TDmMw3+h65V
Dvn2LWVWOQMNHmTtHN+qwXwkT2RnR2+mZq7c2Ucnn/W2gyML4sx+3DWc80uuDK/H
xOfY5rdotVi/oo9NcLcPI8M8SN4O7pimyk1pmg61gdngHP+sLVes8E6kL8Ossgh9
JCWBIW6Dky1Fi7reFbKGSVz3LUuoAU/oRjeXDwR/RatcfkkmrDM=
=OCNg
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
