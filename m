From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: dell-laptop and separate AC timeouts on some Dell systems
Date: Sat, 8 Apr 2017 09:19:46 +0200
Message-ID: <201704080919.46723@pali>
References: <ac73b849a1de43b28ea87f92f4f95c1c@ausx13mpc120.AMER.DELL.COM> <201704080122.45868@pali> <2235ad548a604c3990e9bbd7e78c4177@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2656371.Ugg5KEYcjC";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f171.google.com ([209.85.128.171]:33810 "EHLO
        mail-wr0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751154AbdDHHTu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 8 Apr 2017 03:19:50 -0400
Received: by mail-wr0-f171.google.com with SMTP id t20so120959312wra.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 08 Apr 2017 00:19:49 -0700 (PDT)
In-Reply-To: <2235ad548a604c3990e9bbd7e78c4177@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: platform-driver-x86@vger.kernel.org

--nextPart2656371.Ugg5KEYcjC
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Saturday 08 April 2017 04:09:11 Mario.Limonciello@dell.com wrote:
> > > The difference is that intensity it's obvious that it changes
> > > from 50 to 100 percent.  With different timeouts, shouldn't this
> > > be more complex?
> >=20
> > Currently for keyboard backlight settings is used procedure:
> > get current status --> update --> set new status.
> >=20
> > So we just need to have two timeouts in struct kbd_state and
> > get/set functions needs to handle it. I do not thing this change
> > would be complex, it should be straightforward.
>=20
> Yeah I figured this part was straightforward, it was the second part
> that was more complex :)
>=20
> > > Would you just keep two different nodes as accessible to
> > > userspace?
> >=20
> > And this is another question... For a first step we should just fix
> > timeout sysfs node to work. And probably the best fix would be
> > that this node will manage timeout which belongs to current AC or
> > battery state.
>=20
> So the easiest way to implement this would be to save/restore the
> values from the cbArg3 that are not currently saved without to
> regard to whether the platform supports a dedicated AC timeout.
>=20
> If it doesn't support a dedicated AC timeout this will be a no-op,
> but if it does it will fix this problem.

We can detect at module load time if notebook is new or old and based on=20
this fact we can fill or not cbArg3.

> > Like for dell_get_intensity(). When notebook is running on battery
> > we will export timeout configured for battery and when on AC we
> > will export timeout configured for AC. Changing timeout via sysfs
> > just affect only one (current) configuration (ac or battery).
>=20
> So basically the value in sysfs would change when you added/removed
> the AC adapter?  That might be a little bit confusing to a user in
> my opinion.
>=20
> > IIRC we do not provide a sysfs node for changing AC display panel
> > brightness level when notebook is running on battery and vice
> > versa. So do we need it for keyboard backlight timeout at all?
>=20
> How is that handled then?  The node dynamically changes values based
> on if a power adapter is plugged in?

Node has read and store functions. Those function check if AC is=20
connected and based on this state variant for AC or battery is called.

There is no need to active monitoring plug of power adapter.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2656371.Ugg5KEYcjC
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAljojxIACgkQi/DJPQPkQ1JF6ACgqTe+NhdOyh/h3h9ggOY9yYsR
iyIAnjeQ1UNAo5cMHamP9WwlzPuIGTiE
=W73x
-----END PGP SIGNATURE-----

--nextPart2656371.Ugg5KEYcjC--
