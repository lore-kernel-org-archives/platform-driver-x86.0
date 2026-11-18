Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002316;
	b=jwCghn/x5jN1s6Xzksc+GtXqWATh2pFledkD1t86Of3JMnBM1tFQLD/Kim16pj7OJ/gH
	 zIvSxKrvnCN0jXRssV2fAYPZvdHHUL4p+kGKLoMEFUkBfnmPSexZASnBi3/ZxgGUnJUsa
	 eexTt6KfnOHkjNakcslsdaKJa4aoVX44wfC2GUd+ub2PPtYwaceaQVSkN3qAEFbyKy5Mb
	 XkygEvWu/Vf8Rzi0cLVxld/ns8n+09OcJ4L7ZOAfHnsZwWnJdA6ORgxFqnVCyTxaSYOhk
	 x8EjeBxUUQlPeL9DJ0kF2PQq9XGmhIJ8Bd83cPxThAAxO7+hxNZQqj9QMCWwoAFmiLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DnVN4oQm5vTmEy9Yk/HP88sUnMp8Vqm6PKjzwgqph7k=;
	b=DooLYhJxysQm9WNVnBjFLOO5ZphwGQZvn7T/BEAWW/Ruq24aXEHPeHbtXLP3IZ0WD03w
	 TI8RxFCcH1a7e2jYgl2kDAYx8BlbzyDrbNEnw0Oa3gBAT1MZVaDU6MFYYbzKInebOv2Sa
	 eumkGlmr1oVC2shC0h0DcEYCPJ9eZ/zSH4v35THPM5YtMSw2/5ddtf/cAk74IkEmyRjtH
	 Ac/tljZlvVqF4gTSOkTN7gXGy9euNhyLZC3dD4FYaFeYEBnTaTSIgC+DaHGEqnEr9dhbc
	 W/SLvtFo1EKwROzdZUcWzgAtjXNLy9j47jgUmhjnGWgoWVUDX9EqwwlI6zX6AeHJcKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESi73pff;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B30606A320
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 11:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B30606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESi73pff
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so491665a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 03:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795002316; x=1795607116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnVN4oQm5vTmEy9Yk/HP88sUnMp8Vqm6PKjzwgqph7k=;
        b=ESi73pff1GSFfSwx4JNdxGydjGTeDNw8o0GckIIxaN/K7q3lQGbF9XZbt+3k00z9yG
         0b+37vzSD/gHg1SyAHITKOLTDe64sW2VSCjcFs34RiiPSgy8b28RVixYt7MEjBM74+Kg
         TKfsdmunNcJvV0d8AXdQB7Oq5Q5YGZk9QB2Lr6fB9EwmuvwDCxcbK+9r5+va1QGXL28p
         xvzM39xUf+yV1fsnuGn286vDcAo+lkkU8D9BhHJ0Z38CzWt9APvRLqsffg3TL67Wcb7s
         PmXhOepiu2yJZ+lTNhCX+m5zIBkuzdcwfBMLZeA5f5GhCybk6Cf4NOkkpG4emHxnR02x
         BaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002316; x=1795607116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnVN4oQm5vTmEy9Yk/HP88sUnMp8Vqm6PKjzwgqph7k=;
        b=rmkL9uRbFE3QCT0vCO6cuExaoF3CLmI7zhE6k6/m9C1Fqmn5+rBIP9I5x6NKGlCcTv
         hGlH3grK1FNdKjl+68BIEnerf8PDCQLXf4FjK5jiGf8m2FM63SkehNtkzEZyZpg1Cy7E
         rA+zXFrwuWg0ZJlSBJIcnRA5TDEwIMWketWBHzwIGCg5inLlgVIKkf7sQ/aFExL6+8v/
         UMOKTd8HA6mgylvl+Huar/wISMoxqg2jKc84Y/HlpUydL4OveJbl+txG52QULys1W/8w
         9gl5VVuujN9JUFwIZCedeWdvhqGTbN/1Hz0FXsSPrd6vQbM1TW5DxDHHXCskIAqP2+FX
         7qRg==
X-Gm-Message-State: APuU4Z/EHelcY1cBPk2zA99dDjtEge4rJHQQmEbG3HG7Y/8JIKMXwO6F
	I09MrKfZSGfhXzXI0z9PUCHb70KPfNZVDpa5COXEQxGmrnW+bGIkWlS+2WGXiw==
X-Gm-Gg: AZFdTZfC2s0Cl4xwfVc9TjXA0OdY0++8GpGwllIQQzdYVupij44syCSvr++m51/Yt23
	+fumd6KIopnulMhsRX8b1Z8jRIggOgbiYJupqMgf1v5Yf052GhV8/y2dHlm7Rs55o3+cG+K4MMX
	HeKQRubb1SYuczWPJFnwK5bN4FsU+0RyMWArJJDzJEjzI2EKgQMJDTDI42+d1VnvhrchXIV3SLT
	Nq63JaJoF86BXtqx+ZPov/ZqHYuWy8yR/jeV1/MFS1j1jKcsuhc/l1Cx/RAsNHraZHTlSyL9L07
	K7f46eRVWHrpMOF/tQWEdkV6lDn/43HfBmqpVLSu5vwr/6+nF6x6vX8hTmlceH91QS1Jfznn13C
	wo3ciEk4aD0QhtV7Yi6FZ9pOkfCyHGKpAeAJ9Ue03pzUFHcb0+N14yzWHALAhfQxs0Q2EytGAz/
	v2WLzNwA8OOaHv7JHLCYrnuIF7Rmfe4JJIjXaywGAsBVUrMBJykfwX7CwiIKSXCnXipAZkMOY6j
	bDx1eLt/iwGeKn75s83P1fHFw/QZd4ATBZO35i23l4deGxfIDdxsH0kPahORDTEdCiSzeOU9nV1
	yI9NaXqJc+XrN8lIuHa8bg==
X-Received: by 2002:a17:90b:448b:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b3d07b9f34mr2444000a91.36.1795002315663;
        Wed, 18 Nov 2026 03:45:15 -0800 (PST)
Received: from [0.0.0.0] ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2550e1sm8966783a91.3.2026.11.18.03.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:45:14 -0800 (PST)
Message-ID: <bd605c87-542f-43be-8e3c-01f2f3c14f28@gmail.com>
Date: Wed, 18 Nov 2026 19:45:11 +0800
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
Subject: Re: [RFC PATCH] platform/x86: bitland-mifs-wmi: Add Redmi Book Pro 15
 2023 (TM2209) quirk
To: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 regressions@leemhuis.info, regressions@lists.linux.dev,
 shlyapugin@gmail.com, Musaev Ibragim <atomicus.xyz@gmail.com>
References: <49e43ccd-fa28-44a0-9e8d-554868d0585e@gmail.com>
 <20261111124849.11309-1-rybalov.oleg.dev@gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261111124849.11309-1-rybalov.oleg.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 20:48, Oleg Rybalov wrote:
> On TM2209 the power mode is the STNM byte in EC RAM. Fn+K rotates it
> in EV20 and the EC0._Q24 handler then applies the matching SoC limits
> with HPTC. SystemPerMode does not affect STNM, so changing the platform
> profile had no effect on power.
>
> Read the mode from STNM and, on set, write STNM and evaluate EC0.HPTC
> as the Fn+K handler does. HPTC returns AE_AML_BUFFER_LIMIT because SVRP
> declares its ALIB buffer one byte longer than its data; the limits are
> already sent at that point, so treat it as success.
>
> The board reports DMI_SYS_VENDOR "XIAOMI" with TM2209 in
> DMI_BOARD_NAME, returns the WMI return code at the end of the buffer
> and charges over USB-C only.
>
> Signed-off-by: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
> ---
> Based on v15 of "Merge redmi-wmi into bitland-mifs-wmi":
> https://lore.kernel.org/r/20261028112742.674847-1-qby140326@gmail.com
>
> Tested on BIOS RMAPH5B0P0909 only.
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 83 ++++++++++++++++++++++++-
>   1 file changed, 81 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index a431d3fef..b63b139a6 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -21,6 +21,7 @@
>   #include <linux/input-event-codes.h>
>   #include <linux/input.h>
>   #include <linux/input/sparse-keymap.h>
> +#include <linux/io.h>
>   #include <linux/kernel.h>
>   #include <linux/leds.h>
>   #include <linux/module.h>
> @@ -99,6 +100,10 @@ struct bitland_mifs_quirks {
>   
>   	bool return_code_at_end;
>   	bool skip_ac_type_check;
> +
> +	const char *ec_mode_field;
> +	const char *ec_mode_apply;
> +	phys_addr_t ec_mode_addr;
>   };
>   
>   static const struct bitland_profile_entry default_profile_entries[] = {
> @@ -113,7 +118,30 @@ static const struct bitland_mifs_quirks default_quirks = {
>   	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
>   };
>   
> +static const struct bitland_profile_entry tm2209_profile_entries[] = {
> +	{ PLATFORM_PROFILE_LOW_POWER,   2 },
> +	{ PLATFORM_PROFILE_BALANCED,    1 },
> +	{ PLATFORM_PROFILE_PERFORMANCE, 3 },
> +};
> +
> +static const struct bitland_mifs_quirks tm2209_quirks = {
> +	.profile_entries = tm2209_profile_entries,
> +	.num_profile_entries = ARRAY_SIZE(tm2209_profile_entries),
> +	.return_code_at_end = true,
> +	.skip_ac_type_check = true,
> +	.ec_mode_field = "\\_SB.PCI0.LPC0.EC0.STNM",
> +	.ec_mode_apply = "\\_SB.PCI0.LPC0.EC0.HPTC",
> +	.ec_mode_addr = 0xFE0B0300 + 0x7E,
> +};

I think this is an anti-pattern.

Do we get a WMI method for this?

> +
>   static const struct dmi_system_id bitland_mifs_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2209"),
> +		},
> +		.driver_data = (void *)&tm2209_quirks,
> +	},
>   	{}
>   };
>   
> @@ -271,6 +299,48 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
>   	return 0;
>   }
>   
> +static int bitland_ec_mode_get(const struct bitland_mifs_quirks *quirks, u8 *val)
> +{
> +	unsigned long long v;
> +	acpi_status status;
> +
> +	status = acpi_evaluate_integer(NULL, (acpi_string)quirks->ec_mode_field,
> +				       NULL, &v);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	*val = v;
> +	return 0;
> +}
> +
> +static int bitland_ec_mode_set(const struct bitland_mifs_quirks *quirks, u8 val)
> +{
> +	void __iomem *addr;
> +	acpi_status status;
> +	u32 glk;
> +
> +	addr = ioremap(quirks->ec_mode_addr, 1);
> +	if (!addr)
> +		return -ENOMEM;
> +
> +	status = acpi_acquire_global_lock(1000, &glk);
> +	if (ACPI_FAILURE(status)) {
> +		iounmap(addr);
> +		return -EBUSY;
> +	}
> +	writeb(val, addr);
> +	acpi_release_global_lock(glk);
> +	iounmap(addr);
> +
> +	status = acpi_execute_simple_method(NULL, (char *)quirks->ec_mode_apply, val);
> +	if (status == AE_AML_BUFFER_LIMIT)
> +		return 0;
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
>   static int laptop_profile_get(struct device *dev,
>   			      enum platform_profile_option *profile)
>   {
> @@ -282,14 +352,20 @@ static int laptop_profile_get(struct device *dev,
>   	};
>   	struct bitland_mifs_output_head_rc result;
>   	size_t i;
> +	u8 val;
>   	int ret;
>   
> -	ret = bitland_mifs_wmi_call(data, &input, &result);
> +	if (quirks->ec_mode_field) {
> +		ret = bitland_ec_mode_get(quirks, &val);
> +	} else {
> +		ret = bitland_mifs_wmi_call(data, &input, &result);
> +		val = result.data[0];
> +	}
>   	if (ret)
>   		return ret;
>   
>   	for (i = 0; i < quirks->num_profile_entries; i++) {
> -		if (quirks->profile_entries[i].wmi_val == result.data[0]) {
> +		if (quirks->profile_entries[i].wmi_val == val) {
>   			*profile = quirks->profile_entries[i].profile;
>   			return 0;
>   		}
> @@ -350,6 +426,9 @@ static int laptop_profile_set(struct device *dev,
>   	for (i = 0; i < quirks->num_profile_entries; i++) {
>   		if (quirks->profile_entries[i].profile == profile &&
>   		    !quirks->profile_entries[i].no_set) {
> +			if (quirks->ec_mode_addr)
> +				return bitland_ec_mode_set(quirks,
> +							   quirks->profile_entries[i].wmi_val);
>   			input.payload[0] = quirks->profile_entries[i].wmi_val;
>   			return bitland_mifs_wmi_call(data, &input, NULL);
>   		}
