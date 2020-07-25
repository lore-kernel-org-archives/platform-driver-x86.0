From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v13 1/4] battery: Add the battery hooking API
Date: Sat, 25 Jul 2020 21:00:50 +0200
Message-ID: <20200725190050.3ssslnkrauq6zdrd@earth.universe>
References: <20180207145813.icmv6rwemyejhxbk@thinkpad>
 <2270b8c7-beec-5ab6-f8b7-5ec41751c699@klausen.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hfre6zazdmed5p3p"
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2270b8c7-beec-5ab6-f8b7-5ec41751c699@klausen.dk>
Sender: linux-acpi-owner@vger.kernel.org
To: Kristian Klausen <kristian@klausen.dk>
Cc: Ognjen Galic <smclt30p@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>, Lv Zheng <lv.zheng@intel.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, devel@acpica.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Platform Driver <platform-driver-x86@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, Linux PM <linux-pm@vger.kernel.org>, Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph@boehmwalder.at>, Kevin Locke <kevin@kevinlocke.name>
List-Id: platform-driver-x86.vger.kernel.org


--hfre6zazdmed5p3p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 24, 2020 at 01:42:26AM +0200, Kristian Klausen wrote:
> On 07.02.2018 15.58, Ognjen Galic wrote:
> > This is a patch that implements a generic hooking API for the
> > generic ACPI battery driver.
> >=20
> > With this new generic API, drivers can expose platform specific
> > behaviour via sysfs attributes in /sys/class/power_supply/BATn/
> > in a generic way.
> >=20
> > A perfect example of the need for this API are Lenovo ThinkPads.
> >=20
> > Lenovo ThinkPads have a ACPI extension that allows the setting of
> > start and stop charge thresholds in the EC and battery firmware
> > via ACPI. The thinkpad_acpi module can use this API to expose
> > sysfs attributes that it controls inside the ACPI battery driver
> > sysfs tree, under /sys/class/power_supply/BATN/.
> >=20
> > The file drivers/acpi/battery.h has been moved to
> > include/acpi/battery.h and the includes inside ac.c, sbs.c, and
> > battery.c have been adjusted to reflect that.
> >=20
> > When drivers hooks into the API, the API calls add_battery() for
> > each battery in the system that passes it a acpi_battery
> > struct. Then, the drivers can use device_create_file() to create
> > new sysfs attributes with that struct and identify the batteries
> > for per-battery attributes.
>=20
> Hi
>=20
> I did that, when I implemented charge threshold support for ASUS
> laptops[1][2].
>=20
> It works very well but I can't control the threshold with udev (also
> reported by another user here[3]). So I did a bit of digging and the doc[=
4]
> states: "If attributes are added after the device is registered, then
> userspace won=E2=80=99t get notified and userspace will not know about th=
e new
> attributes.", which seems to be the way the current code works:
> power_supply_register_no_ws is called[5] and if it success all the hooks =
are
> run.
>
> Looking at the code I'm not sure there is a easy way to fix it, do you ha=
ve
> any good ideas?

That problem is described by Greg in his blog post from 2013:

http://kroah.com/log/blog/2013/06/26/how-to-create-a-sysfs-file-correctly/

The power-supply subsystem offers registering extra attributes
at registration time by filling in the .attr_grp field in the
struct power_supply_config supplied as last parameter to
power_supply_register_*() since 4.21.

-- Sebastian

--hfre6zazdmed5p3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl8cgV4ACgkQ2O7X88g7
+pqvtQ//ZrWf/Jt4UggT7gakaPf45snDjeeIbYOG4t+yuEAOkSI+6VHGMERKap2o
mkpuzVdEYnpIP4PtSjCxM9adJvSktn/z22QvkypyyYDDmsuGGu8d3fUD1o1TYDGE
Dm5Kce8aqHIFBVL1TG+9Yg6O8L5gkKE6NC8dwlwFRTgnh7jAR910F8sva6Poc0PC
Uvp3DqeuqRWgdPqKko5l5BTtfsghu+nTl+cMqYxrN7yTLeimaTUZZdLtYrwNJ3Z1
o4jDSYCGlxdb269FGsPj3Ukoh4KvGJ4Iz+FZw60QToteki3lMuQfmrZBrsd1dWFo
SEdrG0m+zetHNRJWEiuxSFRKHsHQXOiyrmso63HxfdwhB8s+mlBsC0pn+kunKhTh
xx0v9n9xygPfs3QWVd8mQJkE2yLVeExacsoZPLabL9NLYUTEMRUrB43pcq0D85Jv
+d7MDMKJ+Q+xOVGk6GukdMCgmR+cY7jImZqIIRKUrE1utKQ0fux2bZzbsJ7jXyvC
H27QMpJ1uA+knpRKx5PpWM5ohfVRUogaItv5C7uBzrpksMToB+wU2LumrOSKg67D
vvv3XkWm6KFKl+wOOGWcj/1pzTOatqQk0VQC1BKVeoWzqFPq/x2XNCMHIpYK7ZpP
ABX2jdj0v3Jd7bwiKRNLc9P0W6E7YQcM1V3+N2KI36O4FoLWL9M=
=9vtN
-----END PGP SIGNATURE-----

--hfre6zazdmed5p3p--
