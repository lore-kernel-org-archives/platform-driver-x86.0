Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7394315F
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 01:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763515294; cv=none; b=Bb6nhW9afv+9E3Xs5g9LPD85mo6VSZOZLNP0ZxJsKJeN/8c1yIQHjs/ywoLCzvVJzfZTHq/0fkR52IML/HYJK1to7zqDz6TQ0w0hz0iA1/Y5z20Z7OcTpnhl76dUeg9/wj8BeELJFPF8WFhe7ZZH0pSiI2ATC6VO2kAcxTqSE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763515294; c=relaxed/simple;
	bh=zsj0bYxmNl0sC4RJxINFguzHtKtN4C3I4foNnLM2ocQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W67sFwBYaWdBfeqy1RXd/b5zo26rEPUyNaTCd8ilLHeMdUj0JTk83MRBZxqF3AHGTQ/7JmY3OhIfVAne4wpghLaeGWO3VjtTdk2+3aBFOkrLGNDD6UQEAYbXDJAyFJphBrTTidosudlbcxvdoK5PzqGsaurH2wgtkFXSZqzAu+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gitjQ2ZJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gitjQ2ZJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae77516so67111355e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 17:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763515290; x=1764120090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ddgEu29tPnsA+drUgrEFgvoZrUhovZVnyPzqxZookM=;
        b=gitjQ2ZJASks/6stURFN0DRPZZXRUMziO13v6jD4pbLwn1sLNHSfTwaQa/RaQJ11HZ
         YSe3G7VH4bjmxh7CidthGQerOhYAkBh3BTHRt4KFrzwXdpWl6A31uA07ENo5+viQZtn7
         j3DDEFrSYU0WSVppUspvLVBHWNej9wer4VrliwHps0RUmRoK3kH1UUULPfj5I/st1hBq
         j/0gYbngIzGo+OI8TqLz+ALSEhm21C1jfdeob04BFSfryWlZc0ZaAXB1WUayHfTi5J0q
         yVxgZkNLpyN3161iA2Qm940EgBPhr+SG7BEEtOLnBvxsy5rZOgwdOEjuNSwO2LS/0FoM
         KrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763515290; x=1764120090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ddgEu29tPnsA+drUgrEFgvoZrUhovZVnyPzqxZookM=;
        b=ROF4n4153CsbBgvD1x5xbKFXJSw9itYWJ2yk9Fnzok+ta2VpURK+9yq4S4TAEHpm00
         iplRz6lSwtfdkfYEVpjmGU9uog5A48T+z22plzBBlqlEkDfTDwi4Qmvi/PQ6UG8+KVq/
         vrhjHprQc4xTJ6KGgg1Wi9q7WpTeBfJHxqOOQ9sn/AOR0CSnzbFLxx2G6rVIGIeueAYD
         /6ucH/DIQMVjFH+bMQHEu4NoRNyOhc8eYd0EalRwMOtldmeOeKEcDLKDpcOXhVtqRXn6
         vw4adoOEwxrvWikxCkcWmWkGrHg76E7a+JGhrx8UUUT9juUyScXc1KHRBjNWgRL2tiyM
         wJCg==
X-Forwarded-Encrypted: i=1; AJvYcCVASBv8c8pVSIZ9Ce8h0O/YR98Ub1BtCSbr6zHfk0TRZ8Eu4Br7/l/h9VApYUGXtdfV5bwy2LA3D6G5qfyh5lA+kwDZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzNW3jV1wMQV0M8Ch2esp+JE2PON8nB6Je01eUiBv3jwBljOpOW
	+pIKv3E2b9X8irYFN8sSMuNYCftBfh+vpuogddrQXC1i+mVuL4biqpBT
X-Gm-Gg: ASbGncsnUvZXUJ4+eXRtcOmRXM4DE4xpFhSMugJkdTXhi5Lu6Ka2U8adqdPdCTYYjjH
	eq/A6TcBZ5txZlU3XfU97OrYeP90uFRnNIfG4RLpE8qOl3+rKnFxPb8blYk7MhuqGdc4r/zPKM2
	08emGQPDL5O6Zu+YKbxcN9a9vrhfGpqtpYzSwNrrcsT0xCvftgxoKxTMZCngvz5bWBbA5ujUTny
	nLOtcv0OaGsRnD4YNdLWNPmotJKNya5JInaU/d/PBTqbt6pSegMtKiAMv2d2uTq77CeYMGzECx/
	D1H7vDh/4b7scV7+RUg8kZPaO7c9Jwb0HA+285yUL5saTk66uCHYtUKeXSotfzQ845/wqeSL0Cq
	EXpIqLbcQDnNYJhWAR3mFtHYmflOQQV3d+wTDLgT0eGfHM3NFKwTlpfweqAMJA/S5TRo/Rv8C/R
	n/UYpE9euzZcUrnqmQ6+YPHxo=
X-Google-Smtp-Source: AGHT+IHXLcJNiQLcfo3kF05UlgcTUhWRjsF9KAEipPvueBYBiJlxZHNWshHmN9OH5bcWeW1Bhsj09A==
X-Received: by 2002:a05:600c:438a:b0:477:9d54:58d7 with SMTP id 5b1f17b1804b1-4779d545bddmr73685225e9.29.1763515289577;
        Tue, 18 Nov 2025 17:21:29 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm34821758f8f.43.2025.11.18.17.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 17:21:29 -0800 (PST)
Message-ID: <e204d129-0ac8-48fb-a178-12466350079e@gmail.com>
Date: Wed, 19 Nov 2025 02:21:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/10] HID: asus: initialize LED endpoint early for old
 NKEY keyboards
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-6-lkml@antheas.dev>
 <2fc1e683-0234-20b6-7448-bd0213c9bb37@linux.intel.com>
 <b505ffca-63a1-4c52-b940-cdfc507813fc@gmail.com>
 <CAGwozwEF8bhbhgYe9cyg0JgcKsXstNZubPV9HCapwxMvw_2OhQ@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwEF8bhbhgYe9cyg0JgcKsXstNZubPV9HCapwxMvw_2OhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/19/25 02:11, Antheas Kapenekakis wrote:
> On Wed, 19 Nov 2025 at 01:54, Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 11/18/25 13:10, Ilpo Järvinen wrote:
>>> On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:
>>>
>>>> These keyboards have always had initialization in the kernel for 0x5d.
>>>> At this point, it is hard to verify again and we risk regressions by
>>>> removing this. Therefore, initialize with 0x5d as well.
>> See patch 1: unless I missed something you can retain the two
>> FEATURE_KBD_LED_REPORT_IDx behind the same exact quirk:
>> why are we adding a quirk to replace a quirk that was removed
>> in patch 1?
>>
>> You are basically doing the pretty-much-but-not-quite
>> equivalent of what the driver was doing before.
>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>> ---
>>>>  drivers/hid/hid-asus.c | 15 +++++++++++++--
>>>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>>> index 726f5d8e22d1..221c7195e885 100644
>>>> --- a/drivers/hid/hid-asus.c
>>>> +++ b/drivers/hid/hid-asus.c
>>>> @@ -91,6 +91,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>>>>  #define QUIRK_ROG_ALLY_XPAD         BIT(13)
>>>>  #define QUIRK_SKIP_REPORT_FIXUP             BIT(14)
>>>> +#define QUIRK_ROG_NKEY_LEGACY               BIT(15)
>>>>
>>>>  #define I2C_KEYBOARD_QUIRKS                 (QUIRK_FIX_NOTEBOOK_REPORT | \
>>>>                                               QUIRK_NO_INIT_REPORTS | \
>>>> @@ -669,6 +670,16 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>>      if (ret < 0)
>>>>              return ret;
>>>>
>>>> +    if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
>>>> +            /*
>>>> +             * These keyboards might need 0x5d for shortcuts to work.
>>>> +             * As it has been more than 5 years, it is hard to verify.
>>>> +             */
>>>> +            ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>>>> +            if (ret < 0)
>>>> +                    return ret;
>>>> +    }
>>>> +
>>>>      /* Get keyboard functions */
>>>>      ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
>>>>      if (ret < 0)
>>>> @@ -1409,10 +1420,10 @@ static const struct hid_device_id asus_devices[] = {
>>>>        QUIRK_USE_KBD_BACKLIGHT },
>>>>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>          USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
>>>> -      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>>> +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>>>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>          USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
>>>> -      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>>> +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>>>>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>>>>          USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>>>>        QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>>> You should do FEATURE_KBD_LED_REPORT_ID1 refactoring together, not remove
>>> + add back in different patches.
>> Granted I still have no idea why that was removed in the first place?
>> Then re-added but losing FEATURE_KBD_LED_REPORT_ID1 ?
>>
>> What's the problem with FEATURE_KBD_LED_REPORT_ID1?
>>
>>> I suppose the cleanest would be to add a new patch as first which moves
>>> asus_kbd_init() outside of if/else so you can make this refactoring of
>>> FEATURE_KBD_LED_REPORT_ID1 in the 2nd patch.
>> Again I am missing the point in moving these...
>>> I note there's still contention with this series overall.
>>>
>> There are a few things that have pretty much the potential of making
>> some laptops act funny due to tinkering with initializations commands.
>>
>> The rename will break some tools, but other than that, granted I have yet
>> to check the rest of the patchset, looks reasonable to me.
>>
>> Perhaps I am not entirely happy with how things are worded in
>> a few instances, but it's a minor issue.
> Hi Denis,
> please refrain from repeating yourself, in the same email and across
> emails, and repeating comments that are already addressed by Ilpo. As
> that makes it hard to track and respond to your comments.
My repetitions are due to confusion with different aspects of what
you are doing, but I'll try to be less repetitive.

Also I don't think I have said the very same exact things as
Ilpo, unless I misunderstood something.
> As noted in this chain, the plan for the next version is to include
> ID2 in this quirk and instead of removing it in the simplify patch,
> use a gate by the ROG quirk that is then replaced by a gate from this
> quirk.
Yeah but I also asked (perhaps too many times?) what's up with _ID1
and the whole reasoning behind this because as it stands now
you are replacing X with Y, only to do Z without making clear to me
the reason of Y, therefore Z also suffers from the same problem.
> This completely addresses your comment. The legacy quirk only applies
> to a subset of devices, so it is not the same with this series
> applied.
And the reason for this difference is exactly what I am asking for.

I have been trying to suggest things to describe and actions
to take/specific code changes to ensure we agree...
> Antheas
>
