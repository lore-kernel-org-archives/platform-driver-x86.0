Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312803A382D;
	Wed, 29 Apr 2026 21:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777497526; cv=none; b=AtFXZ8YzRKFzqhLiige7j08TIM6RRTBpJhst7BY95bKDIbRVIZxSNLJiORngjGXwjtTAWG8tEXdDj0pCENNKvTzBEZvLxCPmLip71pSGhwUZPiR8OYa1BycETS53XFtbaO6vS5i7Anc6ifxNdQPxR0WTH0+6dX8O48rxUoKj/OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777497526; c=relaxed/simple;
	bh=JJCocYjXKZlB5cRswBzbl8LHwtIq+VfjhGrZnZ7U4Fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfPMLwMzlwBR56If2yFBypyeipvZHjnc3Y6zK+rjKLM0Z1hZ46+ovZzKWb/mKkP30CIFqWiXTmuUOnL9kn4SbfTUmnVagQ1ZPG/owKGBpcGZeBozpcWCtptmSzzowi1hcVdTI96+loyYZrXHv44SutqBkgUB8VmIfk4bYzjhelA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fAILxeiY; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fAILxeiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777497522; x=1778102322; i=w_armin@gmx.de;
	bh=ntsIRdCiXi1zzzOo+6NXdzcCKj8jB49XktW/WKrLinA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fAILxeiYfLjpD8U02S9MMGgruuuMn9Zk4y8QMHyNaj//78VZtQvhNS0kIsXmUDyy
	 jLi31doNzC5H3SLWwXTJhZ5HtJ5Z43lm27dQjjYSOCcQtf9Qak4M7ZNcuQKLg81PF
	 Ah1tJ/fZ5fFvp2WmLBh2Q+9go55vtVCJ/rEA0q6dw/1SOztKgtwmFHnh6S5EQKBBY
	 3bIO4mnc9gD0t1PkxWSwEgirXjB846LV2mwR38pjePNUDcyGjXQRF11KASBedXmXu
	 oL3kp/1Vf8QuDm5J/RXsUHzbkcgZ8hRkMD19COX4MRBgr/w4ey68CLmoiTEKK8/5R
	 JyJSWHzVk8X/ynzy3A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvPD-1vt48V1JLB-00I7jj; Wed, 29
 Apr 2026 23:18:42 +0200
Message-ID: <72c88ba9-e95e-49dd-84f5-77274d006577@gmx.de>
Date: Wed, 29 Apr 2026 23:18:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: alienware-wmi-base: Transition to new
 WMI API
To: Kurt Borja <kuurtb@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20260429-aw-new-api-v5-1-7702668d04c6@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260429-aw-new-api-v5-1-7702668d04c6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DqwdRRQNYWHScJFhjh028YRX8AnTAwlJehnet6CmmAqpA3GJbY1
 sIU362otfq8GWFRWeP1VI8z2lo5W29okivH80OOIrffqO9mb0Dav7DVKaLljgbFGvi+Z3+0
 wnjETbx8t+fyHuFVzAocppu07bMGatl/mfTukepEBzrpz1mBwBK9qUCNTxz4J/Akq3osMw2
 fwMx11YhMJhAPxR+MvflA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PBbunkBGSko=;qirEkRd003mVDf2Hu4S5yTQZErK
 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
 1SoTjw==

Am 29.04.26 um 15:27 schrieb Kurt Borja:

> Transition to the new wmi_buffer based WMI API.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
> v5:
>    - Use wmidev_invoke_procedure in the !out_data case
>
> v4: https://patch.msgid.link/20260428-aw-new-api-v4-1-d2c06241d7ad@gmail=
.com
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
>   drivers/platform/x86/dell/alienware-wmi-base.c | 31 +++++++++++++++---=
=2D-------
>   1 file changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/pl=
atform/x86/dell/alienware-wmi-base.c
> index 64562b92314f..19cadf21203a 100644
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
> @@ -150,22 +155,22 @@ u8 alienware_interface;
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
> +	if (!out_data)
> +		return wmidev_invoke_procedure(wdev, 0, method_id, &in);
>  =20
> -	union acpi_object *obj __free(kfree) =3D out.pointer;
> +	ret =3D wmidev_invoke_method(wdev, 0, method_id, &in, &out,
> +				   sizeof(*out_data));
> +	if (ret)
> +		return ret;
>  =20
> -	if (out_data) {
> -		if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
> -			*out_data =3D (u32)obj->integer.value;
> -		else
> -			return -ENOMSG;
> -	}
> +	__le32 *data __free(kfree) =3D out.data;
> +	*out_data =3D le32_to_cpu(*data);
>  =20
>   	return 0;
>   }
>
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260123-aw-new-api-1c18f1011f35
>
