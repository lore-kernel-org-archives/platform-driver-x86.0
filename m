Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A6439FCE;
	Sat, 10 Oct 2026 01:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595014; cv=none; b=IaU9DqucDAUcHZJdv6+pOFUBIgEfR4TDFlnX3q5sQQgOR8251oEOHqvCoPAI6Y0hchAb8LF9iihuHcnEghbH7jjayY8HyDHIDOwj6V1XZx4Ve3Qj2Ieh5F/3TzLjKi/qzthlK9RIMpKu8Z4QfXpj1YvUSh3dMG4PSI5fkOdyIjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595014; c=relaxed/simple;
	bh=93ZsJ5v8KxVS2eEGvjwbZE+PAz1+gc6tpp82ZukoRfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YE/1rq1IPe7/d29S05VfFGaTw/kQLb/74m3zWOohsIak34NQOJDiHHjUzzHaYBXA9O6+T4/G9mDv94aqR4p1VUN/QQSUN1SO/h/ALSrh+lVCHIGcd877MCVsVl4j3sYOPGwVGA3fOFwk2aba1ZpJgSevq1IBZHbaNS1bshBI9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KsM6col1; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KsM6col1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791595010; x=1792199810; i=w_armin@gmx.de;
	bh=wzzMGjcDRNeSveDNFt68lse9DZHdp1LglOfDJsTZJI8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KsM6col1DCyaz7V9hS8JIbzyVqIjMBFdH293r5GL/kJJLGAoqtKuao2N8ePgY2d0
	 y0iQfr6HTbbwlITlEm693QqJt+xshrao4ERjJ/yFJYaGb73yaOfxVSJ/Wtc0sKzjd
	 jsq4fszlxWow91kkrbaRgrEcRJOG38taDUt2cW+/9chH5Wm0658+bwlYYIxTZZtOI
	 MXdddldKSMZ4vHlZL0jgmHdtI1zYDXC+T3nvNsB5plvsynn9ofCGbKnr2aMnSk41o
	 v20ubV+tfjbZxLEFNvKUfPwWDFK9LZAhUCQ+RiyGqog2m/Im4KRliuaUMgqCGJX5m
	 nJBmtXuxg8gFIA4HdA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlXA-1wqV5I1s3S-00fVaF; Sat, 10
 Oct 2026 03:16:50 +0200
Message-ID: <bcc471f4-bae6-4de6-a60d-7f37f5df64a9@gmx.de>
Date: Sat, 10 Oct 2026 03:16:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] platform/x86: lenovo-wmi-capdata: Adopt new WMI
 API
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Charles <hanker007@gmail.com>,
 Navon John Lukose <navonjohnlukose@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
 <20261009-lwmi-wmi-new-api-v2-7-402828382679@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-7-402828382679@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TutMBbvWLPzlgJGmdZsh2zy1DwqF1U87RYrmGxkIk3JgoNoOc0Q
 BywExWq4nDryaJlQ0iPxvopLpGDk/hPTinWhGwZIATYABl+ARMC9LXOfxiw7EQKRoRrRmZ8
 8qWF1aFkZXWy+WCJ0bARLll6SA61Nt+Zsf5XwcwT12bksD6HXfUBSXDdsy6S2gTsh8TKypH
 OsD2gwSoK0wGGoch9iaPg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:E8eCcZAm6ao=;i0Le2bH3m8VvqNDrd71s9t1zLtC
 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
 Uyct19vA==

Am 09.10.26 um 14:53 schrieb Rong Zhang:

> The new WMI API supports multiple ACPI types by converting them into a
> unified buffer that satisfies alignment and size requirements.
>
> Adopt it to make our life easier.
>
> Note that the new WMI API only accepts a few ACPI types to conform to
> the behavior of the Windows WMI-ACPI driver. By adopting the new API, we
> intentionally rejects improper ACPI types instead of silently ignoring
> them.
>
> Meanwhile, considering that `struct_size(block, data, count * 3)' may
> overflow when calculating `count * 3', ignore Fan Test Data with count >
> U8_MAX instead of caping `count'.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>   drivers/platform/x86/lenovo/wmi-capdata.c | 71 ++++++++++++++---------=
=2D-------
>   1 file changed, 32 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfor=
m/x86/lenovo/wmi-capdata.c
> index de8044ef68b8..d70fe4504fc5 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -628,17 +628,19 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *pr=
iv)
>   	}
>  =20
>   	for (idx =3D 0; idx < priv->list->count; idx++, p +=3D size) {
> -		union acpi_object *ret_obj __free(kfree) =3D NULL;
> +		struct wmi_buffer wbuf;
> +		int ret;
>  =20
> -		ret_obj =3D wmidev_block_query(priv->wdev, idx);
> -		if (!ret_obj)
> -			return -ENODEV;
> -
> -		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
> -		    ret_obj->buffer.length < size)
> +		ret =3D wmidev_query_block(priv->wdev, idx, &wbuf, size);
> +		if (ret =3D=3D -ENODATA) /* The block is too short, probably stubbed.=
 */
>   			continue;
> +		if (ret)
> +			return ret;
> +
> +		/* Capdata 01 is an extension to capdata 00. */
> +		struct capdata00 *capdata __free(kfree) =3D wbuf.data;
>  =20
> -		memcpy(p, ret_obj->buffer.pointer, size);
> +		memcpy(p, capdata, size);
>   	}
>  =20
>   	return 0;
> @@ -680,43 +682,35 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv=
)
>    */
>   static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
>   {
> +	struct wmi_buffer wbuf;
>   	struct cd_list *list;
> -	size_t size;
> +	int ret, idx;
>   	u32 count;
> -	int idx;
>  =20
> -	/* Emit unaligned access to u8 buffer with __packed. */
>   	struct cd_fan_block {
>   		u32 nr;
>   		u32 data[]; /* id[nr], max_rpm[nr], min_rpm[nr] */
> -	} __packed * block;
> +	};

Hi,

i suggest you keep the __packed here. With this being addressed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +
> +	ret =3D wmidev_query_block(priv->wdev, 0, &wbuf, sizeof(struct cd_fan_=
block));
> +	if (ret =3D=3D -ENODATA) /* The block is too short, probably stubbed. =
*/
> +		return 0;
> +	if (ret)
> +		return ret;
>  =20
> -	union acpi_object *ret_obj __free(kfree) =3D wmidev_block_query(priv->=
wdev, 0);
> -	if (!ret_obj)
> -		return -ENODEV;
> +	struct cd_fan_block *block __free(kfree) =3D wbuf.data;
>  =20
> -	if (ret_obj->type =3D=3D ACPI_TYPE_BUFFER) {
> -		block =3D (struct cd_fan_block *)ret_obj->buffer.pointer;
> -		size =3D ret_obj->buffer.length;
> +	count =3D block->nr;
>  =20
> -		count =3D size >=3D sizeof(*block) ? block->nr : 0;
> -		if (size < struct_size(block, data, count * 3)) {
> -			dev_warn(&priv->wdev->dev,
> -				 "incomplete fan test data block: %zu < %zu, ignoring\n",
> -				 size, struct_size(block, data, count * 3));
> -			count =3D 0;
> -		} else if (count > U8_MAX) {
> -			dev_warn(&priv->wdev->dev,
> -				 "too many fans reported: %u > %u, truncating\n",
> -				 count, U8_MAX);
> -			count =3D U8_MAX;
> -		}
> -	} else {
> -		/*
> -		 * This is usually caused by a dummy ACPI method. Do not return an er=
ror
> -		 * as failing to probe this device will result in sub-master device b=
eing
> -		 * unbound. This behavior aligns with lwmi_cd_cache().
> -		 */
> +	if (count > U8_MAX) {
> +		dev_warn(&priv->wdev->dev,
> +			 "too many fans reported: %u > %u, ignoring\n", count,
> +			 U8_MAX);
> +		count =3D 0;
> +	} else if (wbuf.length < struct_size(block, data, count * 3)) {
> +		dev_warn(&priv->wdev->dev,
> +			 "incomplete fan test data block: %zu < %zu (%u fans), ignoring\n",
> +			 wbuf.length, struct_size(block, data, count * 3), count);
>   		count =3D 0;
>   	}
>  =20
> @@ -731,11 +725,10 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwm=
i_cd_priv *priv)
>   	priv->list =3D list;
>  =20
>   	for (idx =3D 0; idx < count; idx++) {
> -		/* Do not calculate array index using count, as it may be truncated. =
*/
>   		list->cd_fan[idx] =3D (struct capdata_fan) {
>   			.id      =3D block->data[idx],
> -			.max_rpm =3D block->data[idx + block->nr],
> -			.min_rpm =3D block->data[idx + (2 * block->nr)],
> +			.max_rpm =3D block->data[idx + count],
> +			.min_rpm =3D block->data[idx + (2 * count)],
>   		};
>   	}
>  =20
>
