Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404641;
	b=nSoAxlTp6WIbnfLGgl4bkJCR9irUn5fCFiOCQeiUd1X3Oe7aixTUYtMV1b1GHRsTw7pt
	 xiN8+i9rPhQlLbxsDcpffH5XSsnF9MKlbDWpAHcCN1pDd+/Igb3RSAnW3+x0Pk/yPnWfX
	 O6fteJqG6UsLJbGmOGe5Q+PWk1QWV7HPV1tCrLqakJDQy4TUHpSK4PcpBRVKRa+R2prCX
	 YBQioWQDy2cBfvAOxANb7SstSyB6CntAbo0aUhDxbZXPI9GVZGm344+kb7BEaAx33UTxP
	 tODLxmZHq1N+6MGdjA6O1u4S3u5ZFoJZMHLGDlnP4o0yLgwQErWowRVMY2DYxB6pUFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NmAFtNZlFjbHnjX42/j+XCd3a1eeFxx6t/PrcI706JM=;
	b=Sk2EGmiOOkMvV7UXIz6zwnLvGtcU07FJIVgTjj9AFzvDM+ZSTsRaz5b5MKy3L79mnQ5z
	 7O3E/gMtapisWorm5OlfLhnbt0SkZSMki7lg56cAE/KySJtAMXuqQXqekmbsL+RtyP3P8
	 GenS3fABsz+pDixxACfPF7dNN28At5w/+ltlPS/kAWCUF56NkuQ0VJTYbunk5ZP+XnXpX
	 FjypanadmWEsrL2E5BgjNpoLKOMbR0nUSQXhooxMFqu/P4TtPdzf4KlRFIsiNqsNP2zHl
	 xuMOWbst5F5zdLLnF497sBn09zx3brVRqtFjxFUMqjad+GhqEPDrjIXQKSUrvkCi4jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bc765nJD;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2499606A326
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2499606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bc765nJD
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1583120a91.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 05:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404640; x=1795009440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NmAFtNZlFjbHnjX42/j+XCd3a1eeFxx6t/PrcI706JM=;
        b=Bc765nJDHEsH2ejUfus4JopHG0M16rj4kBx/p7aOsa0Z7qQBaYJUThWLMHXC1a4tGO
         1Z75bo6engkwEfdm+KRBWSO8d9Xut6mqszeX2OcfJWoNKMXhv3cJS04A/MuXCwBc8cuV
         A6foGZml7C3NRs1/rshjj6nwKuoCqVGsMMyPGVGel4/3l7Ixb3B+94RBNZqXqgoLtzrj
         cPBZDWUxHenygW1ptl1luY6cOqNwYMh1+0OPZC1kD/iSpxDP5UB+4f/Yb63MTB7nWz2B
         htuiMH94qFFwktQ4QgWgYah+ePs/pAPUO3lpWTJRmNzoX+AKpVJdspQrC57iuoBNFery
         xlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404640; x=1795009440;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmAFtNZlFjbHnjX42/j+XCd3a1eeFxx6t/PrcI706JM=;
        b=F9E5RqaySIY4uYP0gVsP2Txnfbq/rC1EzCMywOgdiORjiAnI3y+2t87G2dlmS/L2iK
         4uc+I4ub1fmU249RMEWnTmhMMpJQQGay96g97KrbbiWz98K3N848w0khlp1iCNU2wxLx
         3kYTtbW9oScbwnEbpYw4n1towbKkBrZC+W+Df0UQE62ExrutOVGRGxSzPADO6mxeKK8W
         pNwyBKCT1yuDdYtQ4XTNcq7Q5OyGiu9JjXD1Fbt2zeZMlhXyr0TBRyCVEEzI3r12WyoP
         JzoAqd7wF7QqwzLR/lNj0sHA9hjsIg7wdPdYAnY+nQ9iaBvPjASUgvmQJT571e6z3u8t
         VrQw==
X-Forwarded-Encrypted: i=1; AL+hErGZTrsCn8n0kQlhDjkf/1wVP4egPseeWnYvJILXQhP6hkY1GA9egbvvxgYvZTM6tmuqV2aLj8fzreUn3ekO4HrtHgHG@vger.kernel.org
X-Gm-Message-State: APuU4Z+yq6/VqWBbEmZjofpCz+bnCuQxCGWVCbORYUNTyJElb6oBwhmm
	nU8aPj1MqcOzpWEVbtYMqChrWDrbh7ReAMvYkDP1KItFDbUbyy/556Ky
X-Gm-Gg: AYBFou2HKksf8VRB9R+ZWnbm+wPfGsctwLorgYaaYldEHLtVp0d8LE04PnDx1P4hTLS
	zZejazI8lGAQoaCz1oTB/5iVQv8IIpn0fD3n6NrbW+UWqU/pXz2JUDmT/N9vSe9YwZoeivdlLcx
	CBHiU83zfVkT+Uo41+Ckh32rhYYiLs5qOeUrrDcin72ONicHbJ2YhBKg2j7B+aat7le2sCpqZRc
	1cnNsm3SW2PyTYQ1KJGYfmzOpRx4LnJOVsO+nDUVXBKnSGny6JQms4Dcn4lwyvGigELYQ+6s7Ki
	tG+5CdHuQ5G/QXWBSzEbeyJ8wt5PQhm//zyzoAXx5W5Bf+4t92F2RYL4fJhO8rTGXrzK/eXvDq0
	fuT8Ekl0hBCKF/Iye/DX4+wkwHf2Dg/PP+WqHSce5ky6YXTaoqaTTgOK2Vbp8cCAcP05BcPnuHL
	rLuoINYZl4Pgfd2Qk7FozWn6X+t1v5abxdKtnF1YULEVVM+rQZOTDOTpeXnZ+F6xD6CTwwRrU9n
	3+QphZQpzvK3q4ThMVyscwttFMd7pCFRfJwXV3W3g2Ub7AI9ubcOfP6DlzpncrTplVg9wtu/K1B
	au2SlsxNqNAsN6sErb9yhVMdkaj2MhUYcxLmKM8TBM8BUGTpzw==
X-Received: by 2002:a17:90b:4d05:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b182e0f24bmr2264024a91.6.1794404640202;
        Wed, 11 Nov 2026 05:44:00 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:51a2:c8a9:6ee2:816d? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e1f88casm4472835a91.12.2026.11.11.05.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:43:59 -0800 (PST)
Message-ID: <2153e57f-c28d-4f33-b497-ea7cb60fd9f4@gmail.com>
Date: Wed, 11 Nov 2026 21:43:52 +0800
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
Subject: Re: [PATCH v15 0/6] Merge redmi-wmi into bitland-mifs-wmi
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>,
 platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>,
 Armin Wolf <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>,
 Chris Taraszka <chris@miget.com>,
 Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/ig==?=
 =?UTF-8?B?5paH?= <btx342@gmail.com>, powerfullz <wleizc7319@gmail.com>,
 =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>,
 =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe
 <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>,
 Serhiy Shliapuhin <shlyapugin@gmail.com>, okluar <okluar@gmail.com>
References: <20261028112742.674847-1-qby140326@gmail.com>
 <c502f0d3-9ae1-51e2-4410-9f3d532a5d49@linux.intel.com>
 <5baeb1e2-7cc5-43dd-9408-e5f0365a08b1@gmail.com>
 <12efd5a9-8da0-6294-4514-7e26e15737da@linux.intel.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <12efd5a9-8da0-6294-4514-7e26e15737da@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/11/26 21:35, Ilpo Järvinen wrote:
> On Wed, 11 Nov 2026, Mingyou Chen wrote:
>
>> On 11/9/26 21:09, Ilpo Järvinen wrote:
>>> On Wed, 28 Oct 2026, Mingyou Chen wrote:
>>>
>>>>> And I've got a question, from sashiko's comment in my v12
>>>>>
>>>>> https://sashiko.dev/#/patchset/20261012133648.132363-1-qby140326%40gmail.com
>>>>>
>>>>>> Will this result in the loss of KEY_PERFORMANCE events on event-only
>>>>>> legacy
>>>>>> devices?
>>>>>> Looking at bitland_mifs_wmi_probe() in
>>>>>> drivers/platform/x86/bitland-mifs-wmi.c,
>>>>>> if dev_type == BITLAND_WMI_EVENT, it returns early after registering
>>>>>> the input
>>>>>> device:
>>>>>> 	if (dev_type == BITLAND_WMI_EVENT) {
>>>>>> 		/* Register input device for hotkeys */
>>>>>> 		drv_data->input_dev =
>>>>>> devm_input_allocate_device(&wdev->dev);
>>>>>> 		...
>>>>>> 		return input_register_device(drv_data->input_dev);
>>>>>> 	}
>>>>>> When the performance key is pressed, bitland_mifs_wmi_notify()
>>>>>> intercepts it,
>>>>>> invokes the bitland_notifier_list, and returns without reporting an
>>>>>> input event:
>>>>>> 	case WMI_EVENT_PERFORMANCE_PLAN:
>>>>>> 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
>>>>>> 		blocking_notifier_call_chain(&bitland_notifier_list,
>>>>>> 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
>>>>>> 					     NULL);
>>>>>> 		return;
>>>>>> Because the platform profile and notifier were not registered during
>>>>>> probe
>>>>>> for event-only devices, does this mean the events are silently dropped
>>>>>> instead
>>>>>> of emitting KEY_PERFORMANCE like the old driver did?
>>>>> I ackknowledged that KEY_PERFORMANCE (WMI_EVENT_PERFORMANCE_PLAN_ALT in
>>>>> bitland-mifs-wmi) looks like an event in this LKML thread
>>>>>
>>>>>> Since the event reports a change that has already happened,
>>>>>> platform_profile_notify() is the natural way to pass it on, as
>>>>>> suggested in my v6 reply: power-profiles-daemon then re-reads the
>>>>>> profile, which is harmless after the driver's own writes too. If
>>>>>> KEY_PERFORMANCE should stay for on-screen displays (Ibragim asked to
>>>>>> keep these events observable), it may be worth not reporting it for
>>>>>> the
>>>>>> event that echoes the driver's own write, or at least saying in a
>>>>>> comment that it reports a mode change that already happened. On
>>>>>> Ibragim's TM2209 the profile SET is reported not to work [3], so there
>>>>>> 0x16 can only come from Fn+K and the echo does not exist; Ibragim, can
>>>>>> you confirm?
>>>>> https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/
>>>>>
>>>>> So should I follow sashiko's advice?
>>> Do you find Hans' earlier feedback on this not actionable? Or did you miss
>>> it.
> You did not reply to this question (which is my only remaining concern
> with this series)!?
>
>
>>> Copying long walls of text from sashiko's findings for an older version to
>>> the cover letter might not be the best approach in general. Usually, we
>>> want to get the issues addressed before sending the next version so that
>>> discussion should have occurred in the thread for the previous version.
>>>
>>>>> And some remaining comments from sashiko's review of my v13:
>>>>>
>>>>>>> -	/* Keyboard backlight: Off / Auto / Low / High (new state in
>>>>>>> byte 2) */
>>>>>>> -	{KE_KEY, 0x00000501,	{KEY_KBDILLUMTOGGLE}},
>>>>>>> -	{KE_KEY, 0x00800501,	{KEY_KBDILLUMTOGGLE}},
>>>>>>> -	{KE_KEY, 0x00050501,	{KEY_KBDILLUMTOGGLE}},
>>>>>>> -	{KE_KEY, 0x000a0501,	{KEY_KBDILLUMTOGGLE}},
>>>>>>> -
>>>>>>> -	/* Xiaomi G Command Center */
>>>>>>> -	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
>>>>>>> -
>>>>>>> -	/* OEM preset power mode: 1=Balanced 2=Silent 3=Turbo 4=Full
>>>>>>> speed */
>>>>>>> -	{KE_KEY, 0x00011601,	{KEY_PERFORMANCE}},
>>>>>>> -	{KE_KEY, 0x00021601,	{KEY_PERFORMANCE}},
>>>>>>> -	{KE_KEY, 0x00031601,	{KEY_PERFORMANCE}},
>>>>>>> -	{KE_KEY, 0x00041601,	{KEY_PERFORMANCE}},
>>>>>> In drivers/platform/x86/redmi-wmi.c, redmi_wmi_notify() reported these
>>>>>> keyboard backlight events (event_id 0x05) as KEY_KBDILLUMTOGGLE and
>>>>>> OEM preset
>>>>>> power mode events (event_id 0x16) as KEY_PERFORMANCE through
>>>>>> sparse_keymap_report_entry().
>>>>>> In drivers/platform/x86/bitland-mifs-wmi.c, bitland_mifs_wmi_keymap
>>>>>> defines
>>>>>> the four WMI_EVENT_KBD_BRIGHTNESS entries for KEY_KBDILLUMTOGGLE:
>>>>>> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0),
>>>>>> {KEY_KBDILLUMTOGGLE} },
>>>>>> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),
>>>>>> {KEY_KBDILLUMTOGGLE} },
>>>>>> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0),
>>>>>> {KEY_KBDILLUMTOGGLE} },
>>>>>> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0),
>>>>>> {KEY_KBDILLUMTOGGLE} },
>>>>>> However, bitland_mifs_wmi_notify() returns early for both
>>>>>> WMI_EVENT_KBD_BRIGHTNESS and WMI_EVENT_PERFORMANCE_PLAN_ALT before
>>>>>> reaching
>>>>>> bitland_mifs_wmi_report_key():
>>>>>> 	switch (event->event_id) {
>>>>>> 	case WMI_EVENT_KBD_BRIGHTNESS:
>>>>>> 		brightness = event->value_low;
>>>>>> 		blocking_notifier_call_chain(&bitland_notifier_list,
>>>>>> 					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
>>>>>> 					     &brightness);
>>>>>> 		return;
>>>>>> 	case WMI_EVENT_PERFORMANCE_PLAN:
>>>>>> 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
>>>>>> 		blocking_notifier_call_chain(&bitland_notifier_list,
>>>>>> 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
>>>>>> 					     NULL);
>>>>>> 		return;
>>>>>> 	...
>>>>>> 	}
>>>>>> 	payload = get_unaligned_le32(buffer->data);
>>>>>> 	bitland_mifs_wmi_report_key(wdev, payload);
>>>>>> Does this early return leave the WMI_EVENT_KBD_BRIGHTNESS entries in
>>>>>> bitland_mifs_wmi_keymap unreachable and cause a regression on
>>>>>> Redmibook
>>>>>> laptops (especially models that only expose BITLAND_EVENT_GUID without
>>>>>> the
>>>>>> BITLAND_MIFS_GUID control device) when pressing the keyboard backlight
>>>>>> or
>>>>>> power mode hotkeys?
>>>>>> [ ... ]
>>>>> Don't actually agree with sashiko, if we report the key to the
>>>>> userspace, when WMs handle the KEY_KBDILLUMTOGGLE key, the keyboard
>>>>> light will be triggered twice if the firmware already respond to the
>>>>> event,
>>>>> which is not expected.
>>>>>
>>>>> So the question is, does the firmware respond the KBD_BRIGHTNESS event?
>>>>> And should we report this key to userspace?
>>>> >From Chris' comment:
>>>>
>>>>> - Fn+Space (keyboard backlight) sends no WMI event at all, neither 0x05
>>>>>     nor anything else, and does not change the backlight under Linux. So
>>>>>     this model cannot tell whether the firmware handles KBD_BRIGHTNESS.
>>>>>
>>>>> - Fn+K sends event 0x28 with value_low 0x01 on every press (01 28 01
>>>>> 00),
>>>>>     not 0x16. The firmware does not change the mode by itself: the
>>>>>     SystemPerMode value (EC 0x68) stays the same across the presses. If
>>>>>     0x28 is the performance mode key on this model, it is a request
>>>>> rather
>>>>>     than a notification, so platform_profile_cycle() would fit. 0x28 is
>>>>>     currently logged as "Unknown WMI event".
>>>>>
>>>>> - On Windows on the same machine, with Xiaomi PC Manager not running
>>>>>     (it fails to start on this install), neither Fn+K nor Fn+Space does
>>>>>     anything either. So Fn+K looks like a request that Xiaomi's software
>>>>>     normally acts on, not a mode change made by the firmware.
>>>> I think different models have different behaviors on this.
>>>> Should we add a quirk item?
>>> For different behaviors, it may well be possible we need a quirk.
>> This is included in Chris' patch series.
>>
>> https://lore.kernel.org/r/20261106114300.936782-5-chris@miget.com
> I know, so it shouldn't be a concern in the context of _this series_.
>
> We'll be applying Chris' series after this one (and relatively soon after
> it too, I think).
>
>>> But it would be nice to get this refactoring out of the way relatively
>>> soon as it has been blocking lots of other bitland patches and I'm a bit
>>> worried the scope of this work is expanding beyond what an initial
>>> refactor change would need.
>>>
>>> If Chris' device lacks support without his series, this refactoring
>>> shouldn't have to care about that yet as long as it doesn't intentionally
>>> make decisions we need to change right away. New quirks on top of this
>>> refactoring to support a previously unsupported model is not a problem but
>>> too limiting thermal profile mapping would have been problematic as we'd
>>> have immediately had to rework the mapper.
>> I think it's enough for the known cases except this [1].
>>
>> [1]
>> https://lore.kernel.org/all/CAFbNUuLmaoq22pQPzrUidJ+RC2xf2u5Ovxzy5d0LQZ7owH52OA@mail.gmail.com/
>>
>> I'm confused with this bug report, everything looks correctly.
> My point is, that we should focus on getting this refactor series applied
> first.
>
> This again, while nice you're trying to help the report, looks future work
> from the perspective of this refactor series as you again had to add
> another profile table. That is, it is not supported until more work is
> done, which will only happen after this series in terms of applied
> commits.
>
> Also, we don't need to make the rework series perfect, it will take
> forever that way. We might still need to refactor something but I think
> the major problem with the profiles is already dealt with and we're good
> to go in that front.
>
> So the only remaining concern I have is the one I reflagged above. Please
> share your thoughts on that.

Hi,

Sorry for missing your question (I only looked at the bottom, sorry 
about that), here's my opinion:

There are two behaviors on Fn+K as far as I know:

- Hardware report 0x28 and leave the profile unchanged (this is covered 
in Chris' series)

- Hardware change the profile and report 0x16 [1], the driver should 
refresh the platform profile state, and don't report key scancode to 
userspace, I've already done this in my series (in the 
WMI_EVENT_PERFORMANCE_PLAN_ALT case).


[1] 
https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/

