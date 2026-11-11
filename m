Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403107;
	b=02c305Khr3H8w8g6liQhSbkD2EpBo5DUHjQSD6BBVuf4BRwvPwd2wGH1Jzo6GIi43uP7
	 j8RVMo4PYiHy829my2b6U1ERL5O2gS5AnbWDLDhj/GGjEBnOHH9nyR6UMA6+Q9rp5PdND
	 RJ/y0Rurk1xWhbojf9MroggZB2p7yRt3poksZbO7c0RKM70+Cjsf8IL27bUY9+Xu2q5kG
	 eoGKcOaSZu/bgGU6OYeNB68d3h3MGvjTBEGl2OH8CLm3lIL7evA3w4GA5BDZwkID+/PBN
	 s8AJTb4GTWzd3dPVsCJzST6+yFKTkczy/ufi9BC5bnAGeTafrAXiw/uKy8p/sv0TTUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/sC0PYd6u7aXjl2JhSuzaaUvo6C/lmg3ble+mWNwtWY=;
	b=QFz3LvwSYJ5FatsatRNH5s42w+KUY2SvvoFsVYCXK0zzo7SU1DKn0XlQW86dlQzlcnm+
	 YBl+ePA9ynLnNpGTcccaaTqugSnxT3NJvdu0flzluWTZ4Q070qh53dET/OHdoGopF3EWs
	 rMcPzYrZqzngfmDdB13R5G4TDcrvKXRaKPuEr6T/xwNnKaNDtoT07jHi3IT6wlG2j4Vou
	 8TIFV5Z0Ima7wbjVtwhaoeN1Fv1JGuZa0AyGyjXMJ/LE0mGJwF1LdE0nfrDY6P4sxCRxG
	 7x5ehbCBGFXFzJyY+CggJRbx8Nl2EmYJeOKxQbaAqi2ZqiNfJYF80MvpcEa7+cC/m+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bjEoSXOj;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121E9606A33A
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 121E9606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bjEoSXOj
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1923184a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 05:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794403106; x=1795007906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sC0PYd6u7aXjl2JhSuzaaUvo6C/lmg3ble+mWNwtWY=;
        b=bjEoSXOjKRGEM99DYz2069eSWHV7dmmqqgAdKOUmR4/gJ2k7Kr378LjREkgcnh/1eT
         0nKf6BFhVcQSf0SfCws9OBiaszp62J6BwjTACkQp0SKA1CZMv28QfD45mDlbIdW27hKM
         OwwvIYigcX1KyxdhKPmgxKfCT9osJTk1y41sv5nJj20GB10AVPvk6XmDuM9bcRTqYEy2
         VCVmQfW2bFndhR4RslD5l7AkYv8NwhLeolsHNO2g47c8EQ+eq635y7i/he6xFaOWez4v
         xp26EXIOajgCly5j/greyTg31roSWxbR3w2VTAa9vtBoAA6SX13+gHq8H5JaaI0nNfXM
         EXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403106; x=1795007906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sC0PYd6u7aXjl2JhSuzaaUvo6C/lmg3ble+mWNwtWY=;
        b=RWFGFV1rvLQRqZPiCRLWJ72lDN606P35N2lgcGfHfegW2Xdojs0ZyH7XUi5zvFddGC
         Yjqyqpjxdn/VD2tlZmMqA/u31uw7xijqauYMjc6qIcYkG3fQ0IkJRQSwlx6aMm+057v9
         M6fD7jljTUhJ0hnLA1adTSY35dK0sqHCklJvxSYfmsQi9BDmSJ2/pUHDslSPEv9gEIi2
         frIDg2la5gDPRqrhEb5a1ATgQoTPxIKPmjZxD9LW8UNcx0mOowwQev7SEQbgeZ9uCMQG
         DD91mgFqKXlsDijAoBkEzz17X3GuhClR+otc5sJNHNVdMrRm01rvV73OSvQR+/k66RCJ
         tSWw==
X-Forwarded-Encrypted: i=1; AL+hErHgj67m7uudTl/qyihpf2MKcsTES9p7eVcHsJNObQdVtg3ZwjEPvXPtchOmRrH1gT4/S+FYLEdomS9wYa/Y1Uiod7Sv@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vq/Z5PtG5l7JsnNVbbcpFlNwf1iudFmFxWjRCW5KxLMYMYnT1
	4jh5Sw+BIePAmUPgb2jF0gG/Yl/IcK4dC9evULgbHk3hN/uuSwG6e/hw
X-Gm-Gg: AYBFou1LOLHCdZjqNAJUGD9Osfm9YRS7tSktrl7LOAl5XuUHFg9zyaP8EaQtR2P740y
	BGHFxQfmHEhgmxy1l21MIBMPaf5rnFAcXPYwtwNCjFZlywBDdRwp5RBQ81m2oEQmLVe8WU+Rzy/
	NGPOuNDr+P3VMajW3ZjzV+CGuH3ps5Kv5bUgt/N08gw3tR0Rxr8Ek4DG+kUp/1Qz2M07l+ldlaZ
	9F2xAV+Ow1ybK9lDyOCkDyaYelo08Ubw/Snz8K1j/ZXY5ZJlF4luu2Cdiw8EfSemEiARqnogOSA
	jwJkJv1H6ETrNSpeJa/6KWLrb+9TyC6DAmXAszp8xlsyNrjqsjUlS9/z5NjGKmJ5sCadBYe5NgV
	fPvcG3bX+4MLr+4vYWWhvdipOCZXNRsk1PwjY3Vqle0NBUX+wUmzZRgwDmoX/8OpaZZ6T5lmnEt
	y0YAaqErf1TsHOjpqrz16cSx4wfW+ySRgpny/1DyBTxpJBpIweoYeQeBhFFKCRrhKaqoL0VJ+i/
	Do5wR1B0gn1qqXZgRf3oMddMZO0a70iEq1NFZnQ1FCnH5aFRJO3X4uIweghJo71wRogSUbyDBM7
	cOoSxYQh+7xozdCodjLmsYynqScZulFfMrMhk2spTwHqWUhdzA==
X-Received: by 2002:a17:90b:2244:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b182ee22cfmr2316612a91.34.1794403106200;
        Wed, 11 Nov 2026 05:18:26 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:51a2:c8a9:6ee2:816d? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e1f88casm4387310a91.12.2026.11.11.05.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:18:25 -0800 (PST)
Message-ID: <5baeb1e2-7cc5-43dd-9408-e5f0365a08b1@gmail.com>
Date: Wed, 11 Nov 2026 21:18:17 +0800
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
 Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org,
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
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <c502f0d3-9ae1-51e2-4410-9f3d532a5d49@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/26 21:09, Ilpo Järvinen wrote:
> On Wed, 28 Oct 2026, Mingyou Chen wrote:
>
>> This patch series consolidates the standalone 'redmi-wmi' driver into the
>> 'bitland-mifs-wmi' driver to eliminate code duplication and centralize
>> the maintenance of overlapping ACPI WMI event streams.
>>
>> Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
>> platforms share the exact same keyboard event stream WMI GUID
>> (46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
>> the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
>> it into discrete type/id/value fields.
>>
>> Redmi operations were not contained in this patch series, future reverse
>> engineering is required.
>>
>> This series introduce a newly reported mic-mute hotkey definition
>> for Redmibooks, dropped the previous redmi-wmi driver and intrudoced
>> the quirks table for the bitland-mifs-wmi driver.
>>
>> I don't have a Redmi or other Bitland device. So I cannot work on the
>> real device.
>>
>> Features are working properly on my device (Lecoo Bellator N176).
>>
>> I leave the future reverse engineering work to the community.
>>
>> Tests are welcome.
>>
>> And by the way, the no_set member in bitland_profile_entry means a
>> platform profile is only report by the firmware but not available for
>> set.
>>
>>> And I've got a question, from sashiko's comment in my v12
>>>
>>> https://sashiko.dev/#/patchset/20261012133648.132363-1-qby140326%40gmail.com
>>>
>>>> Will this result in the loss of KEY_PERFORMANCE events on event-only legacy
>>>> devices?
>>>> Looking at bitland_mifs_wmi_probe() in drivers/platform/x86/bitland-mifs-wmi.c,
>>>> if dev_type == BITLAND_WMI_EVENT, it returns early after registering the input
>>>> device:
>>>> 	if (dev_type == BITLAND_WMI_EVENT) {
>>>> 		/* Register input device for hotkeys */
>>>> 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
>>>> 		...
>>>> 		return input_register_device(drv_data->input_dev);
>>>> 	}
>>>> When the performance key is pressed, bitland_mifs_wmi_notify() intercepts it,
>>>> invokes the bitland_notifier_list, and returns without reporting an input event:
>>>> 	case WMI_EVENT_PERFORMANCE_PLAN:
>>>> 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
>>>> 		blocking_notifier_call_chain(&bitland_notifier_list,
>>>> 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
>>>> 					     NULL);
>>>> 		return;
>>>> Because the platform profile and notifier were not registered during probe
>>>> for event-only devices, does this mean the events are silently dropped instead
>>>> of emitting KEY_PERFORMANCE like the old driver did?
>>> I ackknowledged that KEY_PERFORMANCE (WMI_EVENT_PERFORMANCE_PLAN_ALT in
>>> bitland-mifs-wmi) looks like an event in this LKML thread
>>>
>>>> Since the event reports a change that has already happened,
>>>> platform_profile_notify() is the natural way to pass it on, as
>>>> suggested in my v6 reply: power-profiles-daemon then re-reads the
>>>> profile, which is harmless after the driver's own writes too. If
>>>> KEY_PERFORMANCE should stay for on-screen displays (Ibragim asked to
>>>> keep these events observable), it may be worth not reporting it for the
>>>> event that echoes the driver's own write, or at least saying in a
>>>> comment that it reports a mode change that already happened. On
>>>> Ibragim's TM2209 the profile SET is reported not to work [3], so there
>>>> 0x16 can only come from Fn+K and the echo does not exist; Ibragim, can
>>>> you confirm?
>>> https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/
>>>
>>> So should I follow sashiko's advice?
> Do you find Hans' earlier feedback on this not actionable? Or did you miss
> it.
>
> Copying long walls of text from sashiko's findings for an older version to
> the cover letter might not be the best approach in general. Usually, we
> want to get the issues addressed before sending the next version so that
> discussion should have occurred in the thread for the previous version.
>
>>> And some remaining comments from sashiko's review of my v13:
>>>
>>>>> -	/* Keyboard backlight: Off / Auto / Low / High (new state in byte 2) */
>>>>> -	{KE_KEY, 0x00000501,	{KEY_KBDILLUMTOGGLE}},
>>>>> -	{KE_KEY, 0x00800501,	{KEY_KBDILLUMTOGGLE}},
>>>>> -	{KE_KEY, 0x00050501,	{KEY_KBDILLUMTOGGLE}},
>>>>> -	{KE_KEY, 0x000a0501,	{KEY_KBDILLUMTOGGLE}},
>>>>> -
>>>>> -	/* Xiaomi G Command Center */
>>>>> -	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
>>>>> -
>>>>> -	/* OEM preset power mode: 1=Balanced 2=Silent 3=Turbo 4=Full speed */
>>>>> -	{KE_KEY, 0x00011601,	{KEY_PERFORMANCE}},
>>>>> -	{KE_KEY, 0x00021601,	{KEY_PERFORMANCE}},
>>>>> -	{KE_KEY, 0x00031601,	{KEY_PERFORMANCE}},
>>>>> -	{KE_KEY, 0x00041601,	{KEY_PERFORMANCE}},
>>>> In drivers/platform/x86/redmi-wmi.c, redmi_wmi_notify() reported these
>>>> keyboard backlight events (event_id 0x05) as KEY_KBDILLUMTOGGLE and OEM preset
>>>> power mode events (event_id 0x16) as KEY_PERFORMANCE through
>>>> sparse_keymap_report_entry().
>>>> In drivers/platform/x86/bitland-mifs-wmi.c, bitland_mifs_wmi_keymap defines
>>>> the four WMI_EVENT_KBD_BRIGHTNESS entries for KEY_KBDILLUMTOGGLE:
>>>> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {KEY_KBDILLUMTOGGLE} },
>>>> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0), {KEY_KBDILLUMTOGGLE} },
>>>> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {KEY_KBDILLUMTOGGLE} },
>>>> 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {KEY_KBDILLUMTOGGLE} },
>>>> However, bitland_mifs_wmi_notify() returns early for both
>>>> WMI_EVENT_KBD_BRIGHTNESS and WMI_EVENT_PERFORMANCE_PLAN_ALT before reaching
>>>> bitland_mifs_wmi_report_key():
>>>> 	switch (event->event_id) {
>>>> 	case WMI_EVENT_KBD_BRIGHTNESS:
>>>> 		brightness = event->value_low;
>>>> 		blocking_notifier_call_chain(&bitland_notifier_list,
>>>> 					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
>>>> 					     &brightness);
>>>> 		return;
>>>> 	case WMI_EVENT_PERFORMANCE_PLAN:
>>>> 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
>>>> 		blocking_notifier_call_chain(&bitland_notifier_list,
>>>> 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
>>>> 					     NULL);
>>>> 		return;
>>>> 	...
>>>> 	}
>>>> 	payload = get_unaligned_le32(buffer->data);
>>>> 	bitland_mifs_wmi_report_key(wdev, payload);
>>>> Does this early return leave the WMI_EVENT_KBD_BRIGHTNESS entries in
>>>> bitland_mifs_wmi_keymap unreachable and cause a regression on Redmibook
>>>> laptops (especially models that only expose BITLAND_EVENT_GUID without the
>>>> BITLAND_MIFS_GUID control device) when pressing the keyboard backlight or
>>>> power mode hotkeys?
>>>> [ ... ]
>>> Don't actually agree with sashiko, if we report the key to the
>>> userspace, when WMs handle the KEY_KBDILLUMTOGGLE key, the keyboard
>>> light will be triggered twice if the firmware already respond to the event,
>>> which is not expected.
>>>
>>> So the question is, does the firmware respond the KBD_BRIGHTNESS event?
>>> And should we report this key to userspace?
>> >From Chris' comment:
>>
>>> - Fn+Space (keyboard backlight) sends no WMI event at all, neither 0x05
>>>    nor anything else, and does not change the backlight under Linux. So
>>>    this model cannot tell whether the firmware handles KBD_BRIGHTNESS.
>>>
>>> - Fn+K sends event 0x28 with value_low 0x01 on every press (01 28 01 00),
>>>    not 0x16. The firmware does not change the mode by itself: the
>>>    SystemPerMode value (EC 0x68) stays the same across the presses. If
>>>    0x28 is the performance mode key on this model, it is a request rather
>>>    than a notification, so platform_profile_cycle() would fit. 0x28 is
>>>    currently logged as "Unknown WMI event".
>>>
>>> - On Windows on the same machine, with Xiaomi PC Manager not running
>>>    (it fails to start on this install), neither Fn+K nor Fn+Space does
>>>    anything either. So Fn+K looks like a request that Xiaomi's software
>>>    normally acts on, not a mode change made by the firmware.
>> I think different models have different behaviors on this.
>> Should we add a quirk item?
> For different behaviors, it may well be possible we need a quirk.

This is included in Chris' patch series.

https://lore.kernel.org/r/20261106114300.936782-5-chris@miget.com

>
> But it would be nice to get this refactoring out of the way relatively
> soon as it has been blocking lots of other bitland patches and I'm a bit
> worried the scope of this work is expanding beyond what an initial
> refactor change would need.
>
> If Chris' device lacks support without his series, this refactoring
> shouldn't have to care about that yet as long as it doesn't intentionally
> make decisions we need to change right away. New quirks on top of this
> refactoring to support a previously unsupported model is not a problem but
> too limiting thermal profile mapping would have been problematic as we'd
> have immediately had to rework the mapper.

I think it's enough for the known cases except this [1].

[1] 
https://lore.kernel.org/all/CAFbNUuLmaoq22pQPzrUidJ+RC2xf2u5Ovxzy5d0LQZ7owH52OA@mail.gmail.com/

I'm confused with this bug report, everything looks correctly.

