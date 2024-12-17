Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2597D130A73
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 00:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396617; cv=none; b=kQjGJ9z8FbRt7ZfdZUxWrzdsj5tWw65908zD0CqgCVSyNeupF9HbEsL2B1bcuBlSwKRg0FgfKbX/N8Z501BwdeqatP+vV90+6g94Kq9zMZLrWHIWOD6L7nu4pqrR1LR1WV9QHkbAy40QxUORRWcLYbmolT31FyzrnyejkupLS/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396617; c=relaxed/simple;
	bh=S+xXoUmakaZEpQTiZ2oDmbZAxRcn04ftroEYkO39b5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aic1gmPDrQiZcNE3DV/8DBIKx7tt755Jv02Vu2qXY7doOL8SeJzqAgFfjhXfp9WkgIxSo3AnAaG94eppj43FEEQ2VnnJEIgvN5D1rxNliNgOKJqoTXXTXCtvI8A2Y6IWbdqq+PQ3QEQFRRR+mZOMOyAsoKx2hgrbyckfjsXuSGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hLBqtW3O; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hLBqtW3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734396607; x=1735001407; i=w_armin@gmx.de;
	bh=3wNUkPQQRlYyTWixk+d7Cmrfyl5pDm7YPYg8dVyZwxw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hLBqtW3OO7bH15nZVAuoyoC7Uty6vr7OMwBMcxqWBscOiG5ncyABW+PVkFHxLOTf
	 AKlX9dab/3lpGMUH44X3lcH8PGrOopYAecYMVDopkzRevFOcrjXMtg/p/ZJy3yo0C
	 y8w/9rNkJdXlSIQxK8K3bOJ08kHbxY+NogqZD28f+51F+RgMGk/5FQhdHYdKZ+tHq
	 534n3dmOFyU1yr1a/aPnMGrlC9Ne6McyWW8nERRRAlKapcvXvqPXYAalHr6v8NnoF
	 6O+tsYno8rZoD4Di7OJNpLrzO80fusBHz3PO/v9YLkTVI0uefRZLsB1a97DDo47ou
	 mgytcufkxePNbLV1hA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6Ue3-1tUEbO1R2v-00GnNU; Tue, 17
 Dec 2024 01:50:07 +0100
Message-ID: <f3752e1c-0702-433a-b358-c3e89968f6ae@gmx.de>
Date: Tue, 17 Dec 2024 01:50:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: acer-wmi: fix fan mode setup in
 WMID_gaming_set_fan_mode()
To: Dmitry Antipov <dmantipov@yandex.ru>, Lee Chun-Yi <jlee@suse.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, lvc-project@linuxtesting.org
References: <20241216132400.302003-1-dmantipov@yandex.ru>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241216132400.302003-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1P3AdbWtE8a7T3SIxKmRNpGjVlFh42aEcBAkIqbV4ZQLuxXJ9Iw
 +ZmbXyoqpvcJ+Hg8oSEq10CTyDzSIz5RzoIh39ah+Bg3WiR+J4hYEfDCT5GcdTutvQlpwvP
 RYFa6bzGCX2/2LKmHPl0k/k8z6Oe+q6jL4/j+KsplINOalvqnXWe5d1fSLY5H8BdzX1LHGL
 bknFzzsX82jXmv8sDGVlQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iBlA2Mo/1+U=;y1YStH3VllWKJbWWAPGr1maUtF6
 aiXndRYN4uO5TXHf8SgEQK+IQFGMh+3fkVRSgwwLNDL7RFnbi6DBKhx4HdAGuALPkitZvAozE
 TLksCd9WoiBYfDXg8IQKIewew1N7Omq2Ax4KyERkKC0VO95qJ7C2jqpy5urNzRZMHdJwI5+tR
 CbcmSWlK4L8VhLK60MEOOSQE0FVoXF/JI/4pAoy6NbPajJ7UMjNHTS/PBtKZwTwBLLCMmu6E6
 3DBrqf+QH+OQ4GZCc6vtIzr7pz0sO9T5Bxm4bJnLTY1xHGlLy7BykhrOFB0vvHgqkX/YaDruW
 8w99UzaemB8lr2qRBao2gIq7zqGN/OkghzDZi4JaGmjf9eb6yxXbKAjhTaUJD2TEx6EzCjjEV
 708QaDX71b3+R1j7cyBCLtLeZxhUisiCve5PxykRwNCenYp4sdPzmkjZgDK8tR2MZnLnKsl8C
 yKnIzdIbBqQNzC73mG+fvj4McyDxyL4sb51luuX2T9pRNgzKQi1P+ZEUPsCnwbgv+WJUfaTi5
 jKwu2goCt1qvlDhnKwI/AD+lsLWMXDUvp4yhIu7EzIgcUlw7fcGPj8BoPLjMe0EtEkErzSJet
 0WrIFyR/yw+hrlwPbB6tDBxjHU1FN6UXEnJjGxpPCrmPYKYNxBNsfVdOaDlE+HRCpuD5RYC3A
 fZO5QyY//aR+DUPrXdw9zUGkg9tEaApdclumwRAL8tPLIfO7sYIWGHyy8bBnK6B960qd5fja3
 4ZRat5Bbv8iRLHjX5873OP2henr44kNIRABHv/yj+ceSN/VVoj1D2Dy3BvDJrtfECsC/yVIJY
 d5CNlSt1KsuYOSBXN1sFuFoYvWTKOx/A7k6BzHoCLtG9t7r6gXqkcuJlYP6Q4ytPY9oeV5LCC
 YlpO3A0OW4yHBtUPcDOY9bMSYUFuc+7vb4j4FcXhwTSFB3xZGisePYd9vc4W82jBGYGFnt/xj
 wRQnZBJx0+1hyHdu5WG+Qtu4RLgajm/xC9aP2BkmRs9BBBi/uz6OSgUFcOCMO753yLtBvxNr9
 uCsGKAKVrcTFmQfQgy2ilBZtSU2JXaHYZ3HTE5popQgCZbX7QZV5KptsgnoZbH1aLpLPDfoz/
 C9lDFV7H2/Zyhy2VQzgmcf1baBOys1

Am 16.12.24 um 14:24 schrieb Dmitry Antipov:

> In 'WMID_gaming_set_fan_mode()', most likely the (whether CPU or
> GPU or even total) fan count is not larger than 31. But still
> cast everyting to 'u64' just to be sure that there is no integer
> overflow when performing left shifts. Compile tested only.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>   drivers/platform/x86/acer-wmi.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer=
-wmi.c
> index d09baa3d3d90..9be6176c0076 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1504,17 +1504,17 @@ static void WMID_gaming_set_fan_mode(u8 fan_mode=
)
>   	int i;
>
>   	if (quirks->cpu_fans > 0)
> -		gpu_fan_config2 |=3D 1;
> +		gpu_fan_config2 |=3D 1ULL;
>   	for (i =3D 0; i < (quirks->cpu_fans + quirks->gpu_fans); ++i)
> -		gpu_fan_config2 |=3D 1 << (i + 1);
> +		gpu_fan_config2 |=3D 1ULL << (i + 1);
>   	for (i =3D 0; i < quirks->gpu_fans; ++i)
> -		gpu_fan_config2 |=3D 1 << (i + 3);
> +		gpu_fan_config2 |=3D 1ULL << (i + 3);
>   	if (quirks->cpu_fans > 0)
>   		gpu_fan_config1 |=3D fan_mode;
>   	for (i =3D 0; i < (quirks->cpu_fans + quirks->gpu_fans); ++i)
> -		gpu_fan_config1 |=3D fan_mode << (2 * i + 2);
> +		gpu_fan_config1 |=3D (u64)fan_mode << (2 * i + 2);
>   	for (i =3D 0; i < quirks->gpu_fans; ++i)
> -		gpu_fan_config1 |=3D fan_mode << (2 * i + 6);
> +		gpu_fan_config1 |=3D (u64)fan_mode << (2 * i + 6);
>   	WMID_gaming_set_u64(gpu_fan_config2 | gpu_fan_config1 << 16, ACER_CAP=
_TURBO_FAN);
>   }
>
