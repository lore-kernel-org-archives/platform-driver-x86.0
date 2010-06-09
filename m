From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: Re: [PATCH] classmate-laptop: Add RFKILL support.
Date: Wed, 9 Jun 2010 15:19:58 -0300
Message-ID: <20100609181958.GA2551@barata.holoscopio.com>
References: <1272384900-3982-1-git-send-email-cascardo@holoscopio.com>
 <4C0F6CDF.9060608@tuffmail.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade2.minaslivre.org ([74.50.53.203]:38312 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751727Ab0FISUa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jun 2010 14:20:30 -0400
Content-Disposition: inline
In-Reply-To: <4C0F6CDF.9060608@tuffmail.co.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Cc: platform-driver-x86@vger.kernel.org, mjg@redhat.com, don@syst.com.br, johannes@sipsolutions.net, rpurdie@rpsys.net


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2010 at 11:28:47AM +0100, Alan Jenkins wrote:
> Thadeu Lima de Souza Cascardo wrote:
> >The RFKILL device shares the same ACPI device used for backlight. So, it
> >required a new struct sharing both a backlight_device and a rfkill
> >device.
> >
> >Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
> >---
>=20
> Apologies for tardiness.  You did ask for review, so I've scanned it for =
some common rfkill pitfalls.
>=20
>=20

Hello, Alan.

Thanks for your review.

> > drivers/platform/x86/classmate-laptop.c |  170 ++++++++++++++++++++++++=
+++----
> > 1 files changed, 148 insertions(+), 22 deletions(-)
> >
> >diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/=
x86/classmate-laptop.c
> >index 7f9e5dd..3bf399f 100644
> >--- a/drivers/platform/x86/classmate-laptop.c
> >+++ b/drivers/platform/x86/classmate-laptop.c
>=20
> >+static const struct rfkill_ops cmpc_rfkill_ops =3D {
> >+	.query =3D cmpc_rfkill_query,
> >+	.set_block =3D cmpc_rfkill_block,
> >+};
>=20
> You said down-thread that firmware does not change the state.  In that ca=
se, I believe the query method is unnecessary
>=20
>=20
> * @query: query the rfkill block state(s) and call exactly one of the
> *	rfkill_set{,_hw,_sw}_state family of functions. Assign this
> *	method if input events can cause hardware state changes to make
> *	the rfkill core query your driver before setting a requested
> *	block.
>=20
>=20
> Generally, the rfkill core caches the soft blocked state.  It doesn't cal=
l query() during registration either - it calls set_block() with a default =
value (usually "unblocked").  query() is only used to minimize a race with =
the firmware during set_block().
>=20
>=20

I really don't know of anything that may change the rfkill state behind
our back. However, would this work in the case a new version comes out
with this same ACPI interface that does it? And keeping the query method
would only be a performance issue? If that's the case, and there are no
strong opinions about using the cache, I think we could keep the method.
The hardware interface allow us to query and I think it's better to
point it out that the hardware has this capability. What do you think
about it?

> >+	ipml->rf =3D rfkill_alloc("cmpc_rfkill", &acpi->dev, RFKILL_TYPE_WLAN,
> >+				&cmpc_rfkill_ops, acpi->handle);
> >+	/* rfkill_alloc may fail if RFKILL is disabled. We should still work
> >+	 * anyway. */
> >+	if (!IS_ERR(ipml->rf)) {
> >+		retval =3D rfkill_register(ipml->rf);
> >+		if (retval) {
> >+			rfkill_destroy(ipml->rf);
> >+			ipml->rf =3D NULL;
> >+		}
> >+	} else {
> >+		ipml->rf =3D NULL;
> >+	}
>=20
> I think the comment is wrong, and so is the code it references.
>=20
> rfkill_alloc() is documented as returning NULL on failure, not an ERR_PTR=
=2E  So you're going to pass NULL into rfkill_register() on allocation fail=
ure, which will BUG out.
>=20

Gee! At the time, I only read the RFKILL=3Dn implementation in the header.
It returns ERR_PTR(-ENODEV), while the RFKILL=3Dy implementation does
indeed return NULL. This is inconsistent interface, and we'd better fix
it, in my opinion. But for the time, we must fix the users here.

> eeepc_laptop tests for NULL here, not ERR_PTR.
>=20
> If you look at the implementation when RFKILL is disabled, rfkill_registe=
r() is designed to accept  ERR_PTR(-ENODEV) without complaint.  (And the ot=
her rfkill functions won't care either; they'll just be completely empty st=
ubs).
>=20

I see why eeepc_laptop would still work right now. But I think it's
risky for the casual driver writer to trust the rfkill device is there
while it isn't. If this is by design, to bite those driver writers that
do "stupid" things (like not using the right interface) and that they
should still manipulate hardware as if the rfkill device was there,
that's OK. But is this really by design or should we fix it? For
example, eeepc_laptop does all the wlan pci device hotplug stuff and
also write some ACPI values. And it will do that if RFKILL is disabled
but will not do it if RFKILL is enabled but device allocation fails. So,
should we document that ERR_PTR(-ENODEV) is not a failure, but a
"dummy"?

In any case, classmate-laptop does need a fix! Care to make a patch?

Thanks again for the review and my best regards.
Cascardo.

>=20
> Regards
> Alan

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJMD9tLAAoJEEWxSg7udFZIAmsQAJzFAdoqR0gP3xe75Lyp3YPI
JwppBbDScqrJPP2VaJsOPafVcoWGa9FkYKtP5rKsk0kIlzgAupWEE3Pn0LjoLKI1
uynWOI1bvSipv+F2y6Af192cqQKeTYNxhaqCkUomUHqJ3ijbVNQEUx1AzTMIMeXx
6i0fqtAexwVozPqJZapnekZ3fJmKcLgmog9VLRNZDi4TvKLniM+Q1kBP+5Os72aB
Nest/dEc5q/NOwMmf9hRUm8Q7OpRZQ9QjWt+Mz5Euay8Fl/t4WQKFrL5/l6Ue0rM
F/cZx5KQTvK4kTyc/73xBWlY6DoljzSYQJpDLX80R3Hu8B5RYd030b1FpDquy6/3
H7I4iom1s18XKwPzPws3Wf28BWXkhgM4oTAS2c5qHe/yyLU4CYU+L8RtDmyv5dfV
jsT7oTFKI1dOJs0BJ2uU9UWZpUqV2ctbdJkLUQEMUDzLaYEQekdLiyMHRL0aT9m1
SsWQMfRKKy84QjauuBTpi6LnZ4J5UkzVra7JRLd/LABma66oANOJBPRXHewisvUp
fxbMMTx4yEpcnH01uht0ULicA9PQBe3uQ2JC9uw29wOf6dABvHCSagZGl8MCovjj
JataT+swIa5eiMQoOC55sPPHDAt+dF82WztcR/v7+71ghDQ2GgGOzaHetXLT0wBP
7SZUBw0wsfFuXeGJtkg5
=swv6
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
