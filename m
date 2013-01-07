From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [GIT] x86 platform driver bugfixes for 3.8
Date: Mon, 7 Jan 2013 17:43:06 +0000
Message-ID: <20130107174306.GC31427@srcf.ucam.org>
References: <20130107171722.GA31427@srcf.ucam.org>
 <CA+55aFzL00K+oURqcnSgbAAkD18DJ8-p1G8vd7KE6RD77dLmCQ@mail.gmail.com>
 <20130107172616.GB31427@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130107172616.GB31427@srcf.ucam.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: platform-driver-x86@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

This set covers regressions and two obvious bugfixes. The rest can wait=20
for 3.9.

The following changes since commit 4c9014f2ca7e5ecf8806e838be0f07aa1810c985:

  Merge tag 'nfs-for-3.8-2' of git://git.linux-nfs.org/projects/trondmy/lin=
ux-nfs (2013-01-07 08:36:45 -0800)

are available in the git repository at:


  git://cavan.codon.org.uk/platform-drivers-x86.git for_linus

for you to fetch changes up to 9f89748463f13c9657496b12820f09a988ce77ff:

  asus-laptop: Fix potential invalid pointer dereference (2013-01-07 12:33:=
48 -0500)

----------------------------------------------------------------
Ben Hutchings (1):
      asus-laptop: Do not call HWRS on init

Lee, Chun-Yi (3):
      MAINTAINERS: change the mail address of acer-wmi/msi-laptop maintainer
      acer-wmi: fix obj is NULL but dereferenced
      acer-wmi: change to emit touchpad on off key

Matthew Garrett (2):
      Update MAINTAINERS entry
      asus-laptop: Fix potential invalid pointer dereference

Mattia Dongili (1):
      sony-laptop: fix SNC buffer calls when SN06 returns Integers

Sergey Senozhatsky (1):
      acer-wmi: add Aspire 5741G touchpad toggle key

Seth Forshee (1):
      samsung-laptop: Add quirk for broken acpi_video backlight on N250P

 MAINTAINERS                           |  6 ++--
 drivers/platform/x86/acer-wmi.c       | 60 +++++++++++++++++++++----------=
----
 drivers/platform/x86/asus-laptop.c    | 19 +++--------
 drivers/platform/x86/samsung-laptop.c | 10 ++++++
 drivers/platform/x86/sony-laptop.c    | 15 +++++----
 5 files changed, 62 insertions(+), 48 deletions(-)

--=20
Matthew Garrett | mjg59@srcf.ucam.org

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlDrCSoACgkQ7Hkv8l1YiTsOiQCgr8wSgnlHklARB1NxcmZETLm9
AxIAmgLS7czm7fCgLaJXFcHnFKWEVCjS
=9LuN
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
