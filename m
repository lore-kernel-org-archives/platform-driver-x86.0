From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 00/11] Intel SGX Driver
Date: Wed, 3 Jan 2018 10:48:39 +0100
Message-ID: <20180103094839.GA26610@amd>
References: <pavel@ucw.cz>
 <201801030059.w030xQGD011342@wind.enjellic.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201801030059.w030xQGD011342@wind.enjellic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: greg@enjellic.com
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grzegorz Andrejczuk <grzegorz.andrejczuk@intel.com>, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@kernel.org>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Jim Mattson <jmattson@google.com>, Kan Liang <Kan.liang@intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Kyle Huey <me@kylehuey.com>, Len Brown <len.brown@intel.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>, Mauro
List-Id: platform-driver-x86.vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Good evening Pavel et.al., I hope the New Year has started well for
> everyone.

:-). Stuff proceeds as usual. Too bad it is raining outside, instead
of snowing.

> > > > Would you list guarantees provided by SGX?
> > >
> > > Obviously, confidentiality and integrity.  SGX was designed to address
> > > an Iago threat model, a very difficult challenge to address in
> > > reality.
>=20
> > Do you have link on "Iago threat model"?
>=20
> https://cseweb.ucsd.edu/~hovav/dist/iago.pdf
>=20
> > > I don't have the citation immediately available, but a bit-flip attack
> > > has also been described on enclaves.  Due to the nature of the
> > > architecture, they tend to crash the enclave so they are more in the
> > > category of a denial-of-service attack, rather then a functional
> > > confidentiality or integrity compromise.
>=20
> > So ... even with SGX, host can generate bitflips in the enclave,
> > right?
>=20
> Correct.

=2E..

I'd say that you can't generate bitflips because if you do hardware
will kill the enclave. This seems to be significant difference from
AMD "secure" memory encryption...

> > People usually assume that bitflip will lead "only" to
> > denial-of-service, but rowhammer work shows that even "random" bit
> > flips easily lead to priviledge escalation on javascript virtual
> > machines, and in similar way you can get root if you have user and
> > bit flips happen.
> >
> > So... I believe we should assume compromise is possible, not just
> > denial-of-service.
>=20
> Prudence always dictates that one assumes the worst.  In this case
> however, the bitflip attacks against SGX enclaves are very definitely
> in the denial-of-service category.  The attack is designed to trigger
> a hardware self-protection feature on the processor.
>=20
> Each page of memory which is initialized into an enclave has a
> metadata block associated with it which contains the integrity state
> of that page of memory.  The MM{E,U} hardware on an SGX capable
> platform checks this integrity data on each page fetch request arising
> from addresses/pages inside of an enclave.
>=20
> Forcing a bitflip in enclave memory causes the next page fetch
> containing the bitflipped location to fail its integrity check.  Since
> this technically shouldn't be possible, this situation was classified
> as a hardware failure which is handled by the processor locking its
> execution state, thus taking the machine down.

So you can't really do bitflips on the SGX protected memory, because
MM{E,U} hardware will catch that and kill machine if you try?

So SGX protected memory is not swappable?

> It would seem to be a misfeature for the self-protection mechanism to
> not generate some type of trappable fault rather then generating a
> processor lockup but hindsight is always 20/20.  Philosophically this
> is a good example of security risk managment.  Locking a machine is
> obviously problematic in a cloud service environment, but it has to be
> taken in the perspective of whether or not it would be preferable to
> have a successful privilege escalation attack which could result in
> exfiltration of sensitive data.

Ok, right, it should fault. They can fix it in new version?

> > Well, yes :-). And I believe someone is going to have fun with SGX
> > ;-).
>=20
> Arguably not as much fun as what appears to be pending, given what
> appears to be the difficulty of some Intel processors to deal with
> page faults induced by speculative memory references... :-)

Do you have more info on that? Will they actually leak information, or
is it just good for rowhammering the kernel memory?


Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlpMpvcACgkQMOfwapXb+vKJFgCeOHE+GANAbpZtWBbzwCcANtOn
MTcAnR+xaqLcIQgze7OkG4B7qCpRBier
=iYQr
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
