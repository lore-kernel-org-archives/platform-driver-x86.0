Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F57382F1B;
	Tue,  3 Mar 2026 22:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578708; cv=none; b=dh19dNPrgyiYmR/49yGYszr2BlgvMghyLdNRs/d/r5y8xwsX5GpBMRGORDlIIXHu0OWxcKFhNyN5iIbJvRiRUgcxvXxMWPzeo4pR7vihI2lKaA3TZ1Y20QXGmSfJatU6do1T2fn3e3229D48psxYXBA1xj9YK6cDY6/2NVjLGvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578708; c=relaxed/simple;
	bh=KAatKesxs9PDvFgfwlmMDEeQ8zCUvRRhzTcvewEUZbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOL/70+iV9+TLlfDyGyg60XQHqvGzDLMHTgYq27cctM4pRXWsjXMAnYOsINnVVpJlLk61QagnjHYA5eNg9VpYMrhMH8lwxOJfcdhsEAc2Ulh2nNxBaqJwhVQHIszzw91dTx7vNbtUDgvZpZ25z3jrpwgj5Zzr4kbljmmCQAtBZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=WAJJbzF3; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="WAJJbzF3"
Received: from [192.168.178.24] (i5C75F679.versanet.de [92.117.246.121])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 508EF2FC0050;
	Tue,  3 Mar 2026 23:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772578703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N8qOgsC+Z1Dr/HOlKiGBxJNNLZ+jkuLtb3d4KjfotM4=;
	b=WAJJbzF3iyJraxgD8imKzdoB0CqwjcYT/atLUjYGK/DHGvaQvqC6BeTdCR9zicil5xziIM
	Uap9+jiU1mh1ZLfQhhUQ3fQbA6aHslPFFTal2xndVFrDe8NGepXCuZnk+U5DWC4Uk3DRjj
	5fHuCYgiqnzS3MZket+4dMfqwJP3v1E=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <9d847884-bb9e-458e-b30a-290dae23d982@tuxedocomputers.com>
Date: Tue, 3 Mar 2026 23:58:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] platform/x86/uniwill: uniwill-laptop: Rework hwmon
 feature defines
To: W_Armin@gmx.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260303225440.504358-1-wse@tuxedocomputers.com>
 <20260303225440.504358-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260303225440.504358-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 03.03.26 um 23:54 schrieb Werner Sembach:
> From: Armin Wolf <W_Armin@gmx.de>
>
> Split hwmon feature define in smaller parts to accommodate for diverse
> hardware. You can now specify the presence of a cpu and/or a gpu temp
> sensor separately and if one or 2 fans exists.
>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Forgot to add

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

Tested-by: Werner Sembach <wse@tuxedocomputers.com>

> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 68 ++++++++++++++++++---
>   1 file changed, 61 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 6341dca20b76a..048b265bff374 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -319,8 +319,11 @@
>   #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
>   #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
>   #define UNIWILL_FEATURE_BATTERY			BIT(4)
> -#define UNIWILL_FEATURE_HWMON			BIT(5)
> -#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(6)
> +#define UNIWILL_FEATURE_CPU_TEMP		BIT(5)
> +#define UNIWILL_FEATURE_GPU_TEMP		BIT(6)
> +#define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
> +#define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
>   
>   struct uniwill_data {
>   	struct device *dev;
> @@ -427,7 +430,7 @@ static const struct key_entry uniwill_keymap[] = {
>   	{ KE_END }
>   };
>   
> -static inline bool uniwill_device_supports(struct uniwill_data *data,
> +static inline bool uniwill_device_supports(const struct uniwill_data *data,
>   					   unsigned int features)
>   {
>   	return (data->features & features) == features;
> @@ -937,6 +940,48 @@ static const struct attribute_group *uniwill_groups[] = {
>   	NULL
>   };
>   
> +static umode_t uniwill_is_visible(const void *drvdata, enum hwmon_sensor_types type, u32 attr,
> +				  int channel)
> +{
> +	const struct uniwill_data *data = drvdata;
> +	unsigned int feature;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (channel) {
> +		case 0:
> +			feature = UNIWILL_FEATURE_CPU_TEMP;
> +			break;
> +		case 1:
> +			feature = UNIWILL_FEATURE_GPU_TEMP;
> +			break;
> +		default:
> +			return 0;
> +		}
> +		break;
> +	case hwmon_fan:
> +	case hwmon_pwm:
> +		switch (channel) {
> +		case 0:
> +			feature = UNIWILL_FEATURE_PRIMARY_FAN;
> +			break;
> +		case 1:
> +			feature = UNIWILL_FEATURE_SECONDARY_FAN;
> +			break;
> +		default:
> +			return 0;
> +		}
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	if (uniwill_device_supports(data, feature))
> +		return 0444;
> +
> +	return 0;
> +}
> +
>   static int uniwill_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
>   			long *val)
>   {
> @@ -1020,7 +1065,7 @@ static int uniwill_read_string(struct device *dev, enum hwmon_sensor_types type,
>   }
>   
>   static const struct hwmon_ops uniwill_ops = {
> -	.visible = 0444,
> +	.is_visible = uniwill_is_visible,
>   	.read = uniwill_read,
>   	.read_string = uniwill_read_string,
>   };
> @@ -1048,7 +1093,10 @@ static int uniwill_hwmon_init(struct uniwill_data *data)
>   {
>   	struct device *hdev;
>   
> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_HWMON))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_CPU_TEMP) &&
> +	    !uniwill_device_supports(data, UNIWILL_FEATURE_GPU_TEMP) &&
> +	    !uniwill_device_supports(data, UNIWILL_FEATURE_PRIMARY_FAN) &&
> +	    !uniwill_device_supports(data, UNIWILL_FEATURE_SECONDARY_FAN))
>   		return 0;
>   
>   	hdev = devm_hwmon_device_register_with_info(data->dev, "uniwill", data,
> @@ -1687,7 +1735,10 @@ static struct uniwill_device_descriptor lapac71h_descriptor __initdata = {
>   		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>   		    UNIWILL_FEATURE_BATTERY |
> -		    UNIWILL_FEATURE_HWMON,
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN,
>   };
>   
>   static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
> @@ -1696,7 +1747,10 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
>   		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>   		    UNIWILL_FEATURE_LIGHTBAR |
>   		    UNIWILL_FEATURE_BATTERY |
> -		    UNIWILL_FEATURE_HWMON,
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN,
>   };
>   
>   static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
