From: Julien Valroff <julien@kirya.net>
Subject: [PATCH] acerhdf: add support for Aspire 1810TZ BIOS v1.3314
Date: Thu, 23 Jun 2011 20:50:08 +0200
Message-ID: <20110623185007.GA2889@kirya.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nix.kirya.net ([109.74.192.127]:35838 "EHLO nix.kirya.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759898Ab1FWSzq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2011 14:55:46 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Peter Feuerer <peter@piie.net>


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[ please CC me in all your replies, I am not subscribed to the list ]

Hi,

Would you please consider applying the following patch adding support for
the Aspire 1810TZ BIOS v.1.3314 version to the acerhdf module and avoids the
following error:

acerhdf: unknown (unsupported) BIOS version Acer/Aspire 1810TZ/v1.3314, ple=
ase report, aborting!

Not sure about the other Aspire models, but it seems at least 1810T should
also be updated.

A similar patch was also proposed last year for 1410 [0] but wasn't yet
applied.

Thanks in advance
Julien


Signed-off-by: Julien Valroff <julien@kirya.net>
---
 drivers/platform/x86/acerhdf.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index fca3489..d339756 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -182,6 +182,7 @@ static const struct bios_settings_t bios_tbl[] =3D {
        {"Acer", "Aspire 1810T",  "v1.3308", 0x55, 0x58, {0x9e, 0x00} },
        {"Acer", "Aspire 1810TZ", "v1.3310", 0x55, 0x58, {0x9e, 0x00} },
        {"Acer", "Aspire 1810T",  "v1.3310", 0x55, 0x58, {0x9e, 0x00} },
+       {"Acer", "Aspire 1810TZ", "v1.3314", 0x55, 0x58, {0x9e, 0x00} },
        /* Acer 531 */
        {"Acer", "AO531h", "v0.3201", 0x55, 0x58, {0x20, 0x00} },
        /* Gateway */
--=20
1.7.5.4


[0] http://kerneltrap.org/mailarchive/linux-kernel/2010/11/13/4645119

--=20
  .''`.   Julien Valroff ~ <julien@kirya.net> ~ <julien@debian.org>   =20
 : :'  :  Debian Developer & Free software contributor
 `. `'`   http://www.kirya.net/
   `-     4096R/ E1D8 5796 8214 4687 E416  948C 859F EF67 258E 26B1

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOA4rbAAoJEIWf72cljiaxfHcP/3ZHYbwq0cOsBsLsVUN5L6S3
e8mk8EJEVegSuioi49rD0s/5a9Y++p7mXpaT/tgWXSl2ylND2DoKjYcMJIlEfvWA
wr8oK3iUYsfL5FS8Boq1byfUtgdr5XEv9Azw5JFvuElM9jIZq3foh2X4oXJ0H46l
rKlwYWj/g6E3Yd0uCICYx2joB888Pbtqx6Oj1FC65R8Hpnhhi8GnSYl5QCTPcOBC
K475S31mNh6AsHtA7A5s9vxyVnHOwTrQ18jBoy9ppzgAVRVkqXun2kxyalTMtT/w
lX5BuBi3WhF++fB00tyTzh1K1F+xDQ7l6DjXLdwB/BeadGyxvjKLg+txJb+1m4K9
MJPjEpNCKzt6LP8zkIGKQlPBa/dQhlZ2c+JLDFPpMhZY7O1vZ0gR35hP9bskn/1n
AEYytjznWg2U8VH7tFAvKqytekhE56LjXdt8cxnmOssoyi9Cs8oxtASFRUEDHDyp
rWumx7Sze1HC4aoJvZTmv48s1CLP9yWRPNIkM7Esgb9RjVqw0LqpLPZY/gzG84rA
aW9DGa6SRXTqE+gaiSlGY1GlEQLravVfdNTFVUTrjhHgsPs7CKCcbxJjKn9efhuN
2R/Ur8VHRheffGp0FEc9NXp8mLHWMnTBKIiwzVH9AZGoXj0JMT7Hg/oozivLtuuQ
VbGwyeZwLOUwesuAJdZY
=OZcn
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
