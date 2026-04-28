Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AED1288AD;
	Tue, 28 Apr 2026 19:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777404430; cv=none; b=JlbjV6MLQELuPou2fLkIJM3Ay+jQ+MYFY9o99BzTkdKo3DS0nghVn2dr4mqUUaP+t5fgGqXo8equU9NLz0FwDlzPYsqG3lpo34BkCaoR8IMEP+V4COgSqYjezRWU8LdTmX1CwHfM8LOBmAJjmNtDR0Iij9ohaSWzpnWO3yvWO1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777404430; c=relaxed/simple;
	bh=LdOYPMYpNmItPxGLxb2nov+yJYqdlh0aPRukmwkRCb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIQoHcWBWTeIqzVvmkMVA+mvKAznW7yW+rp1LB9ob1QyRCqk9/3dVsl7btsTUQKVidtSMwef6VIlAZzyqG7BDPJ5+3ll6yjq5zz6hpy5Q68TnGbCj7OqbxWGCJYi5/aBk4vo0jI2kDbFoOcPhDu0FT3B5XZxdm5580dkJhFPrE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=l3EN3oFr; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="l3EN3oFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777404426; x=1778009226; i=w_armin@gmx.de;
	bh=ZsgSxjTPRsrYjTzoXkzUI+tLn72Df+RjmKfxLQStLOs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=l3EN3oFrpKqqPUbsdOljaWB+c6ZIxC4pAMahBWo5ODcuXKkx1Xpm4pRlxtbA5xPb
	 O07n5chfAGHUoHe/Vs7bThrSw+Xj0fE0Ayx4qWM+8F1Jet0BcFLoMWnn9pMkYajjq
	 katoKofQcd8EDa3D2fMgolVvjJiIFAHZhGmCV0NuRjPpykROGYO7DKf687xg45gp6
	 R2y9l+XtR3VfGFMZzQKQanvi5VaqHhDqkpuDZGgV8OkmVe+M4zVhckx9M8QQRkE8l
	 Nkml3o0k66yQkHDihBbUiYUQsCI806zuIZp0X9wa0IqrOmlpXeOgd+0Qeb43fAIau
	 yqUWRGEqs4WihfmQRg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjS9I-1vcimG2B2I-00cl7V; Tue, 28
 Apr 2026 21:27:06 +0200
Message-ID: <795321b2-3655-40ec-ae10-02b0db799df6@gmx.de>
Date: Tue, 28 Apr 2026 21:27:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: alienware-wmi-base: Transition to new
 WMI API
To: Kurt Borja <kuurtb@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20260428-aw-new-api-v4-1-d2c06241d7ad@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260428-aw-new-api-v4-1-d2c06241d7ad@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hJQPAW7P1cjQgzXP2DD1yMOXBTn9OvDui7eYaLgQJxgEdk8DsJh
 upqy2NNx4PM9O9w+ECrdlmPCJIO0NGQ6Xj8ZmeB4+uw5hHdEzIUuP6BTzoEEIyGvcv+slOb
 CfoyYluPB94LllpUvMV78nZC00E+HXrvFw3Urom8E2hFjDYBSmNWxIPhkT5ToK2bjRnkjtm
 wyzeu0jM99cCSugXPOzuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sA8gG2naAho=;aMA4+yP1z0CMpuVm4mtRyMwWN6t
 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

Am 28.04.26 um 18:37 schrieb Kurt Borja:

> Transition to the new wmi_buffer based WMI API.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
> v4:
>    - Rebase to use the new wmidev_invoke_method() with size check
>
> v3: https://patch.msgid.link/20260331-aw-new-api-v3-1-ef03b94529d8@gmail=
.com
>    - Use __free() instead of manual cleanup.
>    - Include <linux/types.h>
>
> v2: https://patch.msgid.link/20260331-aw-new-api-v2-1-3b0d33bf8d22@gmail=
.com
>    - Cast wmi_buffer data to __le32 and then use le32_to_cpu() before
>      returning
>
> v1: https://patch.msgid.link/20260330-aw-new-api-v1-1-95910bfa1b38@gmail=
.com
> ---
>   drivers/platform/x86/dell/alienware-wmi-base.c | 31 ++++++++++++++++--=
=2D-------
>   1 file changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/pl=
atform/x86/dell/alienware-wmi-base.c
> index 64562b92314f..21d3acfbd73d 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> @@ -12,8 +12,13 @@
>   #include <linux/cleanup.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
>   #include <linux/dmi.h>
>   #include <linux/leds.h>
> +
> +#include <asm/byteorder.h>
> +
>   #include "alienware-wmi.h"
>  =20
>   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
> @@ -150,21 +155,23 @@ u8 alienware_interface;
>   int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
>   			  void *in_args, size_t in_size, u32 *out_data)
>   {
> -	struct acpi_buffer out =3D {ACPI_ALLOCATE_BUFFER, NULL};
> -	struct acpi_buffer in =3D {in_size, in_args};
> -	acpi_status ret;
> +	struct wmi_buffer out, in =3D {
> +		.data =3D in_args,
> +		.length =3D in_size,
> +	};
> +	int ret;
>  =20
> -	ret =3D wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &ou=
t : NULL);
> -	if (ACPI_FAILURE(ret))
> -		return -EIO;
> -
> -	union acpi_object *obj __free(kfree) =3D out.pointer;
> +	if (out_data)
> +		ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, &out,
> +					   sizeof(*out_data));
> +	else
> +		ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, NULL, 0);
> +	if (ret)
> +		return ret;
>  =20
>   	if (out_data) {
> -		if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
> -			*out_data =3D (u32)obj->integer.value;
> -		else
> -			return -ENOMSG;
> +		__le32 *data __free(kfree) =3D out.data;
> +		*out_data =3D le32_to_cpu(*data);
>   	}

Hi,

calling wmidev_invoke_method() with a NULL output buffer will likely lead =
to crashes. This happens
because wmidev_invoke_method() demands that a valid pointer to a output bu=
ffer is provided by the
caller. I suggest that you use wmidev_invoke_procedure() instead:

	__le32 *data __free(kfree) =3D NULL;

	if (!out_data)
		return wmidev_invoke_procedure(wdev, 0, method_id, &in);

	ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, &out, sizeof(*data)=
);
	if (ret < 0)
		return ret;

	result =3D out.data
	...

Thanks,
Armin Wolf

>  =20
>   	return 0;
>
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260123-aw-new-api-1c18f1011f35
>
