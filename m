From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
Date: Sun, 6 Aug 2017 17:42:56 +0200
Message-ID: <201708061742.57031@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com> <20170613184228.GC22450@fury> <20170614154654.GA22981@pali>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart9057429.hPkF6GXRi9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:37296 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751300AbdHFPnA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Aug 2017 11:43:00 -0400
In-Reply-To: <20170614154654.GA22981@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart9057429.hPkF6GXRi9
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wednesday 14 June 2017 17:46:54 Pali Roh=C3=A1r wrote:
> On Tuesday 13 June 2017 11:42:28 Darren Hart wrote:
> > On Tue, Jun 13, 2017 at 08:04:57PM +0200, Pali Roh=C3=A1r wrote:
> > > On Tuesday 13 June 2017 18:49:51 Darren Hart wrote:
> > > > I'd suggest reaching out to the maintainers and contributors to
> > > > the drivers you mention to request some help in testing.
> > >=20
> > > Seems sane. Grep for all methods with instance number different
> > > as zero (or just number one -- which can be suspicious as
> > > somebody could thought that indexing is from one, not zer) and
> > > try to receive ACPI/BMOF data and verify it.
> >=20
> > This would still be the ideal solution, verify we can do the right
> > thing without breaking existing drivers. Agreed.
>=20
> Here is all usage:
>=20
> Function wmi_set_block:
>=20
>   msi-wmi.c:
>   instance=3D0 /* Instance 0 is "set backlight" */
>=20
>   tc1100-wmi.c:
>   instance=3DTC1100_INSTANCE_WIRELESS /* defined as 1 */
>   instance=3DTC1100_INSTANCE_JOGDIAL  /* defined as 2 */
>=20
> Function wmi_query_block:
>=20
>   acer-wmi.c:
>   instance=3D1 /* no comment why,
> guid=3D95764E09-FB56-4E83-B31A-37761F60994A */
>=20
>   dell-wmi.c:
>   instance=3D0
>=20
>   msi-wmi.c:
>   instance=3D1 /* Instance 1 is "get backlight", cmp with DSDT */
>=20
>   surface3-wmi.c:
>   instance=3D0
>=20
>   tc1100-wmi.c:
>   (same as in wmi_set_block)
>=20
> Function wmi_evaluate_method:
>=20
>   acer-wmi.c:
>   instance=3D1 /* no comment why,
> guid=3D67C3371D-95A3-4C37-BB61-DD47B491DAAB */ instance=3D1 /* no
> comment why, guid=3D6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3 */ instance=3D0
>=20
>   alienware-wmi.c:
>   instance=3D1 /* no comment why,
> guid=3DA70591CE-A997-11DA-B012-B622A1EF5492 */ instance=3D1 /* no
> comment why, guid=3DA80593CE-A997-11DA-B012-B622A1EF5492 */ instance=3D1
> /* no comment why, guid=3DA70591CE-A997-11DA-B012-B622A1EF5492 */
>=20
>   asus-wmi.c:
>   instance=3D1 /* no comment why,
> guid=3D97845ED0-4E6D-11DE-8A39-0800200C9A66 */
>=20
>   dell-wmi-led.c:
>   instance=3D1 /* no comment why,
> guid=3DF6E4FE6E-909D-47cb-8BAB-C9F6F2F8D396 */
>=20
>   hp-wmi.c:
>   instance=3D0
>=20
>   mxm-wmi.c:
>   instance=3D1 /* no comment why,
> guid=3DF6CB5C3C-9CAE-4EBD-B577-931EA32A2CC0 */
>=20
> So problematic drivers which use instance=3D1 without any comments are:
>=20
>   acer-wmi
>   alienware-wmi
>   asus-wmi
>   dell-wmi-led
>   mxm-wmi

Also there is a new problematic driver named peaq-wmi.c added by Hans.=20
Adding into loop. Hans, can you recheck if arguments for=20
wmi_evaluate_method() are correct, specially instance number "1"?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart9057429.hPkF6GXRi9
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlmHOQEACgkQi/DJPQPkQ1ImXQCgjjEUSl8EzgRWvEEDpkCnmF+5
LnIAmQGKq0piUTKsLAU+MBman1wj7XgK
=NaoJ
-----END PGP SIGNATURE-----

--nextPart9057429.hPkF6GXRi9--
