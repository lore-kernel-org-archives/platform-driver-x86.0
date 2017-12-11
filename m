From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: dell-wmi: check for kmalloc() errors
Date: Mon, 11 Dec 2017 14:58:28 +0000
Message-ID: <ed9fa3c8c5bc45f58ff6844e628791a2@ausx13mpc120.AMER.DELL.COM>
References: <20171211105427.ed6wmdsz2s4xxfht@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20171211105427.ed6wmdsz2s4xxfht@mwanda>
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
To: dan.carpenter@oracle.com, mjg59@srcf.ucam.org
Cc: pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Monday, December 11, 2017 4:54 AM
> To: Matthew Garrett <mjg59@srcf.ucam.org>; Limonciello, Mario
> <Mario_Limonciello@Dell.com>
> Cc: Pali Roh=E1r <pali.rohar@gmail.com>; Darren Hart <dvhart@infradead.or=
g>;
> Andy Shevchenko <andy@infradead.org>; platform-driver-x86@vger.kernel.org=
;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH] platform/x86: dell-wmi: check for kmalloc() errors
>=20
> This allocation won't fail in the current kernel because it's small but
> not checking for kmalloc() failures introduces static checker warnings
> so let's fix it.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-=
wmi.c
> index 39d2f4518483..fb25b20df316 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -639,6 +639,8 @@ static int dell_wmi_events_set_enabled(bool enable)
>  	int ret;
>=20
>  	buffer =3D kzalloc(sizeof(struct calling_interface_buffer), GFP_KERNEL)=
;
> +	if (!buffer)
> +		return -ENOMEM;
>  	buffer->cmd_class =3D CLASS_INFO;
>  	buffer->cmd_select =3D SELECT_APP_REGISTRATION;
>  	buffer->input[0] =3D 0x10000;

Thanks for that.

Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
