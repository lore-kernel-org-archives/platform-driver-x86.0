From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: Re: [PATCH] classmate-laptop: Add RFKILL support.
Date: Wed, 9 Jun 2010 15:58:03 -0300
Message-ID: <20100609185803.GB2551@barata.holoscopio.com>
References: <1272384900-3982-1-git-send-email-cascardo@holoscopio.com>
 <4C0F6CDF.9060608@tuffmail.co.uk>
 <20100609181958.GA2551@barata.holoscopio.com>
 <1276108379.14580.23.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade2.minaslivre.org ([74.50.53.203]:51087 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932332Ab0FIS6J (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jun 2010 14:58:09 -0400
Content-Disposition: inline
In-Reply-To: <1276108379.14580.23.camel@jlt3.sipsolutions.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Alan Jenkins <alan-jenkins@tuffmail.co.uk>, platform-driver-x86@vger.kernel.org, mjg@redhat.com, don@syst.com.br, rpurdie@rpsys.net


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2010 at 08:32:59PM +0200, Johannes Berg wrote:
> On Wed, 2010-06-09 at 15:19 -0300, Thadeu Lima de Souza Cascardo wrote:
>=20
> > > >+	ipml->rf =3D rfkill_alloc("cmpc_rfkill", &acpi->dev, RFKILL_TYPE_W=
LAN,
> > > >+				&cmpc_rfkill_ops, acpi->handle);
> > > >+	/* rfkill_alloc may fail if RFKILL is disabled. We should still wo=
rk
> > > >+	 * anyway. */
> > > >+	if (!IS_ERR(ipml->rf)) {
> > > >+		retval =3D rfkill_register(ipml->rf);
> > > >+		if (retval) {
> > > >+			rfkill_destroy(ipml->rf);
> > > >+			ipml->rf =3D NULL;
> > > >+		}
> > > >+	} else {
> > > >+		ipml->rf =3D NULL;
> > > >+	}
> > >=20
> > > I think the comment is wrong, and so is the code it references.
> > >=20
> > > rfkill_alloc() is documented as returning NULL on failure, not an
> > ERR_PTR.  So you're going to pass NULL into rfkill_register() on
> > allocation failure, which will BUG out.
> > >=20
> >=20
> > Gee! At the time, I only read the RFKILL=3Dn implementation in the
> > header.
> > It returns ERR_PTR(-ENODEV), while the RFKILL=3Dy implementation does
> > indeed return NULL. This is inconsistent interface, and we'd better
> > fix it, in my opinion. But for the time, we must fix the users here.
>=20
> No, it's perfectly consistent. RFKILL=3Dn returns non-NULL on success,
> just as RFKILL=3Dy/m. It's just defined to be always successful for
> RFKILL=3Dn, with the special case that it's returning an ERR_PTR for its
> own checking in rfkill_register.
>=20
> All the drivers should do is test for NULL, and if non-NULL proceed as
> normal.
>=20
> > I see why eeepc_laptop would still work right now. But I think it's
> > risky for the casual driver writer to trust the rfkill device is there
> > while it isn't. If this is by design, to bite those driver writers
> > that
> > do "stupid" things (like not using the right interface) and that they
> > should still manipulate hardware as if the rfkill device was there,
> > that's OK. But is this really by design or should we fix it? For
> > example, eeepc_laptop does all the wlan pci device hotplug stuff and
> > also write some ACPI values. And it will do that if RFKILL is disabled
> > but will not do it if RFKILL is enabled but device allocation fails.
> > So,
> > should we document that ERR_PTR(-ENODEV) is not a failure, but a
> > "dummy"?
>=20
> That's the intended outcome, yes, so that drivers need NOT worry about
> whether RFKILL is built into the system or not at all.
>=20
> johannes
>=20

Thanks, Johannes.

I think this is a fix for 2.6.35, then. Otherwise, we get a BUG_ON in
case rfkill_alloc fails. If there was not a BUG_ON at rfkill_register,
there would be a NULL pointer dereference.

I will check the driver for the RFKILL=3Dn case. If it's sane, I'll just
change the check for the NULL check.

Best regards,
Cascardo.

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJMD+Q6AAoJEEWxSg7udFZIR/IP/iqnRoDs9UTnOFwaIlokpQad
PMU4aBJ4K/IUQz7BTxaLyVp+G8XYag6ijta1V6u6OgrM8UNIzC3u1kLFPjBO2Txs
W/PTXsPs6KW63RaDEQSm9Ld8oKnZUWnTQ3O6+G98iNnsNl59NfT3t2qzoFmrjkD2
/mKUMSBH0X+bH6Rl3mrdLVGTMSiEUKqYJ7bwvZ3oeGJDRLo2jkYSW3IvXJSABuEf
QL1bxvikSHjlYL1yzNovZzXZS+Ia+SltgucIQFVpJYT7m87WglPHoSERvlSJinlP
dskNmDmPa+1B0nPeC7+EL4Brus4BlSbQ37zvURhfAE2lKqjrVeHs+MEEM/PYn6qW
5LlGoLPu2C2ItoaSrYrHcaHymqx5RmAwJsVRgRFDgFtca5cZYzXL/yi5v+mx6xiD
M7NYoi8sEZM7+anGYCcnmV73MZ028Gn+j0FS+IBiloca20vnHcN4WW5PFevQ/XDu
gkIKVt9ahIdP25DdtwbrHwkkLuyq3xZOI9MC7NeBdyVnvmTgVgH4bgLC2KfGBdJ1
FYAyzSHHvIkJQefs7BsqgT3Wj5eXI/PhtXO1cTjTkfGVu6f6kn6/ziZyzogfzauq
Oy3Srij5XyfU0ry6sb52TTwb0HQ9JOaJ/lhzUrrjE8oX7soqvZSTqS8D/PtnT7fB
fheYwgpUfR7Qtv8qFk4y
=yLB/
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
