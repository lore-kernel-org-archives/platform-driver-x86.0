Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619085;
	b=l3KgL6X35U53ICVFh9rAZ4WbSXr14I/C1aagnS5rfyd9uwyXtJp5tWcNa9ocF/6VS0/6
	 a4HDkEfOozNOXJzDD1V8ivJ3wkU0kx2oQdFqAbSR6w1OPESIY7Ezram44y+9u3oAg3bDI
	 hmTXHWKRDsmBdm2jAY+hwc3cdkzVHGKvfuLNCK+rzffBZRxXdMw6HqReo2va52WTGoooC
	 Zpo+PIqDKS/VM1CYcrMwMBl24KZeV9daal9r3jQq90fI6t8ZJ26CphYqyM5iG9F6vSE/e
	 1tAS+OuiQwF5u22tNSy2wgzKl/nScMbu/nGiZWQ0Gtr0IEeYEtohQqyOe4lU8Dtqgqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ugcOTaVoHQDMbUWrr1UR/TQtkHFQCW4Iuv/ctdtGhzI=;
	b=nkUP4Z4R/JqP68jx5CVw+Kioz/Xd1DarMDK5zZ/QBRPklHrjXjcHVNh3i5RidoaNpIqQ
	 4Tlb8MDASIK8DP5Z8M0uOJ68hFo68Y6nloIbc/uKPejMTgbVcUFcziZpCVl2vhbtfVpHz
	 n5qiqXozz8vAAl3pmr5qzmzhyuUazQ0WfSFGwEI1g9jKHdV6ly6PyzSm5TO8U3OqHyc1Q
	 FlMJKLbdwObuLrk/fCes+TsPmPNIL4w73ONWZ3SRXViwA7hIdikt7/noRYNicaGzgTieg
	 TzFsHvy2vQJlP+29uYUgRWGDDDtbIzsp8NW68Gp3Uc/wgTKeGnUN0FX8aT1t47oVvhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtH2HRPI;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E834606A32F
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 11:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E834606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtH2HRPI
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a05b210703so973477b3a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 03:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793619084; x=1794223884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugcOTaVoHQDMbUWrr1UR/TQtkHFQCW4Iuv/ctdtGhzI=;
        b=LtH2HRPIaLKnYss9nw4YboHq2Numnvpkuckuo5SCXJ9lsE5P4OClzjMkRyNe+ErhfZ
         eKgDeCwL1cHfP8eMh7BC6qFDhsjoVaZ7A6U7FMGmTK32br1lk3g7tyjGzPn+8TmliqdP
         8UuQoximhZcygAjeORe8ogjegbs1h2jEu/wjjcY3LD0C6xWnaGUBjM+Gcr7GaWu558ml
         JES3VW+6ysZ6XbKOqcZ16HZ32hCsPACqCfzl48FPRcDPWfut/6o+3ANx2qD7868x/08j
         sLfpjM5aqbuf6FRJg+mlxP+zOcaKEpZQ2EYPHKkQK9Bfts9WjoubGFlZXfn9xjkPyfdy
         xppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619084; x=1794223884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugcOTaVoHQDMbUWrr1UR/TQtkHFQCW4Iuv/ctdtGhzI=;
        b=IUX25Yj81336ekEU+CHREJEvihkpslwdW343iY8MVDalYhOyEZsZBPAVUdiFTC5qqh
         ag+7EA00CxUrOvO6sVOWL1+X6n92PDBDb7ScLW9U/uhwYSUtkS/Q02y2s0PanesLTsp1
         xy9F7F7UeXWaJEBKV90HYIEiwWOpW/C47YPxvioffF0OF427WyrRGw+aNXf4CFM3RJHu
         PfWuViRPMPuJpq6khbh3as1xERBCjrnRsQOYJF3k5u5oVdWneU4Zo3P1N4ipI8P8xn4S
         86vrG2t4UaTqXzZtYl9lGe5lGGI/XyyHiyEfz3cmWjinSaAMbZASzrAf1AKE96maUa9O
         HLrQ==
X-Gm-Message-State: AFq9FYLGG95dRmqQZkIgPGbB3LXoUlUNNTBFUvJeAXEY3zxr0++BRD9M
	xmQOOYRjX8f2kukLzKsB4icyPQ+QipJdE/QqoGFBNtES1Og5By00Cv3i
X-Gm-Gg: AYBFou0ZzYiS+BB9yx5LoHlNeBBAP704gh1+Q+//65iLSlAgjEhKyW5blCt+xZp//Ts
	V9xRJ/MnQBCtYycrRIPrl6cgSMdLx1q9AXf2Jom9fbP7HQxhaAW/AZBKNJQ4cxWeVZZd04sQUny
	aeLLF3fcP49lEgeCwS8CaQeavE7MTR1jRdZfzBDuOREDcYMMSbdV6Fdp6UWjNbEfekJ498xaav/
	Pr8BxcO2Jm1tLvnjqu7+wnoNRvr9qYPpIdx5lJNiHUoidTWppxJ5exH0G84w4T8QHtoOtoOicaR
	Hy2UBytz7vxWjMqYnPIp4gG53wZN6NKVEYmK5Q2YXJaur9dMaPLEil/ojvBlDU8ToSMx7gA5x/V
	mcliE1aUElVyg+fdF2bYtWR0FLoCgzG9EC13VBpJUMf7S1iuIQ6PKdnYKb8qJb/cNnDk+iOzs5e
	YuYuvkJdVeWGnM2CyDjUzqiWEliLAHvOwLaFfSUBwvB0EkZHtXSKmDdvT1eICKfbiAUgctOtSyT
	l7iHs+NZl5doctOKqJp6sq3Z7HdnJ7nKc9mGD7IMQpX8XQGx01eRe/+ggFhUGJyonAsB8C39Wlf
	NSjHT8iOR43Gr6wlUPtZjLN5mdnQAvMUzO86Y4ktzzcsuTMCz/be7WbePuolKztwIuH/
X-Received: by 2002:a05:6300:6cc8:20b0:3eb:39fd:bab3 with SMTP id adf61e73a8af0-3eb39fdd9bfmr3330041637.32.1793619083924;
        Mon, 02 Nov 2026 03:31:23 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:5bd4:8bc0:479b:e7d0? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm3066396a12.20.2026.11.02.03.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:31:08 -0800 (PST)
Message-ID: <3e44b454-922d-4a1a-8ffd-f77b4cbce654@gmail.com>
Date: Mon, 2 Nov 2026 19:31:04 +0800
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
Subject: Re: [PATCH v3 1/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book
 Pro 14 quirk
To: Chris Taraszka <chris@miget.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda <matias.civadda2342001@gmail.com>
References: <20261101161814.1325847-1-chris@miget.com>
 <20261101161814.1325847-2-chris@miget.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261101161814.1325847-2-chris@miget.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 00:18, Chris Taraszka wrote:
> The Xiaomi Book Pro 14 (board TM2424) implements SystemPerMode with
> its own values. Its firmware ignores 0x00 and 0x01, and GET returns one
> of 0x02, 0x03, 0x04, 0x09 or 0x0a, so with the default table balanced
> and balanced-performance are no-ops and reading the profile fails with
> -EINVAL whenever the firmware is in 0x04, 0x09 or 0x0a. The failed read
> also aborts system suspend.
>
> The firmware passes the mode to Intel DTT as an OEM design variable.
> The DTT tables in its data vault name the modes and set the sustained
> package power limit (PL1) for each, by power source. For the H484 CPU
> variant (H404 has the same layout with lower limits):
>
>    value  AC                 battery
>    0x02   Silent  15-25 W    Silent  15-25 W
>    0x0a   Silent  15-25 W    Silent  15-25 W
>    0x09   Balance 35-45 W    Balance 32-40 W
>    0x03   Smart   36-37 W    Turbo   50-58 W
>    0x04   Crazy   50-58 W    no entry
>
> Map low-power, balanced and performance to 0x02, 0x09 and 0x04. 0x0a
> selects the same tables as 0x02, and 0x03 gives on battery what 0x04
> gives on AC, so report them as low-power and performance without
> offering them for SET. There is no balanced-performance mode.
>
> The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
> so skip the AC type check.
>
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
>
> Notes:
>      Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A, H484)
>      with this series on top of v15, loaded on v7.3. Firmware mode (EC 0x68),
>      DTT OEM variable 1 and PL1 a few seconds after each set:
>      
>        AC       low-power    0x02  ODV1 2  25 W
>                 balanced     0x09  ODV1 0  45 W
>                 performance  0x04  ODV1 4  58 W
>        battery  low-power    0x02  ODV1 2  25 W
>                 performance  0x03  ODV1 1  58 W  (with patch 3)
>      
>      With v2 on battery, balanced set 0x03 and PL1 went to 54 W.
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index a431d3fef774..63fae12ebd83 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -113,7 +113,28 @@ static const struct bitland_mifs_quirks default_quirks = {
>   	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
>   };
>   
> +static const struct bitland_profile_entry tm2424_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
> +	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
> +	{ PLATFORM_PROFILE_BALANCED,    0x09 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 0x04 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, true },
> +};
> +
> +static const struct bitland_mifs_quirks tm2424_quirks = {
> +	.profile_entries = tm2424_profile_entries,
> +	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
> +	.skip_ac_type_check = true,
> +};
> +
>   static const struct dmi_system_id bitland_mifs_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2424"),
> +		},
> +		.driver_data = (void *)&tm2424_quirks,
> +	},
>   	{}
>   };
>   
I'd prefer to have this applied on top of patch 3/4 instead, so the 
infrastructure is in place first.
