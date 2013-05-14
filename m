From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] amilo-rfkill: Add dependency on SERIO_I8042
Date: Tue, 14 May 2013 02:44:26 +0100
Message-ID: <1368495866.4304.43.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4Kipo6Kc6ftxdgGHjs3A"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:53814 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754534Ab3ENBom (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 May 2013 21:44:42 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Fengguang Wu <fengguang.wu@intel.com>, kbuild-all@01.org, platform-driver-x86@vger.kernel.org


--=-4Kipo6Kc6ftxdgGHjs3A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I forgot to add this when changing the driver to use the proper
i8042 functions.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/platform/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3338437..1fdbb0d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -176,6 +176,7 @@ config FUJITSU_TABLET
 config AMILO_RFKILL
 	tristate "Fujitsu-Siemens Amilo rfkill support"
 	depends on RFKILL
+	depends on SERIO_I8042
 	---help---
 	  This is a driver for enabling wifi on some Fujitsu-Siemens Amilo
 	  laptops.


--=-4Kipo6Kc6ftxdgGHjs3A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUZGW+ue/yOyVhhEJAQpTHxAAnoAqDsTjDfK99I4wbDZn+/dqGYYcGm6G
2elEHh3ed53QQCu8sVtvzP1POJ2sEmpHZSYNIfsBxY0Iex6ESYMqWmqoTSI+z34Q
ao2MMEWltNW1yT1yyDMnb6drio5UuCmrr6exlosQsn7gFSNF73Ck6v3YE0g15fqv
mRi1YgPqW5mAYsDLanl0i+SN7tGiGg5k8cLLBquwO9Yi2k0aNM6+6zfRrhniTWXK
z06c2d1+kXbpbWf3qpzSezrqUqNAwDBe+wJmZ73ycWnKGUvS/mFW/mo/sx/Q+X92
9HJWc11YkROWGoMRIYFwnafVkPGp8BM4NQ3HLqvZnm9Ald1cadlHneijPp0ZGT08
0oDDqobnXZDeIYn0BOQAMJ0P8NftwIUFmqiT6lzxBRFHL1E7hStAxBmkIFRYxILu
eVMKI2D4+FMrCXwmt6etAms3BpelzRclxz6r63q9R1Wkgmc2j52D5gfAi3vmvHK/
OyoxsbzzPGSWjhDMX3ZYt392bWkqd6qJCxm/rnndQi7jNhW3ZzcvzqCehGa3nqjg
O/x/kwNpq7icd+2sAxbRjLL6FistudhJvV661eey4Vde5CVWeoTW7cTmtejO23j6
fMiRmiekU0TM71DRyRV8l+VqxWtxGJjuk4WoxJzIfEGCQRyQK+SEONwc38oEz6mq
OjVDMVtz+IA=
=2h2d
-----END PGP SIGNATURE-----

--=-4Kipo6Kc6ftxdgGHjs3A--
