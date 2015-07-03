From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/3] dell-laptop: Clear buffer before each SMBIOS call
Date: Fri, 3 Jul 2015 10:10:38 +0200
Message-ID: <20150703081038.GF1841@pali>
References: <201507012004.45275@pali>
 <1435774101-12329-1-git-send-email-pali.rohar@gmail.com>
 <20150702004544.GD27795@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:37788 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754811AbbGCIKl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 04:10:41 -0400
Content-Disposition: inline
In-Reply-To: <20150702004544.GD27795@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Wednesday 01 July 2015 17:45:44 Darren Hart wrote:
> On Wed, Jul 01, 2015 at 08:08:19PM +0200, Pali Roh=C3=A1r wrote:
> > Make sure that before initializing SMBIOS call input buffer does no=
t contain
> > any garbage (e.g values from previous SMBIOS call). This fix proble=
m with
> > passing undefined/random parameters to SMBIOS functions.
> >=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > ---
> >  drivers/platform/x86/dell-laptop.c |   11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/=
x86/dell-laptop.c
> > index 35758cb..6728487 100644
> > --- a/drivers/platform/x86/dell-laptop.c
> > +++ b/drivers/platform/x86/dell-laptop.c
> > @@ -310,10 +310,15 @@ static DEFINE_MUTEX(buffer_mutex);
> > =20
> >  static int hwswitch_state;
> > =20
> > +static void clear_buffer(void)
> > +{
> > +	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> > +}
> > +
> >  static void get_buffer(void)
> >  {
> >  	mutex_lock(&buffer_mutex);
> > -	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> > +	clear_buffer();
> >  }
> > =20
> >  static void release_buffer(void)
> > @@ -557,6 +562,8 @@ static int dell_rfkill_set(void *data, bool blo=
cked)
> >  	    !(buffer->output[1] & BIT(16)))
> >  		disable =3D 1;
> > =20
> > +	clear_buffer();
> > +
> >  	buffer->input[0] =3D (1 | (radio<<8) | (disable << 16));
> >  	dell_send_request(buffer, 17, 11);
> > =20
> > @@ -571,6 +578,7 @@ static void dell_rfkill_update_sw_state(struct =
rfkill *rfkill, int radio,
> >  	if (status & BIT(0)) {
> >  		/* Has hw-switch, sync sw_state to BIOS */
> >  		int block =3D rfkill_blocked(rfkill);
> > +		clear_buffer();
> >  		buffer->input[0] =3D (1 | (radio << 8) | (block << 16));
> >  		dell_send_request(buffer, 17, 11);
> >  	} else {
> > @@ -774,6 +782,7 @@ static int __init dell_setup_rfkill(void)
> >  	dell_send_request(buffer, 17, 11);
> >  	status =3D buffer->output[1];
> >  	buffer->input[0] =3D 0x2;
> > +	clear_buffer();
> >  	dell_send_request(buffer, 17, 11);
>=20
> This clears the buffer after modifying input[0] and right before
> dell_send_request... so you're sending a completely empty buffer? Is =
that
> intentional here? I guess I would have expected the clear_buffer to b=
e one line
> earlier.
>=20

Yes, now I see. I split that one patch into tree and I checked that
every one compiles fine and cumulative change of all patches is same...
Because that part (sending 0x2) is deleted in patch 3/3 it missed in my
eyes...

I will fix these problems and sent patch series again.

> >  	hwswitch_state =3D buffer->output[1];
> >  	release_buffer();
> > --=20
> > 1.7.9.5
> >=20
> >=20
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
