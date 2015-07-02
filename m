From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/3] dell-laptop: Clear buffer before each SMBIOS call
Date: Wed, 1 Jul 2015 17:45:44 -0700
Message-ID: <20150702004544.GD27795@vmdeb7>
References: <201507012004.45275@pali>
 <1435774101-12329-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40593 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753657AbbGBApu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jul 2015 20:45:50 -0400
Content-Disposition: inline
In-Reply-To: <1435774101-12329-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Wed, Jul 01, 2015 at 08:08:19PM +0200, Pali Roh=E1r wrote:
> Make sure that before initializing SMBIOS call input buffer does not =
contain
> any garbage (e.g values from previous SMBIOS call). This fix problem =
with
> passing undefined/random parameters to SMBIOS functions.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> ---
>  drivers/platform/x86/dell-laptop.c |   11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x8=
6/dell-laptop.c
> index 35758cb..6728487 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -310,10 +310,15 @@ static DEFINE_MUTEX(buffer_mutex);
> =20
>  static int hwswitch_state;
> =20
> +static void clear_buffer(void)
> +{
> +	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> +}
> +
>  static void get_buffer(void)
>  {
>  	mutex_lock(&buffer_mutex);
> -	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> +	clear_buffer();
>  }
> =20
>  static void release_buffer(void)
> @@ -557,6 +562,8 @@ static int dell_rfkill_set(void *data, bool block=
ed)
>  	    !(buffer->output[1] & BIT(16)))
>  		disable =3D 1;
> =20
> +	clear_buffer();
> +
>  	buffer->input[0] =3D (1 | (radio<<8) | (disable << 16));
>  	dell_send_request(buffer, 17, 11);
> =20
> @@ -571,6 +578,7 @@ static void dell_rfkill_update_sw_state(struct rf=
kill *rfkill, int radio,
>  	if (status & BIT(0)) {
>  		/* Has hw-switch, sync sw_state to BIOS */
>  		int block =3D rfkill_blocked(rfkill);
> +		clear_buffer();
>  		buffer->input[0] =3D (1 | (radio << 8) | (block << 16));
>  		dell_send_request(buffer, 17, 11);
>  	} else {
> @@ -774,6 +782,7 @@ static int __init dell_setup_rfkill(void)
>  	dell_send_request(buffer, 17, 11);
>  	status =3D buffer->output[1];
>  	buffer->input[0] =3D 0x2;
> +	clear_buffer();
>  	dell_send_request(buffer, 17, 11);

This clears the buffer after modifying input[0] and right before
dell_send_request... so you're sending a completely empty buffer? Is th=
at
intentional here? I guess I would have expected the clear_buffer to be =
one line
earlier.

>  	hwswitch_state =3D buffer->output[1];
>  	release_buffer();
> --=20
> 1.7.9.5
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center
