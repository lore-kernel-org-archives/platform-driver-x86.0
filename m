From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH -next] platform/x86: dell-laptop: fix error return code in
 dell_init()
Date: Tue, 14 Nov 2017 14:38:04 +0000
Message-ID: <22a08d901d38462d8a55f2b3b934e502@ausx13mpc120.AMER.DELL.COM>
References: <1510666813-173192-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa4.dell-outbound.iphmx.com ([68.232.149.214]:41453 "EHLO
        esa4.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753177AbdKNOie (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 09:38:34 -0500
In-Reply-To: <1510666813-173192-1-git-send-email-weiyongjun1@huawei.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: weiyongjun1@huawei.com, mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-x=
86-
> owner@vger.kernel.org] On Behalf Of Wei Yongjun
> Sent: Tuesday, November 14, 2017 7:40 AM
> To: mjg59@srcf.ucam.org; pali.rohar@gmail.com; dvhart@infradead.org;
> andy@infradead.org; Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; platform-driver-
> x86@vger.kernel.org
> Subject: [PATCH -next] platform/x86: dell-laptop: fix error return code i=
n dell_init()
>=20
> Fix to return error code -ENOMEM from the kzalloc() error handling
> case instead of 0, as done elsewhere in this function.
>=20
> Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for=
 SMM
> calls")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/platform/x86/dell-laptop.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/de=
ll-laptop.c
> index c4903c5..0a8f359 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -2081,8 +2081,10 @@ static int __init dell_init(void)
>  	}
>=20
>  	buffer =3D kzalloc(sizeof(struct calling_interface_buffer), GFP_KERNEL)=
;
> -	if (!buffer)
> +	if (!buffer) {
> +		ret =3D -ENOMEM;
>  		goto fail_buffer;
> +	}
>=20
>  	if (quirks && quirks->touchpad_led)
>  		touchpad_led_init(&platform_device->dev);

Thanks.

Acked-by: Mario Limonciello <mario.limonciello@dell.com>
