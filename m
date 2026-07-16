Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F8D42CAF7;
	Thu, 16 Jul 2026 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784214793; cv=none; b=h10Kl0UA6IKpgyvTkN5lb6RkrE71dSccarqWb3EiNGPQCZs8Lw+BXsHm2lUg5MD3OjDyULUMpkgeQKA8SUHBQqS0BPvmCDe62duwYKKPIfBJsc4KwWbmy+YSMEpKbm/fuOrdcx/W0a3NRpw5aR4GJLKMT+r5REvlQ/HO3MB5Jw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784214793; c=relaxed/simple;
	bh=Iy7PAIPgGo2TixNjNEpl1ikLy4RYKV1PX7248448rig=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jRxb+Ln0MQcF05zLr8hDQoonB6O+TpVHOiT0qIIbUIzaJ7f1x+Fuv1BNEQx/cOSbpVhFFtWZWtCqNMDo2Ec2qxn2Bn9YLGH46hd3sfkZYclIG48ElNC2Y+35RuSO47gZANJMpT7+R+BsQrVGH15iLy1d00IErdhExR+wVkRUFbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=HrL8rCJh; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="HrL8rCJh"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id DEAD82FC0071;
	Thu, 16 Jul 2026 17:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1784214780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hV4vyMmK3CV5GChl2sk0SXKFJaLQLK2YjK1nIm4Oiww=;
	b=HrL8rCJhfGIqs3HYPt7H+0yNKgbaFWv330qUidZcmjCcUcDUoI6Fj5cGZqkH4MItNqmcwY
	HX4wU7zNaCkmxXQfynr7RXw3ElE5vexYKzW7JT2fB0oDO4bSQ/UcHaAphrAv/7e11WgzQT
	SJCwzpcjCygTzSMnIms82nkD58dbbUg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <10f11233-af26-4984-b557-febaa381c193@tuxedocomputers.com>
Date: Thu, 16 Jul 2026 17:12:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] platform/x86: uniwill-laptop: Make
 KBD_LED_MAX_INTENSITY configurable
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710223544.49602-1-W_Armin@gmx.de>
 <20260710223544.49602-4-W_Armin@gmx.de>
 <5bb7d5c3-a6d3-458b-b536-ece19c972024@tuxedocomputers.com>
Content-Language: en-US
In-Reply-To: <5bb7d5c3-a6d3-458b-b536-ece19c972024@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 15.07.26 um 17:19 schrieb Werner Sembach:
>
> Am 11.07.26 um 00:35 schrieb Armin Wolf:
>> Some (yet to be enabled) Tuxedo devices have a maximum intensity of
>> 200 instead of the default 50. Remove the hardcoded maximum intensity
>> and use the device descriptor instead.

sorry i gave missinformation, we actually convert down to the range 0-50 in td 
for all devices here: 
https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers/-/blob/0b2f8c6ab7ef709343ae74b3de51dcae45357641/src/uniwill_leds.h#L106

so this patch can actually be dropped

>>
>> Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 4591ee299a90..5b8e35bf9a51 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -351,7 +351,6 @@
>>   #define LED_CHANNELS        3
>>     #define KBD_LED_CHANNELS    3
>> -#define KBD_LED_MAX_INTENSITY    50
>>     #define UNIWILL_FEATURE_FN_LOCK            BIT(0)
>>   #define UNIWILL_FEATURE_SUPER_KEY        BIT(1)
>> @@ -403,6 +402,7 @@ struct uniwill_data {
>>       struct mc_subled led_mc_subled_info[LED_CHANNELS];
>>       bool kbd_led_single_color;
>>       u8 kbd_led_max_brightness;
>> +    u8 kbd_led_max_intensity;
>>       unsigned int last_kbd_status;
>>       union {
>>           struct {
>> @@ -429,6 +429,7 @@ struct uniwill_device_descriptor {
>>       unsigned int features;
>>       bool kbd_led_single_color;
>>       u8 kbd_led_max_brightness;
>> +    u8 kbd_led_max_intensity;
>>       u8 lightbar_max_brightness;
>>       /* Executed during driver probing */
>>       int (*probe)(struct uniwill_data *data);
>> @@ -1780,8 +1781,8 @@ static int uniwill_rgb_kbd_led_init(struct uniwill_data 
>> *data)
>>            * Make sure that the initial intensity value is not greater than
>>            * the maximum intensity.
>>            */
>> -        if (regval > KBD_LED_MAX_INTENSITY) {
>> -            regval = KBD_LED_MAX_INTENSITY;
>> +        if (regval > data->kbd_led_max_intensity) {
>> +            regval = data->kbd_led_max_intensity;
>>               ret = regmap_write(data->regmap, 
>> uniwill_kbd_led_channel_to_reg[i], regval);
>>               if (ret < 0)
>>                   return ret;
>> @@ -1793,7 +1794,7 @@ static int uniwill_rgb_kbd_led_init(struct uniwill_data 
>> *data)
>>               intensity_all_zeros = false;
>>             data->kbd_led_mc_subled_info[i].intensity = regval;
>> -        data->kbd_led_mc_subled_info[i].max_intensity = KBD_LED_MAX_INTENSITY;
>> +        data->kbd_led_mc_subled_info[i].max_intensity = 
>> data->kbd_led_max_intensity;
>>           data->kbd_led_mc_subled_info[i].channel = i;
>>       }
>>   @@ -2338,6 +2339,7 @@ static int uniwill_probe(struct platform_device *pdev)
>>       data->features = device_descriptor.features;
>>       data->kbd_led_single_color = device_descriptor.kbd_led_single_color;
>>       data->kbd_led_max_brightness = device_descriptor.kbd_led_max_brightness;
>> +    data->kbd_led_max_intensity = device_descriptor.kbd_led_max_intensity;
>>       data->lightbar_max_brightness = device_descriptor.lightbar_max_brightness;
>>         /*
>> @@ -2675,6 +2677,7 @@ static struct uniwill_device_descriptor 
>> machenike_l16p_descriptor __initdata = {
>>               UNIWILL_FEATURE_USB_POWERSHARE,
>>       .kbd_led_single_color = false,
>>       .kbd_led_max_brightness = 4,
>> +    .kbd_led_max_intensity = 50,
>>   };
>>     static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor 
>> __initdata = {
>> @@ -2858,6 +2861,7 @@ static struct uniwill_device_descriptor 
>> x4sp4nal_descriptor __initdata = {
>>               UNIWILL_FEATURE_USB_POWERSHARE,
>>       .kbd_led_single_color = true,
>>       .kbd_led_max_brightness = 2,
>> +    .kbd_led_max_intensity = 50,
>>   };
>>     static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>> @@ -3355,6 +3359,7 @@ static int __init uniwill_init(void)
>>           device_descriptor.kbd_led_single_color = false;
>>           /* Some models only support 3 brightness levels */
>>           device_descriptor.kbd_led_max_brightness = 4;
>> +        device_descriptor.kbd_led_max_intensity = 50;
>>           /* Some models only support 36 brightness levels per color 
>> component */
>>           device_descriptor.lightbar_max_brightness = 200;
>>           pr_warn("Enabling potentially unsupported features\n");
>
> lgtm
>
> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
>
