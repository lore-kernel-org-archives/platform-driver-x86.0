From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: [GIT] x86 platform drivers update for 3.2
Date: Mon, 5 Dec 2011 18:55:42 +0000
Message-ID: <20111205185542.GA27141@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

One small regression fix picked up by user testing.

The following changes since commit 8e8da023f5af71662867729db5547dc54786093c:

  x86: Fix boot failures on older AMD CPU's (2011-12-04 11:57:09 -0800)

are available in the git repository at:
  git://cavan.codon.org.uk/platform-drivers-x86.git for_linus

Seth Forshee (1):
      toshiba_acpi: Fix machines that don't support HCI_SYSTEM_EVENT

 drivers/platform/x86/toshiba_acpi.c |   21 ++++++++++++++++-----
 1 files changed, 16 insertions(+), 5 deletions(-)

--=20
Matthew Garrett | mjg59@srcf.ucam.org

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk7dE64ACgkQ7Hkv8l1YiTs8/QCgrOHQr/hZn+LMl6wKSCJmQMIG
QSYAn0gcqYW5bxAA7VtLzoohvbopw7Ey
=O47b
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
