From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 3/3] dell-laptop: Use dell-rbtn instead i8042 filter when possible
Date: Sat, 6 Jun 2015 10:24:35 +0200
Message-ID: <201506061024.35859@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <20150603081509.GA14980@pali> <20150604051655.GC31158@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart7884745.WkMyIXHVRg";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150604051655.GC31158@fury.dvhart.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu, Darren Hart <dvhart@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

--nextPart7884745.WkMyIXHVRg
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 04 June 2015 07:16:55 Darren Hart wrote:
> On Wed, Jun 03, 2015 at 10:15:09AM +0200, Pali Roh=C3=A1r wrote:
> > On Tuesday 02 June 2015 20:55:05 Darren Hart wrote:
> > > On Wed, May 27, 2015 at 07:52:13PM -0700, Darren Hart wrote:
> > > > On Wed, May 27, 2015 at 11:28:25PM +0200, Pali Roh=C3=A1r wrote:
> > > > > Until now module dell-laptop registered rfkill device which
> > > > > used i8042 filter function for receiving HW switch rfkill
> > > > > events (handling special keycode).
> > > > >=20
> > > > > But for some dell laptops there is native ACPI driver
> > > > > dell-rbtn which can receive rfkill events (without i8042
> > > > > hooks).
> > > > >=20
> > > > > So this patch will combine best from both sides. It will use
> > > > > native ACPI driver dell-rbtn for receiving events and
> > > > > dell-laptop SMBIOS interface for enabling or disabling radio
> > > > > devices. If ACPI driver or device will not be available
> > > > > fallback to i8042 filter function will be used.
> > > > >=20
> > > > > Patch also changes module_init() to late_initcall() to ensure
> > > > > that init function will be called after initializing
> > > > > dell-rbtn.c driver.
> > > > >=20
> > > > > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > > > Tested-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> > > > > Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> > > >=20
> > > > Several basic checkpatch.pl errors in this one. Please always
> > > > run checkpatch.pl before submitting patches, these sorts of
> > > > issues should be caught before hitting the mailing list.
> > > >=20
> > > > Please provide some details on the scenarios you have tested to
> > > > verify you have addressed the build and runtime issues
> > > > reported.
> > >=20
> > > Checking in so this doesn't fall through the cracks. Do you have
> > > a v5 in the works for the 4.2 merge window?
> > >=20
> > > Thanks,
> >=20
> > In last days I did not have time to look at it... When do you need
> > to see v5 if it could go to 4.2?
>=20
> No rush in general, I just wanted to make sure you weren't waiting on
> me while I was waiting for you.
>=20
> We're at the mercy of Linus' decision regarding how many RCs before
> he releases 4.1. I suspect we have another week, but it could be
> this weekend.
>=20
> I like to have new functionality in linux-next for two weeks prior to
> sending a pull to Linus. To meet that, you should really have it in
> this weekend. If Linus releases 4.1 this weekend, that will just
> barely make two weeks before the end of the merge window.
>=20
> Thanks,

v5 with fixed checkpatch.pl problems was sent.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart7884745.WkMyIXHVRg
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlVyrkMACgkQi/DJPQPkQ1JfUACfcyunQMJWgOrpHE61UQ64vUiL
QLgAn2VrHW/OJumxo2SAeJhVzz6xNF9x
=pCG9
-----END PGP SIGNATURE-----

--nextPart7884745.WkMyIXHVRg--
