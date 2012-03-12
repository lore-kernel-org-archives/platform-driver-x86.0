From: Matthew Garrett <mjg@redhat.com>
Subject: [GIT] X86 platform driver updates for 3.3
Date: Mon, 12 Mar 2012 14:28:41 +0000
Message-ID: <20120312142841.GA12245@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:48095 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752395Ab2CLO2n (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Mar 2012 10:28:43 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Some trivial patches that fix wifi on some Lenovos and avoid a potential=20
memory corruption issue on some Panasonics, plus two straightforward new=20
drivers that touch no existing code.

The following changes since commit fde7d9049e55ab85a390be7f415d74c9f62dd0f9:

  Linux 3.3-rc7 (2012-03-10 13:49:52 -0800)

are available in the git repository at:
  ssh://cavan.codon.org.uk/srv/git/platform-drivers-x86.git for_linus

Ben Hutchings (1):
      x86: Add amilo-rfkill driver for some Fujitsu-Siemens Amilo laptops

Ike Panhc (1):
      acer-wmi: No wifi rfkill on Lenovo machines

Robert Gerlach (1):
      Fujitsu tablet extras driver

Xi Wang (1):
      panasonic-laptop: avoid overflow in acpi_pcc_hotkey_add()

 MAINTAINERS                             |    6 +
 drivers/platform/x86/Kconfig            |   24 ++
 drivers/platform/x86/Makefile           |    2 +
 drivers/platform/x86/acer-wmi.c         |   30 ++-
 drivers/platform/x86/amilo-rfkill.c     |  173 +++++++++++
 drivers/platform/x86/fujitsu-tablet.c   |  478 +++++++++++++++++++++++++++=
++++
 drivers/platform/x86/panasonic-laptop.c |    4 +-
 7 files changed, 714 insertions(+), 3 deletions(-)
 create mode 100644 drivers/platform/x86/amilo-rfkill.c
 create mode 100644 drivers/platform/x86/fujitsu-tablet.c


--=20
Matthew Garrett | mjg59@srcf.ucam.org

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk9eCBkACgkQ7Hkv8l1YiTu+QwCglHiEbTOm5CrA82dUZNbYCzjt
7bwAn2lGVdX1naI39NePokwDdgHCj2fu
=yj9P
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
