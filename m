From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: dell-smbios-wmi: Unlock on error in
 dell_smbios_wmi_call()
Date: Mon, 13 Nov 2017 14:52:13 +0000
Message-ID: <e5eed4b46fd84e889b8f60299e715b7f@ausx13mpc120.AMER.DELL.COM>
References: <20171113100555.sbn32ls22snpfgpg@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa8.dell-outbound.iphmx.com ([68.232.149.218]:29647 "EHLO
        esa8.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753346AbdKMOwt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Nov 2017 09:52:49 -0500
In-Reply-To: <20171113100555.sbn32ls22snpfgpg@mwanda>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dan.carpenter@oracle.com
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Monday, November 13, 2017 4:06 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: Darren Hart <dvhart@infradead.org>; Andy Shevchenko
> <andy@infradead.org>; platform-driver-x86@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH] platform/x86: dell-smbios-wmi: Unlock on error in
> dell_smbios_wmi_call()
>=20
> We have to unlock before returning if get_first_smbios_priv() fails.
>=20
> Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatch=
er
> driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x8=
6/dell-
> smbios-wmi.c
> index 35c13815b24c..7b0e3ca74ca0 100644
> --- a/drivers/platform/x86/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell-smbios-wmi.c
> @@ -91,8 +91,10 @@ int dell_smbios_wmi_call(struct calling_interface_buff=
er
> *buffer)
>=20
>  	mutex_lock(&call_mutex);
>  	priv =3D get_first_smbios_priv();
> -	if (!priv)
> -		return -ENODEV;
> +	if (!priv) {
> +		ret =3D -ENODEV;
> +		goto unlock;
> +	}
>=20
>  	size =3D sizeof(struct calling_interface_buffer);
>  	difference =3D priv->req_buf_size - sizeof(u64) - size;
> @@ -101,6 +103,7 @@ int dell_smbios_wmi_call(struct calling_interface_buf=
fer
> *buffer)
>  	memcpy(&priv->buf->std, buffer, size);
>  	ret =3D run_smbios_call(priv->wdev);
>  	memcpy(buffer, &priv->buf->std, size);
> +unlock:
>  	mutex_unlock(&call_mutex);
>=20
>  	return ret;

Hi Dan,

Thanks for submitting.  This exact same fix is in the subsystem "testing" b=
ranch
but hasn't yet been promoted to -next.

http://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git/commit=
/307ab2a99d190d3a7949258b8551b66887ce8cf4
