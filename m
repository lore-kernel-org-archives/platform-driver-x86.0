From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: Re: [PATCH] classmate-laptop: should check for NULL as retval for
 rfkill_alloc
Date: Wed, 9 Jun 2010 16:49:32 -0300
Message-ID: <20100609194931.GC2551@barata.holoscopio.com>
References: <20100609185803.GB2551@barata.holoscopio.com>
 <1276112368-3057-1-git-send-email-cascardo@holoscopio.com>
 <1276112777.14580.24.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z4+8/lEcDcG5Ke9S"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade2.minaslivre.org ([74.50.53.203]:37870 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752496Ab0FITth (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jun 2010 15:49:37 -0400
Content-Disposition: inline
In-Reply-To: <1276112777.14580.24.camel@jlt3.sipsolutions.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: alan-jenkins@tuffmail.co.uk, platform-driver-x86@vger.kernel.org, mjg@redhat.com, don@syst.com.br, rpurdie@rpsys.net


--z4+8/lEcDcG5Ke9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2010 at 09:46:17PM +0200, Johannes Berg wrote:
> On Wed, 2010-06-09 at 16:39 -0300, Thadeu Lima de Souza Cascardo wrote:
>=20
> > +	/*
> > +	 * If RFKILL is disabled, rfkill_alloc will return ERR_PTR(-ENODEV).
> > +	 * This is OK, however, since all other uses of the device will not
> > +	 * derefence it.
> > +	 */
> > +	if (!ipml->rf) {
>=20
> the ! shouldn't be there
>=20
> johannes
>=20

Sorry for that. The else case is unneeded too. Removed in the next
patch.

--z4+8/lEcDcG5Ke9S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJMD/BLAAoJEEWxSg7udFZI52UP+wbJRvO7xy3+MskYoZrmuSPv
pUI9uBSIqfVTtA5N5HqhHlxu2rjyPJiMK1HTlv6F8D7oISD8pEaA8zDU90z4quRp
6TlXAk0GKkGUTHJzqAqbot0SjhxhhXXp3Y7Z1pCfMTmAmqd6lMkZYt7wpurBNZ1u
Vejobm96pDSdEoL+1L540a1fMdrCbFvtbhcNdK8CLeA3NSFR9X59OgalK8Tkt81C
R5oaM951uj/0GmEZ2p9yMRXvKAoni4YBuRVqHujeBAdGMzAU2rCUtQ4+ZSndom00
ci/099uAbHNzgrfqCtUbhSKISMPiljckZrve+2BoovvB15NF8wJ/5d0Pcw7ECtKd
fwM720oMVZ7mB6xmHP3dVg2CiVA64/y73Te6OcLsXu3UouSVqW3bWJ4pY4GEY+tr
h0pWgE5DySmUxA6SIchm6SiISAOvdyHFdad5orWwHyJ0O2hOGozj9IqZGbe2hgzT
P/DWPUOoFNXfvF5VP9Ob4fm8k6YqPCSm8q8Wj9KkgaQFnydRJq2bRiw8kMABbcPm
KQjM4QBt19RoCUIR29Hs4pmAEl1Y5j3JQAS/16mjorcA9bSMo6MdrWgUthEiHQxI
pXYl3nlV9/wBzFVuCvlblwc/IHXJWibRJuGBdqOUqC7w0tmoE1EnKWQ/cgRHXIQJ
IiSDs0KXpr+1CHyOGJsx
=O3t1
-----END PGP SIGNATURE-----

--z4+8/lEcDcG5Ke9S--
