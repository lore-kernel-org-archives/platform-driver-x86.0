From: Ben Hutchings <ben@decadent.org.uk>
Subject: hp-wmi: wifi rfkill can't be reversed
Date: Tue, 26 Aug 2014 00:50:42 -0700
Message-ID: <1409039442.3033.65.camel@deadeye.wl.decadent.org.uk>
References: <53ED47BA.60904@tnnn.pl>
	 <1408389040.2618.31.camel@deadeye.wl.decadent.org.uk>
	 <53F27EFC.3030409@tnnn.pl>
	 <1408916663.12973.88.camel@deadeye.wl.decadent.org.uk>
	 <1409018140.5921.3.camel@debian1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ZGgGCnHVRc5kTPgco1IC"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59212 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933952AbaHZHu4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 26 Aug 2014 03:50:56 -0400
In-Reply-To: <1409018140.5921.3.camel@debian1>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Tomasz Nitecki <tnnn@tnnn.pl>, 756947@bugs.debian.org, Alan Wilson <al_wilson@ns.sympatico.ca>


--=-ZGgGCnHVRc5kTPgco1IC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alan Wilson (in cc) reported that rfkill doesn't work correctly on the
HP Compaq nc6230.

- Without the hp-wmi driver loaded, the hard rfkill switch controls both
wifi and BT while soft rfkill only works for wifi.

- With the hp-wmi driver loaded, soft and hard rfkill switches can be
used to turn wifi and BT off and to turn BT back on, but wifi cannot be
turned back on without using the BIOS setup program.

(The full bug report is logged at <https://bugs.debian.org/756947>.)

This was reported against Linux 3.2, but I don't think there have been
relevant fixes since then.

Perhaps the hp-wmi driver should blacklist this model for wifi rfkill
(while leaving all the others features enabled).  Does that seem like a
reasonable approach to fix this?

Ben.

--=20
Ben Hutchings
No political challenge can be met by shopping. - George Monbiot

--=-ZGgGCnHVRc5kTPgco1IC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAU/w8V+e/yOyVhhEJAQoicg//SYbNJMhDc/SmyGd7dtidlnZDGZVWKsJa
nasAbT3HxsF34v6tGEHOk8bsDDVQ6tRzDymVcpf22wm5ZJhStyaBMoh3wc+HzSch
PVfOCxu4fm/6MaKaMwTGW028IIbtDPfyo5Leyc2RiVIVeOgx9TzxYddpNI0KK1Bi
MBOVinARKbveYJUTBfpM92UqUaoMYs5B2nqu+8VHxlYVRbT4UeBN9jT4Uvi+i4b1
SeOEMjaJZVbHHxRH84E1s196VAZ3X5xsn/57bJLhDZKzBDuJHjpak6Th/J9TeXYb
P9IVnPc7pDKy7Q3OYDuRpWMHxv3p1K5zyDjUdgyss1Z9HRm7qFOV9YirnbSXIK8D
KnouyoKDUYwSZc1Bl6RO28PUQhzLUZCDfmko8QJ/DNk9Ytxh0olEBBkoHfQY6q4Q
4GDM6MQ/u7nIMWOZkTpptmpbFQ1hm3BN6f85FNw2+1GUx4L+1WZrIk7TMwAHNxku
zg1DU6xejdLHiQWjo19t2wtECa9l8pvZaCQ8lZQyKkVRSNuzsbpp8YJJrOFoBEYi
Z5De/kwT/VJfQq73c6wTOts4QXqz8M3pElQIgpN5Zny4AcFV2nIAT+2xL+vnbLPY
2PYbhWM793EIqagSfxS5wiY3jtF9vf4a7+SUXy2I0TQc7DljwwaxT04nt7PGldQn
Ci+uvPIuO5Y=
=mu4w
-----END PGP SIGNATURE-----

--=-ZGgGCnHVRc5kTPgco1IC--
