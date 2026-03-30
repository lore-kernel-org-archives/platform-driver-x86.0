Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B20523958D;
	Mon, 30 Mar 2026 23:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774913225; cv=none; b=isdo2+d3ymhKqUIP3/Yx8tRhZYtqRA6ow0oCgCtVkoGtFOKYpmvzwpHJoULjp8tfjIlqfutCf9nP+d2dA30X3Q2l2wnO+0U2zUxjbgGXr24Ckzu3yrs7TDlA2jpm82kB0DG3SuKC8DEZrFDd2oLUrRGs/aqChRqpBccidJkwFX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774913225; c=relaxed/simple;
	bh=Zu7Pzmo6YVlV7XvaGRt7MygYv4ASRU2QPAVJ0HtkIC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4tVkud7vaQibryDsgBSVwMYqd6YNblczpUFA1kfGZDavEv4U8jsI+SbLg8sr5XiESq7V/p7jqCTFIWwp7I8CYhNqdueDQIdvUFfY5TIMXHh7oWfwH4NzT9b9d92UV1h79b3uHKYOhRoRYrCZHPEvtSLGSKp0sXjTOYhiGBlpFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=e7y6HM5V; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="e7y6HM5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774913221; x=1775518021; i=w_armin@gmx.de;
	bh=uEvBr01Vf2AsFaCsHT+o9mxuQn0mGKs3hqAKEDlVfO8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=e7y6HM5VxNkYjaGtqsj3X6ow51cq96b7d8jcWVusWUM1M+X+ha+lzIkbBbtT7GbY
	 filhscLmBtOI0FW/BGXuC8MnvsUdCAEQvzGKbpePfTfIsrZuMPiZ4mlaNmx0b0izN
	 2ADdYrur6uHBHO5M0HGptGUmtBAVgFKQZj1DtIZZOLgPo5ksrxbhHa/cuiiVO8blw
	 epnmjkMTEZMhNaF7Kxio9z7ixGt/MZKV5GwQx3CpupSswMQrXowlenAzMpYHPP0VL
	 +2vxxrs9hdBmWc6Wq6NV451L4kLXy5i3P9Z1oHSFTXjyXcWrI+Bjc9at8k8eV4SGo
	 n9LL+mDT89hetTQI2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mjj8D-1ve6sJ3NQR-00nGE4; Tue, 31
 Mar 2026 01:27:00 +0200
Message-ID: <ea8c7adc-7caf-4305-b2c7-dca38524629c@gmx.de>
Date: Tue, 31 Mar 2026 01:26:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: alienware-wmi-base: Transition to new WMI
 API
To: Kurt Borja <kuurtb@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20260330-aw-new-api-v1-1-95910bfa1b38@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260330-aw-new-api-v1-1-95910bfa1b38@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6c9a1xGgW1CF7sa+BP2xYL/6V62DnP+cD47OL3AnEPal8JsCjqy
 fhNyUBB02msmAK6vyqfUn3Q93nI8DV00w4iHv9qVs3fDUWvhj1hMPb82EhcEZdcFe6hyECa
 kkBsY/Dvk5kBPp7SR1ef7nGJd+w6eU7omiAlSvwXVM1NnVNGFhLT/Os5VuVpMYyDUI5jMjL
 dTKnyNngn8YJ2DzM9L4Jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MUHFy+Z7WKg=;6qOy7Men9aSgWWhBNjPg/NcDTIB
 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
 nEpjZcVj1F9nIKOaYqOM1NYA==

Am 30.03.26 um 17:50 schrieb Kurt Borja:

> Transition to the new wmi_buffer based WMI API.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi-base.c | 29 ++++++++++++++----=
=2D-------
>   1 file changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/pl=
atform/x86/dell/alienware-wmi-base.c
> index 64562b92314f..ef2b4893b7b5 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> @@ -9,7 +9,6 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  =20
>   #include <linux/acpi.h>
> -#include <linux/cleanup.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
>   #include <linux/dmi.h>
> @@ -150,23 +149,27 @@ u8 alienware_interface;
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
> +	if (out.length < sizeof(*out_data)) {
> +		kfree(out.data);
> +		return -ENOMSG;
>   	}
>  =20
> +	*out_data =3D *(u32 *)out.data;

Please cast the output data to a __le32 * and use le32_to_cpu() to take th=
e endianess into account.
The rest looks fine to me.

Thanks,
Armin Wolf

> +	kfree(out.data);
> +
>   	return 0;
>   }
>  =20
>
> ---
> base-commit: fab7c51693e95aa874d6d9db22bfae7bd0b23c66
> change-id: 20260123-aw-new-api-1c18f1011f35
>
