From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [patch 1/2] thinkpad_acpi: signedness bugs getting current_mode
Date: Sun, 15 Mar 2015 13:46:12 +1100
Message-ID: <20150315134612.46ca70c5@canb.auug.org.au>
References: <20150311093450.GA3564@mwanda>
	<20150314210612.GA26465@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZpG3Ipt23mE6Rg_we2ojZJ_"; protocol="application/pgp-signature"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20150314210612.GA26465@fury.dvhart.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Bastien Nocera <hadess@hadess.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: platform-driver-x86.vger.kernel.org

--Sig_/ZpG3Ipt23mE6Rg_we2ojZJ_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Darren,

On Sat, 14 Mar 2015 14:06:12 -0700 Darren Hart <dvhart@infradead.org> wrote:
>
> On Wed, Mar 11, 2015 at 12:34:50PM +0300, Dan Carpenter wrote:
> > This needs to be signed for the error handling to work.  Valid modes are
> > small positive integers.
> >=20
> > Fixes: b790ceeb0fd9 ('thinkpad_acpi: Add adaptive_kbd_mode sysfs attr')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >=20
>=20
> Question for HPA, Rafael, and Stephen,
>=20
> I recall discussion at Kernel Summit 2014 about not rebasing or merging p=
atches
> when sending to Linus, that he'd prefer to see the history. I recall Step=
hen
> mentioning something similar for linux-next.
>=20
> That said, I've seen varying behavior among maintainers with respect to f=
ixes
> like this one from Dan. This patch fixes a patch that currently only exis=
ts in
> my for-next and Stephen's linux-next trees.
>=20
> What is the preference. Do I just queue it up to for-next as is (this is =
what
> I've done for now), or do I roll it into the referred patch causing the e=
rror
> and credit Dan with the fixup?

The only answer, is "it depends" :-)  If it will cause problems for
people doing bisects, or if it is just the last one of two commits on
the top of your tree, it seems like it is OK to just squash the fix
into the original patch (with attribution as you say).  Otherwise, I
would prefer that trees just progress with no rebasing.

> Left to my own devices I would prefer not to introduce bugs into the
> kernel history if I can help it. That said, I don't want to make
> extra work for Stephen or Linus.

It is very unusual for a small rebase to cause me any more work (unless
the files involved and modified by other trees).  And for Linus, well
all he sees is the tree that you submit to him.

The people you will inconvenience more by rebasing are the developers
who write patches that are based on your tree.  If you rebase under
them, they may have to rebase and fix up the patches they have already
tested and had reviewed before they can then submit them to you
(hopefully before you rebase again).

Dave Miller seems to get on quite well in the networking tree with no
rebasing at all ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/ZpG3Ipt23mE6Rg_we2ojZJ_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVBPJ5AAoJEMDTa8Ir7ZwVkcsP/R7DftSLm9Wi6IdPy6kCISSt
KfO4aN/CNjb8R5KAAxSU3USs4qBZqVkkFKMkZ2Xz67LTXPHbThLN9xlQMFDD4qXK
gIoC9HSH8i8BYOj52qNDn7K3HaF7Jtxc7hxu1R2JBnQY4Emm8v1Ym7M1Gvq4DIds
wTZhsBeG0fIwFzJge4D/208TR0E/kZuMpPzsSZiCZQ2uHlFLZw5mqPOPUljtPpTq
QkPGJojX2+CSBDZhriauCght6TFNzWZmiDrKhRhKFeUPS8pFaEbNhym0dU6P8Fbv
Yh6GyocWejbqxv7SM0NAsnYLqkqRM0pDMhVFx/YRQ6FTsIPMliyaqeUfLzXR+r3B
jzNopR6XHLvlbDj075RtOBKzIpZiyVVmfmKpYwXuY9fuiQwQ6KlofIc6VWCFEhy0
n8+y0exK1ffjXjG49QSwrjPonp0yEKYFh8X2shwxURVQxKaVYbA87h6f2Sw9JFvw
sisJHSUtyyUyQ+0bUe5JTGgtKY4+taYPzC6KENYuUcVHkOmH5dZ24IZBvALt2KSI
0KeDt4fHXOxsLuszasqOIjEng9iNTgX2us/uWBG3Y4znbI6NnduGQmoNyBzV4zfs
euC9gPgKFW+Co+h/C8D5MLYRa2Hnuj3fxvALSzSpPL+WwIhZDmn7cDxDq30nqm2G
1lrddjCXsCmFZlXDxz9k
=P/wS
-----END PGP SIGNATURE-----

--Sig_/ZpG3Ipt23mE6Rg_we2ojZJ_--
