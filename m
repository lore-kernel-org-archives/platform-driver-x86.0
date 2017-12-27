From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Wed, 27 Dec 2017 21:46:45 +0100
Message-ID: <20171227204645.GA14201@amd>
References: <pavel@ucw.cz>
 <201712271030.vBRAUo3o027896@wind.enjellic.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:44624 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751184AbdL0Uqr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Dec 2017 15:46:47 -0500
Content-Disposition: inline
In-Reply-To: <201712271030.vBRAUo3o027896@wind.enjellic.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@enjellic.com
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Would you list guarantees provided by SGX?
>=20
> Obviously, confidentiality and integrity.  SGX was designed to address
> an Iago threat model, a very difficult challenge to address in
> reality.

Do you have link on "Iago threat model"?

> I don't have the citation immediately available, but a bit-flip attack
> has also been described on enclaves.  Due to the nature of the
> architecture, they tend to crash the enclave so they are more in the
> category of a denial-of-service attack, rather then a functional
> confidentiality or integrity compromise.

So ... even with SGX, host can generate bitflips in the enclave,
right?

People usually assume that bitflip will lead "only" to
denial-of-service, but rowhammer work shows that even "random" bit
flips easily lead to priviledge escalation on javascript virtual
machines, and in similar way you can get root if you have user and bit
flips happen.

So... I believe we should assume compromise is possible, not just
denial-of-service.

> Unfortunately, in the security field it is way more fun, and seemingly
> advantageous from a reputational perspective, to break things then to
> build solutions.... :-)(

Well, yes :-). And I believe someone is going to have fun with SGX
;-).
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlpEBrUACgkQMOfwapXb+vKWuwCeK8FrKdegbRzvIf2uYxC8tdjR
PIQAn2z7LfNc/E6aU5QJCt5qUruSYG0R
=5BJd
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
