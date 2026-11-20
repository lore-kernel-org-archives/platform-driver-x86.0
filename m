Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186092;
	b=nP1kNH5mDMGJX4oolQDGwinsdWg8FKobfJhSIi5WJ/K/gnG4JVgfI6HXs2QholNPeE1C
	 A9XTWMECFcBfKUKnSEOE8qS8JUV7w7ddWoDb1C5Iom/sqTPzDdTeP/B18+AO8n2+i+1yG
	 /5MmbK8Ah6ed3AfkKSV8XsW6VgT2JLFmvuxyoaiiBaaZuSt9VgC83lXu3zhn0IwStyIIn
	 hFiURRybb5OGII2o9ku9JRipT7qvakI9xHiw1X6sBUEw7Gc0EkvpW3IQz9q2mDNegp7bK
	 qomSRja5jPORziykWQhoiIeipIfouYWcEiWNUUckIMqVqGl6fcg9unQNaA1Os24B9dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=23XPNfNm7eI9kWRtudFXNyVD6I24r4ai3A9NrPUHv/A=;
	b=TejM4x0kAhfQEgGJfjYlrx9iDn787EpM1bDsOQaqy0f27dLGde7h55dokPYiPfYNdEye
	 RVOW/0+Oic6Yc+et0XJ4fS++is+PUy7oV3XsIbJANdjzjKxXhrZiYzAU1hNcQ9m2uDtJO
	 kgXwOP4Y6q5yTE9wybuBjBGToOSq+vy+rOcMPs/eVm5VU/v4CCdtQV0y5PF0zeQMR545H
	 GVu0aEM6K9W5W7KXSgzjI5DjUjCLLk4iARpqN0LPDl+uz+n/NKsi67P7Z9SlkvZ54l28V
	 JlXe4k4BnkdTTj/pJedlZhtz9Uw6JnjqaNGseMkmrDZrv4z1If0q33XDXpODJSoYsgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qr4ZWDnq;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E391606A326
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 14:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E391606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qr4ZWDnq
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso474417b3a.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 06:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186091; x=1795790891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=23XPNfNm7eI9kWRtudFXNyVD6I24r4ai3A9NrPUHv/A=;
        b=Qr4ZWDnqVLM8ijeFTenHh+mRsOUlc0ge6ncVzdnjlTz9ERXksEiCpYeHGnt1gWNDo+
         kq3Nq+L2657JCrPL9W50hgjKBXKrvmfAmZ9rZI450+JGETRpeLm5VZihUHlkUytl4i4z
         urFeKBLx7KWwupSyY7Gj9iVgpOWq3NvMTbKiSV1Vccpq+F6LTX/Z9VEkEu1kDz50V/3L
         SRciJLRWufcmmxfXrBJfIQo8r1jt5/psSamYfG68BKRDIKVdUplUD8Cc64EO5DcKVXSM
         DgFqqNkqrMI68pVYFxEJYOjaI4e+gXaZwvgDl3CakN1pXel3Rjyx9n42mSmR96y/78W6
         5R7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186091; x=1795790891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23XPNfNm7eI9kWRtudFXNyVD6I24r4ai3A9NrPUHv/A=;
        b=a+4hiboiGjvkdbXQhw0bQxAqwaKtBScdK+msXZWjofKD/hDscFPvSPeCpDF3vA9d7m
         zGR5VH8oikEOzlfLtCN+Z7TruPOhSnNp948NzUFeC7Br4X7VmiyC0tRHLPZ1V3s5nf5+
         FRSXQuHKM7C8eHg1kBoo4TikUh15Vd2B3my997A/BZrRTT0+y1KLaAx2lUIKJ98BnFOm
         g6ehaWqt0DMMY7xeDgC28UaUZxRiA+PnY62H7ts5FZfvec0Ybht0A3ZbGX05d54oifXQ
         vGPfTcvOtmDk2LqGGOc4TjniPCVXyzyrrKxLapvEYM+5f03ePffBqyrfJydBUD4oW7Pd
         CZ1w==
X-Forwarded-Encrypted: i=1; AL+hErGybMhGeju9uzJ4TwP2FWzgkmTaZtl6r6DEa7qIM0kXcsa7TJkvurfWzWqiiAxH0TDfO3ETQeH3XQZAe6HIb8Unyoem@vger.kernel.org
X-Gm-Message-State: APuU4Z8i/E+/eQOL9+JFQ55wIVz5NKt7nXg1Mpq5j7MpkBkcEy1crtkK
	j7yghYI2U5pfgta8HNRtA56emuIEw7Vb6Y+YH1vWEmnvHmhBVypkIhsU
X-Gm-Gg: AZFdTZc4V1edEwEjEexJix0bg7ojL6kzZ/8kxn2sVekrj0/ToDp66meduvjDE7buU+/
	YhIhfrNqNI7G6W0yss+npwM4rvRRAAqKrccKjSwP72+znaIqlzI2mTTZh/PpNk0jJaZ5SPKrmHg
	4Nu8n8wlQbNJH20HkJMPV4kWqVISoOOfsvhj4XpFoRsdmr/67JVQpdbly324E+YodIhm0WtUP16
	cRyBejYDk/C/6YXiVim0drp72BMRT/5PAzibNdGXxKOuDGOVTjwz4wOAwLKY6LwKILAY4mCXS9A
	07qSpVbX+mkphfNX2KLpiH57JgfpoCJ6kyNSdx250+54/E2lLzOe/eyIZtVv5+f9zL2aLMZQktn
	vp1O/aAqxne1/0x7RiFNydEH7tXbtGsz6dWBqr8Qx8HuyilYIUVS7H1Gs14Y5y/epKPCh3/s9Jl
	zmzFqHy47uCqXZIbIpKI4R/T0ZrOKGFrxDpuBK621F/bYgiNyIpXw74xXH4ExbVM/2pFUl4y80P
	azvegrLiQERl8+0Gh3jqZfghejzDsYkSeuOL4+vtGPfUwY2Ia5nt5wX7k5Gy4peOcHo5/+gi0Ki
	9KEGDQmS1aq6heWSGej/akc=
X-Received: by 2002:a05:6a00:f07:b0:881:4b47:f31a with SMTP id d2e1a72fcca58-8c87baca5c4mr2876693b3a.11.1795186090967;
        Fri, 20 Nov 2026 06:48:10 -0800 (PST)
Received: from [0.0.0.0] ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b2434asm1571245b3a.45.2026.11.20.06.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 06:48:10 -0800 (PST)
Message-ID: <8b31251f-cb67-4aef-bd93-d2bd43885be1@gmail.com>
Date: Fri, 20 Nov 2026 22:48:06 +0800
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
Subject: Re: [PATCH v2] platform/x86: bitland-mifs-wmi: Support WUJIE15 PRO
 HPT
To: Bozhen Peng <bozhenpeng93@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <0da43a8c-1755-49fe-b8e2-403489297f06@gmail.com>
 <fb4e0678-3028-463e-8a8c-1b680e40c4ee@gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <fb4e0678-3028-463e-8a8c-1b680e40c4ee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 15:42, Bozhen Peng wrote:
> I found that my WUJIE15 PRO with the HPT board uses three profiles:
> performance (0), balanced (1), and quiet (2). The driver's default
> mapping gets these wrong and exposes a fourth mode that the firmware
> does not implement. My laptop only has USB-C power input, so the
> circular-hole adapter requirement also rules out its supported external-
> power configuration.
>
> I added a check matching the vendor, product and board names to select
> the correct profiles and power check. During testing, I saw
> power_supply_is_system_supplied() return true even after I unplugged the
> charger during sleep. I switched the check to the ACPI adapter's _PSR,
> which reads the current power-present bit on this machine. I also made
> resume select balanced if power was removed, rather than restore the
> saved performance profile. If the power query fails, I return the error
> instead of assuming the charger is connected.
>
> I checked the firmware methods and found only two fan readings, in F2/F1
> order, and no MIFS CPU temperature reading. Some unimplemented GET
> commands return success with zero data, so I could not use a successful
> query to establish sensor support. I register the two fans and leave out
> the temperature input. I also hide the unsupported GPU, RGB mode and fan
> boost controls. I rely on the shared WMI helper to check the remaining SET
> commands. I left normal keyboard backlight control unchanged.
>
> I found that the event GUID also matches redmi-wmi, so I made that
> driver decline this machine and leave its notifications to bitland-mifs-
> wmi. I kept the existing behavior for other machines and documented the
> HPT differences.
>
> Signed-off-by: Bozhen Peng <bozhenpeng93@gmail.com>
> ---
> Changes in v2:
> - Fix the RST heading underline length, as Randy pointed out.
> - Rebase onto current platform-driver-x86 for-next, retaining its shared
>    WMI return-code handling.
> - Drop the unreachable redmi-wmi Cc address.
>
> I tested this on my MECHREVO WUJIE15 PRO (WUJIE15 Series-HPT), comparing
> the firmware methods and profile values with the Windows OEM controls.
>
> I ran the hardware tests on Ubuntu 26.04.1, kernel 7.0.0-30-generic. I
> used a small adaptation for that kernel's older WMI API in the test
> modules. I have left that adaptation out of this patch.
>
> I ran 22 automated profile, backlight, binding and sensor checks, all of
> which passed, and tested the actual hotkeys. I recorded about 2280 and
> 2850-2970 RPM from the two fans while running, and zero when stopped. I
> did not independently calibrate the RPM readings.
>
> For the final _PSR change, I ran two s2idle tests. With the charger
> connected, the driver read supplied=1 and restored performance; it
> stayed in performance afterwards. With the charger unplugged during
> sleep, it read supplied=0 and restored balanced; it stayed balanced
> afterwards. Requesting performance on battery then returned EOPNOTSUPP.
> The logs include the resume decision and firmware readbacks.
>
> I built a full x86_64 kernel and both modules against the for-next base
> below. I used x86_64_defconfig with BITLAND_MIFS_WMI and REDMI_WMI as
> modules, GCC 15.2.0 and W=1. The build passed without compiler warnings
> from either changed driver.
>   Documentation/wmi/devices/bitland-mifs-wmi.rst |  31 +++++
>   drivers/platform/x86/bitland-mifs-wmi.c        | 157 ++++++++++++++++++++++++-
>   drivers/platform/x86/redmi-wmi.c               |   7 ++
>   3 files changed, 189 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
> index 27c3fd248..e73f9666f 100644
> --- a/Documentation/wmi/devices/bitland-mifs-wmi.rst
> +++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
> @@ -7,6 +7,37 @@ Bitland MIFS driver (bitland-mifs-wmi)
>   Introduction
>   ============
>   
> +MECHREVO WUJIE15 PRO (HPT) firmware variant
> +-------------------------------------------
> +
> +The MECHREVO WUJIE15 PRO with board WUJIE15 Series-HPT uses a reduced
> +interface. The driver selects this variant using exact system vendor,
> +product name and board name matches.
> +
> +The supported platform profiles are low-power (raw value 2), balanced
> +(1), and performance (0). There is no separate full-speed mode.
> +USB-C is the only external power input on this model. Performance is
> +available on external power, but not on battery. The driver queries the
> +ACPI adapter's _PSR for current power presence because USB-C connector
> +ONLINE state may still be stale during resume. A failed query is not
> +treated as external power being present.
> +On resume, a saved performance profile becomes balanced if external
> +power was removed, matching the firmware's AC-loss transition.
> +
> +Command 0x0d returns two little-endian tachometers, EC Fan 2 followed by
> +Fan 1. No third fan or CPU-temperature input is provided. GPU switching,
> +RGB modes and fan boost are not exposed. Keyboard backlight brightness
> +uses the normal 0 through 3 values.
> +
> +Unsupported GET commands can return success (0x8000) with an empty
> +payload. Successful queries alone therefore do not establish the
> +presence of a sensor or control; the driver uses the known capabilities.
> +The shared WMI call helper checks firmware acknowledgments for supported
> +profile and backlight SET calls.
> +
> +The event GUID is shared with redmi-wmi. On this exact DMI combination,
> +redmi-wmi declines binding so bitland-mifs-wmi handles the notifications.
> +
>   
>   EC WMI interface description
>   ============================
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index dd1648b7d..0d2b6c80c 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -14,6 +14,7 @@
>   #include <linux/dev_printk.h>
>   #include <linux/device.h>
>   #include <linux/device/devres.h>
> +#include <linux/dmi.h>
>   #include <linux/err.h>
>   #include <linux/hwmon.h>
>   #include <linux/init.h>
> @@ -161,6 +162,19 @@ struct bitland_mifs_wmi_data {
>   	struct device *hwmon_dev;
>   	struct device *pp_dev;
>   	enum platform_profile_option saved_profile;
> +	bool is_wujie15_hpt;
> +};
> +
> +/* Profile mapping and capabilities for the WUJIE15 PRO HPT board. */
> +static const struct dmi_system_id bitland_wujie15_hpt[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "WUJIE15 PRO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "WUJIE15 Series-HPT"),
> +		},
> +	},
> +	{ }
>   };
>   
>   static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
> @@ -195,6 +209,12 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
>   	if (output)
>   		memcpy(output, result, sizeof(*output));
>   
> +	if (data->is_wujie15_hpt)
> +		dev_dbg(&data->wdev->dev,
> +			"HPT op=%#x fn=%#x arg=%u value=%u status=%#x\n",
> +			input->operation, input->function, input->payload[0],
> +			result->data[0], le16_to_cpu(result->return_code));
> +
>   	return 0;
>   }
>   
> @@ -213,6 +233,22 @@ static int laptop_profile_get(struct device *dev,
>   	if (ret)
>   		return ret;
>   
> +	if (data->is_wujie15_hpt) {
> +		switch (result.data[0]) {
> +		case 0:
> +			*profile = PLATFORM_PROFILE_PERFORMANCE;
> +			return 0;
> +		case 1:
> +			*profile = PLATFORM_PROFILE_BALANCED;
> +			return 0;
> +		case 2:
> +			*profile = PLATFORM_PROFILE_LOW_POWER;
> +			return 0;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
>   	switch (result.data[0]) {
>   	case WMI_PP_BALANCED:
>   		*profile = PLATFORM_PROFILE_BALANCED;
> @@ -232,6 +268,26 @@ static int laptop_profile_get(struct device *dev,
>   	return 0;
>   }
>   
> +static int bitland_wujie15_is_supplied(void)
> +{
> +	struct acpi_device *adapter;
> +	unsigned long long online;
> +	acpi_status status;
> +
> +	/* USB-C ONLINE can still contain the pre-suspend connector state. */
> +	adapter = acpi_dev_get_first_match_dev("ACPI0003", NULL, -1);
> +	if (!adapter)
> +		return -ENODEV;
> +
> +	/* This machine's adapter _PSR reads the current EC power-present bit. */
> +	status = acpi_evaluate_integer(adapter->handle, "_PSR", NULL, &online);
> +	acpi_dev_put(adapter);
> +	if (ACPI_FAILURE(status) || online > 1)
> +		return -EIO;
> +
> +	return online;
> +}
> +
>   static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *data)
>   {
>   	struct bitland_mifs_input input = {
> @@ -241,7 +297,15 @@ static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *da
>   	struct bitland_mifs_output output;
>   	int ret;
>   
> -	/* Full-speed/performance mode requires DC power (not USB-C) */
> +	/* WUJIE15 PRO is powered through USB-C only. */
> +	if (data->is_wujie15_hpt) {
> +		ret = bitland_wujie15_is_supplied();
> +		if (ret < 0)
> +			return ret;
> +		return ret ? 0 : -EOPNOTSUPP;
> +	}
> +
> +	/* Other models require the firmware's circular-hole adapter type. */
>   	if (!power_supply_is_system_supplied())
>   		return -EOPNOTSUPP;
>   
> @@ -270,6 +334,27 @@ static int laptop_profile_set(struct device *dev,
>   	int ret;
>   	u8 val;
>   
> +	if (data->is_wujie15_hpt) {
> +		switch (profile) {
> +		case PLATFORM_PROFILE_LOW_POWER:
> +			val = 2;
> +			break;
> +		case PLATFORM_PROFILE_BALANCED:
> +			val = 1;
> +			break;
> +		case PLATFORM_PROFILE_PERFORMANCE:
> +			ret = bitland_check_performance_capability(data);
> +			if (ret)
> +				return ret;
> +			val = 0;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		input.payload[0] = val;
> +		return bitland_mifs_wmi_call(data, &input, NULL);
> +	}
> +
>   	switch (profile) {
>   	case PLATFORM_PROFILE_LOW_POWER:
>   		val = WMI_PP_QUIET;
> @@ -300,9 +385,12 @@ static int laptop_profile_set(struct device *dev,
>   
>   static int platform_profile_probe(void *drvdata, unsigned long *choices)
>   {
> +	struct bitland_mifs_wmi_data *data = drvdata;
> +
>   	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
>   	set_bit(PLATFORM_PROFILE_BALANCED, choices);
> -	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> +	if (!data->is_wujie15_hpt)
> +		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
>   	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>   
>   	return 0;
> @@ -328,13 +416,25 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
>   static int bitland_mifs_wmi_resume(struct device *dev)
>   {
>   	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	enum platform_profile_option profile = data->saved_profile;
> +	int supplied;
>   
>   	/* Skip event device */
>   	if (!data->pp_dev)
>   		return 0;
>   
> -	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
> -	return laptop_profile_set(dev, data->saved_profile);
> +	/* Match the firmware's performance-to-balanced transition on AC loss. */
> +	if (data->is_wujie15_hpt &&
> +	    profile == PLATFORM_PROFILE_PERFORMANCE) {
> +		supplied = bitland_wujie15_is_supplied();
> +		if (supplied < 0)
> +			return supplied;
> +		if (!supplied)
> +			profile = PLATFORM_PROFILE_BALANCED;
> +	}
> +
> +	dev_dbg(dev, "Resuming, restoring profile %d\n", profile);
> +	return laptop_profile_set(dev, profile);
>   }
>   
>   static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
> @@ -398,7 +498,16 @@ static int laptop_hwmon_read_string(struct device *dev,
>   				    enum hwmon_sensor_types type, u32 attr,
>   				    int channel, const char **str)
>   {
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	static const char *const hpt_fan_labels[] = { "Fan 2", "Fan 1" };
> +
>   	if (type == hwmon_fan && attr == hwmon_fan_label) {
> +		if (data->is_wujie15_hpt) {
> +			if (channel < 0 || channel >= ARRAY_SIZE(hpt_fan_labels))
> +				return -EINVAL;
> +			*str = hpt_fan_labels[channel];
> +			return 0;
> +		}
>   		if (channel >= 0 && channel < ARRAY_SIZE(fan_labels)) {
>   			*str = fan_labels[channel];
>   			return 0;
> @@ -426,6 +535,18 @@ static const struct hwmon_chip_info laptop_chip_info = {
>   	.info = laptop_hwmon_info,
>   };
>   
> +/* HPT fills only the F2/F1 tachometers; the temperature GET is a no-op. */
> +static const struct hwmon_channel_info *hpt_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info hpt_chip_info = {
> +	.ops = &laptop_hwmon_ops,
> +	.info = hpt_hwmon_info,
> +};
> +
>   static int laptop_kbd_led_set(struct led_classdev *led_cdev,
>   			      enum led_brightness value)
>   {
> @@ -604,7 +725,28 @@ static const struct attribute *const laptop_attrs[] = {
>   	&dev_attr_fan_boost.attr,
>   	NULL,
>   };
> -ATTRIBUTE_GROUPS(laptop);
> +
> +static umode_t laptop_attr_is_visible(struct kobject *kobj,
> +				      const struct attribute *attr, int index)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(kobj_to_dev(kobj));
> +
> +	/* All three custom attributes require methods absent on HPT. */
> +	if (data && data->is_wujie15_hpt)
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
> +static const struct attribute_group laptop_group = {
> +	.attrs_const = laptop_attrs,
> +	.is_visible_const = laptop_attr_is_visible,
> +};
> +
> +static const struct attribute_group *laptop_groups[] = {
> +	&laptop_group,
> +	NULL
> +};
>   
>   static const struct key_entry bitland_mifs_wmi_keymap[] = {
>   	{ KE_KEY, WMI_EVENT_OPEN_APP, { KEY_PROG1 } },
> @@ -659,6 +801,7 @@ static int bitland_notifier_callback(struct notifier_block *nb,
>   static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
>   {
>   	struct bitland_mifs_wmi_data *drv_data;
> +	const struct hwmon_chip_info *chip_info;
>   	enum bitland_wmi_device_type dev_type =
>   		(enum bitland_wmi_device_type)(unsigned long)context;
>   	struct led_init_data init_data = {
> @@ -673,6 +816,7 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
>   		return -ENOMEM;
>   
>   	drv_data->wdev = wdev;
> +	drv_data->is_wujie15_hpt = dmi_check_system(bitland_wujie15_hpt);
>   
>   	ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
>   	if (ret)
> @@ -706,10 +850,11 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
>   		return PTR_ERR(drv_data->pp_dev);
>   
>   	/* Register hwmon */
> +	chip_info = drv_data->is_wujie15_hpt ? &hpt_chip_info : &laptop_chip_info;
>   	drv_data->hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
>   								   "bitland_mifs",
>   								   drv_data,
> -								   &laptop_chip_info,
> +								   chip_info,
>   								   NULL);
>   	if (IS_ERR(drv_data->hwmon_dev))
>   		return PTR_ERR(drv_data->hwmon_dev);
> diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
> index cc82ef502..de41642b7 100644
> --- a/drivers/platform/x86/redmi-wmi.c
> +++ b/drivers/platform/x86/redmi-wmi.c
> @@ -4,6 +4,7 @@
>   #include <linux/acpi.h>
>   #include <linux/bits.h>
>   #include <linux/device.h>
> +#include <linux/dmi.h>
>   #include <linux/input.h>
>   #include <linux/input/sparse-keymap.h>
>   #include <linux/module.h>
> @@ -69,6 +70,12 @@ static int redmi_wmi_probe(struct wmi_device *wdev, const void *context)
>   	struct redmi_wmi *data;
>   	int err;
>   
> +	/* This shared GUID belongs to bitland-mifs-wmi on the WUJIE15 PRO HPT. */
> +	if (dmi_match(DMI_SYS_VENDOR, "MECHREVO") &&
> +	    dmi_match(DMI_PRODUCT_NAME, "WUJIE15 PRO") &&
> +	    dmi_match(DMI_BOARD_NAME, "WUJIE15 Series-HPT"))
> +		return -ENODEV;
> +
>   	/* Init dev */
>   	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>
> base-commit: a3371fac5dd51518de4edcdcc3c7284a5c5a6607

Hi, sorry for the very late reply.

We have introduced the quirk table system in the recent commits (in the 
pdx86/for-next branch).

You could refine the patch within the quirks system by adding new quirk 
items. We have no WUJIE 15 PRO HPT support yet.

