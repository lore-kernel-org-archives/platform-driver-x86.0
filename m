From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: hp-wmi: wifi rfkill can't be reversed
Date: Tue, 26 Aug 2014 23:57:23 -0700
Message-ID: <1409122643.30127.24.camel@deadeye.wl.decadent.org.uk>
References: <53ED47BA.60904@tnnn.pl>
	 <1408389040.2618.31.camel@deadeye.wl.decadent.org.uk>
	 <53F27EFC.3030409@tnnn.pl>
	 <1408916663.12973.88.camel@deadeye.wl.decadent.org.uk>
	 <1409018140.5921.3.camel@debian1>
	 <1409039442.3033.65.camel@deadeye.wl.decadent.org.uk>
	 <D022766E.A5859%dvhart@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-S5Mxl3kFw3XNpnkJD8Q2"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:33633 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752032AbaH0G5o (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Aug 2014 02:57:44 -0400
In-Reply-To: <D022766E.A5859%dvhart@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Wilson <al_wilson@ns.sympatico.ca>
Cc: platform-driver-x86@vger.kernel.org, Tomasz Nitecki <tnnn@tnnn.pl>, 756947@bugs.debian.org, Darren Hart <dvhart@infradead.org>


--=-S5Mxl3kFw3XNpnkJD8Q2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2014-08-26 at 17:40 -0500, Darren Hart wrote:
> On 8/26/14, 2:50, "Ben Hutchings" <ben@decadent.org.uk> wrote:
>=20
> >Alan Wilson (in cc) reported that rfkill doesn't work correctly on the
> >HP Compaq nc6230.
> >
> >- Without the hp-wmi driver loaded, the hard rfkill switch controls both
> >wifi and BT while soft rfkill only works for wifi.
> >
> >- With the hp-wmi driver loaded, soft and hard rfkill switches can be
> >used to turn wifi and BT off and to turn BT back on, but wifi cannot be
> >turned back on without using the BIOS setup program.
> >
> >(The full bug report is logged at <https://bugs.debian.org/756947>.)
> >
> >This was reported against Linux 3.2, but I don't think there have been
> >relevant fixes since then.
> >
> >Perhaps the hp-wmi driver should blacklist this model for wifi rfkill
> >(while leaving all the others features enabled).  Does that seem like a
> >reasonable approach to fix this?
> >
> >Ben.
>=20
> Hi didn't quite have to get pencil and paper out to create a truth table
> for this one, but nearly! Assuming assertions about no more firmware
> becoming available and the latest firmware being run are accurate,
> blacklisting this model seems like a reasonable approach to restoring
> basic functionality.

Alan, can you provide the identifying information for this model:

    grep . /sys/class/dmi/id/{product,board}_{name,version}

Ben.

--=20
Ben Hutchings
No political challenge can be met by shopping. - George Monbiot

--=-S5Mxl3kFw3XNpnkJD8Q2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAU/2BXue/yOyVhhEJAQq3DBAAwEn5QbAwttYhB84SMcXMN9iQYw5d4GIO
EVsIV1fe482V1Z1uEf5ZNrYIk0TQXVKsEiPOfEH8ZB2NMLnp3cIDCeeC87n6CLus
wXbbsV1MrHM3i55q6Ix/d0A3CEG1LAagWWinpWD+BJwehfiUpKOfZ3yuFmLWr9ew
QGJRLDvPNqRXptQNSEFECTDTnIlbNk7sTYgH2hBC1up+zz7EX8/1YcKfWXa3vKty
f/GXpevjwV1xXmMUy2wItbd83z49IkP289XYm/yScusF+tXEJfo8BtZi6aZ0VOtE
FMtaGeVDaUchfxQHu+c1Fcph0DBg94Eu/pDyMonEyzSFZaR6fdb+7qQPeTZdD0xu
qPvN0HqSpA5oVeT/SUktqQWR0lrWSvRZVxXc55BhYcyJ9DMXBWBqMo/RgmFukN/o
Udo+aTil5vTgDu96s2YMKH4GuuJr/bcRYYr3evLd6/nXLnlRXg5cvJvqnRy3FWiM
L/M86DNdn6PqrgHltPgGwobRN2y0VGIJyqsU+nmDt+8yj13USoUlU7vl6aJy2q/N
KyKbtkXGqk6kk/GbZaC4fZ2tZVXEgw2u50HC/KLmYPGejJipDF4JToMY33QxU20n
QWHTwgGtJYJmExOrpy2jL0XkWJ4XEgLWi37MsDgrZHPRI8m9v72ev9hqWNyA31fL
0CQ/DwZXoAw=
=r6TQ
-----END PGP SIGNATURE-----

--=-S5Mxl3kFw3XNpnkJD8Q2--
