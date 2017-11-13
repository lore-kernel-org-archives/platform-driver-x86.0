From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: wmi: Unlock on error in wmi_ioctl()
Date: Mon, 13 Nov 2017 14:51:55 +0000
Message-ID: <70cf3e24742a43639839b0e2c3a60797@ausx13mpc120.AMER.DELL.COM>
References: <20171113100601.quq6qjvlk6ijzmri@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20171113100601.quq6qjvlk6ijzmri@mwanda>
Content-Language: en-US
Sender: kernel-janitors-owner@vger.kernel.org
To: dan.carpenter@oracle.com, dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Monday, November 13, 2017 4:06 AM
> To: Darren Hart <dvhart@infradead.org>; Limonciello, Mario
> <Mario_Limonciello@Dell.com>
> Cc: Andy Shevchenko <andy@infradead.org>; platform-driver-
> x86@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH] platform/x86: wmi: Unlock on error in wmi_ioctl()
>=20
> We need to drop a lock if try_module_get() fails.
>=20
> Fixes: 44b6b7661132 ("platform/x86: wmi: create userspace interface for d=
rivers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 8c31ed4f0e1b..791449a2370f 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -868,8 +868,10 @@ static long wmi_ioctl(struct file *filp, unsigned in=
t cmd,
> unsigned long arg)
>  	/* let the driver do any filtering and do the call */
>  	wdriver =3D container_of(wblock->dev.dev.driver,
>  			       struct wmi_driver, driver);
> -	if (!try_module_get(wdriver->driver.owner))
> -		return -EBUSY;
> +	if (!try_module_get(wdriver->driver.owner)) {
> +		ret =3D -EBUSY;
> +		goto out_ioctl;
> +	}
>  	ret =3D wdriver->filter_callback(&wblock->dev, cmd, buf);
>  	module_put(wdriver->driver.owner);
>  	if (ret)

Hi Dan,

Thanks for submitting.  This exact same fix is in the subsystem "testing" b=
ranch
but hasn't yet been promoted to -next.

http://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git/commit=
/5e3e22971fb0b0d7d03286f1a619d0348748a243

