Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971543;
	b=O/koluszXdce3OTrYnhD+cOo/UiFKfIO1QpMfFM7co7mRQZ4pBQAidyDGsSvCUax1hdu
	 h5ZX3QYHOi7xikow04AAH02qdXL385Iy5SQfkNBirNOfCz3Fjyky9O8r20MQHtNeVb9j/
	 1i2DsTdr36qxGFXAtu6fivDm+2JPK0PbxA+Gzq010EAfWgf1WDgQu9PpLnEfuQ9myWeVq
	 gAd0kHPOfBkz4Tk5eHISmNZBXN7pcycJS9OkZ7tm7EpJE3K9LVHMriUi3zSJNSJC/AqKu
	 +CXS8wDPYNzravrTUVq8d3dpdiuTIHLPM6BJdI5zBapcdZKIlr5haUsOflNLADUeCpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=c4N6Lk/3/JFyCHBusbIUOAGKnIVz7D4T+6vjkTEhF24=;
	b=R4hfyubKZxFmVJbXdHMdV1SUBIEWWOtlnlsYnRQu9TKEDtKPiZSozUywhl7I7RX8fMbz
	 9h2rhdOYGbBFnbaeAluohBJep7Mtz7TUmAIsomroV6oPeUeLofT8ktxPqi69vyMaQR7T0
	 /QpNWdt4kT3H6G1K0O7eJ9FsPaPQomrylnZ4QI4DI1JEKZ+gM4839lZ0GOpDeS5qBCSA7
	 xOGFloR/Sf/zzK/wvYo9g7aKC01QKqF3tazi7c4qYYy2FPUZXboLHHWlKpEy01LjbB2ZR
	 9jY5Km7+5JSs9I41UnnXdH2ymbILhhZczIcECyc4Fzd+UFXgw5/7GLvSixCxQOnerhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUVlnB4P;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F10606A329
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 13:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F10606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUVlnB4P
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b1a705b88aso391665b3a.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 05:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971542; x=1794576342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4N6Lk/3/JFyCHBusbIUOAGKnIVz7D4T+6vjkTEhF24=;
        b=mUVlnB4PKDx9+QzDpM/Bfjl+Utv/hg4Bsx52PAoFvkQByds2DJjX/U5sOTnlWjat2o
         SrFY8TFWsaD+NKWErLqLCHKPWJFczZYdd6Z3WwQv2/67JG2kBbOwUOxZumyZ4HecKjt4
         4LvxF8QdZXQMmiwZH8orTZQLnQ8uB29ZpteO6ZIkuC/34iqM6nv3EpidcJhHktxadHm7
         JUIDeCVu1/CHdZfdYZGpeUk5tGepfX0BGaAAJkoaxAZZy/bCWncnJ8LnxuJO+Fz9OeHA
         FLQGoAVtrxYQ1K4yIxbkfx8Gh/cKcmLAYMhEQEiWtMtnd8AowwBgjQIDZ1FxelzkvAyz
         a8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971542; x=1794576342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4N6Lk/3/JFyCHBusbIUOAGKnIVz7D4T+6vjkTEhF24=;
        b=A8ToEQNGycUhaxx05a6IeN9R7q4j5+ExfEN6A14jOHeCUxLJ0/QXa3IdD1trwmkTCl
         x9aXJ9FImywLYwGhjDs0kBVjRkAw6nRlT7L9pMzh8m7HGGMY2hwxTjVlM3whaVbj4scr
         1QpEHDeqBl7u2X2WMcujdstvw23fky6aDK9LQsuAYYh620XUbxzPHgq37vt7Qis1uu5O
         XustIwVtDxZR0ww4Jcn8jL/tt8NBTqkngnp0lv2cRfoffRHnd0z53BBT+ufjCu7YohCC
         6v+A6zgCBDOCO34F/nGNN7DLxvIBEb8Su60XFJE+fpJTXFz1boZ4JcgyaPcIsjD7SJCz
         3QGQ==
X-Gm-Message-State: APuU4Z9IoPgJt0BKjG0LRdgiivo1jicgp8y8GnQBdHuHZkeWzl6dI0O7
	vTUFnZeLIsS0UJ8DckIZNkntz+bvjR3nHvxFvFMvqBF5GeLzE1+1kKq0
X-Gm-Gg: AYBFou2Wqnb15O6iEXJZXbHT299VS2iOBiXQJ7gGidzY6K8/VwDh32rpBRgvJ6tJbPQ
	AtDPCnL30/sCaG3zkDqEC1kyhYAwI2OPlXc6ouTd6YlPSxK4eblym7znctRswe0OaYlCFvcGeK7
	WgAvnK9a49kt8Zn3VUPXQr6m3/YEFfwHW0CAPnDcS6Sa1Y5E9TgxPRbX+g/BKI6dhqOBO7FpUQw
	2H8ngMHYPDMzFeYx2rL277ej5RoTXZmXKBtvvkOfgp/HgeeC6ZTwQlZ2QrO3X1Gwr95gkKkOyXn
	88jkE2kW5rqQXba1DhE7k/qeyDCG+zkofAhsHb72Z1ztWQbXLIYqmWKmyUgGK5S78vSSDInqIn+
	0KESMZWMjsi3AgG/lw8KSLzOGHY4y7S1RNV0X2gvMaVg8QOXDzj6VORf3bSAwAHyY+VLsDvy1GD
	OWcqxsHLm97VeXv48uaVQ6ipvAbQxB3pTtYOsS/HiDvyewgkESNuO1KCItV5ycWAW2Gi3xF6Qs+
	fbG+WJITwfPFYRSFufIflDD1WJKytbi8qo/8iZvQwZ/SU+++hEVqvzqaBz47UCmp17rPFmd5XYt
	g2I0lZNra6XcBwMtMYzxv2JilFQSrOjk2kF4PDpjE+UXtGp8ZoHBw/VW7uhEeT9Sibo=
X-Received: by 2002:a05:6a00:1c96:b0:899:465d:c8f4 with SMTP id d2e1a72fcca58-8b37ab9eee2mr2239384b3a.14.1793971542542;
        Fri, 06 Nov 2026 05:25:42 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:bb81:a698:7716:7bcb? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35a4ad602sm569093b3a.49.2026.11.06.05.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 05:25:41 -0800 (PST)
Message-ID: <a45f3b7c-ed86-434f-a572-d42afe57010c@gmail.com>
Date: Fri, 6 Nov 2026 21:25:37 +0800
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
Subject: Re: [PATCH v4 3/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book
 Pro 14 quirk
To: Chris Taraszka <chris@miget.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda
 <matias.civadda2342001@gmail.com>, Arsenova <7z0423arsenova@proton.me>
References: <20261106114300.936782-1-chris@miget.com>
 <20261106114300.936782-4-chris@miget.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261106114300.936782-4-chris@miget.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 19:42, Chris Taraszka wrote:
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
> Map low-power, balanced and performance to 0x02, 0x09 and 0x04, and
> use 0x03 for performance on battery, where it gives what 0x04 gives on
> AC. 0x0a selects the same tables as 0x02, so report it as low-power
> without offering it for SET. There is no balanced-performance mode.
>
> The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
> so skip the AC type check.
>
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
>
> Notes:
>      v4: moved after the battery support (Mingyou), so 0x03 is the battery
>      entry from the start. The code at the end of the series is unchanged.
>      
>      Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A, H484)
>      with this series on top of v15. Firmware mode (EC 0x68), DTT OEM
>      variable 1 and PL1 a few seconds after each set:
>      
>        AC       low-power    0x02  ODV1 2  25 W
>                 balanced     0x09  ODV1 0  45 W
>                 performance  0x04  ODV1 4  58 W
>        battery  low-power    0x02  ODV1 2  25 W
>                 performance  0x03  ODV1 1  58 W
>      
>      Rechecked on v7.4-rc1: on battery, balanced, performance and low-power
>      set 0x09, 0x03 and 0x02.
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index 97dafd510ba8..4d02cd9e8a6b 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -114,7 +114,28 @@ static const struct bitland_mifs_quirks default_quirks = {
>   	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
>   };
>   
> +static const struct bitland_profile_entry tm2424_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
> +	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
> +	{ PLATFORM_PROFILE_BALANCED,    0x09 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 0x04 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, .battery = true },
> +};
> +
> +static const struct bitland_mifs_quirks tm2424_quirks = {
> +	.profile_entries = tm2424_profile_entries,
> +	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
> +	.skip_ac_type_check = true,
> +};

Feel free to collect the Reviewed-by tag if cycle_profile_on_key is 
confirmed unnecessary in the future patches. (Please take a look at my 
review on patch 4/4.)

If not, please add cycle_profile_on_key value to the quirk entry and 
move this commit after your 4/4 (platform/x86: bitland-mifs-wmi: Cycle 
the platform profile on Fn+K).

Reviewed-by: Mingyou Chen <qby140326@gmail.com>

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
