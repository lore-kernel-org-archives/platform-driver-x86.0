From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v2] platform/x86: dell-laptop: fix kbd_get_state's request
 value
Date: Tue, 13 Feb 2018 19:39:56 +0000
Message-ID: <7dc06e118bde48bb8b44280d9a77983b@ausx13mpc120.AMER.DELL.COM>
References: <20180213192739.GA4985@laszlth>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90]:39706 "EHLO
        esa1.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965313AbeBMTj6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Feb 2018 14:39:58 -0500
In-Reply-To: <20180213192739.GA4985@laszlth>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: laszlth@gmail.com, mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-x=
86-
> owner@vger.kernel.org] On Behalf Of Laszlo Toth
> Sent: Tuesday, February 13, 2018 1:28 PM
> To: Matthew Garrett <mjg59@srcf.ucam.org>; Pali Roh=E1r <pali.rohar@gmail=
.com>;
> Darren Hart <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>;
> platform-driver-x86@vger.kernel.org; Limonciello, Mario
> <Mario_Limonciello@Dell.com>
> Subject: [PATCH v2] platform/x86: dell-laptop: fix kbd_get_state's reques=
t value
>=20
> Commit 9862b43624a5 ("platform/x86: dell-laptop: Allocate buffer on heap
> rather than globally")
> broke one request, changed it back to the original value.
>=20
> Tested on a Dell E6540, backlight came back.
>=20
> Signed-off-by: Laszlo Toth <laszlth@gmail.com>
> ---
> Changes in v2:
>  - split the fix and the function merge part
>=20
>  drivers/platform/x86/dell-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/de=
ll-laptop.c
> index 2a68f59..a37cff9 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -1279,7 +1279,7 @@ static int kbd_get_state(struct kbd_state *state)
>  	struct calling_interface_buffer buffer;
>  	int ret;
>=20
> -	dell_fill_request(&buffer, 0, 0, 0, 0);
> +	dell_fill_request(&buffer, 0x1, 0, 0, 0);
>  	ret =3D dell_send_request(&buffer,
>  				CLASS_KBD_BACKLIGHT,
> SELECT_KBD_BACKLIGHT);
>  	if (ret)
> --
> 2.7.4

This should also CC stable and
Fixes 9862b43624a5450a097cc4122732857b869dbbca

Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
