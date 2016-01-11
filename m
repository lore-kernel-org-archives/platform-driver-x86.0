From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell Vostro V131
Date: Mon, 11 Jan 2016 21:07:43 +0100
Message-ID: <201601112107.43510@pali>
References: <20151130211542.GE30553@malice.jf.intel.com> <20151204132745.GA13441@eudyptula.hq.kempniu.pl> <20160111191226.GF10643@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3026720.kTKCy23bP1";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36360 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759905AbcAKUHq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 15:07:46 -0500
In-Reply-To: <20160111191226.GF10643@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

--nextPart3026720.kTKCy23bP1
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 11 January 2016 20:12:26 Darren Hart wrote:
> On Fri, Dec 04, 2015 at 02:27:45PM +0100, Micha=C5=82 K=C4=99pie=C5=84 wr=
ote:
> > > This patch is not enough for enabling 0xe025 key on that Vostro
> > > machine. Some extra SMBIOS call is needed, without them ACPI
> > > will not send WMI keypress event.
> >=20
> > Indeed.  But have you read the last e-mail I wrote before
> > submitting the original patch [1]?  Brightness control on the V131
> > is already broken "out of the box" with newer kernels (flickering
> > upon brightness change), but if we do what you're suggesting and
> > include the SMI call in the kernel, we'll break it even more, to
> > the point where pressing one of the brightness control keys might
> > not result in any brightness change at all.  Sure, we can fix that
> > by overriding an arbitrary ACPI method.  Oh, wait, did I say
> > "fix"?
> >=20
> > I posted the patch without the SMI call because that way if you
> > want to use the Dell Instant Launch hotkey, you just fire up a
> > userspace script (which uses libsmbios and takes care of
> > overriding the ACPI method) and chances are you will end up with a
> > fully functional system.  Of course you need to understand that
> > using this script is not an elegant solution and that it might
> > break something else, but it's your choice, not the kernel's.  And
> > the patch itself does not change kernel's default behavior, so
> > we're not risking breaking any other models out there.
> >=20
> > > At least I think this one patch should not be included into
> > > kernel until there will be full support for 0xe025 key (adding
> > > that SMBIOS call).
> >=20
> > Again, fully supporting the Dell Instant Launch hotkey makes
> > brightness control even more broken than it has to be.  In other
> > words, everything is terrible.
> >=20
> > The only real solution to all these issues is a BIOS fix and I'm
> > pretty sure it's not happening.
> >=20
> > [1] http://www.spinics.net/lists/platform-driver-x86/msg07679.html
>=20
> I have this patch as still pending review, and I *think* where we are
> is Pali had some objections but Michal felt they didn't help address
> the problem.
>=20
> Where are we?

Hi Darren! Hans fixed our big problem and with his patches (to acpi=20
video keypresses) we are able to finally fix support for that Vostro=20
machine. I had discussion with Micha=C5=82 and he will prepare new patch=20
series with other changes in smbios... So for now just wait when Micha=C5=
=82=20
is ready.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3026720.kTKCy23bP1
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaUC48ACgkQi/DJPQPkQ1IziQCgkVORN05KJifzP4ojF+PEz2KB
x7IAoLK7EYu3ZmnjndcR7b9oiBTuUsje
=Ti3l
-----END PGP SIGNATURE-----

--nextPart3026720.kTKCy23bP1--
