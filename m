From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/1] thinkpad_acpi: Add support for status (external
 cover) LED
Date: Fri, 12 May 2017 12:43:16 +0200
Message-ID: <20170512104315.GC6780@amd>
References: <20170119172132.36029-1-agoode@google.com>
 <20170507163812.GA14896@xo-6d-61-c0.localdomain>
 <20170507234903.GA15137@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45876 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751323AbdELKnT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 May 2017 06:43:19 -0400
Content-Disposition: inline
In-Reply-To: <20170507234903.GA15137@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Adam Goode <agoode@google.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org


--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-05-07 20:49:03, Henrique de Moraes Holschuh wrote:
> On Sun, 07 May 2017, Pavel Machek wrote:
> > On Thu 2017-01-19 12:21:32, Adam Goode wrote:
> > > This allows the control of the red status LED, which is the dot of th=
e "i"
> > > in the word "ThinkPad" on the outside cover of newer models.
> > >=20
> > > In the manual, both this LED and the power LED are referred to as
> > > the "system-status indicators" without distinction between the two, so
> > > I chose "status" as the LED name.
> >=20
> > Could we name it something like external_status or something? "status" =
is way too generic.
>=20
> "thinkdot" ;-)

Sounds good to me ;-).

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkVkcMACgkQMOfwapXb+vLC1gCfaaxDQ6FpNlMrOFBQISM9OQVS
F9QAn1N77wLq2Cu2ohy9kxOvdwXBergQ
=Nm+I
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--
