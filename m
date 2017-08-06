From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] RFC: platform/x86: wmi: Fix check for method instance number
Date: Sun, 6 Aug 2017 22:16:41 +0200
Message-ID: <201708062216.41755@pali>
References: <1495886134-8276-1-git-send-email-pali.rohar@gmail.com> <201708061742.57031@pali> <7d7a104b-1555-8a7c-352b-cd5e4b4ac153@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8844622.rDM2mCEezU";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f182.google.com ([209.85.128.182]:35867 "EHLO
        mail-wr0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751351AbdHFUQp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Aug 2017 16:16:45 -0400
In-Reply-To: <7d7a104b-1555-8a7c-352b-cd5e4b4ac153@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

--nextPart8844622.rDM2mCEezU
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 06 August 2017 18:18:06 Hans de Goede wrote:
> Hi,
>=20
> On 06-08-17 17:42, Pali Roh=C3=A1r wrote:
> > On Wednesday 14 June 2017 17:46:54 Pali Roh=C3=A1r wrote:
> >> On Tuesday 13 June 2017 11:42:28 Darren Hart wrote:
> >>> On Tue, Jun 13, 2017 at 08:04:57PM +0200, Pali Roh=C3=A1r wrote:
> >>>> On Tuesday 13 June 2017 18:49:51 Darren Hart wrote:
> >>>>> I'd suggest reaching out to the maintainers and contributors to
> >>>>> the drivers you mention to request some help in testing.
> >>>>=20
> >>>> Seems sane. Grep for all methods with instance number different
> >>>> as zero (or just number one -- which can be suspicious as
> >>>> somebody could thought that indexing is from one, not zer) and
> >>>> try to receive ACPI/BMOF data and verify it.
> >>>=20
> >>> This would still be the ideal solution, verify we can do the
> >>> right thing without breaking existing drivers. Agreed.
> >>=20
> >> Here is all usage:
> >>=20
> >> Function wmi_set_block:
> >>    msi-wmi.c:
> >>    instance=3D0 /* Instance 0 is "set backlight" */
> >>   =20
> >>    tc1100-wmi.c:
> >>    instance=3DTC1100_INSTANCE_WIRELESS /* defined as 1 */
> >>    instance=3DTC1100_INSTANCE_JOGDIAL  /* defined as 2 */
> >>=20
> >> Function wmi_query_block:
> >>    acer-wmi.c:
> >>    instance=3D1 /* no comment why,
> >>=20
> >> guid=3D95764E09-FB56-4E83-B31A-37761F60994A */
> >>=20
> >>    dell-wmi.c:
> >>    instance=3D0
> >>   =20
> >>    msi-wmi.c:
> >>    instance=3D1 /* Instance 1 is "get backlight", cmp with DSDT */
> >>   =20
> >>    surface3-wmi.c:
> >>    instance=3D0
> >>   =20
> >>    tc1100-wmi.c:
> >>    (same as in wmi_set_block)
> >>=20
> >> Function wmi_evaluate_method:
> >>    acer-wmi.c:
> >>    instance=3D1 /* no comment why,
> >>=20
> >> guid=3D67C3371D-95A3-4C37-BB61-DD47B491DAAB */ instance=3D1 /* no
> >> comment why, guid=3D6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3 */
> >> instance=3D0
> >>=20
> >>    alienware-wmi.c:
> >>    instance=3D1 /* no comment why,
> >>=20
> >> guid=3DA70591CE-A997-11DA-B012-B622A1EF5492 */ instance=3D1 /* no
> >> comment why, guid=3DA80593CE-A997-11DA-B012-B622A1EF5492 */
> >> instance=3D1 /* no comment why,
> >> guid=3DA70591CE-A997-11DA-B012-B622A1EF5492 */
> >>=20
> >>    asus-wmi.c:
> >>    instance=3D1 /* no comment why,
> >>=20
> >> guid=3D97845ED0-4E6D-11DE-8A39-0800200C9A66 */
> >>=20
> >>    dell-wmi-led.c:
> >>    instance=3D1 /* no comment why,
> >>=20
> >> guid=3DF6E4FE6E-909D-47cb-8BAB-C9F6F2F8D396 */
> >>=20
> >>    hp-wmi.c:
> >>    instance=3D0
> >>   =20
> >>    mxm-wmi.c:
> >>    instance=3D1 /* no comment why,
> >>=20
> >> guid=3DF6CB5C3C-9CAE-4EBD-B577-931EA32A2CC0 */
> >>=20
> >> So problematic drivers which use instance=3D1 without any comments
> >> are:
> >>    acer-wmi
> >>    alienware-wmi
> >>    asus-wmi
> >>    dell-wmi-led
> >>    mxm-wmi
> >=20
> > Also there is a new problematic driver named peaq-wmi.c added by
> > Hans. Adding into loop. Hans, can you recheck if arguments for
> > wmi_evaluate_method() are correct, specially instance number "1"?
>=20
> Ok, so looking at wmi_evaluate_method() the instance number becomes
> arg0 and the DSDT implementation of the WMBC method which is the one
> we care about is:
>=20
>              Method (WMBC, 3, NotSerialized)
>              {
>                  If (Arg1 =3D=3D 0x05)
>                  {
>                      Local0 =3D ^^GPO0.DBLY /* \_SB_.GPO0.DBLY */
>                      ^^GPO0.DBLY =3D Zero
>                      Return (Local0)
>                  }
>=20
>                  Return (0xFFFFFFFF)
>              }
>=20
> So the instance_index / Arg0 does not matter. I just tested passing 0
> and that works fine. Feel free to change this if that helps with the
> wmi refactoring.

Ok, thanks for testing.

> Interestingly enough passing wmi.debug_dump_wdg=3D1 shows that the
> BC object claims to have 10 instances, but the whole peaq-wmi
> interface appears to be a messy quick hack from the manufacturer,
> so that is not surprising.

Apparently, this is fully correct and should not cause any problems.=20
Just all instances would do same thing.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart8844622.rDM2mCEezU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlmHeSkACgkQi/DJPQPkQ1JL3QCgorWPeMb7T5ytoacfg1KXjQoG
FewAnitiIHGEObs1zbx1XHvWSA/T5AOx
=U4fk
-----END PGP SIGNATURE-----

--nextPart8844622.rDM2mCEezU--
