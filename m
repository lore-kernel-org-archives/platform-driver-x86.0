From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: Re: [PATCH] classmate-laptop: Add RFKILL support.
Date: Tue, 27 Apr 2010 13:32:48 -0300
Message-ID: <20100427163247.GD1493@holoscopio.com>
References: <1272384900-3982-1-git-send-email-cascardo@holoscopio.com>
 <20100427162227.GA5645@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade.minaslivre.org ([72.232.254.139]:35586 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756396Ab0D0Qc4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Apr 2010 12:32:56 -0400
Content-Disposition: inline
In-Reply-To: <20100427162227.GA5645@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, don@syst.com.br, johannes@sipsolutions.net, rpurdie@rpsys.net


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2010 at 05:22:27PM +0100, Matthew Garrett wrote:
> On Tue, Apr 27, 2010 at 01:15:00PM -0300, Thadeu Lima de Souza Cascardo w=
rote:
> > The RFKILL device shares the same ACPI device used for backlight. So, it
> > required a new struct sharing both a backlight_device and a rfkill
> > device.
>=20
> Is this purely a software-controlled toggle, or can the firmware change=
=20
> the state as well? If the latter, how is synchronisation between=20
> hardware and OS state handled?
>=20
> --=20
> Matthew Garrett | mjg59@srcf.ucam.org

It's purely a soft block device. I'll add that in the commit message
with any other changes suggested or requested.

I'd really like some feedback about the implementation. I've done tests
around here, but I may still have gotten something wrong. And I sure
hope I haven't messed with the backlight. But nothing points that I've
done so.

Anyway, I'd like some review.

Thanks,
Cascardo.

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJL1xGtAAoJEEWxSg7udFZI1z4P/252xoDdNkQlLysMUX+FTHxM
Xs041rpMSvVyUhdmZKiFSkrKJaMcNXpJt3385pRK+27U5xgnyuOp0V7AaM98Wx//
1Y6x64+wKBhHYUrfAKH0B9Y9uD5ApmMx64JtCwbOnOgJNGr74DVFMuCjpW85n4kx
otEO6Dam0/MNo4so0OxOYoyrB1WokiQ00mNTWLalaUkQnnkhOYZB3ukBysj/lrIK
VJk5edYo7+bwMjUi6Sj0TkfKHR5tHqjCrVRqS4ZZF6GxC/gAyjpymyQX/8EFHcpm
34axigcqSqOedoCRJjpsVSj1aqBg+Tkyhtt5LjOuCvrEP7C4DF1Qcjzzy2O+ISCU
7J3RwxxtErp1UEFN+hdb3CZ/vbTX+nSiAzNV7YXAAyFPKCoX3Gl083oL826UXC8y
9QYyjz0m1bYfR4LaqUj2SczzVf0aG/6Nx25T3x68E0aItlPcwGmvishLt90OQL51
WO6ZsqPFoKse5bF1gPZyz9V0pxaZSdWi0WbpE38K6CZnKEFkfrIVxLDTP+pQGRZ6
41hwZnCVZTRTFT9F8tnV/6KzpTrESMDR4KlYAj7LT7P0p1dOikV/l60vySaiR693
tP/7YqRaPMsCppbTegY7HubVGpFY2JOIP0FDH/naJBfX93F7D46VmcdJxPve2Wps
CoPiC2d5mvwjLC50K1d+
=Yhtu
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
