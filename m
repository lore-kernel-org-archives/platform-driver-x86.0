Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CEE3B47CD;
	Mon, 22 Jun 2026 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139521; cv=none; b=E1Ad93FrJuETlNbr364lyFYSjkU3G1ASlSCAd3Oekeivi56KHmmRNa95FsAFLMCft4HZzxZuHSBJ4BttZ3xVlK54kTXehjlldRsTWFIt4RbShPsxrkmB/ahv/1uC7oUTv4ijdHkyTJcmqd2C09s60BuJq9zVRIA39Bufkq0qyAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139521; c=relaxed/simple;
	bh=t/DkB/Z42q2km6K8CBw1XbwyTkv56Bz3l2F4/i8RsOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTYQKkJUqvUS77g05022IQ9W4rR0FUDtxzH+iDnvRAEvtNB32y4/jDHUq94gA/P91AXQOSq4+JQLLYKv9+aBUnTYYviLNWC5hNqS+v1cJ4Qpdhtti15bRgf4BMKRo7RyLnOeyTA2f0Lxcr0rPB3VtCMslwgqzYrSKbjrJFPD/LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=E5cYedoz; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="E5cYedoz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782139518; x=1782744318; i=w_armin@gmx.de;
	bh=Ipa0CPcX1TsT3QT5KceF7uTmWqd/VI++bwTr4HwaBS4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=E5cYedozD/j3prKV9RKW9t+12towjOoTHgfm1qGk0yQwYf8G9nb6px6n8mToMRzx
	 oIfzgkcpI05Hk0QAM3dmN9clgsBWdLmPTLiSidDfDSDrDIGZSZXC0prYemsgODWtS
	 JvNBIj8zZ8GfJSdEH4y2xESO/OQ+NbSc0cXxDVIKBSzeDI6p0f4ew4+zbZll12Ft7
	 SUj+XKeLwHor+OApJBi+fn4nS/oUI+4ohcItetpa+rbEE43knTCLMmnA2Z2KoV3nS
	 VUD+BN2h+ipcbRU6n9o3o4UqEFKyF4XzuVW+qyw1U5SzOpTNluvn7UQG02H4dd1Co
	 dXgvqkxG3dHSueKATA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbRm-1wNyEd3Wik-007uQE; Mon, 22
 Jun 2026 16:45:17 +0200
Message-ID: <8b505aea-2c76-4868-b30c-be34ce0eb761@gmx.de>
Date: Mon, 22 Jun 2026 16:45:17 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wmi/core Fix use-after-free in parse_wdg()
To: yahia <yahia.a.abdrabou@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260622000253.210491-1-yahia.a.abdrabou@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260622000253.210491-1-yahia.a.abdrabou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o6c+llBHrrOzTjKcmZBTGliJxIO835+8YIWDMCs8g81vE1l6SvX
 oxKCKarIfl3hWkVr534DEiJPNutcLBLvd8o7mPC8d3eLJIbkyPQBi4Y5csa54CTCoERAheq
 jrOPL6MSM7j7FhgMVHADJEtWYe3t/M+7BjgwPbbzig+lWFE2NHiUCAse5pEXyWuzPCMBpNd
 a+t1U7AUwgJd7wJZlFIXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zyw1LHn34TQ=;QAx2UWrKM3eJmmilFsN0wO7sbTG
 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
 AAgl2MCBxXKnQ2Yng+210nxAn3o=

Am 22.06.26 um 02:02 schrieb yahia:

> From: yahia ahmed <yahia.a.abdrabou@gmail.com>
>
> Fix use-after-free in parse_wdg() function by
> setting wblock to null to prevent referencing
> freed memory, if wblock is freed in the if
> (retval) path and address a minor typo.

Hi,

where exactly does this UAF happen? Keep in mind that kmalloc_obj()
only "dereferences" *wblock to use sizeof() on the type pointed to by
the pointer.

Thanks,
Armin Wolf

> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
> ---
>   drivers/platform/wmi/core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 5a2ffcbab6af..9b5bd9ef5ba2 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -1328,6 +1328,7 @@ static int parse_wdg(struct device *wmi_bus_dev, s=
truct platform_device *pdev)
>   		retval =3D wmi_create_device(wmi_bus_dev, wblock, device);
>   		if (retval) {
>   			kfree(wblock);
> +			wblock =3D NULL; /* Set wblock to NULL to prevent a use after free *=
/
>   			continue;
>   		}
>  =20
> @@ -1418,7 +1419,7 @@ static int wmi_notify_device(struct device *dev, v=
oid *data)
>   		return 0;
>  =20
>   	/* The ACPI WMI specification says that _WED should be
> -	 * evaluated every time an notification is received, even
> +	 * evaluated every time a notification is received, even
>   	 * if no consumers are present.
>   	 *
>   	 * Some firmware implementations actually depend on this
