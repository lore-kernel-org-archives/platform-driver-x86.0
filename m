From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 2/4] dell-wmi: Sort WMI event codes and update comments
Date: Wed, 8 Jun 2016 22:27:20 +0200
Message-ID: <201606082227.20875@pali>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com> <201606082157.26447@pali> <20160608201518.GE28348@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart10400565.pu8CNTrW8E";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:38204 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161459AbcFHU1Z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2016 16:27:25 -0400
In-Reply-To: <20160608201518.GE28348@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart10400565.pu8CNTrW8E
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 08 June 2016 22:15:18 Darren Hart wrote:
> On Wed, Jun 08, 2016 at 09:57:26PM +0200, Pali Roh=C3=A1r wrote:
> > On Wednesday 08 June 2016 21:48:24 Darren Hart wrote:
> > > On Wed, Jun 08, 2016 at 12:03:24AM +0200, Pali Roh=C3=A1r wrote:
> > > > On Thursday 02 June 2016 12:41:42 Micha=C5=82 K=C4=99pie=C5=84 wrot=
e:
> > > > > > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > > >=20
> > > > > My guess is that Darren won't let you off without at least a
> > > > > short commit message.
> > > >=20
> > > > I have no idea what else to write. I think that description is
> > > > enough.
> > >=20
> > > There is always something. For example, why? See
> > > Documentation/SubmittingPatches section "14) The canonical patch
> > > format" for an explanation.
> > >=20
> > > "Traceability" of changes is important. If it's worth preparing
> > > the patch, it's worth documenting why.
> >=20
> > In my opinion current description is enough and cover everything
> > what this patch is doing. I think it is clear from my description
> > what this patch is doing and so it is documented.
> >=20
> > But if it is not clear and something is missing, let me know or
> > show what is wrong and how you change it... It is just my
> > assumption that "Sort WMI event codes and update comments" is
> > clear...
>=20
> The patch summary accurately states what it does. It does not explain
> why it does it, or why it is necessary. I understand this is a
> trivial change, but also understand that both maintainers and people
> doing maintenance and regression analysis will appreciate
> understanding the motivation and intent of the patch, in addition to
> the content of the patch.
>=20
> From the maintainer perspective, whether we have 20 or 200 patches to
> review, we will naturally merge the ones that require the least
> effort first. This maximizes our efficiency and benefits the most
> people with what time we have available. For many of us, this is our
> nights and weekends (guessing that's the case for you as well). It
> is in the submitter's best interest to take the time document the
> why, what, and how of each patch in a way that minimizes the effort
> on the part of the maintainer to decide if the patch should be
> merged. It is also a matter of scale, if every patch conforms to
> these guidelines, the workflow is much more efficient.
>=20
> In this case, I don't know why you decided to sort the event codes or
> update the comments. I assume the comments were wrong before, but
> maybe something changed. Do you care about alphabetically order or
> optimizing the switch statements? Is it purely for legibility? Etc.
>=20
> If that isn't sufficient, then just do it out of self-interest,
> because I will not send patches to Linus that do not provide both a
> summary and a description in the commit which meet the guidelines of
> section 14 referenced above.
>=20
> Thanks,

I fully understand your maintainer perspective. I just though that my=20
one line explain everything what is needed about my patch...

So do you want to include reason for my patch? What about this=20
additional description?

=3D=3D=3D
=46or better readability of keymap table, sort events by codes and also=20
update comments for events to be more informative.
=3D=3D=3D

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart10400565.pu8CNTrW8E
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAldYf6gACgkQi/DJPQPkQ1JjyQCgsmlp6l6LDq8hnqNZXU+W0MW9
+rUAn1N+D5vY9lY2u3aLjil8JMSSyaPd
=DQ9Y
-----END PGP SIGNATURE-----

--nextPart10400565.pu8CNTrW8E--
