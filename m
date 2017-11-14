From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH -next] platform/x86: dell-smbios-wmi: fix missing unlock
 on error in dell_smbios_wmi_call()
Date: Tue, 14 Nov 2017 14:51:12 +0000
Message-ID: <3f932607e7a843669abe3a756c10a20b@ausx13mpc120.AMER.DELL.COM>
References: <1510642695-123751-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:24418 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754670AbdKNOvV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 09:51:21 -0500
In-Reply-To: <1510642695-123751-1-git-send-email-weiyongjun1@huawei.com>
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
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>; Darren Hart
> <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; platform-driver-
> x86@vger.kernel.org
> Subject: [PATCH -next] platform/x86: dell-smbios-wmi: fix missing unlock =
on error
> in dell_smbios_wmi_call()
>=20
> Add the missing unlock before return from function dell_smbios_wmi_call()
> in the error handling case.
>=20
> Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatch=
er
> driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/platform/x86/dell-smbios-wmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x8=
6/dell-
> smbios-wmi.c
> index 35c13815..04da5a7 100644
> --- a/drivers/platform/x86/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell-smbios-wmi.c
> @@ -91,8 +91,10 @@ int dell_smbios_wmi_call(struct calling_interface_buff=
er
> *buffer)
>=20
>  	mutex_lock(&call_mutex);
>  	priv =3D get_first_smbios_priv();
> -	if (!priv)
> +	if (!priv) {
> +		mutex_unlock(&call_mutex);
>  		return -ENODEV;
> +	}
>=20
>  	size =3D sizeof(struct calling_interface_buffer);
>  	difference =3D priv->req_buf_size - sizeof(u64) - size;

Thanks Wei.  This is already fixed in -next:
http://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git/commit=
/307ab2a99d190d3a7949258b8551b66887ce8cf4

Thanks,
