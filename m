From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: dell-laptop and separate AC timeouts on some Dell systems
Date: Sat, 8 Apr 2017 01:22:45 +0200
Message-ID: <201704080122.45868@pali>
References: <ac73b849a1de43b28ea87f92f4f95c1c@ausx13mpc120.AMER.DELL.COM> <201704072355.20831@pali> <d7936c1974734b149b47ef7540af8ed8@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart7042803.Y76ugrzY3p";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f178.google.com ([209.85.128.178]:34992 "EHLO
        mail-wr0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751981AbdDGXWt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 19:22:49 -0400
Received: by mail-wr0-f178.google.com with SMTP id o21so89422544wrb.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Apr 2017 16:22:49 -0700 (PDT)
In-Reply-To: <d7936c1974734b149b47ef7540af8ed8@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: platform-driver-x86@vger.kernel.org

--nextPart7042803.Y76ugrzY3p
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 08 April 2017 00:56:24 Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > Sent: Friday, April 7, 2017 4:55 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: platform-driver-x86@vger.kernel.org
> > Subject: Re: dell-laptop and separate AC timeouts on some Dell
> > systems
> >=20
> > Hi!
> >=20
> > On Friday 07 April 2017 21:33:53 Mario.Limonciello@dell.com wrote:
> > > Pali,
> > >=20
> > > For some time there have been folks reporting some issues where
> > > keyboard backlight setting is failing on various Dell systems
> > > (https://github.com/dell/libsmbios/issues/3).  I've been circling
> > > around internally to find out what's going on. This affects a
> > > number of systems from the last year or so.
> >=20
> > Great!
> >=20
> > > What is happening is that some platforms support an alternate
> > > keyboard timeout while on AC.  The old "timeout" value is
> > > treated as just a battery timeout and the separate value is the
> > > AC timeout. Unfortunately if the AC timeout is /not/ set in the
> > > timeout setting/update request, this will fail.
> >=20
> > So in case notebook is running on AC and we want to change timeout
> > for keyboard backlight, we need to tell smbios two timeouts, one
> > for battery and one for AC?
>=20
> Yes, that's correct.  The reason for the failures so far has been
> that the field for AC has not been getting sent.  Since the buffer
> is zero'ed out before starting the undefined value "0" for AC
> timeout is sent to EC and rejected.
>=20
> > > As a result I prototyped a few changes for this at the libsmbios
> > > branch here:
> > > https://github.com/dell/libsmbios/commits/fix-g8-keyboard-backlig
> > > ht
> >=20
> > Can you update also documentation which is at the end of file? It
> > would help for kernel implementation.
>=20
> OK, just added more on this.
>=20
> > > It's not yet requested for merging because I still don't know why
> > > the request to supported features returns "Always On" still
> > > (that shouldn't be supported).
> >=20
> > It looks like that "Always On" mode is reported by smbios by
> > supported, but setting it will cause failure. Any idea where is a
> > problem? Probably Dell firmware bug? Or needs to be that mode
> > handled specially?
>=20
> It's a behavior outside of spec, but I'm still clarifying if it's
> intended and spec wasn't updated.
>=20
> Continue to ignore this bit if it's set unless I hear otherwise.
>=20
> > > As far as I can tell this doesn't really map well to how the
> > > keyboard backlight driver in the kernel works today, so I wanted
> > > to raise this to you to discuss what the best way to handle it
> > > is. One of these systems can be detected by the presence of the
> > > token 0x451. When that is found, the additional timeout unit and
> > > value should be sent with the requests.
> > >=20
> > > Can you let me know your thoughts?
> >=20
> > I think that extending struct kbd_state should work.
> >=20
> > There are already functions dell_send_intensity() and
> > dell_get_intensity() which handle state based on battery/AC mode.
>=20
> The difference is that intensity it's obvious that it changes from 50
> to 100 percent.  With different timeouts, shouldn't this be more
> complex?

Currently for keyboard backlight settings is used procedure:
get current status --> update --> set new status.

So we just need to have two timeouts in struct kbd_state and get/set=20
functions needs to handle it. I do not thing this change would be=20
complex, it should be straightforward.

> Would you just keep two different nodes as accessible to userspace?

And this is another question... For a first step we should just fix=20
timeout sysfs node to work. And probably the best fix would be that this=20
node will manage timeout which belongs to current AC or battery state.=20
Like for dell_get_intensity(). When notebook is running on battery we=20
will export timeout configured for battery and when on AC we will export=20
timeout configured for AC. Changing timeout via sysfs just affect only=20
one (current) configuration (ac or battery).

IIRC we do not provide a sysfs node for changing AC display panel=20
brightness level when notebook is running on battery and vice versa. So=20
do we need it for keyboard backlight timeout at all?

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart7042803.Y76ugrzY3p
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAljoH0UACgkQi/DJPQPkQ1Lu4QCgg5uWnvEZBY//Mbrx/ArYtyZ9
Vo0An2cwo8GAv6mgyKHXkEKFQbRYamfX
=IXpe
-----END PGP SIGNATURE-----

--nextPart7042803.Y76ugrzY3p--
