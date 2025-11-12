Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52F0340287
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 19:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762975262; cv=none; b=NZTXG1HX5I6lb5xlrKEJAXfUK968mGwxsx2Sb7PszOYJIVo+h/kYNUTt1MtC9BGU9dSpJGNtA94J0AvU3Qb5qgaMCqi86RabYf80wOabIca/liRl9FQ7QzE0aGQUMr/uPav+WNERqrBZZQ7MzMK6uOuEoJHIIdqR61Elb9dmUpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762975262; c=relaxed/simple;
	bh=hvTuPUTaEd+9GT62kJKEwVWuFc5yaWBToPCo951hLPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aIAm1eRY8v+IYHSUqdr78467K56neXSN8a9vXesACR2sIqFSiC419yhDdoeIYAFOpjYnZt4W2sMsxcY/dtUq6Zi/4hWpvSZ78Imc/ZUj2RbfiSVeKbnvI20btRHlJzxzp3esw9EeFD+6uvWTf6ucCBQvEe3VBSwUPc2feuYJQo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDSDzdBf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDSDzdBf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47755de027eso486045e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 11:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762975259; x=1763580059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8c+QV8wEsjqNtYb7plJT/6wsLDC2aEj2aThOWqHbM0=;
        b=jDSDzdBfwMSx19r+/UF3n4jreMnQKSUFomNozsAbD86S5Y0X6OTYVOKbFsbqzlxHT3
         UtQtikLqL8ho6PwWQUqRPT+9y0CFYAqNTGL0D+aMWs7TSvgJhcPyRb6hIs8kqJ2cBrsT
         E3x4UJ4ueBN1b2Ulhjq4UHCeviCuuM+R0gjHM60Xtx5/bZyKgRWUv5jXz6/W2E3pirnD
         nFZKf3r7DfT3zAkXyT9xRVDiEhT2rzmx8mNEqFzgujAse1+r9erFZMhPs+awQYNIsvT3
         /3o6AQBt8jYPOWtSMI3J0MwpN1+mofQYcvxIzXSGhgT5AtF+RS7D0e7ZD1R0u1+3gcB4
         o67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762975259; x=1763580059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8c+QV8wEsjqNtYb7plJT/6wsLDC2aEj2aThOWqHbM0=;
        b=pjRxBauqhZlDA9CVozak4qpQd+ZBgbUCCacpHS1VBpzL35ufPhDA+lo1KVelvKe+cf
         2RTzQwD8/GN10VHGR8G7tIfMNZBlf1ALWmVMG8uWspxy/OOczpaq5guxQr0JG1IsdtBh
         1duQUdlf7hqnsB9issnE2+K5v95rhFoVfBQpZTaT8CsNATdDl2JmJEFJwnwtT8TVSqUZ
         opyu6StJOEowKGRTA2h/ph2WqaePT0Y7gdxDJyjoa/wMVXroL8znueJmMD25okybH9JU
         R6i3N3QzgdEiLXAM7N6wQB2WXm472QlrM6VfXCyheBdo38tKEGWl6rRiR7Jt/fYqPveF
         F+ig==
X-Forwarded-Encrypted: i=1; AJvYcCXES/Wb0xi7SirWbVS44TB1+a+gJUktPpBHWuhEKklg6dVDnqjc5wiYdUtEmTx4EgkLZEJf9F+JN6SUdqGDcO8GXelz@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0lDx8VXsecLSrCHPmnnTkQTYqfssm8+fzmxeP8wEuzamOkAC
	asySujVRrp4xR+hLxoLQUBwoNO1kGnCiKcCRTSEdJfDtIgyCuxL7jDB1
X-Gm-Gg: ASbGncstAmmxX3iq6X7ZXOvtKTVEo8T52rifb6RXPSKFIqEdp+kQsUta51wBluL5Nzt
	7CYPE7y5SCU5V615bzlxs/jTCsxowXzSQ2/n9jo8CmVB+NNfR7L/MFP8PLui9NoF1acoXh4WfVC
	fFUSh/EY029DRIhS3sKCO075/yqITQDFAXYaaRmCmFtaoVll9LBlVkFGc1JGPQaiuQZ9G+M34LK
	cSy35xAM+ajY5i5S87Jc9QwAZ2C0oSx6n3bsdpp0paOeU9/DJ/aUqg1xuQIdgTZCdTo9A4tXds/
	qbe6RFnFQ8enMph2ZQ0jRhSarO42K46fcchuHF6Ri6sirc66QCwTfH8IkiySIRJuU7DP2jRAoCE
	5Fqbu2Ak4i+cxHN2vThC+V57eWylKR5EbYAqSCaQ55J2UltTBkdVd6BK20x3ea/LDQ14tUUiYzY
	7bbwz1hAc3aAp7
X-Google-Smtp-Source: AGHT+IHNH2NUnbh7UeXDxVzS6HVOtFRG1Vq39eAQH22UHfrB/4y5nvsPHY5jRG874fuoqFl2Ya5SoA==
X-Received: by 2002:a05:600c:1c1c:b0:477:7b16:5f80 with SMTP id 5b1f17b1804b1-47787049f0bmr40180085e9.10.1762975258734;
        Wed, 12 Nov 2025 11:20:58 -0800 (PST)
Received: from [192.168.1.121] ([176.206.83.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b326a950bsm25447653f8f.8.2025.11.12.11.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 11:20:58 -0800 (PST)
Message-ID: <d3c14100-c616-4b4c-94f5-b4cc7074d951@gmail.com>
Date: Wed, 12 Nov 2025 20:20:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/9] platform/x86: Add asus-armoury driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <denis.benato@linux.dev>, LKML
 <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251102215319.3126879-1-denis.benato@linux.dev>
 <6b5d7dab-1175-8096-64d0-fdf2cc693679@linux.intel.com>
 <78d35771-02b6-4163-88da-ceae3146afe7@linux.dev>
 <e73f74b9-6147-c3ce-c81b-da52082b258b@linux.intel.com>
 <fe18a2f1-3e7b-423a-86ac-fd5abd994fa3@gmail.com>
 <b6a234b6-7e16-24fc-760f-0e2a43fed84f@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <b6a234b6-7e16-24fc-760f-0e2a43fed84f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/12/25 13:42, Ilpo Järvinen wrote:
> On Tue, 11 Nov 2025, Denis Benato wrote:
>> On 11/11/25 11:38, Ilpo Järvinen wrote:
>>> On Mon, 10 Nov 2025, Denis Benato wrote:
>>>> On 11/10/25 16:17, Ilpo Järvinen wrote:
>>>>> On Sun, 2 Nov 2025, Denis Benato wrote:
>>>>>
>>>>>> the TL;DR:
>>>>>> 1. Introduce new module to contain bios attributes, using fw_attributes_class
>>>>>> 2. Deprecate all possible attributes from asus-wmi that were added ad-hoc
>>>>>> 3. Remove those in the next LTS cycle
>>>>>>
>>>>>> The idea for this originates from a conversation with Mario Limonciello
>>>>>> https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/
>>>>>>
>>>>>> It is without a doubt much cleaner to use, easier to discover, and the
>>>>>> API is well defined as opposed to the random clutter of attributes I had
>>>>>> been placing in the platform sysfs. Given that Derek is also working on a
>>>>>> similar approach to Lenovo in part based on my initial work I'd like to think
>>>>>> that the overall approach is good and may become standardised for these types
>>>>>> of things.
>>>>>>
>>>>>> Regarding PPT: it is intended to add support for "custom" platform profile
>>>>>> soon. If it's a blocker for this patch series being accepted I will drop the 
>>>>>> platform-x86-asus-armoury-add-ppt_-and-nv_-tuning.patch and get that done
>>>>>> separately to avoid holding the bulk of the series up. Ideally I would like
>>>>>> to get the safe limits in so users don't fully lose functionality or continue
>>>>>> to be exposed to potential instability from setting too low, or be mislead
>>>>>> in to thinking they can set limits higher than actual limit.
>>>>>>
>>>>>> The bulk of the PPT patch is data, the actual functional part is relatively
>>>>>> small and similar to the last version.
>>>>>>
>>>>>> Unfortunately I've been rather busy over the months and may not cover
>>>>>> everything in the v7 changelog but I've tried to be as comprehensive as I can.
>>>>>>
>>>>>> Regards,
>>>>>> Luke
>>>>>>
>>>>>> Changelog:
>>>>>> - v1
>>>>>>   - Initial submission
>>>>>> - v2
>>>>>>   - Too many changes to list, but all concerns raised in previous submission addressed.
>>>>>>   - History: https://lore.kernel.org/platform-driver-x86/20240716051612.64842-1-luke@ljones.dev/
>>>>>> - v3
>>>>>>   - All concerns addressed.
>>>>>>   - History: https://lore.kernel.org/platform-driver-x86/20240806020747.365042-1-luke@ljones.dev/
>>>>>> - v4
>>>>>>   - Use EXPORT_SYMBOL_NS_GPL() for the symbols required in this patch series
>>>>>>   - Add patch for hid-asus due to the use of EXPORT_SYMBOL_NS_GPL()
>>>>>>   - Split the PPT knobs out to a separate patch
>>>>>>   - Split the hd_panel setting out to a new patch
>>>>>>   - Clarify some of APU MEM configuration and convert int to hex
>>>>>>   - Rename deprecated Kconfig option to ASUS_WMI_DEPRECATED_ATTRS
>>>>>>   - Fixup cyclic dependency in Kconfig
>>>>>> - v5
>>>>>>   - deprecate patch: cleanup ``#if`, ``#endif` statements, edit kconfig detail, edit commit msg
>>>>>>   - cleanup ppt* tuning patch
>>>>>>   - proper error handling in module init, plus pr_err()
>>>>>>   - ppt tunables have a notice if there is no match to get defaults
>>>>>>   - better error handling in cpu core handling
>>>>>>     - don't continue if failure
>>>>>>   - use the mutex to gate WMI writes
>>>>>> - V6
>>>>>>   - correctly cleanup/unwind if module init fails
>>>>>> - V7
>>>>>>   - Remove review tags where the code changed significantly
>>>>>>   - Add auto_screen_brightness WMI attribute support
>>>>>>   - Move PPT patch to end
>>>>>>   - Add support min/max PPT values for 36 laptops (and two handhelds)
>>>>>>   - reword commit for "asus-wmi: export symbols used for read/write WMI"
>>>>>>   - asus-armoury: move existing tunings to asus-armoury
>>>>>>     - Correction to license header
>>>>>>     - Remove the (initial) mutex use (added for core count only in that patch)
>>>>>>     - Clarify some doc comments (attr_int_store)
>>>>>>     - Cleanup pr_warn in dgpu/egpu/mux functions
>>>>>>     - Restructure logic in asus_fw_attr_add()
>>>>>>     - Check gpu_mux_dev_id and mini_led_dev_id before remove attrs
>>>>>>   - asus-armoury: add core count control:
>>>>>>     - add mutex to prevent possible concurrent write to the core
>>>>>>       count WMI due to separated bit/little attributes
>>>>>>   - asus-armoury: add ppt_* and nv_* tuning knobs:
>>>>>>     - Move to end of series
>>>>>>     - Refactor to use a table of allowed min/max values to
>>>>>>       ensure safe settings
>>>>>>     - General code cleanup
>>>>>>   - Ensure checkpatch.pl returns clean for all
>>>>>> - V8
>>>>>>   - asus-armoury: move existing tunings to asus-armoury module
>>>>>>     - Further cleanup: https://lore.kernel.org/platform-driver-x86/20250316230724.100165-2-luke@ljones.dev/T/#m72e203f64a5a28c9c21672406b2e9f554a8a8e38
>>>>>>   - asus-armoury: add ppt_* and nv_* tuning knobs
>>>>>>     - Address concerns in https://lore.kernel.org/platform-driver-x86/20250316230724.100165-2-luke@ljones.dev/T/#m77971b5c1e7f018954c16354e623fc06522c5e41
>>>>>>     - Refactor struct asus_armoury_priv to record both AC and DC settings
>>>>>>     - Tidy macros and functions affected by the above to be clearer as a result
>>>>>>     - Move repeated strings such as "ppt_pl1_spl" to #defines
>>>>>>     - Split should_create_tunable_attr() in to two functions to better clarify:
>>>>>>       - is_power_tunable_attr()
>>>>>>       - has_valid_limit()
>>>>>>     - Restructure init_rog_tunables() to initialise AC and DC in a
>>>>>>       way that makes more sense.
>>>>>>     - Ensure that if DC setting table is not available then attributes
>>>>>>       return -ENODEV only if on DC mode.
>>>>>> - V9
>>>>>>   - asus-armoury: move existing tunings to asus-armoury module
>>>>>>     - return -EBUSY when eGPU/dGPU cannot be deactivated
>>>>>>   - asus-armoury: add apu-mem control support
>>>>>>     - discard the WMI presence bit fixing the functionality
>>>>>>   - asus-armoury: add core count control
>>>>>>     - replace mutex lock/unlock with guard
>>>>>>     - move core count alloc for initialization in init_max_cpu_cores()
>>>>>> - v10
>>>>>>   - platform/x86: asus-wmi: export symbols used for read/write WMI
>>>>>>     - fix error with redefinition of asus_wmi_set_devstate
>>>>>>   - asus-armoury: move existing tunings to asus-armoury module
>>>>>>     - hwmon or other -> hwmon or others
>>>>>>     - fix wrong function name in documentation (attr_uint_store)
>>>>>>     - use kstrtouint where appropriate
>>>>>>     - (*) fix unreachable code warning: the fix turned out to be partial
>>>>>>     - improve return values in case of error in egpu_enable_current_value_store
>>>>>>   - asus-armoury: asus-armoury: add screen auto-brightness toggle
>>>>>>     - actually register screen_auto_brightness attribute
>>>>>> - v11
>>>>>>   - cover-letter:
>>>>>>     - reorganize the changelog of v10
>>>>>>   - asus-armoury: move existing tunings to asus-armoury module
>>>>>>     - move the DMIs list in its own include, fixing (*) for good
>>>>>>   - asus-armoury: add ppt_* and nv_* tuning knobs
>>>>>>     - fix warning about redefinition of ppt_pl2_sppt_def for GV601R
>>>>>> - v12
>>>>>>   - asus-armoury: add ppt_* and nv_* tuning knobs
>>>>>>     - add min/max values for FA608WI and FX507VI
>>>>>> - v13
>>>>>>   - asus-armoury: add ppt_* and nv_* tuning knobs
>>>>>>     - fix a typo in a comment about _def attributes
>>>>>>     - add min/max values for GU605CW and G713PV
>>>>>>   - asus-armoury: add apu-mem control support
>>>>>>     - fix a possible out-of-bounds read in apu_mem_current_value_store
>>>>>> - v14
>>>>>>   - platform/x86: asus-wmi: rename ASUS_WMI_DEVID_PPT_FPPT
>>>>>>     - added patch to rename the symbol for consistency
>>>>>>   - platform/x86: asus-armoury: add ppt_* and nv_* tuning knobs
>>>>>>     - remove the unchecked usage of dmi_get_system_info while
>>>>>>       also increasing consistency with other messages
>>>>>> - v15
>>>>>>   - platform/x86: asus-wmi: export symbols used for read/write WMI
>>>>>>     - fix kernel doc
>>>>>>   - platform/x86: asus-armoury: move existing tunings to asus-armoury module
>>>>>>     - avoid direct calls to asus-wmi and provide helpers instead
>>>>>>     - rework xg mobile activation logic
>>>>>>     - add helper for enum allowed attributes
>>>>>>     - improve mini_led_mode_current_value_store
>>>>>>     - improved usage of kstrtouint, kstrtou32 and kstrtobool
>>>>>>     - unload attributes in reverse order of loading
>>>>>>   - platform/x86: asus-armoury: add apu-mem control support
>>>>>>     - fix return value in apu_mem_current_value_show
>>>>>>   - platform/x86: asus-armoury: add core count control
>>>>>>     - put more safeguards in place against possible bricking of laptops
>>>>>>     - improve loading logic
>>>>>>   - platform/x86: asus-wmi: deprecate bios features
>>>>>>     - modified deprecation message
>>>>>>   - platform/x86: asus-armoury: add ppt_* and nv_* tuning knobs
>>>>>>     - make _store(s) to interfaces unusable in DC to fail,
>>>>>>       instead of accepting 0 as a value (0 is also invalid)
>>>>>>     - make it easier to understand AC vs DC logic
>>>>>>     - improved init_rog_tunables() logic
>>>>>>     - commas after every field in the table for consistency
>>>>>>     - add support for RC73 handheld
>>>>>> -v16
>>>>>>   - platform/x86: asus-armoury: add ppt_* and nv_* tuning knobs
>>>>>>     - add support for GU605CX
>>>>>> -v17
>>>>>>   - platform/x86: asus-armoury: add ppt_* and nv_* tuning knobs
>>>>>>     - fix RC73 -> RC73AX as another RC73 exists
>>>>>>   - platform/x86: asus-armoury: add core count control
>>>>>>     - be more tolerant on out-or-range current CPU cores count
>>>>>>   - platform/x86: asus-armoury: move existing tunings to asus-armoury module
>>>>>>     - fix usage of undeclared static functions in macros
>>>>> I've applied this to the review-ilpo-next branch. I'm still not entirely 
>>>>> happy with how the cpu cores change does store values without arrays but 
>>>>> it's not an end of the world (and could be fixed in tree).
>>>> Hello and thanks.
>>>>
>>>> You would make me very happy applying things as Luke wrote them
>>>> so that successive modifications are more easily compared to
>>>> what those were doing before I changed them...
>>> I just took them as they were so you should be "happy" now :-)
>>>
>>> ...Even if I didn't like having all those as separate variables requiring 
>>> if statements here and there, which could be avoided if core type would be 
>>> an array index so one could simply do:
>>>
>>> 	...
>>> 	case CPU_CORE_MAX:
>>> 		cpu_core_value = asus_armoury.cpu_cores[core_type]->max;
>>> 		break;
>>> 	...
>>>
>>> Doing that transformation incrementally looks simple enough it should be 
>>> low risk after a careful review.
>>>
>>>
>> Apparently one of the two new handhelds from asus reports
>> weird numbers for core count so that area requires a bit of work
>> anyway. I will soon move to investigate that hardware.
>>
>>>> Also if you have some more hints on how I could change that
>>>> interface (while avoiding bad surprises due to index mismatch)
>>>> I will try my best... without destroying any laptop...
>>>> perhaps... Hopefully? Wish me luck.
>>>>
>>>>> I had to reorder a few includes to make the order alphabetical which 
>>>>> luckily worked out without causing conflicts within the subsequent 
>>>>> patches (and a need to respin the series). Please try to remember to
>>>>> keep those in the alphabetical order.
>>>> I have noticed a pair of warnings in this v17 I would like to solve:
>>>> one line is too long, I should break it and one macro has an
>>>> unused parameter.
>>>>
>>>> No semantic changes.
>>>>
>>>> I have seen one of those unordered includes in asus-armoury.h...
>>>> That branch is public in your git tree: this means I can respin
>>>> a v18 from a git format-path, correct?
>>> While I could replace the previous series with a new version, it would 
>>> probably just be better to send incremental patches and I can see myself 
>>> if I fold them into the existing patches or not.
>> Ah forgive me, I am not used to the process and understood
>> something totally different. All good, patches sent, thanks!
>>
>> Would you also want to break the long assignment line?
>> Is it better if it's just one long line for clarity?
>>
>> ```
>> const struct rog_tunables *const ac_rog_runables = ....
>> ```
> I'm not sure what that second const gains us here so I'd prefer removing 
> it.
>
> It's a local variable so it doesn't look like protecting the variable 
> itself with const is that important (in contrast to things which are in 
> global scope where const for the variable too is good).
Force of habit, that way if I ever find myself touching a pointer that
is not supposed to change I get an error.

I am fine removing that const, especially if blending in with the
existing code is deemed more important than the reason above.
> Are you aware of scripts/checkpatch.pl? I think it would have caught this 
> (if one remembers to run it before sending patches, which is the hardest 
> part with that tool :-)).
>
>
Yeah I always do that but the patch number 2 already had a warning due to
reasons tied to the MAINTAINER file, so I did not gave it much attentions. Sorry.

I ended up spotting it when I was going to prepare v18 adding that other laptop.
