From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] dell-laptop: Check return value of all SMBIOS calls
 and do not cache hwswitch state
Date: Mon, 29 Jun 2015 16:02:40 -0700
Message-ID: <20150629230240.GE57818@vmdeb7>
References: <1434875967-13370-3-git-send-email-pali.rohar@gmail.com>
 <1435390483-10694-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44760 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752879AbbF2XCp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Jun 2015 19:02:45 -0400
Content-Disposition: inline
In-Reply-To: <1435390483-10694-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Sat, Jun 27, 2015 at 09:34:43AM +0200, Pali Roh=E1r wrote:
> Make sure that return value of all SMBIOS calls are properly checked =
and
> do not continue of processing (received) information if call failed.
>=20
> Also do not chache hwswitch wireless state as it can be changed at ru=
ntime
> (e.g from userspace smbios applications).

This "Also do.." tripled the size of the patch. This should really be t=
wo
patches.

>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> ---
> Changes since v1:
>  * Call clear_buffer before each sequential SMBIOS call (we expect ze=
ro-filled buffer)

Another good independent patch candidate

>  * Do not cache hwswitch state as it can be modified at runtime by us=
erspace
>  * simplify some conditions
> ---
>  drivers/platform/x86/dell-laptop.c |  173 ++++++++++++++++++++++++++=
----------
>  1 file changed, 127 insertions(+), 46 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x8=
6/dell-laptop.c
> index 35758cb..99f28d3 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c

=2E..

>  static void dell_update_rfkill(struct work_struct *ignored)
>  {
> +	int hwswitch;
>  	int status;
> +	int ret;
> =20
>  	get_buffer();
> +
>  	dell_send_request(buffer, 17, 11);
> +	ret =3D buffer->output[0];
>  	status =3D buffer->output[1];
> =20
> +	if (ret !=3D 0)
> +		goto out;
> +
> +	clear_buffer();
> +
> +	buffer->input[0] =3D 0x2;
> +	dell_send_request(buffer, 17, 11);
> +	ret =3D buffer->output[0];
> +
> +	if (ret =3D=3D 0 && (status & BIT(0)))
> +		hwswitch =3D buffer->output[1];
> +	else
> +		hwswitch =3D 0;

Initializing hwswitch to 0 above saves the else and assignment line her=
e.
Generally preferred.

=2E..

> =20
>  static int dell_get_intensity(struct backlight_device *bd)
>  {
> -	int ret =3D 0;
> +	int ret;
> +	int token;

Since we're talking respin, declare in order of descending line length =
please,
just as you did later when adding token to a function.


--=20
Darren Hart
Intel Open Source Technology Center
