Received: from mta0.migadu.com (out-135.mta0.migadu.com [91.218.175.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF294D0A15
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 20:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353926; cv=none; b=GkP1laNdPxn4GZAT4BYkAmrOGH/uYI+QVPm29DxkHoCkrvYfMRiyXkBvZ8Voy1XQvKXomYtLI1N15c7zPZ1ddknNjP8x/qFYIi4ll4WmDwWPGBWjxwUkn4NV7bi08jb8o7qldHfz/tyJ9pGsijn+3iKXOLYk51ylp8BV/PM22R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353926; c=relaxed/simple;
	bh=f+to3g3YqElogCSwArmlsoHyb4ynsW/MxBQs5Sd7JLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8WUyNrU1e4Qy6MUNg8U7DNdOKA0D8HGOJo1mvTJI9S+/MF4M6EbOA/vo+Qu5s11s1/zNmbGQSIUsa9+dDhuc2h6aJjFJ4mp41dbidllrtaq57MrvesfCCPHmxh1GhNKmAeaLpnnxrwGGmRgwhMP+1RU/mxLyL18WnIRlZyZYpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZLT45K6z; arc=none smtp.client-ip=91.218.175.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZLT45K6z"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=f+to3g3YqElogCSwArmlsoHyb4ynsW/MxBQs5Sd7JLw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792353913; v=1; x=1792958713;
 b=ZLT45K6zz9IpJUozz+ZJWDibOeSqeTXJufaADQLFvH4DnR7xAQGZtPA9HiPBInx8YvcUIxcr
 eCWgq6jcfNQ3m6di0JuMY5sFTIMTd0vA2+mf4KTyHXZU5v+KNzIpWVI+smhP/RnRnCw8UQfQftV
 ty0OWWe2AVrl5QCjWC2Xy3aU=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bad5f322a0463a1b;
	Sun, 18 Oct 2026 20:05:12 +0000
X-Mizu-Trace-ID: bad5f322a0463a1b
X-Migadu-Flow: FLOW_OUT
Message-ID: <ddf53c75-80bb-43f6-9e48-629b49a6339b@linux.dev>
Date: Sun, 18 Oct 2026 22:05:07 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: map ScreenPad and Task Swap
 keys
To: Victor <victor.gillholm@gmail.com>
Cc: corentin.chary@gmail.com, luke@ljones.dev, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261017-zenbook-duo-keys-v1-1-45f72d3db5ed@gmail.com>
 <1a35e100-010d-4327-afe5-1d2496ad7e24@linux.dev>
 <CAKspSoNJxEcEH1AwXHyNY5cWVvCQ3LN0fcZ8d9ajAoShdBMRKg@mail.gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <CAKspSoNJxEcEH1AwXHyNY5cWVvCQ3LN0fcZ8d9ajAoShdBMRKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/18/26 21:25, Victor wrote:
> On 10/18/26 20:02, Denis Benato wrote:
>> The driver is handling the screenpad so why not implementing the
>> functionality in the driver instead of doing the dance driver -> evdev
>> -> remap -> driver ?
>>
>> Unless I misunderstood what you want to do... Hopefully not!
> Hi Denis,
>
> Thanks for looking at this.
>
> Handling it in the driver would work, but the key would then only be an
> on/off switch for the ScreenPad. If I remember correctly, on Windows the
> same key cycled between modes: on, off, and using the ScreenPad as a
> touchpad. If the driver toggles the power on every press, userspace
> cannot do that, because the panel is already switched off before it
> sees the key.
>
> Reporting the key as KEY_F13 allows both. Users who only want on/off can
> bind it to the asus_screenpad backlight device, so the power control
> still goes through the driver, and others can use it to switch modes.
>
> It also matches hid-asus, which already reports the same ScreenPad code
> 0x6a as KEY_F13.

Alright, I see what's going on. Then yeah I agree with this decision.

My remaining question is if that screenpad-as-touchpad is fully
software emulation (like dialpad on newer models) or is actually
something different that can be made in driver... I think I can see
some code using hidraw to send special commands to screenpad
and I really want that inside the kernel...

If it can be made in a driver that would be preferable. Guess I will
need to take a look at asus_screenpad... Can you point me at the
correct repo?

> While testing this I also found that the ScreenPad power control looks
> inverted on this model (UX482EG, stock asus-wmi on 7.2.5). Writing 0
> (power on) to /sys/class/backlight/asus_screenpad/bl_power switches the
> panel off, about three seconds later its DRM connector reports
> disconnected, and writing 4 (power off) brings it back. The result was
> the same each time I tried. While the panel is off, actual_brightness
> still reads 89, so the firmware seems to report it as powered. I can
> look into that separately if it is useful.
>

I am very familiar with this issue. I was hoping to never read this, but
apparently the moment has come.

Please take a look at the link below and all links you find to reconstruct
the story about the current code of power handling.

Link: https://lore.kernel.org/all/20260916143838.170950-1-denis.benato@linux.dev/

You will need to create a quirk for handling inverted power states and
add that quirk to your laptop using a dmi match to get things working.

Before doing anything please be absolutely sure you are running a kernel
with that patch series included or you will see the same "inverted" issue
after inverting the bit only to chase a ghost issue wasting a lot of your time.

>>> + { KE_KEY, 0x9C, { KEY_F14 } }, /* Task Swap key on Zenbook Duo */
>> Fair.
> Thanks.
>
> Best regards,
> Victor
>
>
> Den sön 18 okt. 2026 kl 20:02 skrev Denis Benato <denis.benato@linux.dev>:
>>
>> On 10/17/26 20:13, Victor Gillholm via B4 Relay wrote:
>>> From: Victor Gillholm <victor.gillholm@gmail.com>
>>>
>>> The ASUS Zenbook Duo 14 UX482EG has two keys next to the power button:
>>> one toggles the ScreenPad Plus, the second screen above the keyboard,
>>> and one swaps windows between the two screens (Task Swap in ASUS'
>>> ScreenXpert software). They emit ASUS WMI event codes 0x6a and 0x9c.
>>> Neither code is in the asus-nb-wmi sparse keymap, so pressing them only
>>> logs "Unknown key code 0x6a" or "Unknown key code 0x9c", and both keys
>>> are reported as KEY_UNKNOWN, so ordinary desktop key bindings cannot
>>> tell them apart.
>>>
>>> Map 0x6a to KEY_F13, the same keycode hid-asus already uses for the
>>> ScreenPad toggle code 0x6a. No existing keycode describes moving windows
>>> between screens, so map 0x9c to KEY_F14, following the existing use of
>>> KEY_F13 and KEY_F14 for other ASUS-specific keys in this keymap. Both
>>> keys then emit distinct, bindable events.
>>>
>>> Tested on an ASUS Zenbook Duo 14 UX482EG: with this change the keys
>>> arrive in userspace as KEY_F13 and KEY_F14 and the "Unknown key code"
>>> messages are gone.
>>>
>>> Assisted-by: Claude:claude-opus-5-5
>>> Signed-off-by: Victor Gillholm <victor.gillholm@gmail.com>
>>> ---
>>> Tested by building asus-nb-wmi against 7.2.5 and loading it in place of
>>> the stock module. The key mapping was checked with wev: before the change
>>> both keys arrived as keycode 248 with no keysym, after it as XF86Tools
>>> (KEY_F13) and XF86Launch5 (KEY_F14).
>>> ---
>>>  drivers/platform/x86/asus-nb-wmi.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>>> index 3b0f3346d..c6eb525ec 100644
>>> --- a/drivers/platform/x86/asus-nb-wmi.c
>>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>>> @@ -641,6 +641,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>>>       { KE_KEY, 0x65, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV */
>>>       { KE_KEY, 0x66, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV */
>>>       { KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
>>> +     { KE_KEY, 0x6A, { KEY_F13 } }, /* ScreenPad toggle on Zenbook Duo */
>> Hi Victor,
>>
>> The driver is handling the screenpad so why not implementing the functionality in
>> the driver instead of doing the dance driver -> evdev -> remap -> driver ?
>>
>> Unless I misunderstood what you want to do... Hopefully not!
>>
>>>       { KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
>>>       { KE_IGNORE, 0x6E, },  /* Low Battery notification */
>>>       { KE_KEY, 0x71, { KEY_F13 } }, /* General-purpose button */
>>> @@ -666,6 +667,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>>>       { KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + DVI */
>>>       { KE_KEY, 0x95, { KEY_MEDIA } },
>>>       { KE_KEY, 0x99, { KEY_PHONE } }, /* Conflicts with fan mode switch */
>>> +     { KE_KEY, 0x9C, { KEY_F14 } }, /* Task Swap key on Zenbook Duo */
>> Fair.
>>
>> Best regards,
>> Denis Benato
>>
>>>       { KE_KEY, 0X9D, { KEY_FN_F } },
>>>       { KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
>>>       { KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
>>>
>>> ---
>>> base-commit: ea40f1e9f07aab937b9a217633be7a1f66260394
>>> change-id: 20261017-zenbook-duo-keys-7e0b3f94354a
>>>
>>> Best regards,
>>> --
>>> Victor Gillholm <victor.gillholm@gmail.com>
>>>
>>>
