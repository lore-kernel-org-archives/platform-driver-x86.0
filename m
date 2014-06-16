From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] Documentation: Rename hpfall.c => freefall.c, fixes for Dell
Date: Mon, 16 Jun 2014 13:55:03 +0200
Message-ID: <201406161355.03998@pali>
References: <1399114077-19314-3-git-send-email-pali.rohar@gmail.com> <1402473727-5464-1-git-send-email-pali.rohar@gmail.com> <20140614085328.GC15326@Nokia-N900>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1681691.FhSFYIcQoq";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140614085328.GC15326@Nokia-N900>
Sender: linux-doc-owner@vger.kernel.org
To: Matthew Garrett <matthew.garrett@nebula.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: Pavel Machek <pavel@ucw.cz>, Valdis Kletnieks <valdis.kletnieks@vt.edu>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sonal Santan <sonal.santan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

--nextPart1681691.FhSFYIcQoq
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 14 June 2014 10:53:29 Pavel Machek wrote:
> On Wed 2014-06-11 10:02:07, Pali Roh?r wrote:
> > Dell kernel driver dell-smo8800 provides same freefall
> > interface as hp_accel so program hpfall.c works also on
> > Dell laptops. So rename it to freefall.c.
> >=20
> > Dell driver does not provide hp::hddprotect led so make sure
> > that freefall.c works also if hp::hddprotect does not exist
> > in sysfs.
> >=20
> > Additionally write info to syslog.
> >=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > Cc: Sonal Santan <sonal.santan@gmail.com>
> > ---
> > Changes since v1:
> > * Fixed warnings: Missing a blank line after declarations
> > ---
> >=20
> >  Documentation/laptops/00-INDEX   |    4 +-
> >  Documentation/laptops/freefall.c |  177
> >  ++++++++++++++++++++++++++++++++++++++
> >  Documentation/laptops/hpfall.c   |  146
> >  ------------------------------- 3 files changed, 179
> >  insertions(+), 148 deletions(-) create mode 100644
> >  Documentation/laptops/freefall.c delete mode 100644
> >  Documentation/laptops/hpfall.c
>=20
> Acked-by: Pavel Machek <pavel@ucw.cz>
>=20
> 						Pavel

Randy, Matthew: PING

first patch which implementing dell-smo8800.ko was merged, but=20
this patch which updating documentation and fall daemon *not*.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1681691.FhSFYIcQoq
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlOe2xcACgkQi/DJPQPkQ1Jz1gCdHVPTCUXqxvWDuz6AEBAdHNLx
/E4AoKExeyy3RmxeC6SPh1xKaoj6wjiU
=+7xf
-----END PGP SIGNATURE-----

--nextPart1681691.FhSFYIcQoq--
