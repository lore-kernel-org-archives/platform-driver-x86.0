Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008E81898F8;
	Tue, 18 Nov 2025 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469935; cv=none; b=VVe9VUbx2wSe5dLcF0OMQnDKV9BdzJ4Im+SykqQGzyh4BpcrJBM1zOHocVpPHZrYHq95GacEosjFCryJHWD2dhgnBwbeCsDZzmUMWHtaqRNRaLPYfG4bbjwpcvn3u3QfoXJJMEj1Nwl/xo7+EEXgvnRNHkbroUZ4of0QjT6Bzek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469935; c=relaxed/simple;
	bh=aDgvJ7SuOFHDBcBQpmDBU0/SyCnlnOrFvwPn/svM0yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q5RQOsywYgpROyKVqVG+h5nagU9hbZIzCXxZrdHCwTl/npmX1HHDYeO1EgNxw865KB+8W9d2hny53SyI4IY0HJYicogYAEOaEyEuF0VpBh35m922NAXa2R8jFDQQpc41Lu+ywnoJfSzJxevKTFBzNPdthZNCnwBqUP5HzZ3fOqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=TjBBZq4J; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="TjBBZq4J"
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 715832FC0057;
	Tue, 18 Nov 2025 13:45:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763469929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gj3ORWps5Oy9jCn0nzPr0f2mfs8b6JEVmVOKtKkmvds=;
	b=TjBBZq4J4IfFxrhkmZP46J7f9smJeF1kl8RzrWK5Umg9/A6mGB+5O9wU805ZS+OoWMI8vT
	dPC0MMO0Je7BNYx63jO/6dAwGGeoabagkxYvyVPn+anUm5W7bc6I6mPen038lmejOAbTFW
	BrpAY9UhjNy0KcYWAopuaehqe7gYtFY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <29b24831-92d4-47c6-8daf-7d1879951d43@tuxedocomputers.com>
Date: Tue, 18 Nov 2025 13:45:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] platform/x86/uniwill: Handle more WMI events required
 for TUXEDO devices
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-3-wse@tuxedocomputers.com>
 <fc1b75ce-113d-4de1-ac98-7616b17f915c@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <fc1b75ce-113d-4de1-ac98-7616b17f915c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 18.11.25 um 12:08 schrieb Armin Wolf:
> Am 17.11.25 um 14:23 schrieb Werner Sembach:
>
>> Handle some more WMI events that are triggered on TUXEDO devices.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 19 ++++++++++++++++++-
>>   drivers/platform/x86/uniwill/uniwill-wmi.h  |  2 ++
>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 29bb3709bfcc8..0cb86a701b2e1 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -371,9 +371,11 @@ static const struct key_entry uniwill_keymap[] = {
>>         /* Reported in manual mode when toggling the airplane mode status */
>>       { KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL }},
>> +    { KE_IGNORE,    UNIWILL_OSD_RADIOON,                    { KEY_UNKNOWN }},
>> +    { KE_IGNORE,    UNIWILL_OSD_RADIOOFF,                   { KEY_UNKNOWN }},
>>         /* Reported when user wants to cycle the platform profile */
>> -    { KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN }},
>> +    { KE_KEY,       UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_F14 }},
>
> I am currently working a patch adding platform profile support, so this event 
> would
> be handled inside the kernel on models with platform profile support.

For tuxedo devices we have profiles managed in userspace that do additional 
things. So we need a way to handle this in userspace.

The 2 things I can spontaneously think of would be a sysfs toggle or 2 different 
UNIWILL_FEATURE_* defines.

>
>>         /* Reported when the user wants to adjust the brightness of the 
>> keyboard */
>>       { KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { 
>> KEY_KBDILLUMDOWN }},
>> @@ -382,11 +384,19 @@ static const struct key_entry uniwill_keymap[] = {
>>       /* Reported when the user wants to toggle the microphone mute status */
>>       { KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE }},
>>   +    /* Reported when the user wants to toggle the mute status */
>> +    { KE_IGNORE,    UNIWILL_OSD_MUTE,                       { KEY_MUTE }},
>
> Why is this event being ignored?
Because the UNIWILL_OSD_MUTE event is sent in addition to the mute key event, so 
not ignoring it here would result in a double trigger.
>
>> +
>>       /* Reported when the user locks/unlocks the Fn key */
>>       { KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC }},
>>         /* Reported when the user wants to toggle the brightness of the 
>> keyboard */
>>       { KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { 
>> KEY_KBDILLUMTOGGLE }},
>> +    { KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL0,              { 
>> KEY_KBDILLUMTOGGLE }},
>> +    { KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL1,              { 
>> KEY_KBDILLUMTOGGLE }},
>> +    { KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL2,              { 
>> KEY_KBDILLUMTOGGLE }},
>> +    { KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL3,              { 
>> KEY_KBDILLUMTOGGLE }},
>> +    { KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL4,              { 
>> KEY_KBDILLUMTOGGLE }},
>>         /* FIXME: find out the exact meaning of those events */
>>       { KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN }},
>> @@ -395,6 +405,9 @@ static const struct key_entry uniwill_keymap[] = {
>>       /* Reported when the user wants to toggle the benchmark mode status */
>>       { KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN }},
>>   +    /* Reported when the user wants to toggle the webcam */
>> +    { KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN }},
>
> Same as above.

Same as above ;)

At least iirc, would have to double check

>
>> +
>>       { KE_END }
>>   };
>>   @@ -1247,6 +1260,10 @@ static int uniwill_notifier_call(struct 
>> notifier_block *nb, unsigned long action
>>           }
>>           mutex_unlock(&data->battery_lock);
>>   +        return NOTIFY_OK;
>> +    case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>> +        // noop for the time being
>
> Wrong comment style, please use /* */.
ack
>
> Thanks,
> Armin Wolf
>
>> +
>>           return NOTIFY_OK;
>>       default:
>>           mutex_lock(&data->input_lock);
>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h 
>> b/drivers/platform/x86/uniwill/uniwill-wmi.h
>> index 2bf69f2d80381..48783b2e9ffb9 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>> @@ -113,6 +113,8 @@
>>     #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE    0xC0
>>   +#define UNIWILL_OSD_WEBCAM_TOGGLE        0xCF
>> +
>>   #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED    0xF0
>>     struct device;
