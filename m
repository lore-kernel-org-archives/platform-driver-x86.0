From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 2/2] dell-wmi: Process only one event on devices with interface version 0
Date: Tue, 12 Jan 2016 18:49:44 +0100
Message-ID: <201601121849.44256@pali>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com> <1451942796-26574-3-git-send-email-pali.rohar@gmail.com> <20160112111439.GA7630@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4560551.xe7CYA1sCh";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160112111439.GA7630@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--nextPart4560551.xe7CYA1sCh
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 12 January 2016 12:14:39 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > BIOS/ACPI on devices with WMI interface version 0 does not clear
> > buffer before filling it. So next time when BIOS/ACPI send WMI
> > event which is smaller as previous then it contains garbage in
> > buffer from previous event.
> >=20
> > BIOS/ACPI on devices with WMI interface version 1 clears buffer and
> > sometimes send more events in buffer at one call.
> >=20
> > Since commit 83fc44c32ad8 ("dell-wmi: Update code for processing
> > WMI events") dell-wmi process all events in buffer (and not just
> > first).
> >=20
> > So to prevent reading garbage from buffer we will process only
> > first one event on devices with WMI interface version 0.
> >=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > ---
> >=20
> >  drivers/platform/x86/dell-wmi.c |   16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/dell-wmi.c
> > b/drivers/platform/x86/dell-wmi.c index 1ad7a7b..5db9efb 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -237,6 +237,22 @@ static void dell_wmi_notify(u32 value, void
> > *context)
> >=20
> >  	buffer_end =3D buffer_entry + buffer_size;
> >=20
> > +	/*
> > +	 * BIOS/ACPI on devices with WMI interface version 0 does not
> > clear +	 * buffer before filling it. So next time when BIOS/ACPI
> > send WMI event +	 * which is smaller as previous then it contains
> > garbage in buffer from +	 * previous event.
> > +	 *
> > +	 * BIOS/ACPI on devices with WMI interface version 1 clears
> > buffer and +	 * sometimes send more events in buffer at one call.
> > +	 *
> > +	 * So to prevent reading garbage from buffer we will process only
> > first +	 * one event on devices with WMI interface version 0.
> > +	 */
> > +	if (dell_wmi_interface_version =3D=3D 0 && buffer_entry < buffer_end)
> > +		if (buffer_end > buffer_entry + buffer_entry[0] + 1)
> > +			buffer_end =3D buffer_entry + buffer_entry[0] + 1;
>=20
> Wouldn't it be a bit more clear if we clamped buffer_size before
> setting buffer_end?  E.g. like this:
>=20
> 	if (buffer_size =3D=3D 0)
> 		return;
>=20
> 	if (dell_wmi_interface_version =3D=3D 0 &&
> 	    buffer_size > buffer_entry[0] + 1)
> 		buffer_size =3D buffer_entry[0] + 1;
>=20
> 	buffer_end =3D buffer_entry + buffer_size;

Before return adds correct cleanup part and code will be same as my=20
original patch.

So if more people think that your code is cleaner I'm OK with replacing=20
it.

> If I understand correctly, the second check on the first line added
> by your patch prevents a bad dereference when accesing
> buffer_entry[0].

Yes. Same check (buffer_entry < buffer_end) is used in next whole loop,=20
so I uses it in my patch too...

> The only case when that may happen is when
> buffer_size is 0,

In this one case, yes. But you can see that buffer_entry variable is=20
changing (increasing pointer offset), it means that it points to some=20
entry in buffer.

> which means we got notified with rubbish anyway,
> so we can just return (perhaps with a log message, which I omitted
> above).
>=20
> One more minor nit: you should probably decide between "first" and
> "one" as the phrase "only first one event" (found both in the commit
> message and in the code comment) sounds incorrect to me.

=46eel free to correct commit message, I'm not very good in english...

It should mean something like this... in buffer received by bios can be=20
more events. That while loop iterate over events. And this my patch on=20
machines with wmi version 0 will process only *one* event. And that=20
event is *first* in buffer.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart4560551.xe7CYA1sCh
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlaVPLgACgkQi/DJPQPkQ1IiMACgnEJzoCSa9d0HBMDt2LCguxJk
z4EAoMRTyD1x8Eyfo6OjeGNiWkm9rL4p
=TUjF
-----END PGP SIGNATURE-----

--nextPart4560551.xe7CYA1sCh--
