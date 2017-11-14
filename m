From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH -next] platform/x86: wmi: Fix missing unlock on error in
 wmi_ioctl()
Date: Tue, 14 Nov 2017 14:51:29 +0000
Message-ID: <8d49795aa64a47069d1082a272dc2528@ausx13mpc120.AMER.DELL.COM>
References: <1510642676-123654-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:3886 "EHLO
        esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754252AbdKNOvd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 09:51:33 -0500
In-Reply-To: <1510642676-123654-1-git-send-email-weiyongjun1@huawei.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: weiyongjun1@huawei.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org



> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-x=
86-
> owner@vger.kernel.org] On Behalf Of Wei Yongjun
> Sent: Tuesday, November 14, 2017 12:58 AM
> To: Darren Hart <dvhart@infradead.org>; Andy Shevchenko
> <andy@infradead.org>; Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; platform-driver-
> x86@vger.kernel.org
> Subject: [PATCH -next] platform/x86: wmi: Fix missing unlock on error in
> wmi_ioctl()
>=20
> Add the missing unlock before return from function wmi_ioctl()
> in the error handling case.
>=20
> Fixes: 44b6b7661132 ("platform/x86: wmi: create userspace interface for d=
rivers")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/platform/x86/wmi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 8c31ed4..791449a 100644
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

Thanks Wei,

This is already fixed in -next:=20
http://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git/commit=
/5e3e22971fb0b0d7d03286f1a619d0348748a243
