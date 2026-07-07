Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5C442087C
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 23:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783465526; cv=none; b=jRgVQMoSCTItx2w+N6MDQVYzgO/2M0NgBwc4UxmdPdjfGbAoZvKs+SBfZNabAs1e90zm2NfreR2tV6DChHmOJJNoVPVci4EBv4vlyq9AE6RqRukVvbeUJMMwSe33q8IwXv7UzEfpdkuFzxK9OHmk1Xc3Xfv+2xsFb2KL8EbkmCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783465526; c=relaxed/simple;
	bh=I1Qn7KnerxVtlvSUt8c/+nFgHf5ED0M8oVznEhnoDj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prd6Pd8VRh7Zub1YlUe9u6vwSqmKrYx67cJzhcbr/6Rww0EOq8lEeNR3r0ao81DnfwxgHhG6BXW6AqXi4nj+WWWngxyObv4L7yHL/k2cysf7H2G2Ex9PP6/bcLl1Bz8Oxs2EpnJjcGVrHrOPgd5leZzAoDrw2ZNz93HW77eWqAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnEsC2NF; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnEsC2NF"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c88973b6965so824132a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 16:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783465524; x=1784070324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TgKaJG0/F5Gn47w5VXYKPrzyXelCdta2LvhF/CYIRg=;
        b=FnEsC2NF1yQ1KspmELPJRIL/mPZcWkdNTaa+f9iEjO5thw0IokvaY33E9xTGSdUxAh
         Ynq+Xn1lUlzJX5e8EhKlj+qRNs9TzM+GcZXJIiRGLIc7F8ICXQl6iYuXE01Ualq6B0j6
         5vemGV2TVcvd9THYF3KmokdZjJXFebo2bVMolruqX0Sn/NcTRDr+yGNUsaPDWrH1A+gt
         /4AQE8DBd9WwP5XUqkLQNN5F5S473Pnxj4G5Ns/Xnu2uo4kyiWw0bh/i5KLpoBqk9KOE
         22Z2I61teG//IPXKfkzV3ycYcuQsS4dwP63UyXYh9knKLchSxYqgB0stgySTMpkqKQdU
         PoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783465524; x=1784070324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TgKaJG0/F5Gn47w5VXYKPrzyXelCdta2LvhF/CYIRg=;
        b=dhqXkHncKe+G2KkjbB0ksWPvCUDMp8q4DJHVlGvKkX8Zd2Z4FE+A9uQ7hZqEU6G0ej
         2JKpJnVv273l3laB00DvYatvBbQsX2VbEUT4DehGf/JDILB0+tcSGOUokO3bWaGgK2Ix
         8EHzSCEGGk3r1ulO+4MsjIJFkiB5UPrLvikc577dLL4UFGR3EsE/7H1923fIJOsMe3gx
         XYNWZxmeJFIHVVH5Vb2Hrya7oKpr9LO92H2sv6ALYL5P+SOe6RbFRwNokO3l9hqQqPWX
         lGMp9I8e4rsqpPS/L2CVbvhkRxOfEbTYaGXiEtxiW0IvKF5MCo7knj50UL8hOPlo/IsE
         64hw==
X-Forwarded-Encrypted: i=1; AHgh+RohUqxuLlvGqKe0B/bz6ckp2N5Q3ps5DdHcu83fNLprdNM/KC2b3bszI8hy8HyyCmOBdYyXM6F6xutirm9FjR9+YLjd@vger.kernel.org
X-Gm-Message-State: AOJu0YwQl9RLkGMj4t6ZPkOPl8/FKpS2RfjoTCl2Y+vaRSMzXgbnRFNy
	l4Xo8wl5QmE1LL3blQa9ei4DRXg0aipzW/0dvcFhAMKsV/o9cTdGff3t
X-Gm-Gg: AfdE7cl+kNrHhX44OjFVxcqqCA+jsCF0Fh/Ts7eMlAtlhEOVuoRL2OInVuEGwtxcqNc
	glC17TNVLQQQ51g0y6sVdukjzlxbzlgySUelAKnkdV8CAky3pGEx+befU/INYt2rZDfFvXBQNjr
	20RCPBDIayKD30cJwXvhC0zvjdPkUp6aMp9Cuwetlb7ApAQGFn7u0YjF6/PwQnlbjzr8rjwxnMi
	hGcXGT/cbXUl4h1fkZGf4L8EpRDHZeB5Tb5P/3L8smgfu/MGtzUz26nmatWcXHtbtN9t2ExEGj0
	N3EO9rWinT7a0RcqOT21EjReZEJu61jLPGn7ChZzcwubL0ZA3siJh6aipY9GdWM1oXmS55VcPsE
	nLogJS548TmO8T/cokDc+tlxzkUtTp0yvaRCF3uGoRKGLR6Yclst+jr5Jmuy5bqdga9dknWe+pJ
	i/EtvAgtYwXvkRw1KHSKqcFpsecyrqYYLR8cbb
X-Received: by 2002:a05:6a21:2989:b0:3bf:9bd9:cf54 with SMTP id adf61e73a8af0-3c09af93d49mr5946357637.8.1783465524495;
        Tue, 07 Jul 2026 16:05:24 -0700 (PDT)
Received: from [28.0.0.1] ([96.44.179.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm11810249eec.4.2026.07.07.16.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 16:05:23 -0700 (PDT)
Message-ID: <4bb76377-d3f3-43a2-9176-5f257f975da1@gmail.com>
Date: Wed, 8 Jul 2026 07:05:10 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] platform/x86: redmi-wmi/bitland-mifs-wmi: shared WMI GUID
 ownership
To: Armin Wolf <W_Armin@gmx.de>, Nika Krasnova <nika@nikableh.moe>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Gladyshev Ilya <foxido@foxido.dev>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260623235235.28058-1-nika@nikableh.moe>
 <66c11c86-f3cd-4d84-b8fc-9dad3b518b87@gmx.de>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <66c11c86-f3cd-4d84-b8fc-9dad3b518b87@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/1/26 5:07 AM, Armin Wolf wrote:
> Am 24.06.26 um 01:48 schrieb Nika Krasnova:
>
>> Hello,
>>
>> I am adding support for a mic-mute LED to redmi-wmi (a follow-up to the
>> keymap patch [1]) and ran into a GUID ownership problem with
>> bitland-mifs-wmi.
>>
>> bitland-mifs-wmi claims two WMI GUIDs in its id_table:
>>
>>    46C93E13-EE9B-4262-8488-563BCA757FEF  (event device)
>>    B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B  (control device)
>>
>> redmi-wmi already claims the event GUID for its keymap, so the two
>> overlap there today, with nothing deciding which one wins. The mic-mute
>> LED needs the control device -- the EC mic-mute field sits behind its
>> WMAA method -- and bitland-mifs-wmi claims that one too, so my patch
>> would extend the overlap to the control GUID as well.
>>
>> Both drivers set MODULE_DEVICE_TABLE(wmi, ...), so udev autoloads both
>> and the device goes to whichever probes first.
>>
>> The outcome is load-order dependent. Loading bitland-mifs-wmi first, it
>> binds *both* devices, and a redmi-wmi loaded afterwards binds nothing:
>>
>>    $ for d in /sys/bus/wmi/devices/*; do \
>>        printf '%s -> %s\n' "$(basename "$d")" \
>>          "$(basename "$(readlink "$d/driver")")"; done | column -t
>>    ...
>>    46C93E13-EE9B-4262-8488-563BCA757FEF-0   -> bitland-mifs-wmi
>>    B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4   -> bitland-mifs-wmi
>>
>> In this order redmi-wmi is shut out entirely, including the mic-mute key
>> (bitland's keymap has none).
>>
>> This is a RedmiBook Pro 16 2024 (DMI_SYS_VENDOR "XIAOMI", board TM2309).
>> These machines appear to share a common ODM firmware base with
>> Bitland's: the same WMI GUIDs are exposed under a different DMI vendor.
>> Neither driver inspects DMI, so neither can tell whose machine it is on.
>>
>> Two complications:
>>
>> - The control device (B60BFB48) is one multiplexed method (WMAA):
>>    mic-mute, keyboard backlight, platform profile and fan all sit behind
>>    it as sub-functions. Its features cannot be split between drivers; 
>> one
>>    driver has to handle all of them.
>>
>> - The mic-mute LED needs one driver to own *both* devices. The EC
>>    reflects an LED write as the very same WMI event as a physical
>>    mic-mute key press, so suppressing the self-induced event requires 
>> the
>>    LED-writing path and the key-event path to share state. A split
>>    (control in one driver, event in the other) cannot coordinate it.
>>
>> So per machine one driver needs to own both devices and provide all the
>> features that machine needs. The options I see:
>>
>>   1. The two are merged into one driver for this ODM platform that owns
>>      both GUIDs and DMI-gates the per-brand pieces (keymap, mic-mute
>>      LED).
>>
>>   2. bitland-mifs-wmi gains the Redmi mic-mute key + LED (DMI-gated to
>>      XIAOMI), since it already owns both devices and provides the other
>>      features here; redmi-wmi would then not bind on these machines.
>>
>>   3. redmi-wmi becomes the Redmi owner: it absorbs the control-device
>>      features (backlight/profile/fan) plus the mic-mute LED, and
>>      bitland-mifs-wmi DMI-gates itself out of Redmi hardware.
>>
>> In cases 2 and 3 the split is enforced by a DMI check in probe,
>> returning -ENODEV on a vendor mismatch, so the declining driver yields
>> the device to some'ne else. Both sides must gate from the start: once
>> the wrong driver binds, the device is -EBUSY for the other and is not
>> re-offered.
>>
>> Mingyou Chen (bitland-mifs-wmi author, CC'd) told me off-list that this
>> is a GUID overlap, that his Bitland hardware has no mic-mute key, and
>> that he is fine with the mic-mute support living in redmi-wmi.
>>
>> The mic-mute LED is already implemented and tested on my RedmiBook Pro
>> 16. I can send it, and the bitland-mifs-wmi changes, as a proper series
>> once we settle on a shape.
>>
>> This follows up the mic-mute keymap patch [1] and an earlier question
>> about the overlap [2].
>
> I think that Bitland also manufactures hardware for Xiaomi, so both 
> drivers
> seem to actually control the same hardware.
>
> Because of this i would go with option 1 (merging both drivers into one).
>
> Thanks,
> Armin Wolf
>
>>
>> [1]: 
>> https://lore.kernel.org/all/20260620145928.2156909-1-nika@nikableh.moe/
>> [2]: 
>> https://lore.kernel.org/all/20260531123345.237521-1-nika@nikableh.moe/
>>
Hello, the redmi device is using 32bits (4 bytes) to represent an event, 
but my bitland device uses 16bits (2 bytes)

This is the structure to represent an event

struct bitland_mifs_event {
     u8 event_type;
     u8 event_id;
     u8 value_low;    /* For most events, this is the value */
     u8 value_high;    /* For fan speed events, combined with value_low */
     u8 reserved[4];
} __packed;

The raw events are hard-encoded (Little-Endian) in the redmi driver (in 
the redmi_wmi_keymap constant)

The Redmi device uses value_low in its hotkey event payload

Using magic numbers in the kernel code is bad

So should I add an macro to construct the event code like

#define WMI_SCANCODE(type, id, low, high) (((u32)(high) << 24) | 
((u32)(low) << 16) | ((u32)(id) << 8) | (u32)(type))

