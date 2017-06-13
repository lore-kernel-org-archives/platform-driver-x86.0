From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
Date: Tue, 13 Jun 2017 20:04:57 +0200
Message-ID: <201706132004.58051@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com> <201706102115.57995@pali> <20170613164951.GI27850@fury>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2304693.NMtAXrQBWh";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170613164951.GI27850@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--nextPart2304693.NMtAXrQBWh
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 13 June 2017 18:49:51 Darren Hart wrote:
> On Sat, Jun 10, 2017 at 09:15:57PM +0200, Pali Roh=C3=A1r wrote:
> > On Saturday 27 May 2017 13:55:34 Pali Roh=C3=A1r wrote:
> > > instance_count defines number of instances of data block and
> > > instance itself is indexed from zero, which means first instance
> > > has number 0. Therefore check for invalid instance should be
> > > non-strict inequality.
> > >=20
> > > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > ---
> > > I'm marking this patch as RFC because it is not tested at all and
> > > probably could break existing WMI drivers. Some WMI drivers pass
> > > instance number 1 and I'm not sure if ACPI-WMI bytecode for those
> > > machines has really two instances. In more cases ACPI-WMI
> > > bytecode does not check instance number if supports only one
> > > instance. So then any instance id can be used for correct
> > > execution of ACPI-WMI method.
> > >=20
> > > So this patch is open for discussion.
> >=20
> > Hi! Any comments?
>=20
> Hi Pali,
>=20
> This change appears correct to me, but your comment about this
> parameter being ignored by ACPI-WMI is definitely concerning. Since
> this doesn't address a specific failure report, and it has the
> potential to break functional drivers, I wouldn't want to merge it
> without some evidence that those drivers still work.

I agree that it should not be merged without any other testing or=20
discussion. Reason why I marked it as RFC.

ACPI bytecode (which implements WMI functions) is often ignoring=20
instance method if there is only one instance. So it does not have to=20
decide which instance to call based on parameter.

IIRC it is also stated in that MSDN documentation.

> I'd suggest reaching out to the maintainers and contributors to the
> drivers you mention to request some help in testing.

Seems sane. Grep for all methods with instance number different as zero=20
(or just number one -- which can be suspicious as somebody could thought=20
that indexing is from one, not zer) and try to receive ACPI/BMOF data=20
and verify it.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2304693.NMtAXrQBWh
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAllAKUoACgkQi/DJPQPkQ1KXoACZAT5Xcurz9PNyteqEzSvmgBLK
JMUAnjFe4zcT+AyY3mJqKmM6JmZiOiux
=WnF9
-----END PGP SIGNATURE-----

--nextPart2304693.NMtAXrQBWh--
