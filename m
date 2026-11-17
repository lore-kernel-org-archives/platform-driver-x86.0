Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911368;
	b=vp8lKua/yyVLnI65DIh88Ln+9FFltRtgFQ9F754UEhU1AoXI3kS4AJvx9P0TX70SKU7n
	 y6BjFXcBgxTlSYXaePmNORE6jviV1qa6Z/2QQb7/qecAyRG4HystpzK4hdu8IaIm96Ohb
	 9wJEGXXkc1RB6wEue6OqUrX+U/7VKAekihwcqvUgwf8Aw25MigtRV57jPBby62vViwN3W
	 8fyYpKnWyb1a0LR9vinT8ZPeGuHSKBX4mXR6uxc7IaRTN/WAgyYqwABkBFLANMZXKbCc3
	 XzK2Ht/h6yr5YAZJAh+tB3rnFQr3qi68OliJoeF4XAV+JEiPgw8hmXBdFIwqHJ5hEcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911368;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nmEzjUGKCjpygr9GTx6fqSFUim6tApeDxOuwDC4y2DQ=;
	b=QbxhX9pFthUsYcdXabzvEpAKP2+0P1Fy9u1d49wGSe7nI1yy0iAP2SwkFdkAQUU305z8
	 oXMeYKruZDbKFfX9dMr8SiL6Kheu8aYi5xgyYWtq4mi7pZF0+laZ7jKzpiG4knGwcbBky
	 Nj6Ksny+M9qyXsgPI2k61v2YyMVPPXCLGZTt1RNg3z2j9OWatQCyu7L526fZBNP6LU2OO
	 7djU/SptupSb7nc2UIpcuQRN2RqwJ1tNXBn8eFbHc8vyuUU8rcMu1CXj5ajNbdvThqgv3
	 hOe8mcVQgcu43tDFLYsqvFJLjqoRD23esbLL62vZ3atwWtb49O4o1TKS2+uvvNzTm5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=eftk+HLL;
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F26606A31C;
	Tue, 17 Nov 2026 10:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F26606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=eftk+HLL
Received: from [10.10.12.8] (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id F3DD32FC0048;
	Tue, 17 Nov 2026 11:29:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1794911359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmEzjUGKCjpygr9GTx6fqSFUim6tApeDxOuwDC4y2DQ=;
	b=eftk+HLLzYFSc1Y07j+q8y3q6KcL66FGBheeB4k1i5LCs/O1TdU/xT4m3svLWwClBbjyoI
	HkCBd9jtTv2Gn9vSBt6DuIgQ5As8ywXxAGP8Y/3vXpDmR8AuBUFUUrQHKg8eofpducCy73
	IBv9EzqXBtZi1qOm9CeSd3NFR7u8S8g=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <da9b330c-a04e-4029-9abf-59fc4356da99@tuxedocomputers.com>
Date: Tue, 17 Nov 2026 11:29:18 +0100
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
Subject: Re: [PATCH] platform/x86: uniwill-laptop: Remove cTGP control from
 unsupported devices
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113144749.59958-1-wse@tuxedocomputers.com>
 <6ac5ca43-25db-4843-8317-dee4cd55c627@gmx.de>
Content-Language: en-US, de-DE
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <6ac5ca43-25db-4843-8317-dee4cd55c627@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.11.26 um 21:42 schrieb Armin Wolf:
> Am 13.11.26 um 15:47 schrieb Werner Sembach:
>> Some devices like the InfinityBook Pro series have Dynamic Boost support,
>> but the cTGP setting is actually ignored.
>>
>> This commit adds the ability to still initialize DB, but hide the noop cTGP
>> sysfs attribute and applies this to the respective devices.
>
> IMHO the cTGP setting only works with the official NVidia driver and 
> nvidia-powerd running in the background.
Yes I know, but so does DB and that one works, so the setup is correct.
> Also there currently is a tiny
> issue with cTGP support, do you have a acpidump from one of the affected 
> machines?
Can generate one, I will send in a separate email because I will just sent the 
binary files, and want to make sure that this message doesn't get blocked by 
spam filters.
>
> Thanks,
> Armin Wolf
>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 26 ++++++++++++++-------
>>   1 file changed, 17 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index e2a6a704e942e..c0a75bc6e66db 100644
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
>
