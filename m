Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006562;
	b=BFAm6/zQJ8RSxjpSBqNcf+k7Wl3V5UC2RU9CfLlCz5NCsMtIbU8rugfKF1zoadD4bWGq
	 cNCXY/l7xX3+3+Fy7t0uMSVXFOD2QgJHfvMN2AsPHzA4OQ3HmSqGnitkO8MI8wymQ2OY3
	 ZB/J3CymRLVwF/+BRTA/o279IeR4apoJ5V5w+H1qNHC6ib+WZxTlRK0KaVHr2xFo4EBx4
	 yfCy6jqjrZ48s0xqN+O3YQtuqoNiFXGFbDzXQ6YSUzFsmG7RzcNeX3+8kFohwn/Zgo5aX
	 HxlnWH1PSd3P9mEoH8xy66GKLB5fBQqIjEHeBosSCU1TJ2J36MyYAcOGbu9CIx1Y5ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=30QwHpi4RQGrlJA4Ni1ieESAKb4LlkBBANXTStC06eU=;
	b=XinQeHif9PAVcJ3yRvRe/03zCnrOag6hEkgfxOQSuSMfIJ5bMdT48ZFNYKUEDsu0cepM
	 IO5kIej1GJw2gDadO6KDQ/iSXU33etFRmskeoT7hVaYoS4S1ABEDugQYuaw65K4cQ6mc7
	 aCtp/7AZQjJh3Q1EU9D/8uWQgmYYQm7qKyrqBcoxpgxwasKKTfs04Zmg6b3alX/toV3WL
	 LuW2uk5QPqggk2TMJa2+Gn4XDikNIDzuxNdzzoTIePRVVtA1H8z7kUq1c0vFD3X2kBQK8
	 wjQ5cLJolxAUwVLYX0LVZCtUKPz0a3GgkYyFTEgr34bzlwa+QFJW4zSNdJOYYySqfAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SqEKp91Q;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FFE606A326
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 09:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67FFE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SqEKp91Q
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd623dfe420so1778275a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006562; x=1793611362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30QwHpi4RQGrlJA4Ni1ieESAKb4LlkBBANXTStC06eU=;
        b=SqEKp91QEemx2ju6xjRBnie9/9djcxRU+HZEFSiSRyQWs+ck13SCYuzwf5iDKE3O8b
         h9juM9RlXBSS0KdREyQ8vvTsvLQCrNqK3youafF5HBvGBH/eCKkazk79Joz5fJFm4ZQX
         +b96DLvSHiCQ45HZD/vDwgokbXbNuQUP5S74bpwWedQZRh70/dNYZAK3DZB+XANsRLFY
         kfZtKSWgEgBCdgvbJxkr2U956y4A91JIDPEhds2IE13W0maedIO+xOCW01n0b1Wds8P+
         VcJXT5VaDaHaZgPVWama7AlVlFBPDZfscJDtLcsCAbnYVHAej+yz+6wYOclPjEEujoI4
         BbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006562; x=1793611362;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=30QwHpi4RQGrlJA4Ni1ieESAKb4LlkBBANXTStC06eU=;
        b=ebsAmpBi86doGpKXpath3CNSYKZcrn0ATdDghYWN4r0tVDyG4Tv1nJWT0VG8pzJnFX
         stQ4hAbmpR90x8cro8XgCeqR/qvrEnVg22uL4P9UcDSo+UWBocbBa5wBzGtnJLOxvJ7H
         8geTIJ9yi1zbfI/tJRBSftydPXwG05GWaZ889Fs02J1UJ5KmsFsGvB3lDNoOn3n974oX
         dj5YeRv8phmtpBi9yDI9avUCb3QimX9IyVJMCq2fvzykoYoMteALPj3xozqjk5WTjNt1
         hcM8t10FkNh0S7GE9f6ReZJ5y/wA5YWedxsSXgGspNpVAml7HMwlkT4D2zwqOL2LvRXl
         qkiQ==
X-Gm-Message-State: AFq9FYJN9jWxO8JPK1aax0+2oN/mCKPGmA8C3GlgxrKuZ4lLUnjUJU8n
	+cFX675kjRTvwGEvllzdH6qd7yNVX60ZQ8PMlWz0DItPQ7+Miy2MtCuV
X-Gm-Gg: AYBFou2N2Jtrn/Q33REEnCvou4AVFqMJZ0UBW9cBmP0KHmzDmYmQrs/XudlpZ3fFwCg
	BIL/nVnSBZZbX/rM0UmA+6pkW8aWCAVTbhoTXCz+6bKPsuU9f2IjM/1Z/ajwY+iYb1Eu0K+KjxC
	7RhDgUpgArkcW3O94XLd11xJ/zGwpJ3s5NLgpf5iB06XsRW6SVFzH546+ZdvKINVvEa8Gotrpwf
	+2PuYLBC1m7oi9KYxTp+CeGxJhjF0WhCdBzTuWTLedbdusGDlaINIE/KxUvkE9lEj8rj6qBlnK+
	XYqog59AWt+giNmumhvlbOmFNtrUy1T/qD9ryEJpvhFBMZBk2ykwVHk/BvfJnOao2VczrHyYVif
	40MrjNVd/9koEwZjP5cFMDesB91wn7ivEhSoWw54NNuR5eYd8AFKVWngqc38yzHEETn6AyEv7d2
	s/FrZcluTaonjuj5coGWxoIDh0U8JGWR1e3YCtTrCd9SqmxGW2+W0vyVVclICwAABGMGy6jomG3
	5YpS04JEOoznEnWLqSS3v/T+DyUQdlg6cnymn2p0eYsuH6vBNOPNX0+KNDF2MJOPbrsox+9MOBS
	ZIYV04YrNqNz+MzHuqxzAg==
X-Received: by 2002:a17:90b:2645:b0:3a8:878:ebab with SMTP id 98e67ed59e1d1-3adead4c29bmr5294059a91.35.1793006561792;
        Mon, 26 Oct 2026 02:22:41 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:3934:2b73:344c:e6fc? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb06c57sm5454569a91.3.2026.10.26.02.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:22:40 -0700 (PDT)
Message-ID: <96fc3e59-9fd4-4960-b318-10dcca1bd11f@gmail.com>
Date: Mon, 26 Oct 2026 17:22:36 +0800
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
Subject: Re: [PATCH v2 1/2] platform/x86: bitland-mifs-wmi: Add Xiaomi Book
 Pro 14 quirk
To: Chris Taraszka <chris@miget.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda <matias.civadda2342001@gmail.com>
References: <20261025195456.43414-1-chris@miget.com>
 <20261025195456.43414-2-chris@miget.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261025195456.43414-2-chris@miget.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 03:54, Chris Taraszka wrote:
> The Xiaomi Book Pro 14 (board TM2424) implements SystemPerMode with
> its own values. Its firmware ignores 0x00 and 0x01, and GET returns one
> of 0x02, 0x03, 0x04, 0x09 or 0x0a, so with the default table balanced
> and balanced-performance are no-ops and reading the profile fails with
> -EINVAL whenever the firmware is in 0x04, 0x09 or 0x0a. The failed read
> also aborts system suspend.
>
> The values were identified from the WMAA method in the firmware's SSDT
> and by setting each one and reading the sustained package power limit
> from intel-rapl-mmio on AC:
>
>    0x02  18 W
>    0x03  37 W
>    0x09  45 W
>    0x04  58 W
>    0x0a  18 W
>
> Map low-power, balanced, balanced-performance and performance to 0x02,
> 0x03, 0x09 and 0x04. 0x0a is only entered through the firmware's own
> mode cycling, so report it as low-power without offering it for SET.
>
> The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
> so skip the AC type check.
>
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
>
> Notes:
>      Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A) with this
>      series on top of v13, backported to v7.3, on AC: all four profiles set
>      and read back, and the firmware mode (EC 0x68) and PL1 follow:
>      0x02/18 W, 0x03/37 W, 0x09/45 W, 0x04/58 W. These match the values
>      first measured on BIOS XMAPT4B0P0909. s2idle suspend/resume from
>      performance restores 0x04.
>      
>      On battery, balanced-performance and performance are refused by
>      bitland_pp_check_capability(), although BIOS 0909 applies 0x04 on
>      battery. This patch leaves that check as it is.
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index a4c341ffbb9b..73be63146fd5 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -116,7 +116,28 @@ static const struct bitland_mifs_quirks default_quirks = {
>   	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
>   };
>   
> +static const struct bitland_profile_entry tm2424_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,              0x02 },
> +	{ PLATFORM_PROFILE_LOW_POWER,              0x0a, true },
> +	{ PLATFORM_PROFILE_BALANCED,               0x03 },
> +	{ PLATFORM_PROFILE_BALANCED_PERFORMANCE,   0x09 },
> +	{ PLATFORM_PROFILE_PERFORMANCE,            0x04 },
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
Reviewed-by: Mingyou Chen <qby140326@gmail.com>
