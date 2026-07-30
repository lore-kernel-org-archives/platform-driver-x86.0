Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E354052A7
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408997; cv=none; b=fLrJ1IUwX6ijaY8iw5lWfP5tLdEw+eqWIXk3Eql58gCV3qW7s+I2O8lSYUI86nQURt7QOWUi5fDyIp9s8UpINEoV2DPgRK/SByoS+3SOuA39gqeWXxu7zM6MlrkmuBzJOatBOwbBJAQqmFmGxCagZ7UIRHOxb0GOtZt4ySdkNtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408997; c=relaxed/simple;
	bh=cIfbd/Ph7v5En+51FMIoRhluL3xVZi5Ycw/R3M+paxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odU13brdpMVrifR71TAxlveubt1Y3rWOS21XyN0h6q0YEc4rJFiUCYvO2pI59Mgs6f9oJKhJYFwWzxPWyDaU83ByLPyp6lMVuByUaSa1b090YhldpwXpGLTtEi3PP6NvsoSo/cmEHV8jHtdhZFARAlN5uWWWiAQkblQt6NxXneo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDTeE5ut; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDTeE5ut"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84830c774a0so2221355b3a.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 03:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785408995; x=1786013795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPJIrsdPXiWk/y3lIXg5KqNz5WvEP8+gRrqQ6gmOJ9M=;
        b=QDTeE5utyaMAAgJ7YpAFFoHnLp1ZP+Z8nwBmzm22yvR82vG66sROE3fxs9KZWloO0X
         mTOJg2gGPNwumNZ8hfC4da0Elezu09Vyk4fvULmVF9MkfTA6PRpGaLn36YldtZ7YYUUM
         rkpgkQt7z+hOGCeYnUZQEqac6eTlHBXzW9Gu+5obhqrJUisVD7HtR1Pcl6rc2sMNfbfX
         99qAa2a8F3N9qwhARSpqRbmIckQtoXd13M/Avv3gK/aqDtpSzG6jkr/LvuYbAsfTA8KX
         s3ebuVcBk1uyty9pLTTJUqx/ygG6JUlc0uw+lRVsJt5I9HND8q20kXtzfbrILbxk+8z4
         FH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408995; x=1786013795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPJIrsdPXiWk/y3lIXg5KqNz5WvEP8+gRrqQ6gmOJ9M=;
        b=iizmxowo1TqM11Vl65CnVsuZOSBtIPiB4yRjwldb3FlGY0pFvvCenj1fgpb7EWAMT/
         8h7l1uIS5hZTtqKNmaXgkkOGGVEiMSwYHg/oYe2oR/vL01zDtkOJEZskP/gbhsriw9ly
         HOsB7v70g1q44V73a+CAGEdc4zd9EepOrqVxe5rfGB8drUEfRxCI4XVStFWc8na1GFYR
         KMDLfZYpAtc9AtBWtlwiGBdeepZ/Wt5MyUdzhnSXj4RFWXcm1IH7V+vNXf9s+vWHItT+
         UhCEu2olJF3piVMOUX4fOsNpa+rPT7q3VyVht7IykGRCmpdriGMQAjZHN3DpWdsvHO4o
         tNFQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHAu4lYrMGAI4V1b1EB1iVbK/tyy8Tg/z7vYzk6rWXwheQCJ+JwElGyNRJXSh0jc+HprgHc9NjT9W2/sTIXZzSS2sV@vger.kernel.org
X-Gm-Message-State: AOJu0YwWN8V+b/vP2tff0qyOjrYx+ZbPH104mIz3jXHOVoaMDJ2k8EKN
	pfOiJnDXEZFdhzxtbmeFnIa4TcVjtK1HJ26oViBOirkBtuxatZXyNuZI
X-Gm-Gg: AR+sD12GIWFCb4h+N/2MKOe0NGBOa1temISlAovEk5/EqrhXCEHDRzRcttf2EzIcxJW
	gyt+2EHLlO3iJhLTO6wEoY6YGS+X4fOpvjXO4ElGJYC9A/HeKKDyn6flfNOvz4Oppg5BqzpAM1G
	1YOalR1h3bZvYK7aUw59Gk0439x0b2ox1DiM7gsaY9x0UbjBeKICP+SMa13JuWumQtj35r4D6JV
	T69kScJMEEwwHjiTqwQPzpyrT+UoNE0mLatxnRjPGm3pCNPPC6BA0VQWRELAqVj8FUF9LABwyQV
	4a/WOHYB3/XJ62BbQ8XEP1fcLpb2+CLWV9P4uAZILqgqgDY1oTnTY5/Wzb+dsB4chKmb5RQxOAZ
	2IHy0QxpbRVvTzRzGaeaB1wtjE3MNo+lxVlji++zh165DYexNFUn89jfg8RGdvIKgrqezI8RTmc
	7839Lwtgv6IbfJ/jP2e+sRzf0/UFtHAOBoJTIN8UzYefuQ0g==
X-Received: by 2002:a05:6a00:3e20:b0:846:f517:ba5a with SMTP id d2e1a72fcca58-84ebc239cddmr2090742b3a.28.1785408994966;
        Thu, 30 Jul 2026 03:56:34 -0700 (PDT)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f9740sm2857860b3a.37.2026.07.30.03.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 03:56:34 -0700 (PDT)
Message-ID: <46e065dc-be3c-4457-9e66-22b9a9fdfc04@gmail.com>
Date: Thu, 30 Jul 2026 18:56:30 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 2/5] platform/x86: bitland-mifs-wmi: support MIFS
 v2 perf-mode mapping
To: =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Nabil Danial <nabildanial.93@gmail.com>
References: <20260728180944.51356-1-wolf109909@outlook.com>
 <20260728180944.51356-3-wolf109909@outlook.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20260728180944.51356-3-wolf109909@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/29/26 2:09 AM, 孙 誉铭 wrote:
> The MIFS v2 firmware found on e.g. the Xiaomi Book Pro 14 2026 (Intel
> Panther Lake, SSDT device "WMID" with _UID "MIFS") implements only a
> reduced WMAA command set and reports the performance mode as raw QFAN
> embedded-controller codes { 2, 3, 4, 9, 10 } instead of the v1 0..3
> enumeration. With the v1 mapping, profile_get() returns -EINVAL for
> most firmware states ("platform_profile: Failed to get profile for
> handler bitland-mifs-wmi", also reported on REDMI Book Pro 14 2025)
> and profile_set() writes values the firmware treats as no-ops, so
> power-profiles-daemon can neither read nor switch the profile;
> selecting "performance" fails outright and wedges the daemon.
>
> Detect the variant at probe time by querying the current mode: values
> outside the v1 enumeration mean v2 firmware. Map the v2 codes to
> platform profiles (2=quiet, 3=balanced, 4=speed, 9/10=extreme) and
> skip the v1-only AC-type capability probe, which does not exist on v2
> and now fails the call after the status-word check.
>
> Values verified against the laptop's SSDT WMAA method and by observing
> the EC QFAN register while switching modes.
>
> Signed-off-by: Yuming Sun <wolf109909@outlook.com>
> ---
>   drivers/platform/x86/bitland-mifs-wmi.c | 79 +++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index 12426d11..342dd7e1 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -73,6 +73,21 @@ enum bitland_mifs_power_profile {
>   	WMI_PP_FULL_SPEED	= 3,
>   };
>   
> +/*
> + * MIFS v2 firmware (e.g. Xiaomi Book Pro 14 2026, SSDT "WMID" with UID
> + * "MIFS") implements a reduced WMAA command set (only function groups
> + * 0x0800/0x0a00/0x0c00/0x1000) and reports the performance mode as raw
> + * QFAN EC codes instead of the v1 0..3 enumeration. Codes 9 and 10 are
> + * the SMM-backed "extreme" modes.
> + */
> +enum bitland_mifs_v2_power_profile {
> +	WMI_V2_PP_QUIET		= 2,
> +	WMI_V2_PP_BALANCED	= 3,
> +	WMI_V2_PP_SPEED		= 4,
> +	WMI_V2_PP_EXTREME	= 9,
> +	WMI_V2_PP_EXTREME2	= 10,
> +};
> +
>   enum bitland_mifs_event_id {
>   	WMI_EVENT_RESERVED_1		= 1,
>   	WMI_EVENT_RESERVED_2		= 2,
> @@ -172,6 +187,7 @@ struct bitland_mifs_wmi_data {
>   	struct device *pp_dev;
>   	enum platform_profile_option saved_profile;
>   	bool profile_valid;
> +	bool is_v2;	/* MIFS v2 firmware: QFAN perf-mode codes */
>   };
>   
>   static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
> @@ -217,6 +233,27 @@ static int laptop_profile_get(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> +	if (data->is_v2) {
> +		switch (result.data[0]) {
> +		case WMI_V2_PP_QUIET:
> +			*profile = PLATFORM_PROFILE_LOW_POWER;
> +			break;
> +		case WMI_V2_PP_BALANCED:
> +			*profile = PLATFORM_PROFILE_BALANCED;
> +			break;
> +		case WMI_V2_PP_SPEED:
> +			*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +			break;
> +		case WMI_V2_PP_EXTREME:
> +		case WMI_V2_PP_EXTREME2:
> +			*profile = PLATFORM_PROFILE_PERFORMANCE;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		return 0;
> +	}
> +
>   	switch (result.data[0]) {
>   	case WMI_PP_BALANCED:
>   		*profile = PLATFORM_PROFILE_BALANCED;
> @@ -272,6 +309,28 @@ static int laptop_profile_set(struct device *dev,
>   	int ret;
>   	u8 val;
>   
> +	if (data->is_v2) {
Consider introducing an ops table. Then you can completely remove the 
is_v2 conditions.
> +		switch (profile) {
> +		case PLATFORM_PROFILE_LOW_POWER:
> +			val = WMI_V2_PP_QUIET;
> +			break;
> +		case PLATFORM_PROFILE_BALANCED:
> +			val = WMI_V2_PP_BALANCED;
> +			break;
> +		case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +			val = WMI_V2_PP_SPEED;
> +			break;
> +		case PLATFORM_PROFILE_PERFORMANCE:
> +			val = WMI_V2_PP_EXTREME;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		input.payload[0] = val;
> +
> +		return bitland_mifs_wmi_call(data, &input, NULL);
> +	}
> +
>   	switch (profile) {
>   	case PLATFORM_PROFILE_LOW_POWER:
>   		val = WMI_PP_QUIET;
> @@ -705,6 +764,26 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
>   
>   	dev_set_drvdata(&wdev->dev, drv_data);
>   
> +	if (dev_type == BITLAND_WMI_CONTROL) {
> +		/*
> +		 * Firmware variant detection: v1 firmware reports the perf mode
> +		 * as 0..3 (enum bitland_mifs_power_profile); anything else means
> +		 * the reduced MIFS v2 command set with raw QFAN codes.
> +		 */
> +		struct bitland_mifs_input probe_in = {
> +			.operation = WMI_METHOD_GET,
> +			.function = WMI_FN_SYSTEM_PER_MODE,
> +		};
> +		struct bitland_mifs_output probe_out;
> +
> +		if (!bitland_mifs_wmi_call(drv_data, &probe_in, &probe_out) &&
> +		    probe_out.data[0] > WMI_PP_FULL_SPEED) {
If the current profile is WMI_V2_PP_QUIET or WMI_V2_PP_BALANCED, 
probe_out.data[0] > WMI_PP_FULL_SPEED would be false.
> +			drv_data->is_v2 = true;
> +			dev_info(&wdev->dev,
> +				 "MIFS v2 firmware detected (QFAN mode codes)\n");
This log message doesn't print any useful information, consider remove it.
> +		}
> +	}
> +
>   	if (dev_type == BITLAND_WMI_EVENT) {
>   		/* Register input device for hotkeys */
>   		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
