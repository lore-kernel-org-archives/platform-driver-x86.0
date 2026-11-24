Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535463;
	b=oIWFVgT71As+JruqHgZ4jKoqiERTYfmoJF/JDjPJFDn/S0agah9QqFRVsO8yAfr0aIqT
	 NU5/x2TB4WaM8Yz+tFKR8QCaXwphHmJNgwKY71Gq4bBDe/f0bINgTjc082hu4i7dJhrh+
	 R8ZRIJaqONneQJrQOJ+jvDJ5Qycalq/zWT3OfhjzaQzXAFFgXuf16hjX5s4JlIh6iJ24b
	 wiLJGzTUSDgT54zL3gKAV0FNJ1y4qa3US1MdRB6IPnrinCp2tw0xS/ntOyZuVMK5C2bZn
	 OLvc3wbbxCtgnhn/QzMYM2+jmP+89hPiPyrsDrbZGKhqQPLx55BffgKt8zmWZJFH0Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535463;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+0+VzjcsKx1nr4LQUxK2fwSRPHTLOPOaso9I8zmCrfk=;
	b=WXFTTugISSgr4sNsfV6ubt3UH/+qUUBZID4PbUgc9ophp8kW/KNuzzU2OFOchi53D93r
	 BDYlEPBfO6A4AfFsgECxN94Za6qtSnWKn1xJnnZM4MH3r4raYMJA1GtqG3j+9HCIW5gke
	 h+xRa9luBovQ0MsIJWOXHDxKfs8sdS3LHk4GW48VuXqQ0nPCKgBLSiaAxwtc/cuBb/M1I
	 YNzAWJKyB8zGp6mKafe9HmhqksnI34f5b94vKe/uxM3DMinfsKjzm2SgKqq3bxVFRo5+M
	 RboTH9wcQb742VyCHUclW8xXfFklV27CSg88ri9YKADD0yPGzRHLe+Pk/RJayFSlLJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=FPF2VsJT;
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1461A606A31E;
	Tue, 24 Nov 2026 15:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1461A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=FPF2VsJT
Received: from [10.10.12.8] (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 4D6D92FC004A;
	Tue, 24 Nov 2026 16:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1795535459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0+VzjcsKx1nr4LQUxK2fwSRPHTLOPOaso9I8zmCrfk=;
	b=FPF2VsJTvuwZBocWHuaefCTleLiSgEMgy2QzbgzrdTvws6QgyOFSF6JNPpjbGu+UeLky0q
	djUELzf30xBDCOMEcFDyShppmuGzkxgh98Yr5Xv+u0ZQdGHAmZt7vzrBD+IPbQJPCRM4Mf
	gFwL4kFs62u75npFiWgxErabJgzw08U=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <48e192d6-3c72-49fe-b2a9-ed5dd296d737@tuxedocomputers.com>
Date: Tue, 24 Nov 2026 16:50:58 +0100
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
Subject: Re: [PATCH v2] platform/x86: uniwill-laptop: Remove cTGP control from
 unsupported devices
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261124151303.435534-1-wse@tuxedocomputers.com>
 <90a3cf06-ab77-4995-ab27-8e10eb9d8e87@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <90a3cf06-ab77-4995-ab27-8e10eb9d8e87@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 24.11.26 um 16:39 schrieb Armin Wolf:
> Am 24.11.26 um 16:11 schrieb Werner Sembach:
>> Some devices like the InfinityBook Pro series have Dynamic Boost support,
>> but the cTGP setting is actually ignored.
>>
>> This commit adds the ability to still initialize DB, but hide the noop cTGP
>> sysfs attribute and applies this to the respective devices.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>> V2: Fix "force" mode not respecting mutual exclusivity of new feature bit.
>>
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 30 ++++++++++++++-------
>>   1 file changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index e2a6a704e942e..bef072f9f1b55 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -366,10 +366,12 @@
>>   #define UNIWILL_FEATURE_PRIMARY_FAN        BIT(8)
>>   #define UNIWILL_FEATURE_SECONDARY_FAN        BIT(9)
>>   #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL    BIT(10)
>> -#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY    BIT(11)
>> -#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT    BIT(12)
>> -#define UNIWILL_FEATURE_AC_AUTO_BOOT        BIT(13)
>> -#define UNIWILL_FEATURE_USB_POWERSHARE        BIT(14)
>> +/* Mutually exclusive with the cTGP control feature */
>> +#define UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY    BIT(11)
>
> Hi,
>
> i think it would be better to instead split 
> UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL into UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL 
> and UNIWILL_FEATURE_NVIDIA_DB_CONTROL.
>
> Devices that currently support cTGP control just need to also set 
> UNIWILL_FEATURE_NVIDIA_DB_CONTROL, and devices that only support dynamic boost 
> only need to set UNIWILL_FEATURE_NVIDIA_DB_CONTROL.
>
> This way we can avoid having another set of mutally exclusive feature flags.
ok
>
>> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY    BIT(12)
>> +#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT    BIT(13)
>> +#define UNIWILL_FEATURE_AC_AUTO_BOOT        BIT(14)
>> +#define UNIWILL_FEATURE_USB_POWERSHARE        BIT(15)
>>     enum usb_c_power_priority_options {
>>       USB_C_POWER_PRIORITY_CHARGING = 0,
>> @@ -1004,7 +1006,9 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data 
>> *data)
>>   {
>>       int ret;
>>   -    if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
>> +    if (!uniwill_device_supports_any(data,
>> +                     UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
>> +                     UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
>>           return 0;
>
> Should we still set CTGP_DB_CTGP_ENABLE if cTGP control is not supported? Also 
> i think we should not touch EC_ADDR_CTGP_DB_CTGP_OFFSET if cTGP support is not 
> present, the same goes for dynamic boost.
>
> Thanks,
> Armin Wolf
>
>>         ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 0);
>> @@ -2577,7 +2581,9 @@ static int uniwill_suspend_usb_powershare(struct 
>> uniwill_data *data)
>>     static int uniwill_suspend_nvidia_ctgp(struct uniwill_data *data)
>>   {
>> -    if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
>> +    if (!uniwill_device_supports_any(data,
>> +                     UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
>> +                     UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
>>           return 0;
>>         return regmap_clear_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
>> @@ -2686,7 +2692,9 @@ static int uniwill_resume_usb_powershare(struct 
>> uniwill_data *data)
>>     static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
>>   {
>> -    if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
>> +    if (!uniwill_device_supports_any(data,
>> +                     UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
>> +                     UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
>>           return 0;
>>         return regmap_set_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
>> @@ -2910,7 +2918,7 @@ static struct uniwill_device_descriptor 
>> phxtqxx_phxagxx_phxaqxx_phxpgxx_descript
>>               UNIWILL_FEATURE_GPU_TEMP |
>>               UNIWILL_FEATURE_PRIMARY_FAN |
>>               UNIWILL_FEATURE_SECONDARY_FAN |
>> -            UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
>> +            UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY |
>>               UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
>>               UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
>>       .kbd_led_single_color = true,
>> @@ -3106,7 +3114,7 @@ static int phxarxx_phxaqxx_probe(struct uniwill_data 
>> *data)
>>         if (value & HAS_GPU)
>>           data->features |= UNIWILL_FEATURE_GPU_TEMP |
>> -                  UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
>> +                  UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY;
>>         return 0;
>>   };
>> @@ -3711,7 +3719,9 @@ static int __init uniwill_init(void)
>>         if (force) {
>>           /* Assume that the device supports all features except the charge 
>> limit */
>> -        device_descriptor.features = UINT_MAX & 
>> ~UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT;
>> +        device_descriptor.features = UINT_MAX &
>> +            ~(UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>> +            UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY);
>>           /* Some models only have a (white) single color keyboard backlight */
>>           device_descriptor.kbd_led_single_color = false;
>>           /* Some models only support 3 brightness levels */
>
