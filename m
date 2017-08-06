From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
Date: Sun, 6 Aug 2017 17:35:30 +0200
Message-ID: <201708061735.31002@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com> <1588258750.25982542.1499283035221.JavaMail.zimbra@redhat.com> <201707052224.20656@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4466104.iLDb3jxoXp";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f177.google.com ([209.85.128.177]:38015 "EHLO
        mail-wr0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751300AbdHFPfe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Aug 2017 11:35:34 -0400
In-Reply-To: <201707052224.20656@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: David Airlie <airlied@redhat.com>, Chun-Yi Lee <jlee@suse.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, Oleksij Rempel <linux@rempel-privat.de>, =?utf-8?q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart4466104.iLDb3jxoXp
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 05 July 2017 22:24:20 Pali Roh=C3=A1r wrote:
> On Wednesday 05 July 2017 21:30:35 David Airlie wrote:
> > ----- Original Message -----
> >=20
> > > From: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> > > To: "Chun-Yi Lee" <jlee@suse.com>, "Corentin Chary"
> > > <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net,
> > > "Dave Airlie" <airlied@redhat.com>, "Oleksij Rempel"
> > > <linux@rempel-privat.de>, "Jo=C3=A3o Paulo Rechi Vita"
> > > <jprvita@gmail.com>
> > > Cc: "Darren Hart" <dvhart@infradead.org>, "Andy Shevchenko"
> > > <andy@infradead.org>, "Andy Lutomirski" <luto@kernel.org>,
> > > platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
> > > Sent: Wednesday, 5 July, 2017 7:51:13 PM
> > > Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method
> > > instance number
> > >=20
> > > On Saturday 17 June 2017 18:47:54 Pali Roh=C3=A1r wrote:
> > > > > So problematic drivers which use instance=3D1 without any
> > > > > comments
> > > > >=20
> > > > > are:
> > > > >   acer-wmi
> > > > >   asus-wmi
> > > > >   mxm-wmi
> > > >=20
> > > > Adding authors & maintainers of those drivers in loop.
> > >=20
> > > Hi!
> > >=20
> > > Dell drivers and acer-wmi are fixed now. So only asus-wmi and
> > > mxm-wmi needs to be investigated.
> > >=20
> > > Adding more people who developed those drivers recently in loop.
> > > Can you check if instance number is used correctly or not?
> >=20
> > I've no memory of why I picked 1 or 0, I probably cut-n-paste it
> > from somewhere else.
> >=20
> > Dave.
>=20
> And do you have at least ACPI DSDT dumps from that machine? Or are
> you able to find some?

Hi! For mxm-wmi I found this document:
https://lekensteyn.nl/files/docs/mxm-2.1-software-spec.pdf

On page numbered 26 (resp. in PDF page 31) is information about WMI
GUID {F6CB5C3C-9CAE-4EBD-B577-931EA32A2CC0} interface and there is
written that instance count =3D 1.

// Methods GUID {F6CB5C3C-9CAE-4ebd-B577-931EA32A2CC0}
0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xbd, 0x4e, 0xB5, 0x77, 0x93,
0x1E, 0xA3, 0x2A, 0x2C, 0xC0,
0x4D, 0x58,    // Object ID =E2=80=9CMX=E2=80=9D =3D method =E2=80=9CWMMX=
=E2=80=9D
1,             // Instance Count
0x02,          // Flags (WMIACPI_REGFLAG_METHOD)

And ACPI method for handling this WMI call does not check Arg0 and Arg1
at all.

So... Andy, Darren, any objections for following patch which changes
instance number from one to zero?

diff --git a/drivers/platform/x86/mxm-wmi.c b/drivers/platform/x86/mxm-wmi.c
index f4bad83..35d8b9a 100644
=2D-- a/drivers/platform/x86/mxm-wmi.c
+++ b/drivers/platform/x86/mxm-wmi.c
@@ -53,7 +53,7 @@ int mxm_wmi_call_mxds(int adapter)
=20
 	printk("calling mux switch %d\n", adapter);
=20
=2D	status =3D wmi_evaluate_method(MXM_WMMX_GUID, 0x1, adapter, &input,
+	status =3D wmi_evaluate_method(MXM_WMMX_GUID, 0x0, adapter, &input,
 				     &output);
=20
 	if (ACPI_FAILURE(status))
@@ -78,7 +78,7 @@ int mxm_wmi_call_mxmx(int adapter)
=20
 	printk("calling mux switch %d\n", adapter);
=20
=2D	status =3D wmi_evaluate_method(MXM_WMMX_GUID, 0x1, adapter, &input,
+	status =3D wmi_evaluate_method(MXM_WMMX_GUID, 0x0, adapter, &input,
 				     &output);
=20
 	if (ACPI_FAILURE(status))

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart4466104.iLDb3jxoXp
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlmHN0IACgkQi/DJPQPkQ1J5IgCgy00kavXVFYE7GhDeNkfQuqp8
YC0AoJc/qExBbmctBbHvmz4HjpTDObGJ
=xZ4C
-----END PGP SIGNATURE-----

--nextPart4466104.iLDb3jxoXp--
