From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code handling
Date: Tue, 21 Jun 2016 20:29:27 +0200
Message-ID: <201606212029.28029@pali>
References: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com> <20160621180617.GD3685@f23x64.localdomain> <e3fabd2ab50d46389400cfb8900bad4d@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1830051.xN5hMYO3Um";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34425 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751870AbcFUS3c (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Jun 2016 14:29:32 -0400
In-Reply-To: <e3fabd2ab50d46389400cfb8900bad4d@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario_Limonciello@dell.com
Cc: dvhart@infradead.org, gabriele.mzt@gmail.com, luto@kernel.org, alex.hung@canonical.com, mjg59@srcf.ucam.org, kernel@kempniu.pl, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart1830051.xN5hMYO3Um
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 21 June 2016 20:16:09 Mario_Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Tuesday, June 21, 2016 1:06 PM
> > To: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>; Andy Lutomirski
> > <luto@kernel.org>; Alex Hung <alex.hung@canonical.com>; Matthew
> > Garrett <mjg59@srcf.ucam.org>; Micha=C5=82 K=C4=99pie=C5=84 <kernel@kem=
pniu.pl>;
> > Limonciello, Mario <Mario_Limonciello@Dell.com>; platform-driver-
> > x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code
> > handling
> >=20
> > On Thu, Jun 16, 2016 at 09:33:02AM +0200, Pali Roh=C3=A1r wrote:
> > > On Wednesday 15 June 2016 20:19:58 Darren Hart wrote:
> > > > On Wed, Jun 15, 2016 at 09:49:09PM +0200, Pali Roh=C3=A1r wrote:
> > > > > First patch describe problem about 0xe045 code. Second and
> > > > > third are
> >=20
> > just
> >=20
> > > > > cosmetic and last rework code which processing WMI events. It
> > > > > should
> >=20
> > be
> >=20
> > > > > properly tested on more Dell machines, to check that
> > > > > everything is still working correctly.
> > > >=20
> > > > Is this "should be properly tested on more Dell machines" still
> > > > the case?
> >=20
> > Are
> >=20
> > > > you ready for this to go into linux-next?
> > >=20
> > > Series should be OK, but I would like to see if someone else test
> > > this series... Gabriele, Alex or Andy? Do you have time?
> >=20
> > Tested on a Dell XPS 13 2016 (9350). All hotkeys appear to work
> > without warning
> > messages. I didn't get anything out of Fn-F8 which has a picture of
> > a laptop and
> > white screen behind it. Not sure what that is supposed to do - if
> > it was meant to blank the screen, it did not, perhaps it is meant
> > to toggle screen outputs... will test that when I have access to
> > an external display.
>=20
> That key is meant to toggle screen outputs.  I believe it's still
> done by the EC emitting <super> + p.  If your WM doesn't recognize
> that, it won't do much, but you can see in xev the key combinations.

I still do not understand this stupidity, pressing *one* key cause=20
emitting two keys to OS and then OS needs to handle combinations of keys=20
and acts on it correctly.... (like windows manager)

Is there some way to disable this insane nonsense activity of BIOS,=20
firmware or whatever it is doing in HW to send *one* key scancode when=20
pressing *one* key?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1830051.xN5hMYO3Um
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldph4gACgkQi/DJPQPkQ1J8rwCfS+dxlOuMti5YTrwP40UNQCWw
/jwAoIRUJ5MQVs0GYVkqwQ2swwHuWdDq
=xSwg
-----END PGP SIGNATURE-----

--nextPart1830051.xN5hMYO3Um--
