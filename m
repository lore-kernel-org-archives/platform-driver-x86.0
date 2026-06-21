Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346F225B0A0
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048764; cv=none; b=Xgb0lCVp2IdNVmCEPHiX3sIzcByBqvRVdnqXBsvxbcFzhlxG5aMvnjKNattVbNU7uqICJAvQc63fHXMMQSWv7kBwh1K/KKKHYDRmvcfX9FA6O/RyoORhtszXCRfwWJS2N5FZFcQF5VZB2fmfpFvNnJGf3aTBBg8fCdx0q3LSl+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048764; c=relaxed/simple;
	bh=xshPrXaZmV+6WhX4m4kUj5EW27Bxu5CWKNJswRWbQAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSRrtR1JqlSoKwJaR+VkYRwJhVoGB1FlaPlbZKrqRSShTXrxFvlF2WM3/U/pdShtLDB4wBRKUlLd8rEvr9M1tnQ9FF5ejfdWMAVX8XSU2FRCVOSiSIDFoL0YMjj2D4HwuKD9bZwzoof+vyLWNyW//v7vkLM9an+nXpBYuC0bjfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wxb3Ev74; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wxb3Ev74"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-462ebd5d37dso3556271f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782048761; x=1782653561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=etw5hfYSEmcIv3TvqkHk6P9nHRQBB1/75X3Ozpc/CQ4=;
        b=Wxb3Ev74dWynck6Bmmt6sDfcoqohnXJcwB5ZxhqNNwfqjDCLllY6nZskidze7rwOvr
         ENPA7iQgmlsFE8dupTJANAoAqvpjWcNEbKihgTjbmZBBasqnmzFqDPjoyzqQ6YeUaqmF
         aIQzLKMQn9zdPC3abM0O8ncK9x4Yp4b6Tg0v9DKD4NT1/CNgaDHMATSZRquzmSk0m20W
         WRUuX64TqlBfL28L9vZ1NYq8WzNTtjVH5xyjw9CqS+S9XcRFAMI91haUPKqbHU6nNMGB
         CNnEKuU6AgJZtC1DpqzaWNOIDFDX5eOpHmWVEk7C9l39CqP8/8kQlWde/dwgQq0UrD/T
         SdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048761; x=1782653561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etw5hfYSEmcIv3TvqkHk6P9nHRQBB1/75X3Ozpc/CQ4=;
        b=V3KVL/fd4uDTMzE+oUxv01DCXS1r2DebZNh6Fti6wLF6InQAeulZke1N+TRbUWecCa
         pwHenXNz6J0P7OlEvsgcdK4kxAVRHlSnXbBTFR/+awj5nlKS7+PwCXI150deGlrq7o0B
         W+MrsVUwdmtN3tJyzl4oCGcFVccweONFzqwSjN5+ibShLW8bky2upSPnFpGkr5SLXbt1
         xHErzZbqAMI4nrpyBFBpulPZ7Tl+xLEDDRSJrYwxMrsxOMBkYqDG7S5CBh4HXqb+6Rfi
         zUJ35sMlWeob+Vo/yPlu6VVPoWD9WH4yENzJaIIDZR/I6IDpgcUs6NbIQ8eHCyCu/HJR
         DeVw==
X-Gm-Message-State: AOJu0Yw/gh62UyUmmsjZEgVSOptUPXOoewieshBZNj4gOHR0VxXnQrvy
	AQ8IXHaP6yTqlSLS7J+p2XeH6bigN9H7xZwt/BwRDynOA8kojs3/1864DKlmnA==
X-Gm-Gg: AfdE7ckBT18xyomt56rcXpHDAcSdGROvbWzpjtaNtsb2e9uW0lQAtKMvFpZ0tpmaZMH
	BvLxnzXoF0+M5OXTmqHkjAoNkb5zvMJ0eM1tnkYhYY8LRGDdGsy8UHbwHQqfQE9eMijFPYm3dYI
	e2+RzYlSwAFD+IfWa6UICzQ/Y22jc0q42WWybLPQAm/Bt8vUQZRmGBsGJlKhlQ25MuvJjP+3kR1
	pHcZ7lzIfEpVf3xBMaRXu8ysB/NORO1pxTHNTll0YVheFoX0O6oTvB0S7cO+7rmoCqu4FwXrWu/
	5dkC8gv3S40gB9UM6Ps550Hltz+QE/IV+xcG0R8X3MsDzPkCbca04KnBh0i9LG4ZOjZelA1M2Mc
	US0mmg5BJZLD1hDcLsAF/1TIlKRs7x4Trgyoiy3OI7R5w94zada5NSnijwsyegO6F+bDjBoVygU
	vBqDRwXZvtOv5jcyMruZeK0op/dTGymmPNrCVhg2mq9KrbWkNW5B8k9/0XhqetV/maVg0JlHIYM
	yrw4GwP13ru3xXvgAm+7KvVlA==
X-Received: by 2002:a05:6000:4699:b0:45e:f381:cd8c with SMTP id ffacd0b85a97d-465021210e5mr10840886f8f.30.1782048761409;
        Sun, 21 Jun 2026 06:32:41 -0700 (PDT)
Received: from [10.77.100.5] (ipservice-092-209-213-109.092.209.pools.vodafone-ip.de. [92.209.213.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666712cceesm16955817f8f.35.2026.06.21.06.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:32:40 -0700 (PDT)
Message-ID: <6a59a921-c799-489b-a0da-c926588a1d67@gmail.com>
Date: Sun, 21 Jun 2026 15:32:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] platform/surface: aggregator: Consistently define
 ssam_device_ids using named initializers
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <4421c8c959452d8a717ebc7cc905ad9c2912680c.1781522576.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <4421c8c959452d8a717ebc7cc905ad9c2912680c.1781522576.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 15.06.2026 um 13:28 schrieb Uwe Kleine-König (The Capable Hub):
> The .driver_data member of the the two struct ssam_device_id arrays were
> initialized by list expressions. This isn't easily readable if you don't
> work with the Surface System Aggregator core regularily. Using named
> initializers is more explicit and thus easier to parse and also more
> robust to changes of the struct definition. This robustness is relevant
> for a planned change to struct ssam_device_id replacing .driver_data
> by an anonymous union.
> 
> This change doesn't introduce changes to the compiled ssam_device_id
> arrays.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> the mentioned change to ssam_device_id is similar to
> https://lore.kernel.org/all/cover.1779878004.git.u.kleine-koenig@baylibre.com/.
> 
> That allows to get rid of the casts in these two drivers and thus
> benefits a bit more of the (admittedly weak) type safety of C.

I assume that will be a separate change or am I missing something in this patch?

> But IMHO the improved readability alone also justifies this change.
> 
> Best regards
> uwe

Looks good to me, agreed on the readability part.

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

> 
>   drivers/platform/surface/surface_aggregator_hub.c      | 9 +++++++--
>   drivers/platform/surface/surface_aggregator_tabletsw.c | 9 +++++++--
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_hub.c b/drivers/platform/surface/surface_aggregator_hub.c
> index 8b8b80228c14..541e9180f976 100644
> --- a/drivers/platform/surface/surface_aggregator_hub.c
> +++ b/drivers/platform/surface/surface_aggregator_hub.c
> @@ -348,8 +348,13 @@ static const struct ssam_hub_desc kip_hub = {
>   /* -- Driver registration. -------------------------------------------------- */
>   
>   static const struct ssam_device_id ssam_hub_match[] = {
> -	{ SSAM_VDEV(HUB, SAM, SSAM_SSH_TC_KIP, 0x00), (unsigned long)&kip_hub  },
> -	{ SSAM_VDEV(HUB, SAM, SSAM_SSH_TC_BAS, 0x00), (unsigned long)&base_hub },
> +	{
> +		SSAM_VDEV(HUB, SAM, SSAM_SSH_TC_KIP, 0x00),
> +		.driver_data = (unsigned long)&kip_hub,
> +	}, {
> +		SSAM_VDEV(HUB, SAM, SSAM_SSH_TC_BAS, 0x00),
> +		.driver_data = (unsigned long)&base_hub,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(ssam, ssam_hub_match);
> diff --git a/drivers/platform/surface/surface_aggregator_tabletsw.c b/drivers/platform/surface/surface_aggregator_tabletsw.c
> index ffa36ed92897..13031c329553 100644
> --- a/drivers/platform/surface/surface_aggregator_tabletsw.c
> +++ b/drivers/platform/surface/surface_aggregator_tabletsw.c
> @@ -622,8 +622,13 @@ static const struct ssam_tablet_sw_desc ssam_pos_sw_desc = {
>   /* -- Driver registration. -------------------------------------------------- */
>   
>   static const struct ssam_device_id ssam_tablet_sw_match[] = {
> -	{ SSAM_SDEV(KIP, SAM, 0x00, 0x01), (unsigned long)&ssam_kip_sw_desc },
> -	{ SSAM_SDEV(POS, SAM, 0x00, 0x01), (unsigned long)&ssam_pos_sw_desc },
> +	{
> +		SSAM_SDEV(KIP, SAM, 0x00, 0x01),
> +		.driver_data = (unsigned long)&ssam_kip_sw_desc,
> +	}, {
> +		SSAM_SDEV(POS, SAM, 0x00, 0x01),
> +		.driver_data = (unsigned long)&ssam_pos_sw_desc,
> +	},
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(ssam, ssam_tablet_sw_match);
> 
> base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b

