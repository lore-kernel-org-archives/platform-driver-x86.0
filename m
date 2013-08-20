From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: [GIT] x86 platform driver fixes for 3.11
Date: Tue, 20 Aug 2013 13:45:49 +0100
Message-ID: <20130820124549.GA12264@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:35035 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750962Ab3HTMpx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 20 Aug 2013 08:45:53 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: torvalds@linux-foundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Three trivial fixes - the first reverts a patch that's broken some other=20
devices (again - I'm trying to figure out a clean way to implement=20
this), the other two fix minor issues in the sony-laptop driver.

The following changes since commit 50e37ccea06ca8846ceb60dbfbe056012c60d71b:

  Merge branch 'for-3.11-fixes' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/tj/cgroup (2013-08-18 08:51:28 -0700)

are available in the git repository at:


  ssh://cavan.codon.org.uk/srv/git/platform-drivers-x86.git linux-next

for you to fetch changes up to 41c8bd1c75ef8e8566eca6b1c7bc273bc282f495:

  Revert "hp-wmi: Enable hotkeys on some systems" (2013-08-18 13:23:31 -040=
0)

----------------------------------------------------------------
Daniel Serpell (1):
      sony-laptop: Fix reporting of gfx_switch_status

Matthew Garrett (1):
      Revert "hp-wmi: Enable hotkeys on some systems"

Wei Yongjun (1):
      sony-laptop: return a negative error code in sonypi_compat_init()

 drivers/platform/x86/hp-wmi.c      | 16 ----------------
 drivers/platform/x86/sony-laptop.c |  8 ++++++--
 2 files changed, 6 insertions(+), 18 deletions(-)

--=20
Matthew Garrett | mjg59@srcf.ucam.org

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlITZP0ACgkQ7Hkv8l1YiTswzACeKoro+UM5O0+9nYzkFdxv3Hyl
5MIAnR4f2O4x482bIejKucV2M6gHki2a
=NhIw
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
