Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF92314A7E;
	Thu, 20 Nov 2025 22:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763676372; cv=none; b=akFZgdutsyQQYOqvq05myg82sdenAx7IxbOIxQr4s5mqucks6a7itw8p2LpQyWZbdPZw+I0KgspULcwFot2d6WSxG7SU5H/dawFEtBSq0bxRyx5GI+GnH9gHbtZo0OwJfaWf4JTNwsPNhZjPQhEHu1Lfb5UkpbYKjcf+9XBGS7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763676372; c=relaxed/simple;
	bh=1yKD73cEiCxQ/b2VbRgcmoD/mq8Xrk8VgAtNmPkW65s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUW2SToaEcqW8t+iEleNVdKFH2fdo28aIjctFGQ7y495d/LsqXsFaJPTH/kIh73fSmOl5q0wj4bSipxeRuZ8RY71qbKVXj+ue/y0IlaN0TtkZjy2Ms6bzB9yG0qKjGitMWhlraszG5CDeqicRRRdRuYKhiH4qwlnT3qg0OMfKa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=TgGmfMmb; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="TgGmfMmb"
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id B13462FC0055;
	Thu, 20 Nov 2025 23:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763676364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GIWmjcyRAYMasdcopWpoiWkZzgBBLJOQKcYP114Epl8=;
	b=TgGmfMmbg1nehQWLesP/Vt0Bpab3Tv62B0wPsFb1r9a8xpBD3bAIvlTuedcu8pePftpgJZ
	OnTpXw2kTO63D6AJZrZGqsGcOFYp3vY1BpOgvlIY9AUYntXhAx1A0JVYJjDrlMjcD/En1V
	za6BEr08wQ8wK3ik6PpH0T0gxYejVpQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <7dcf2e21-209d-42ad-8541-52eac5c77049@tuxedocomputers.com>
Date: Thu, 20 Nov 2025 23:06:04 +0100
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
 <29b24831-92d4-47c6-8daf-7d1879951d43@tuxedocomputers.com>
 <7cd7081f-b138-4548-a9fb-5c4d5165b036@gmx.de>
 <7276b961-8649-4bc0-87f7-a1f06cd4f3ad@tuxedocomputers.com>
 <5b554128-7466-4b34-9020-c0c39572f100@gmx.de>
 <3c075220-79f3-4dff-a760-6fe065147793@tuxedocomputers.com>
 <2d5d88fe-cd54-4311-b5cd-b1c435ff973d@gmx.de>
 <d4c7b31b-1335-47d5-992a-beace78614e5@tuxedocomputers.com>
 <f0161676-fde7-4c6f-8774-25d176265716@gmx.de>
 <59b75eb5-59f8-472f-ad98-5d333eebebe5@tuxedocomputers.com>
 <aa69ac42-8578-4fbb-a35c-d0a556aa394d@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <aa69ac42-8578-4fbb-a35c-d0a556aa394d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 20.11.25 um 14:40 schrieb Armin Wolf:
> Am 20.11.25 um 11:42 schrieb Werner Sembach:
>
>>
>> Am 20.11.25 um 01:53 schrieb Armin Wolf:
>>> Am 18.11.25 um 16:05 schrieb Werner Sembach:
>>>
>>>>
>>>> Am 18.11.25 um 15:41 schrieb Armin Wolf:
>>>>> Am 18.11.25 um 15:27 schrieb Werner Sembach:
>>>>>
>>>>>>
>>>>>> Am 18.11.25 um 14:48 schrieb Armin Wolf:
>>>>>>> Am 18.11.25 um 14:29 schrieb Werner Sembach:
>>>>>>>
>>>>>>>>
>>>>>>>> Am 18.11.25 um 14:12 schrieb Armin Wolf:
>>>>>>>>> Am 18.11.25 um 13:45 schrieb Werner Sembach:
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Am 18.11.25 um 12:08 schrieb Armin Wolf:
>>>>>>>>>>> Am 17.11.25 um 14:23 schrieb Werner Sembach:
>>>>>>>>>>>
>>>>>>>>>>>> Handle some more WMI events that are triggered on TUXEDO devices.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>> drivers/platform/x86/uniwill/uniwill-acpi.c | 19 ++++++++++++++++++-
>>>>>>>>>>>>   drivers/platform/x86/uniwill/uniwill-wmi.h | 2 ++
>>>>>>>>>>>>   2 files changed, 20 insertions(+), 1 deletion(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>>>>>>>>>>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>>>>> index 29bb3709bfcc8..0cb86a701b2e1 100644
>>>>>>>>>>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>>>>>>>>>>> @@ -371,9 +371,11 @@ static const struct key_entry uniwill_keymap[] 
>>>>>>>>>>>> = {
>>>>>>>>>>>>         /* Reported in manual mode when toggling the airplane mode 
>>>>>>>>>>>> status */
>>>>>>>>>>>>       { KE_KEY,       UNIWILL_OSD_RFKILL, { KEY_RFKILL }},
>>>>>>>>>>>> +    { KE_IGNORE,    UNIWILL_OSD_RADIOON, { KEY_UNKNOWN }},
>>>>>>>>>>>> +    { KE_IGNORE,    UNIWILL_OSD_RADIOOFF, { KEY_UNKNOWN }},
>>>>>>>>>>>>         /* Reported when user wants to cycle the platform profile */
>>>>>>>>>>>> -    { KE_IGNORE, UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE, { 
>>>>>>>>>>>> KEY_UNKNOWN }},
>>>>>>>>>>>> +    { KE_KEY, UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE, { KEY_F14 }},
>>>>>>>>>>>
>>>>>>>>>>> I am currently working a patch adding platform profile support, so 
>>>>>>>>>>> this event would
>>>>>>>>>>> be handled inside the kernel on models with platform profile support.
>>>>>>>>>>
>>>>>>>>>> For tuxedo devices we have profiles managed in userspace that do 
>>>>>>>>>> additional things. So we need a way to handle this in userspace.
>>>>>>>>>>
>>>>>>>>> Do these things have something to do with the uniwill EC? If so then 
>>>>>>>>> we should implement those inside the driver
>>>>>>>>> itself. The control center can then poll the platform profile sysfs 
>>>>>>>>> file to get notified when platform_profile_cycle()
>>>>>>>>> is executed to perform additional actions.
>>>>>>>> Not exclusively, e.g. one thing is display brightness.
>>>>>>>
>>>>>>> And you cannot poll the sysfs interface?
>>>>>> I can't follow you atm?
>>>>>
>>>>> I meant to ask whether or not your application could poll the platform 
>>>>> profile sysfs interface for changes instead of
>>>>> listing for the F14 key.
>>>> But the platform profiles are a fixed number? TCC currently allows an 
>>>> arbitrary amount of profiles being created.
>>>
>>> With "poll the platform profile sysfs interface" i meant that you could use 
>>> poll() (https://linux.die.net/man/2/poll)
>>> or epoll() on the sysfs file containing the current platform profile.
>> Sorry i think i still don't completely get what you mean with platform 
>> profile. I assume you have a poc on github? If not can you give me a short 
>> overview?
>
> Example code, might not work:
>
> from select import poll, POLLPRI
>
> fd = open("|/sys/firmware/acpi/platform_profile", "r") p = poll() 
> p.register(fd.fileno(), POLLPRI) # Wait till platform profile changes p.poll() 
> print("Platform profile changed") This however comes with the drawback that 
> you cannot prevent the platform profile from cycling. If you want to do that 
> manually depending on the settings inside your custom profiles, then maybe we 
> can keep the F14 hack for now. I will then add a module option when adding 
> platform profile support to select between platform_profile_cycle() and the 
> F14 keycode. Does this sound OK?|

a sorry i was imprecise, i wanted to know the kernelspace implementation.

But let me sum up what i think you mean:

Platform profiles are in driver predefined profiles like: Power Save, Balanced, 
Performance, and Custom.

When you press the button you want to cycle through the profiles (except custom 
I guess?).

Only in Custom things like cTGP can be directly controlled by userspace via 
sysfs (otherwise the sysfs value is ignored?)


Maybe an elegant solution would be that upon boot for example "Balanced" is 
selected and when being in one of the predefined profiles the button cycles 
them. But once Custom get selected via sysfs the button starts sending a button 
press as the driver now expects everything to be handled by userspace. Bonus 
points if userspace can read out what the predefined profiles actually set to, 
for example, use that as initialization for custom profiles.

>
>>>
>>> Anyway, i attached the patch with the device descriptor infrastructure. The 
>>> callback called during probe cannot modify
>>> the feature bitmap anymore, but i suggest that you simply set the limit for 
>>> cTGP to zero. The code responsible for
>>> initializing cTGP support can then check if the cTGP limit is zero and 
>>> return early.
>>
>> I wonder if we should directly put that into a formal quirk list. Opinions?
>>
>> Best regards,
>>
>> Werner
>>
> The problem is that the quirk list will become RO before the driver can access 
> the EC, so we have to use uniwill_data
> for storing this information.
>
> Thanks,
> Armin Wolf
>
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>>>
>>>>> Thanks,
>>>>> Armin Wolf
>>>>>
>>>>>>>
>>>>>>>>>
>>>>>>>>>> The 2 things I can spontaneously think of would be a sysfs toggle or 
>>>>>>>>>> 2 different UNIWILL_FEATURE_* defines.
>>>>>>>>>>
>>>>>>>>> TPH i would love to have an ordinary keycode allocated for that if the 
>>>>>>>>> above does not work for you. There already
>>>>>>>>> exists KEY_PERFORMANCE, so adding something like KEY_PERFORMANCE_CYCLE 
>>>>>>>>> should be possible.
>>>>>>>>
>>>>>>>> New keycodes won't work on X11, I don't know the reason, but X11 only 
>>>>>>>> supports a max of 248 keycodes
>>>>>>>>
>>>>>>>> That's why for example touchpad toggle is bound to F21 e.g. here 
>>>>>>>> https://elixir.bootlin.com/linux/v6.17.8/source/drivers/platform/x86/lg-laptop.c#L106 
>>>>>>>> .
>>>>>>>>
>>>>>>> Oh no. In this case using F14 is fine.
>>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Armin Wolf
>>>>>>>
>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>>         /* Reported when the user wants to adjust the brightness of 
>>>>>>>>>>>> the keyboard */
>>>>>>>>>>>>       { KE_KEY, UNIWILL_OSD_KBDILLUMDOWN, { KEY_KBDILLUMDOWN }},
>>>>>>>>>>>> @@ -382,11 +384,19 @@ static const struct key_entry 
>>>>>>>>>>>> uniwill_keymap[] = {
>>>>>>>>>>>>       /* Reported when the user wants to toggle the microphone mute 
>>>>>>>>>>>> status */
>>>>>>>>>>>>       { KE_KEY,       UNIWILL_OSD_MIC_MUTE, { KEY_MICMUTE }},
>>>>>>>>>>>>   +    /* Reported when the user wants to toggle the mute status */
>>>>>>>>>>>> +    { KE_IGNORE,    UNIWILL_OSD_MUTE, { KEY_MUTE }},
>>>>>>>>>>>
>>>>>>>>>>> Why is this event being ignored?
>>>>>>>>>> Because the UNIWILL_OSD_MUTE event is sent in addition to the mute 
>>>>>>>>>> key event, so not ignoring it here would result in a double trigger.
>>>>>>>>>
>>>>>>>>> I understand.
>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> +
>>>>>>>>>>>>       /* Reported when the user locks/unlocks the Fn key */
>>>>>>>>>>>>       { KE_IGNORE,    UNIWILL_OSD_FN_LOCK, { KEY_FN_ESC }},
>>>>>>>>>>>>         /* Reported when the user wants to toggle the brightness of 
>>>>>>>>>>>> the keyboard */
>>>>>>>>>>>>       { KE_KEY, UNIWILL_OSD_KBDILLUMTOGGLE, { KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>> +    { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL0, { KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>> +    { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL1, { KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>> +    { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL2, { KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>> +    { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL3, { KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>> +    { KE_KEY, UNIWILL_OSD_KB_LED_LEVEL4, { KEY_KBDILLUMTOGGLE }},
>>>>>>>>>>>>         /* FIXME: find out the exact meaning of those events */
>>>>>>>>>>>>       { KE_IGNORE, UNIWILL_OSD_BAT_CHARGE_FULL_24_H, { KEY_UNKNOWN }},
>>>>>>>>>>>> @@ -395,6 +405,9 @@ static const struct key_entry uniwill_keymap[] = {
>>>>>>>>>>>>       /* Reported when the user wants to toggle the benchmark mode 
>>>>>>>>>>>> status */
>>>>>>>>>>>>       { KE_IGNORE, UNIWILL_OSD_BENCHMARK_MODE_TOGGLE, { KEY_UNKNOWN 
>>>>>>>>>>>> }},
>>>>>>>>>>>>   +    /* Reported when the user wants to toggle the webcam */
>>>>>>>>>>>> +    { KE_IGNORE, UNIWILL_OSD_WEBCAM_TOGGLE, { KEY_UNKNOWN }},
>>>>>>>>>>>
>>>>>>>>>>> Same as above.
>>>>>>>>>>
>>>>>>>>>> Same as above ;)
>>>>>>>>>>
>>>>>>>>>> At least iirc, would have to double check
>>>>>>>>>>
>>>>>>>>> Ok.
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Armin Wolf
>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> +
>>>>>>>>>>>>       { KE_END }
>>>>>>>>>>>>   };
>>>>>>>>>>>>   @@ -1247,6 +1260,10 @@ static int uniwill_notifier_call(struct 
>>>>>>>>>>>> notifier_block *nb, unsigned long action
>>>>>>>>>>>>           }
>>>>>>>>>>>> mutex_unlock(&data->battery_lock);
>>>>>>>>>>>>   +        return NOTIFY_OK;
>>>>>>>>>>>> +    case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>>>>>>>>>>>> +        // noop for the time being
>>>>>>>>>>>
>>>>>>>>>>> Wrong comment style, please use /* */.
>>>>>>>>>> ack
>>>>>>>>>>>
>>>>>>>>>>> Thanks,
>>>>>>>>>>> Armin Wolf
>>>>>>>>>>>
>>>>>>>>>>>> +
>>>>>>>>>>>>           return NOTIFY_OK;
>>>>>>>>>>>>       default:
>>>>>>>>>>>> mutex_lock(&data->input_lock);
>>>>>>>>>>>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h 
>>>>>>>>>>>> b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>>>>> index 2bf69f2d80381..48783b2e9ffb9 100644
>>>>>>>>>>>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>>>>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>>>>>>>>>>> @@ -113,6 +113,8 @@
>>>>>>>>>>>>     #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE 0xC0
>>>>>>>>>>>>   +#define UNIWILL_OSD_WEBCAM_TOGGLE 0xCF
>>>>>>>>>>>> +
>>>>>>>>>>>>   #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED 0xF0
>>>>>>>>>>>>     struct device;
>>>>>>>>>>
>>>>>>
>>>>
>>
