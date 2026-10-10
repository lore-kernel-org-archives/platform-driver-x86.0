Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31682D1F40;
	Sat, 10 Oct 2026 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595199; cv=none; b=LxeLB655luYfBSFf1A+h34+Ecw5gGlcFa9q/FmuntrMyHqNzfWNMAobT1PnaBFKwkajdcw3LJU7BzsPlSUOxSNQsDHyxlH5KIAfh4vUl9cv5pjBh2Whwcc7xFlAEX4L4MU8v2+trfkfOMl3Wj2x1o4CKsbIvz6gfx7o7vq+QHvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595199; c=relaxed/simple;
	bh=GVynOQ5JCtE4yeOLACQKJj4j6Jl1gDqjfFRpBrv0ol8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EuAELkyESVr+LE/B7i8CAr+XYLurs+OYCD4jyGnV9+xdFLw+pStcflvFeX9NJYq2L7YbplxGiRsuYyKTSpZYVy5NPI6EiQKQn638O+b4KKbeRQUjvDDU8EY4U4uz6Yvvc3g3LYp7XHFr4lwp3sPIcdNUlSzHidPMgs1KZZzhC5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=jScEBBTW; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="jScEBBTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791595186; x=1792199986; i=w_armin@gmx.de;
	bh=uzl5kTDeeWQG5Usx/vi2k01u9k3ks6M1oyTZVIm1zTA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jScEBBTWjgZFsfCJLWll+m7GRUhWuneMf2piJ0DelHISy4hmtSmMjSloVssipQua
	 XgRS5LjV2KO0Sv5srgMaVT5LN3KOvl8VAWV+TiYlBCr1fZEjJLSwOUQZwJWNE1ysX
	 IqcklGV7hguqAivAurPN12+6Jd6Dw4LZtZMGuwenlly/vy0ZZBn7KsIstVDAq/i4c
	 hN//3Y6hoqeuEZUvMjQGccbeApozhtKM5JIr9Q3IaI8c/QOSq8zGpNNOOOvYaNJfp
	 YPSaiMda0I1Ec+syVuOGGr2XJn09GwpGDFka0TxEtoa3ZP9W6cAimgdVUjAt03c13
	 vBLxmglsEgdQMVdb6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwfWa-1wRDtw2RIY-01601k; Sat, 10
 Oct 2026 03:19:46 +0200
Message-ID: <bb1e3abe-5dac-4f91-b5bf-0aac276ec68e@gmx.de>
Date: Sat, 10 Oct 2026 03:19:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] platform/x86: lenovo-wmi-helpers: Adopt new WMI
 API
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Charles <hanker007@gmail.com>,
 Navon John Lukose <navonjohnlukose@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
 <20261009-lwmi-wmi-new-api-v2-11-402828382679@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-11-402828382679@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tHv75PcS2pDnZOwVOEpvwbYib8nD6FXMbW67AY3pooA91muUc+I
 OZ3NZ8WUVkJ5IWk24QS4edQCiDc/KYpy7aTBoRwi1r9xQ0aovGMjZHgbdFLF9TGCQrMWnF2
 b3sA+VZSNnSH8JSy5p0PK6TZ+UG+GA6zPxVxQpMLni2+Mw+OUYc5C0WMdFnEPEHgBP954dw
 GMqQX/lIp9F8ssMFF7zsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:24VAG1VvUnM=;3IkyWCGyEskfxj/RT3urXSv/gH+
 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

Am 09.10.26 um 14:53 schrieb Rong Zhang:

> The new WMI API supports multiple ACPI types by converting them into a
> unified buffer that satisfies alignment and size requirements.
>
> Adopt it to make our life easier.
>
> Note that the Windows WMI-ACPI driver converts all ACPI objects into a
> common buffer format, so adopting the new API intentionally accepts more
> ACPI types as a followup of commit 465dc9da8ff6 ("platform/x86:
> lenovo-wmi-helpers: Convert returned buffer into u32").

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Suggested-by: Armin Wolf <W_Armin@gmx.de>
> Link: https://lore.kernel.org/r/f1787927-b655-4321-b9d9-bc12353c72db@gmx=
.de/
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>   drivers/platform/x86/lenovo/wmi-helpers.c | 61 ++++++++++++-----------=
=2D-------
>   1 file changed, 23 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platfor=
m/x86/lenovo/wmi-helpers.c
> index 8f5766c391eb..687caa226263 100644
> --- a/drivers/platform/x86/lenovo/wmi-helpers.c
> +++ b/drivers/platform/x86/lenovo/wmi-helpers.c
> @@ -24,9 +24,10 @@
>   #include <linux/export.h>
>   #include <linux/module.h>
>   #include <linux/notifier.h>
> -#include <linux/unaligned.h>
>   #include <linux/wmi.h>
>  =20
> +#include <asm/byteorder.h>
> +
>   #include "wmi-helpers.h"
>  =20
>   /* Thermal mode notifier chain. */
> @@ -42,49 +43,33 @@ static BLOCKING_NOTIFIER_HEAD(tm_chain_head);
>    * @size: Length of the buffer.
>    * @retval: Pointer for the return value to be assigned.
>    *
> - * Calls wmidev_evaluate_method for Lenovo WMI devices that return an A=
CPI
> - * integer. Validates the return value type and assigns the value to th=
e
> - * retval pointer.
> + * Calls the specified WMI method for Lenovo WMI devices that return a =
WMI
> + * integer. Validates the return value and assigns it to @retval when i=
t's not
> + * NULL, otherwise the return value is not validated.
>    *
>    * Return: 0 on success, or an error code.
>    */
>   int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 me=
thod_id,
>   			  unsigned char *buf, size_t size, u32 *retval)
>   {
> -	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> -	struct acpi_buffer input =3D { size, buf };
> -	acpi_status status;
> -
> -	status =3D wmidev_evaluate_method(wdev, instance, method_id, &input,
> -					&output);
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -
> -	union acpi_object *ret_obj __free(kfree) =3D output.pointer;
> -
> -	if (retval) {
> -		if (!ret_obj)
> -			return -ENODATA;
> -
> -		switch (ret_obj->type) {
> -		/*
> -		 * The ACPI method may simply return a buffer when a u32
> -		 * is expected. This is valid on Windows as its WMI-ACPI
> -		 * driver converts everything to a common buffer.
> -		 */
> -		case ACPI_TYPE_BUFFER:
> -			if (ret_obj->buffer.length < sizeof(u32))
> -				return -ENXIO;
> -
> -			*retval =3D get_unaligned_le32(ret_obj->buffer.pointer);
> -			return 0;
> -		case ACPI_TYPE_INTEGER:
> -			*retval =3D (u32)ret_obj->integer.value;
> -			return 0;
> -		default:
> -			return -ENXIO;
> -		}
> -	}
> +	struct wmi_buffer input =3D {
> +		.length =3D size,
> +		.data =3D buf,
> +	};
> +	struct wmi_buffer output;
> +	int ret;
> +
> +	if (!retval)
> +		return wmidev_invoke_procedure(wdev, instance, method_id, &input);
> +
> +	ret =3D wmidev_invoke_method(wdev, instance, method_id, &input,
> +				   &output, sizeof(__le32));
> +	if (ret)
> +		return ret;
> +
> +	__le32 *valp __free(kfree) =3D output.data;
> +
> +	*retval =3D le32_to_cpu(*valp);
>  =20
>   	return 0;
>   };
>
