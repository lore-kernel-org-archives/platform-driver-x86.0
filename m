From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: drivers/platform/x86/amilo-rfkill.c::amilo_rfkill_probe() avoid
 NULL deref
Date: Tue, 22 May 2012 03:47:35 +0100
Message-ID: <1337654855.11796.8.camel@deadeye>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-DLBKLPmaKCyj+6EpxFdM"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:50403 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932121Ab2EVCrv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 May 2012 22:47:51 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jesper Juhl <jj@chaosbits.net>
Cc: platform-driver-x86@vger.kernel.org


--=-DLBKLPmaKCyj+6EpxFdM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't understand this change:

commit 41603e9783a24c8c7cce548c0819bdc9e46a585b
Author: Jesper Juhl <jj@chaosbits.net>
Date:   Fri Mar 23 01:08:34 2012 +0100

    drivers/platform/x86/amilo-rfkill.c::amilo_rfkill_probe() avoid NULL de=
ref

amilo_rfkill_init() checks that dmi_first_match() does not return NULL,
before registering the platform driver.  So why would it return NULL
when called by amilo_rfkill_probe()?

Ben.

--=20
Ben Hutchings
You can't have everything.  Where would you put it?

--=-DLBKLPmaKCyj+6EpxFdM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAT7r+R+e/yOyVhhEJAQrXVBAAuhHX6BTbw5AuF8/QcatkN9KyHq2rtA0T
mMkWBDIAQyf0nuQ8722UHdbt2kT3O1rJY2RVTDZh1iE8Y1/bgmuE0neRtOhXxOeF
Zn9c2mP7jMR/x9AW6jAvGr4SzwC6xRINmSJC42o2UGiqXwTYRRZM6+OXDN4XwMAd
0TkqyCaIbrYAfAyN93fh4KjiPw6OdEnNboBMDXIxrpTDoEsL8Ccq7rVm16NCrVPJ
2Khw4B61vz9p1Sm9d1d8k91eVqyHUD69anfivoVAM5WJwLbQsIDQJqzt03d8TPU5
OKXT+XsQFZWV+zQcPowfYVCbP6u1XT9XyJB9kd1OwVWCU7F0OPlj+7M/fxGyEtss
KRLjb2FQAB9N1t6tPDWw8n7yfKJFDV3g4IMXqTy6xJKLf2eUm+dpjjaOezmhfVCk
PyIFfQQt19/PyECwpApK0DSjAeIlk3gSTOmJ0g7WHtnC5S3wtE4x6Am1X8fj7AUG
BvuHOd1gFO2OdhSRCniZdvw/4BQKFthd6gICgFqzxU7Bmbs9Gmp3F0vkRDWGnQYY
h/qa690C4S02K/015db11QtLwRcnAR8It36SsLUKWNNI5qJt1UL6ngzWYwuFsWx7
2WxM+O4MKNZIT2LTff2OKicVhykGdfxypdCrD+JgGrdIAnoM7mQLFp5nXvesXFPk
6LS4Nqen/rU=
=cmTt
-----END PGP SIGNATURE-----

--=-DLBKLPmaKCyj+6EpxFdM--
