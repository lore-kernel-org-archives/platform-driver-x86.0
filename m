Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842792F617C;
	Fri, 27 Feb 2026 18:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772217959; cv=none; b=QZFVfcZMHPImf5haZcNOdOT7WYvpO9/ubQS9sePaLxfTDh7xDUpp58euGKiieYmA8RA6i0JV3PwHWf4bG9GSROvQxdeP1uwpNm3oyco2dD+4erNsWBFQLbfDTSnGZdyJWPKxIO7V3xiYNpfiD56B+XVyiPQPtzETchi7CChRHwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772217959; c=relaxed/simple;
	bh=nblnST8oWmKRX4SuA9AKrz4j4p/VrGuUWtfsYwYxItw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sEqAqqc4Z9h8oTwB57wyn2YWqtn90Wl0SMZt+QQbDcC40D10u/iRt+41zq0EI0KrcgNSVqp6jf/ebyYJJ4YvCw7FpTGA7PCnsNqSft0pNh0kVOwbxaYfMMmuhRT1d5eGlYG9ho3jtNYDtYwn3Cp9/7+S1K+ta4llhB7wItlt00w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=FfKYNUHc; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="FfKYNUHc"
Received: from [192.168.178.24] (i5C75F712.versanet.de [92.117.247.18])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 6E4962FC004D;
	Fri, 27 Feb 2026 19:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772217954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4iFXJ8Oa3NJOvClyZIDURRvILiUlp/l/pP3ipWT4UCI=;
	b=FfKYNUHcwMrjLEkZF9dsmgp2EZzICVTZPmDz4v9aXAuOc2ql1kJJwoB5PXVx9RHwHY8p0a
	m4LqFmbDDr1erLc8s4cwkfJxpJCsgn+jMCcsFDBk0SvcZdanaVarOceQyO2TUPxvnJM5T0
	zJikDhp6pW2liUeI0ngA8vh6eM0IwqE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <04dbac24-2da6-4882-9ec8-4b3f3e29188f@tuxedocomputers.com>
Date: Fri, 27 Feb 2026 19:45:54 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] platform/x86/uniwill: uniwill-laptop: Rework hwmon
 feature defines
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226205302.123782-1-wse@tuxedocomputers.com>
 <20260226205302.123782-2-wse@tuxedocomputers.com>
 <175fbf7c-e5ab-4574-978a-6d2912a57faf@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <175fbf7c-e5ab-4574-978a-6d2912a57faf@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 27.02.26 um 10:28 schrieb Armin Wolf:
> Am 26.02.26 um 21:50 schrieb Werner Sembach:
>
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> Split hwmon feature define in smaller parts to accommodate for diverse
>> hardware. You can now specify the presence of a cpu and/or a gpu temp
>> sensor separately and if one or 2 fans exists.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 68 ++++++++++++++++++---
>>   1 file changed, 61 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 6341dca20b76a..7ab82cf16f388 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -319,8 +319,11 @@
>>   #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE        BIT(2)
>>   #define UNIWILL_FEATURE_LIGHTBAR        BIT(3)
>>   #define UNIWILL_FEATURE_BATTERY            BIT(4)
>> -#define UNIWILL_FEATURE_HWMON            BIT(5)
>> -#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL    BIT(6)
>> +#define UNIWILL_FEATURE_CPU_TEMP        BIT(5)
>> +#define UNIWILL_FEATURE_GPU_TEMP        BIT(6)
>> +#define UNIWILL_FEATURE_PRIMARY_FAN        BIT(7)
>> +#define UNIWILL_FEATURE_SECONDARY_FAN        BIT(8)
>> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL    BIT(9)
>>     struct uniwill_data {
>>       struct device *dev;
>> @@ -427,7 +430,7 @@ static const struct key_entry uniwill_keymap[] = {
>>       { KE_END }
>>   };
>>   -static inline bool uniwill_device_supports(struct uniwill_data *data,
>> +static inline bool uniwill_device_supports(const struct uniwill_data *data,
>>                          unsigned int features)
>>   {
>>       return (data->features & features) == features;
>> @@ -937,6 +940,48 @@ static const struct attribute_group *uniwill_groups[] = {
>>       NULL
>>   };
>>   +static umode_t uniwill_is_visible(const void *drvdata, enum 
>> hwmon_sensor_types type, u32 attr,
>> +                  int channel)
>> +{
>> +    const struct uniwill_data *data = drvdata;
>> +    unsigned int feature;
>> +
>> +    switch (type) {
>> +    case hwmon_temp:
>> +        switch (channel) {
>> +        case 0:
>> +            feature = UNIWILL_FEATURE_CPU_TEMP;
>> +            break;
>> +        case 1:
>> +            feature = UNIWILL_FEATURE_GPU_TEMP;
>> +            break;
>> +        default:
>> +            return 0;
>> +        }
>> +        break;
>> +    case hwmon_fan:
>> +    case hwmon_pwm:
>> +        switch (channel) {
>> +        case 0:
>> +            feature = UNIWILL_FEATURE_PRIMARY_FAN;
>> +            break;
>> +        case 1:
>> +            feature = UNIWILL_FEATURE_SECONDARY_FAN;
>> +            break;
>> +        default:
>> +            return 0;
>> +        }
>> +        break;
>> +    default:
>> +        return 0;
>> +    }
>> +
>> +    if (uniwill_device_supports(data, feature))
>> +        return 0440;
>
> I think you forgot this one.
yes missed it
>
>> +
>> +    return 0;
>> +}
>> +
>>   static int uniwill_read(struct device *dev, enum hwmon_sensor_types type, 
>> u32 attr, int channel,
>>               long *val)
>>   {
>> @@ -1020,7 +1065,7 @@ static int uniwill_read_string(struct device *dev, enum 
>> hwmon_sensor_types type,
>>   }
>>     static const struct hwmon_ops uniwill_ops = {
>> -    .visible = 0444,
>> +    .is_visible = uniwill_is_visible,
>>       .read = uniwill_read,
>>       .read_string = uniwill_read_string,
>>   };
>> @@ -1048,7 +1093,10 @@ static int uniwill_hwmon_init(struct uniwill_data *data)
>>   {
>>       struct device *hdev;
>>   -    if (!uniwill_device_supports(data, UNIWILL_FEATURE_HWMON))
>> +    if (!uniwill_device_supports(data, UNIWILL_FEATURE_CPU_TEMP) &&
>> +        !uniwill_device_supports(data, UNIWILL_FEATURE_GPU_TEMP) &&
>> +        !uniwill_device_supports(data, UNIWILL_FEATURE_PRIMARY_FAN) &&
>> +        !uniwill_device_supports(data, UNIWILL_FEATURE_SECONDARY_FAN))
>>           return 0;
>>         hdev = devm_hwmon_device_register_with_info(data->dev, "uniwill", data,
>> @@ -1687,7 +1735,10 @@ static struct uniwill_device_descriptor 
>> lapac71h_descriptor __initdata = {
>>               UNIWILL_FEATURE_SUPER_KEY |
>>               UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>>               UNIWILL_FEATURE_BATTERY |
>> -            UNIWILL_FEATURE_HWMON,
>> +            UNIWILL_FEATURE_CPU_TEMP |
>> +            UNIWILL_FEATURE_GPU_TEMP |
>> +            UNIWILL_FEATURE_PRIMARY_FAN |
>> +            UNIWILL_FEATURE_SECONDARY_FAN,
>>   };
>>     static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
>> @@ -1696,7 +1747,10 @@ static struct uniwill_device_descriptor 
>> lapkc71f_descriptor __initdata = {
>>               UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>>               UNIWILL_FEATURE_LIGHTBAR |
>>               UNIWILL_FEATURE_BATTERY |
>> -            UNIWILL_FEATURE_HWMON,
>> +            UNIWILL_FEATURE_CPU_TEMP |
>> +            UNIWILL_FEATURE_GPU_TEMP |
>> +            UNIWILL_FEATURE_PRIMARY_FAN |
>> +            UNIWILL_FEATURE_SECONDARY_FAN,
>>   };
>>     static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
