From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v10 00/15] Introduce support for Dell SMBIOS over WMI
Date: Thu, 9 Nov 2017 10:52:08 +0100
Message-ID: <20171109095208.GD6074@amd>
References: <cover.1508434513.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1508434513.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>
List-Id: platform-driver-x86.vger.kernel.org


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2017-10-19 12:50:03, Mario Limonciello wrote:
> The existing way that the dell-smbios helper module and associated
> other drivers (dell-laptop, dell-wmi) communicate with the platform
> really isn't secure.  It requires creating a buffer in physical
> DMA32 memory space and passing that to the platform via SMM.
>=20
> Since the platform got a physical memory pointer, you've just got
> to trust that the platform has only modified (and accessed) memory
> within that buffer.
>=20
> Dell Platform designers recognize this security risk and offer a
> safer way to communicate with the platform over ACPI.  This is
> in turn exposed via a WMI interface to the OS.
>=20
> When communicating over WMI-ACPI the communication doesn't occur
> with physical memory pointers.  When the ASL is invoked, the fixed
> length ACPI buffer is copied to a small operating region.  The ASL
> will invoke the SMI, and SMM will only have access to this operating
> region.  When the ASL returns the buffer is copied back for the OS
> to process.

SMM has access anywhere it wants. This may be good idea, but
definitely not for "security" reasons.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloEJUgACgkQMOfwapXb+vJ1HQCeL7vFIxFVpJhHSBXqrEho/OXx
954Anj5OE5Uzvccu2jxIqC3GzlucU14l
=e0gt
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
