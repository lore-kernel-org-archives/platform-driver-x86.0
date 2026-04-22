Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0EA3563D4;
	Wed, 22 Apr 2026 13:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863607; cv=none; b=cpF9VGdVxeBw7GHiJBB6Rhqh49+mVJWk25oDB0NqX3rAhIOobl5+02OUyQA02TmIFk/XgzCYFE3AHLm1ToI/p/VyyGe4du6M6TqgDVKh/n04ILbDBIUxjLRglp5zqfjU9PK9yVYFnu552v01u/SqzYZ+LFVrhmVkQpKoSzhsgF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863607; c=relaxed/simple;
	bh=ouzVAkikpmSg76mL+kAMgT8DG1XGxrxMyC8HWDaAufA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3xyO0nWxOcUsVrkttdBAD3VVEqWlOE7C4T0xnvp3Xh14n+agrrXLNEKQ56O6asKAeqRqID+QfZCZwE9gAzPUoSRAd2A6+33tmyGOef/iCRwlxSLp55fuSgO8VGR03V4QCPi4nm+KR2jCGpEO3kh/NYI+1L8fKsHILQHTnwiV94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=V6FLxkM/; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="V6FLxkM/"
Received: from [192.168.178.25] (i5C75F720.versanet.de [92.117.247.32])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 9AD5D2FC022B;
	Wed, 22 Apr 2026 15:13:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1776863601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LE/FYVlXRsAIbJQEJ4LImMoXbO1PHhRr+APkHFKHCRA=;
	b=V6FLxkM/hPfae9xv+Hk5RzQZGyW1++E2b/Ru3NJD+gMSbOeX2LgPlM/bNyFNwAqBZ2VAsP
	Z9NU36rlPB0pKaZwABaHDiQAPrJTuCIKpOC5gvowqvpyqO1xnI3O+Z7YMnSjyeah7V00y+
	jh96FFr/ZBEm/DJOC9npmyXPQLqX/lc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <51d8e460-1036-4ff0-a10b-e437d31295b6@tuxedocomputers.com>
Date: Wed, 22 Apr 2026 15:13:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: uniwill-laptop: Implement lightbar
 for XMG Fusion (L19)
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260421201103.142403-1-wse@tuxedocomputers.com>
 <20260421201103.142403-3-wse@tuxedocomputers.com>
 <d85481fe-513c-48db-b766-8f365bcbf66b@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <d85481fe-513c-48db-b766-8f365bcbf66b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Armin,

Am 22.04.26 um 13:17 schrieb Armin Wolf:
> Am 21.04.26 um 22:01 schrieb Werner Sembach:
>> The XMG Fusion (L19) also has a lightbar but with a different max
>> brightness value of 36 instead of 200.
>>
>> This patch adds a new feature flag for the driver to correctly handle this
>> case and applies it to the mentioned device.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 19 +++++++++++++------
>>   1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 7d1fdbacc6871..62d56cc67e2e8 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -318,7 +318,6 @@
>>   #define FAN_TABLE_LENGTH    16
>>     #define LED_CHANNELS        3
>> -#define LED_MAX_BRIGHTNESS    200
>>     #define UNIWILL_FEATURE_FN_LOCK            BIT(0)
>>   #define UNIWILL_FEATURE_SUPER_KEY        BIT(1)
>> @@ -344,6 +343,7 @@ struct uniwill_data {
>>       acpi_handle handle;
>>       struct regmap *regmap;
>>       unsigned int features;
>> +    u8 lightbar_max_brightness;
>>       struct acpi_battery_hook hook;
>>       struct mutex battery_lock;    /* Protects the list of currently 
>> registered batteries */
>>       union {
>> @@ -376,6 +376,7 @@ struct uniwill_battery_entry {
>>     struct uniwill_device_descriptor {
>>       unsigned int features;
>> +    u8 lightbar_max_brightness;
>>       /* Executed during driver probing */
>>       int (*probe)(struct uniwill_data *data);
>>   };
>> @@ -1340,7 +1341,7 @@ static int uniwill_led_brightness_set(struct 
>> led_classdev *led_cdev, enum led_br
>>         for (int i = 0; i < LED_CHANNELS; i++) {
>>           /* Prevent the brightness values from overflowing */
>> -        value = min(LED_MAX_BRIGHTNESS, 
>> data->led_mc_subled_info[i].brightness);
>> +        value = min(data->lightbar_max_brightness, 
>> data->led_mc_subled_info[i].brightness);
>>           ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], 
>> value);
>>           if (ret < 0)
>>               return ret;
>> @@ -1376,12 +1377,14 @@ static int uniwill_led_init(struct uniwill_data *data)
>>           LED_COLOR_ID_GREEN,
>>           LED_COLOR_ID_BLUE,
>>       };
>> -    unsigned int value;
>> +    unsigned int value, max_brightness;
>>       int ret;
>>         if (!uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR))
>>           return 0;
>>   +    max_brightness = data->lightbar_max_brightness;
>
> Please drop the max_brightness variable and assign led_cdev.max_brightness and 
> led_cdev.brightness directly.
ok
>
>> +
>>       ret = devm_mutex_init(data->dev, &data->led_lock);
>>       if (ret < 0)
>>           return ret;
>> @@ -1409,14 +1412,14 @@ static int uniwill_led_init(struct uniwill_data *data)
>>           return ret;
>>         data->led_mc_cdev.led_cdev.color = LED_COLOR_ID_MULTI;
>> -    data->led_mc_cdev.led_cdev.max_brightness = LED_MAX_BRIGHTNESS;
>> +    data->led_mc_cdev.led_cdev.max_brightness = max_brightness;
>>       data->led_mc_cdev.led_cdev.flags = LED_REJECT_NAME_CONFLICT;
>>       data->led_mc_cdev.led_cdev.brightness_set_blocking = 
>> uniwill_led_brightness_set;
>>         if (value & LIGHTBAR_S0_OFF)
>>           data->led_mc_cdev.led_cdev.brightness = 0;
>>       else
>> -        data->led_mc_cdev.led_cdev.brightness = LED_MAX_BRIGHTNESS;
>> +        data->led_mc_cdev.led_cdev.brightness = max_brightness;
>>         for (int i = 0; i < LED_CHANNELS; i++) {
>>           data->led_mc_subled_info[i].color_index = color_indices[i];
>> @@ -1429,7 +1432,7 @@ static int uniwill_led_init(struct uniwill_data *data)
>>            * Make sure that the initial intensity value is not greater than
>>            * the maximum brightness.
>>            */
>> -        value = min(LED_MAX_BRIGHTNESS, value);
>> +        value = min(max_brightness, value);
>>           ret = regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i], 
>> value);
>>           if (ret < 0)
>>               return ret;
>> @@ -1882,6 +1885,7 @@ static int uniwill_probe(struct platform_device *pdev)
>>           return ret;
>>         data->features = device_descriptor.features;
>> +    data->lightbar_max_brightness = device_descriptor.lightbar_max_brightness;
>>         /*
>>        * Some devices might need to perform some device-specific 
>> initialization steps
>> @@ -2130,11 +2134,13 @@ static struct platform_driver uniwill_driver = {
>>     static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor 
>> __initdata = {
>>       .features = UNIWILL_FEATURE_SUPER_KEY |
>> +            UNIWILL_FEATURE_LIGHTBAR |
>>               UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>               UNIWILL_FEATURE_CPU_TEMP |
>>               UNIWILL_FEATURE_GPU_TEMP |
>>               UNIWILL_FEATURE_PRIMARY_FAN |
>>               UNIWILL_FEATURE_SECONDARY_FAN,
>> +    .lightbar_max_brightness = 36,
>>   };
>>     static struct uniwill_device_descriptor lapac71h_descriptor __initdata = {
>> @@ -2158,6 +2164,7 @@ static struct uniwill_device_descriptor 
>> lapkc71f_descriptor __initdata = {
>>               UNIWILL_FEATURE_GPU_TEMP |
>>               UNIWILL_FEATURE_PRIMARY_FAN |
>>               UNIWILL_FEATURE_SECONDARY_FAN,
>> +    .lightbar_max_brightness = 200,
>
> Please also set lightbar_max_brightness to 200 during module initialization 
> when the "force" parameter is set.

Ok

Best regards,

Werner

>
> I suggest you rebase this series on top of the "platform/x86: uniwill-laptop: 
> Charging-related improvements" series to avoid merge conflicts.
>
> Thanks,
> Armin Wolf
>
>>   };
>>     /*
>
