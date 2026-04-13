Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FCE241690;
	Mon, 13 Apr 2026 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061565; cv=none; b=M7IRZ2mbbhYIzCVkChL7qzbGMPaTxjtd9bB8VRut0iODHv0WlBr0AfhMc4tbm1m+MVK2Oleh7UfF+ajGH9lBfaZB6gKMQLMzytK4RZVJJgwTvWA4eqwX0eUbODtDUcbmXDhthqjE+f2xHnl8DureJVrOsVx8GVLoHnJlum56Z+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061565; c=relaxed/simple;
	bh=yHXV5OyqD5vGowCNNypKAYy2WbcME28B0ThRhJQ2xXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HikxZxyZjJlWObFbmX8+t425yACuhoTTyWklH2aJ4xEk+ufMzBh/KC4apo0sXvn4lj9c7s+P2VeEzTVSrChJOEXmehwHlcCr1yD//BDjoVi/c6LWI4hS2Jm+C/BLDyAgYp1OYdlmcd4zJ2W7svmf6Ihgylgrkl5FyOAiiGNBU7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pQUxZRlg; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pQUxZRlg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776061562; x=1776666362; i=w_armin@gmx.de;
	bh=ljBr8UiqvWQRuIyZQ3tO0AjBZJRCimGPoMBaSr8KFrk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pQUxZRlgfhuLM0C0zyFeoCE65Uc2k5Pgh65zEeJecT89i/HSPj9Jqd8Cdo1eMZ4O
	 eawN4gHmuA+JD0CS+g0gnwQnrJG8YBlMztHYjaONWA40xL8DX0EBcbQanjcexAsYu
	 e+ft9kRFsZb8TS2+omS8zgQRULnV66CCG71wkVm5kQxa+NXk9OlGL3v17rzRJtyb2
	 piAG1kYqwqBAY7Beh0iYzPTBGOZvEUAh+QAmRoiRWsj3urCciAGnCP47WyQV51T9O
	 tTH8RY1I9fypeWo0vZH1c9NWTK/HRd3p7t4vXrK0p5+H8ECERBbmIsEQSj3C1coIV
	 fACumAoAA4L124Jb6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE6F-1vtGHS3QOh-00PJ4p; Mon, 13
 Apr 2026 08:26:01 +0200
Message-ID: <eb4b7361-128e-4e1d-853b-667deb52603a@gmx.de>
Date: Mon, 13 Apr 2026 08:25:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: alienware-wmi-base: Transition to new
 WMI API
To: Kurt Borja <kuurtb@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20260331-aw-new-api-v3-1-ef03b94529d8@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260331-aw-new-api-v3-1-ef03b94529d8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GHsZYHGibwIuoiDWd+ZTzCX9e5HDaXyHaUnQomGBPlKRQozxfyH
 8Nz0UKa2SR0e+WdMb4bj8jgCjGLQwQrdfxTlpUIJTEUtzblhUTs+COdtYtjoh712bbqhC5I
 LRHf850ZMVYdTgJNWdWNsYzRDGBWqp7NaY+f/8uxjAVERv9NH06TNtrdz3spHul9L1y+obn
 b1RuR5iia0m6P5bZO8iPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oJyvETL3Dzo=;4DZwf6uIL/JGqHiHM5M/pDcujLB
 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

Am 31.03.26 um 18:20 schrieb Kurt Borja:
> Transition to the new wmi_buffer based WMI API.

Hi,

i think you will have to adapt this patch to the changes i made to
wmidev_invoke_method(). Said function now takes an additional parameter
specifying the minimum size of the output data.

In your case this would replace the size check when output data is=20
expected, otherwise you should call wmidev_invoke_procedure.

Thanks,
Armin Wolf


>=20
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
> v3:
>    - Use __free() instead of manual cleanup.
>    - Include <linux/types.h>
>=20
> v2: https://patch.msgid.link/20260331-aw-new-api-v2-1-3b0d33bf8d22@gmail=
.com
>    - Cast wmi_buffer data to __le32 and then use le32_to_cpu() before
>      returning
>=20
> v1: https://patch.msgid.link/20260330-aw-new-api-v1-1-95910bfa1b38@gmail=
.com
> ---
>   drivers/platform/x86/dell/alienware-wmi-base.c | 34 ++++++++++++++++--=
=2D-------
>   1 file changed, 21 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/pl=
atform/x86/dell/alienware-wmi-base.c
> index 64562b92314f..38a903734fa3 100644
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
> @@ -150,22 +155,25 @@ u8 alienware_interface;
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
> +	ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, out_data ? &out =
: NULL);
> +	if (ret)
> +		return ret;
>  =20
> -	union acpi_object *obj __free(kfree) =3D out.pointer;
> +	if (!out_data)
> +		return 0;
>  =20
> -	if (out_data) {
> -		if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
> -			*out_data =3D (u32)obj->integer.value;
> -		else
> -			return -ENOMSG;
> -	}
> +	__le32 *data __free(kfree) =3D out.data;
> +
> +	if (out.length < sizeof(*out_data))
> +		return -ENOMSG;
> +
> +	*out_data =3D le32_to_cpu(*data);
>  =20
>   	return 0;
>   }
>=20
> ---
> base-commit: fab7c51693e95aa874d6d9db22bfae7bd0b23c66
> change-id: 20260123-aw-new-api-1c18f1011f35
>=20

