From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: dell-smbios: Fix error handling in
 build_tokens_sysfs()
Date: Fri, 19 Jan 2018 18:32:27 +0000
Message-ID: <d8c96f26da4d4fe6940db5961fc1e766@ausx13mpc120.AMER.DELL.COM>
References: <20180118104503.GA30055@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20180118104503.GA30055@mwanda>
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
To: dan.carpenter@oracle.com, pali.rohar@gmail.com
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Thanks, yeah this is obviously the correct way to do it.

Acked-by: Mario Limonciello <mario.limonciello@dell.com>

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Thursday, January 18, 2018 4:45 AM
> To: Pali Roh=E1r <pali.rohar@gmail.com>; Limonciello, Mario
> <Mario_Limonciello@Dell.com>
> Cc: Darren Hart <dvhart@infradead.org>; Andy Shevchenko
> <andy@infradead.org>; platform-driver-x86@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH] platform/x86: dell-smbios: Fix error handling in
> build_tokens_sysfs()
>=20
> We're freeing "value_name" which is NULL, so that's a no-op, instead of
> "location_name" and then we don't free the first zero-th elements of
> token_location_attrs[] and token_value_attrs[].
>=20
> Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface fo=
r SMBIOS
> tokens")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/de=
ll-
> smbios.c
> index 6a60db515bda..d8a21c7ba594 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -512,7 +512,7 @@ static int build_tokens_sysfs(struct platform_device =
*dev)
>  		continue;
>=20
>  loop_fail_create_value:
> -		kfree(value_name);
> +		kfree(location_name);
>  		goto out_unwind_strings;
>  	}
>  	smbios_attribute_group.attrs =3D token_attrs;
> @@ -523,7 +523,7 @@ static int build_tokens_sysfs(struct platform_device =
*dev)
>  	return 0;
>=20
>  out_unwind_strings:
> -	for (i =3D i-1; i > 0; i--) {
> +	for (i =3D i-1; i >=3D 0; i--) {
>  		kfree(token_location_attrs[i].attr.name);
>  		kfree(token_value_attrs[i].attr.name);
>  	}
