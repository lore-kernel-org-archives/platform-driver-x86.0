Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764814;
	b=yNpOvSskAoD9hhmZvTp26OClF6B763LozQtpaxUcZnrT/Ae5DN65rnNwUG8aYtq6TD18
	 wfJgpKk0kUw6fDx7hXQYfrMt72RfrL7d7YuEHw2GuMUutgdIQmD6t+1W0qDdnV4goRCEw
	 awJmLFnoSwcIDp/RG4DqDC5Lgn7P5XUctSRD3fqR+0kpSLPExILiFB8inl/R9A4pAOfh7
	 M70IEYdppweNozq5tpmqaTEgNVBC6IwgstF5xN5zzWwsJai0dzySaZk5Wb+3Xk3q3ehFQ
	 3PaRxg+AJpyDHdmIpN25u6UKftsgMpc7py3WV32UHY3iS/E+izCJgbBDYThPlMwWJ/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JsH8SNCxhbeLoCinL6Hb4gIpMGSz+nZ2pNrnlE7TQjQ=;
	b=uD/ljJLwfkGxI3UVmiw88VvkjyiWUqujW/YrcdL+R2BkM0bUL5t/ZYiidZ+6fblw6H18
	 2sM69KemGpK7GBJ4aCrSsEt16x+sAeOr761nJBXJJgusenNez9A7QPa2qe7mnDgzoxmup
	 Bp8LSQfPXi2jRQagjvYcPd+C7+nb4gEI49jgF1PQpsrVjGm26p8Ju6tZh+re420q5mtvC
	 zxPhktfv7U4OdIwcIGKoVl1T5bV5HCkhgLtmyxA6dJ8drJij9eiXASMFiNs3YJwDUFcTn
	 meeK435/+TieSVs+ZYPDv8/kwCKtXNWP6fLRF+5n/g6m+jo3t/+GYm55gDqwTGT6NSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ohf+ILZu;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E625606A31D
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 14:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E625606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ohf+ILZu
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso550375a91.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 07:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764813; x=1793369613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsH8SNCxhbeLoCinL6Hb4gIpMGSz+nZ2pNrnlE7TQjQ=;
        b=Ohf+ILZuTuqqsWh3ip029KlNrB42M8sRA23kJYWis8tGVgMjAVRSv5QR8I+xmQn8S3
         RPmHyAd4g5ZldCRmORKUpkqJs8qLPMN40yvngjGbMdkrg0APqO1B8ETubgLDbjGIScPz
         CHIaK8X/YkqLVdfy9s22ju0Va3qgEzfuQa5L7+KKuvw8na/NhsktzTPsVjTvsTC49xU3
         UaNRrHrWdsHJgPmZ9402Jd4mJ51AFw/n4yThqfrgjEdP9eM4Ol+z5lzvLdfIL1gw5KCO
         odxnk8wGCq4rIdQSoUSDc+FdZ2JzYJQfTBo/iofw11yA4MYnGk5jOs8FtU3/d1ydSWdt
         /N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764813; x=1793369613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsH8SNCxhbeLoCinL6Hb4gIpMGSz+nZ2pNrnlE7TQjQ=;
        b=m9x9lvWnDEN9TDewvh1AA2VbMGQ+rNxZjPjRMkMg324L7VBYvcFB7qsj6tO4glR0GS
         N4y5XXiBI+5ROhy73Uxvn3zZFMp7D1z4h+xU4MwRwyvQ5SL9/qFEe9MJzxjYhBdVws4h
         6rdJGFa9lkx1HvKDoi6iQEUgNZZTFhbsSvZvjBrmvAb6EA/cXzkBiwpT9DI7T4hxKuQw
         sm7kZBR/Skfri32s7RYbn+/waOVCH4gdU5TXJ/4EDEsoiyRp4RWlxrq7AM1WIO24b4Bc
         Gd841WphLwtgGIUW4jeQgk9Emm1sq/R6Su/KUikG342Q5sS/XWl9hx6oO1u8+HH60cNY
         qwxg==
X-Forwarded-Encrypted: i=1; AKwUvBzFQTF3o/1hIUp0yRdeUO31BO3ffSQaFx2eHQx0KV0/N0VfEdDoZEcP8709keeJWAeG2qvAjFwX3cnP0tPDKP54OvfL@vger.kernel.org
X-Gm-Message-State: AFq9FYKSo/0bcR3QCR7ao1nKa+52Odr00UVzplIdHMbRXOsRavtqY3dv
	DaXupaRhxQ68uEdk9gYN+ESspk0aRPeKwxc94Ob6r5VDSd5LY05GfQjyUaFK4fo0
X-Gm-Gg: AYBFou3mB17wfsBpPJt+I3CXShgiU/R0sA96KVuctxHm2dxDWUOeL/vAm8ia51H4Q8+
	0x+7azWuMiol22HSEVLEhgBtPTGqbOaDBWkiECQ8RzcODJ0VjvFJ74uR2irpysTv8cyVXThEoX/
	4BkSjGM0j1wKNEqlVLO1QtkXNCkvpXPm8ElG82y3BQ6bL6Q+TYInozcCyt8cP1bk80y7T2vN+z7
	Y6lftPCRptcww2GCBtyt0molTFTa4N54D6EdxB2uWQhsw0VgBr0EjKyY+saAvXmqKsVwVXJqZlG
	unlX1VkPTRpMVhGpldbMr9cjS+Wr4BoON/N59KrrwrtWCwTFcQUY9S14gm5uB/lzjCWotwtG4BT
	RvegJsrFKDEuARyydXIdWu93arUUqdZwYweq/t22/2Yx/fwn7x2TjK+ink/cMo4791RsYkm46Bb
	zkizLFQUKPGw/VdeKI16FQc04hqbwjG8YlBLj9KVqSqpoib9Yrc27sunwP6WH8lErfwM4cWZOv3
	SlTW9e1Td5YSudwU2xio/sXHJp+NoKH6ezK6UV1m7f4R33mHk6YLgrX7oM0xhe6eSN8C3gfwn05
X-Received: by 2002:a17:90b:39b0:b0:3ad:6781:da66 with SMTP id 98e67ed59e1d1-3adcdf97f7cmr1890604a91.23.1792764813453;
        Fri, 23 Oct 2026 07:13:33 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:1151:5fc2:5d3a:5838? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add2a132f6sm1233313a91.3.2026.10.23.07.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:13:32 -0700 (PDT)
Message-ID: <97b60bc2-85a5-4830-a510-e0aa9a0ccbb6@gmail.com>
Date: Fri, 23 Oct 2026 22:13:26 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: bitland-mifs-wmi: Fix TM2107 profile
 handling
To: Matias Civadda <matias.civadda2342001@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ilya.gladyshev@linux.dev,
 ilpo.jarvinen@linux.intel.com, hansg@kernel.org, chris@miget.com
References: <20261022150221.26879-1-matias.civadda2342001@gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261022150221.26879-1-matias.civadda2342001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 23:02, Matias Civadda wrote:
> The TIMI Redmi Book Pro 14 2022 (TM2107) stores the MIFS WMI return
> code at the end of the response and uses different profile values:
> 0 for performance, 1 for balanced and 2 for low power.
>
> Add a DMI entry using the existing quirks infrastructure to select
> the correct response layout and profile mapping.
>
> Skip the adapter-type query on this model to allow performance mode
> with its USB-C charger, while retaining the external-power check.
>
> Signed-off-by: Matias Civadda <matias.civadda2342001@gmail.com>
> ---
> This patch applies on top of all patches of Mingyou Chen's v13
> series:
> https://lore.kernel.org/all/20261021123414.25516-1-qby140326@gmail.com/
>
> Changes in v4:
> - Rebase onto Mingyou Chen's complete v13 series.
> - Drop the separate payload copy fix, which is included in v13.
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index a4c341ffbb9b..59b930ef8729 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -116,7 +116,28 @@ static const struct bitland_mifs_quirks default_quirks = {
>   	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
>   };
>   
> +static const struct bitland_profile_entry tm2107_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,   2 },
> +	{ PLATFORM_PROFILE_BALANCED,    1 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 0 },
> +};
> +
> +static const struct bitland_mifs_quirks tm2107_quirks = {
> +	.profile_entries = tm2107_profile_entries,
> +	.num_profile_entries = ARRAY_SIZE(tm2107_profile_entries),
> +	.return_code_at_end = true,
> +	.skip_ac_type_check = true,
> +};
> +
>   static const struct dmi_system_id bitland_mifs_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2107"),
> +		},
> +		.driver_data = (void *)&tm2107_quirks,
> +	},
>   	{}
>   };
Reviewed-by: Mingyou Chen <qby140326@gmail.com>
>   
>
> base-commit: 893018d51f27ec0449155b0afe371aaf65380630
> prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
> prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
> prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
> prerequisite-patch-id: 2bbb1371b506f5a07a1e6e69d34217195cd5ffcb
> prerequisite-patch-id: b88e60d7915ad055b67478359bd9c6c9482d8433
> prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
> prerequisite-patch-id: fbf70405992dfa75ed02026d97aa16e1644fbd42
