Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847933A0E8A;
	Wed,  5 Aug 2026 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785966436; cv=none; b=OasdcCA/ocao+ku7Tr5BVXI9KWuPpDUMoqbWceE0LpCMb7ivH8VxcqsHHQvRQP0jXVWiwfByOnQYjWssgMTsUfFGoFRconvo6iGr47db/8Bh5AM/n8u9MKVB5aQ6dfwpHPW6JiWgVqIANE+0I+v7LR7AO4FRWpl/JM8FjacX4BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785966436; c=relaxed/simple;
	bh=COKy2a3JGQF/rlCJxtO2ORBSzBGeKoUZJlR307q0fdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPP7XJeZxg6p3iIcOS0ocylAxRLpqj6vkX8LNNtg8HfkLHFtIFqtVJqRAuU0KK5agyu0Q49DsarW0VnGxBHOhMw7oufzVPSws+N+EEhcoy2rVa85GSmGBY/u+W6owAjAecjEljyWtyBiHoETqeFHLBk76hRc01FHNV2tq/vt3Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Sn/2opcA; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Sn/2opcA"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 53FE62FC0077;
	Wed,  5 Aug 2026 23:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1785966424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkSYxlgtsRUjHM+y3dKaviyIAZeSOML7QSakVkTWZ1k=;
	b=Sn/2opcA38iF0K89+lVurD2t47BB2OsO7S/d5izTrlYJE0UYJk/5UJC+lg/wTO5gvx4Tty
	8qDNq/0lrnw9r//eERXutS9FokPZ5zSqulS5rBuSPdJOzh8AnC1XnLa/gKXkzeEfqwozl0
	dcvdfKabBJg2NnyoOV+27p/010ge/mI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <54cebd4e-63d2-4e28-bc29-a6d427d192a3@tuxedocomputers.com>
Date: Wed, 5 Aug 2026 23:47:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: uniwill-laptop: Fix brightness notify
 for 3 level keyboards
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724230056.708736-1-wse@tuxedocomputers.com>
 <98179131-7beb-4ce0-93ca-2ebc58826d56@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <98179131-7beb-4ce0-93ca-2ebc58826d56@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 25.07.26 um 16:44 schrieb Armin Wolf:
> Am 25.07.26 um 01:00 schrieb Werner Sembach:
>
>> The devices with 3 brightness level keyboards seem to send
>> UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
>> UNIWILL_OSD_KB_LED_LEVEL4 and not UNIWILL_OSD_KB_LED_LEVEL0,
>> UNIWILL_OSD_KB_LED_LEVEL1, and UNIWILL_OSD_KB_LED_LEVEL2 so this patch does
>> not return the brightness based on one of these events, but the brightness
>> read from hardware.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 22 +++------------------
>>   1 file changed, 3 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 7a2eeaec4c961..d9a33be4f4a37 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -1626,7 +1626,7 @@ static int uniwill_led_init(struct uniwill_data *data)
>>                                &init_data);
>>   }
>>   -static int uniwill_notify_kbd_led(struct uniwill_data *data, int brightness)
>> +static int uniwill_notify_kbd_led(struct uniwill_data *data)
>>   {
>>       struct led_classdev *led_cdev;
>>       int ret;
>> @@ -1643,7 +1643,7 @@ static int uniwill_notify_kbd_led(struct uniwill_data 
>> *data, int brightness)
>>       if (ret < 0)
>>           return ret;
>>   -    led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
>> +    led_classdev_notify_brightness_hw_changed(led_cdev, led_cdev->brightness);
>
> WMI events are usually delivered with a large latency, a userspace application 
> could
> have changed the LED brightness value in the meantime.
>
> Please check the maximum keyboard backlight brightness inside 
> uniwill_notify_kbd_led()
> and translate the brightness values instead:
>
> /* Comment here */
> switch (data->kbd_led_max_brightness) {
> case 4:
>     break;
> case 2:
>     switch (brightness) {
>     case 0:
>         break;
>     case 2:
>         brightness = 1;
>         break;
>     case 4:
>         brightness = 2;
>         break;
>     default:
>         return -EINVAL;
>     }
>     break;
> default:
>     return -EINVAL;
> }
>
> Thanks,
> Armin Wolf
ack, but I did it with some ifs to make the footprint smaller
>
>>         return 0;
>>   }
>> @@ -2215,30 +2215,14 @@ static int uniwill_notifier_call(struct 
>> notifier_block *nb, unsigned long action
>>             return NOTIFY_OK;
>>       case UNIWILL_OSD_KB_LED_LEVEL0:
>> -        if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>> -            return NOTIFY_DONE;
>> -
>> -        return notifier_from_errno(uniwill_notify_kbd_led(data, 0));
>>       case UNIWILL_OSD_KB_LED_LEVEL1:
>> -        if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>> -            return NOTIFY_DONE;
>> -
>> -        return notifier_from_errno(uniwill_notify_kbd_led(data, 1));
>>       case UNIWILL_OSD_KB_LED_LEVEL2:
>> -        if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>> -            return NOTIFY_DONE;
>> -
>> -        return notifier_from_errno(uniwill_notify_kbd_led(data, 2));
>>       case UNIWILL_OSD_KB_LED_LEVEL3:
>> -        if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>> -            return NOTIFY_DONE;
>> -
>> -        return notifier_from_errno(uniwill_notify_kbd_led(data, 3));
>>       case UNIWILL_OSD_KB_LED_LEVEL4:
>>           if (!uniwill_device_supports(data, 
>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>>               return NOTIFY_DONE;
>>   -        return notifier_from_errno(uniwill_notify_kbd_led(data, 4));
>> +        return notifier_from_errno(uniwill_notify_kbd_led(data));
>>       default:
>>           mutex_lock(&data->input_lock);
>>           sparse_keymap_report_event(data->input_device, action, 1, true);
>>
>> base-commit: caf8342512c3056005f475d350eeca089c3c6623
