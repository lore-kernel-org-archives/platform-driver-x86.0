Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536DB2054E3
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184323; cv=none; b=ESTyPri97ImcuR9rovrOc1Tchkh0kEWQ8/u41MElKnhotrTYl4PWPTnX1VH/0o1WkbeOJWGz3nb3xhYIyrbWz4sJi5pKupTGda1ap+TvSkgszINnHEJ+iHNc9bSgrSjuOR5pU4wyCdJ+cB6Dh/IuEmVtxAv9HvYhyOzbpxNnjQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184323; c=relaxed/simple;
	bh=LVsL4DWK5MoDqgj/eDMet6tfnsbo3Lr5t/4FfnOSyRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgvoawXjCM7LFD0Q+N5ZdCuHE48Oiokfz0j7AYJPbPIuNNYySk7ZBN4dq7DwehLX2xnG+nznJfqfKYzrAJRskj7Hl74MXvx90yzPimzcmq2oHFw4BsVo5wpZb7bEBgZDinMP8M6WYTEU/AXs3d46PdDuqR0mEDEftijOXftHIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TT+dysvG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TT+dysvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741184320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bfir7IfiVqSAipxfKeZEv3aRIXxAI4dwNi1nFhxXLAE=;
	b=TT+dysvG+xj4OeQjlndn7D3/NisBVFisW1aaftuBbT3WEDlwtlx75UuZrv18cxdYtC5cvK
	n+j116KwFrA7wybVn2TgnhaiyEPLVSsuDW+28uK+xer5aIrsMb0pRfnR/SzgBEORHcef9n
	HbLaZvSK3xGPoHOxtaRQyMOYS9CkwTM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-rn-cKJQAOFGjQjngT20c9Q-1; Wed, 05 Mar 2025 09:18:39 -0500
X-MC-Unique: rn-cKJQAOFGjQjngT20c9Q-1
X-Mimecast-MFC-AGG-ID: rn-cKJQAOFGjQjngT20c9Q_1741184318
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac22704d52aso4564666b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Mar 2025 06:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184317; x=1741789117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bfir7IfiVqSAipxfKeZEv3aRIXxAI4dwNi1nFhxXLAE=;
        b=Um0dSTI9B2u3ue6Rsz9gcU97+DpRfSCY++hWVhQK5dHZj0nWee+ru4qVH0ptwIJYoC
         dy+wMLlYCG9/yHE9dy0CEkiKBmFKkxhqdsAJURsGdwlaQ+WucK2EQlDQX+sn6MrUVy78
         3FY6piw96Bcl0EbJVNaM64PRg9gjjxI2tyVjhvXL3mikRJG4wc0Y6Kd96BDX2T831NQW
         Xbub50jsKcVL50Fa4EEAeEJp/kdHLlNjWrqZvEOUeLXfFUuoXahFesz3Jp1roVh6Ku7+
         iqcloVrwn4ycuBu2dGGeEDo+dJIyrIcapJa4ZvX5K98xqWvfmXWXTijCILXj7qBKhwIa
         NGfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuzzrkAUcMjilLZem/KpjPl3nUi0GJhYMnswApgL1KwB0mVyiVpxvwjXBltPSoVQHRfSKX3/MUJ0TGEIfN+6KymyU0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6MqaScMVhLDaOiPLWfimz2FGRid3VnWSjL7RCzRvOE/fDRwAN
	oIvOoO3iS/Sd/eV/e4aL/Nb5HwWTrdIKDY0Kr2DdB0EHjaxYL5zffQkF0+/arCzIfIPuznq7Hr+
	fHfFZTZhNeIgq9uQU1x33xpa0wBs6FhXkPuMn1YarukoSzumjN7+Z4sw3vcnmuV6dbKWZWBkhix
	GXYTY=
X-Gm-Gg: ASbGnctzNNcuv/lGtSXacjGRSG+VvL6c2lnjJMKPZb2uR9cADA+fte9EG1v7QwW2/2t
	ZrDVXh1UWhHK7lu9gTLOFx/+VIU4DTvm0sSDk1ViecZwdMTdn06d3iv1L3gIlSE022WdUUOv2NQ
	ow3P/zd9sVWG2cWrHbsG2CXB78lG6750+B7bZ7Wf9wunKiPUO1b5yi2O7DdhfKwES+4aKqpfrAp
	J1VG4Kw3egbNW3JeXdAaz1abF2uH1gE8pVhsc2NDInx8IAn+1JBpe+tRjapx7LxKs+N2zPiggnA
	9rUNY8Yff/7QT4kyC5bIYkLJM9ceRsl+Ki4ZtqcCHpS0uSRF/1TRi7X7h03rZl1HEgA1y7lwf03
	M2eUusD/t+UZez1rnuoDIIfzCRnNsnkKmyxgxXajdU0gPq1307szy7EN0yrrn1+ofOQ==
X-Received: by 2002:a17:907:2da2:b0:abf:7af6:ea64 with SMTP id a640c23a62f3a-ac20da89861mr371552066b.45.1741184317231;
        Wed, 05 Mar 2025 06:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFthXkhApHf5BaqjfN/Ct7e8dkc7sOHNeLhxQ+dj8q4TgODtS1XjZz0p2cTlhOfwaI1mEmxWQ==
X-Received: by 2002:a17:907:2da2:b0:abf:7af6:ea64 with SMTP id a640c23a62f3a-ac20da89861mr371548166b.45.1741184316745;
        Wed, 05 Mar 2025 06:18:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1d860c279sm449327966b.27.2025.03.05.06.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 06:18:36 -0800 (PST)
Message-ID: <1fbdfe7f-0f25-4de0-805c-b712663f7681@redhat.com>
Date: Wed, 5 Mar 2025 15:18:35 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Fix TUXEDO NB02 notebook keyboards
 FN-keys
To: Werner Sembach <wse@tuxedocomputers.com>, mario.limonciello@amd.com,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250303190442.551961-1-wse@tuxedocomputers.com>
 <20250303190442.551961-2-wse@tuxedocomputers.com>
 <1bee0a62-058b-482a-8eec-d45b8aca1614@redhat.com>
 <d74c348d-474a-4871-8b94-d836e8d054e8@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d74c348d-474a-4871-8b94-d836e8d054e8@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Werner,

On 5-Mar-25 1:07 PM, Werner Sembach wrote:
> 
> Am 05.03.25 um 12:25 schrieb Hans de Goede:
>> Hi Werner,
>>
>> On 3-Mar-25 8:04 PM, Werner Sembach wrote:
>>> This small driver does 2 things:
>>>
>>> It remaps the touchpad toggle key from Control + Super + Hangaku/Zenkaku to
>>> F21 to conform with established userspace defaults. Note that the
>>> Hangaku/Zenkaku scancode used here is usually unused, with real
>>> Hangaku/Zenkaku keys using the tilde scancode.
>> So this control + super + scancode 0x76 sending is also seen on
>> quite a few other laptops and I think we need a generic fix for this.
>>
>> I recently noticed that KDE's keyboard-shortcut settings actually has
>> a  control + super + Hangaku/Zenkaku -> touchpad-toggle key binding
>> in its default bindings (IIRC). But that cannot work because xkb actually
>> has no mapping for evdev code 85 / KEY_ZENKAKUHANKAKU if you look in:
>>
>> /usr/share/X11/xkb/keycodes/evdev and then look for 93 (*) you will
>> find no mapping. I think this KDE default binding may be from a long
>> time ago when this did work. Or maybe KDE uses the FOO part of KEY_FOO
>> as symbolic when there is no xkb mapping ?
> 
> It does not work on X11, but it does work on Wayland (there xev also sees the Zenkaku/Hankaku keypress). Don't ask me why.

Interesting, so in xev under Wayland you see something like this
on release:

    state 0x0, keycode 38 (keysym 0x61, a), same_screen YES,

With there actually being a keysym of "Zenkaku_Hankaku" there ?

Because that is not working on Wayland on my laptop with the same
issue (after disabling the hwdb mapping) and I don't understand
how that could work at all given that /usr/share/X11/xkb/keycodes/evdev
has no mapping for EV keycode 85 (93 in that file) ?

> Also: Other DEs don't have this binding.

Yes that is an issue, but see below.

>> *) 85 + 8 all codes there are shifted up 8 compared to the KEY_FOO
>> defines because codes 0-7 are reserved for modifier.
>>
>> I hit the same issue years ago on "T-boa Tbook air" laptop and
>> their I fixed this by mapping Hangaku/Zenkaku -> f21 in
>> /lib/udev/hwdb.d/60-keyboard.hwdb :
>>
>> ###########################################################
>> # T-bao
>> ###########################################################
>>
>> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnT-bao:pnTbookair:*
>>   KEYBOARD_KEY_76=f21                                    # Touchpad toggle
>>
>> + teaching GNOME to also accept Ctrl + Super + XF86TouchpadToggle
>> as touchpad-toggle:
>>
>> https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/blob/master/data/org.gnome.settings-daemon.plugins.media-keys.gschema.xml.in?ref_type=heads#L577
> 
> Yeah KDE would need a similar fix and other DEs probably too. I hoped for a generic fix that does not need adjustments in so many projects.
> 
> My first try was to do it on the XKB level but on Wayland the RedirectKey action is not implemented https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/merge_requests/794#note_2803713 (and probably wont be even in the future https://github.com/xkbcommon/libxkbcommon/issues/18#issuecomment-72728366) so I can't "unpress" control and super.
> 
> If it is a more general issue, why not fix it on a more general level in the kernel? Maybe a generic filter applyable via a command line quirk and/or a quirk list?

The problem is that filtering keys with modifiers like you are doing
here just does not work.

Your filter is seriously messing with the timing of the keypresses
which can be a real issue when not actually using the toggle touchpad
hotkey.

Lets say the user is playing a game and has mapped super to
one of the fire buttons and is using an in game weapon with
some sort of auto-repeat firing.

And your seqpos variable likely is 0 when super gets pressed,
now the keyboard sends 0xe0, 0x5b which your filter filters
out, and the user keeps super pressed because they expect
the weapon to start firing on auto-repeat. But the super
press is never send until super is released or another key
is pressed so things don't work.

Likewise if the DE, an app or accessibility settings want to
differentiate between a short and a long super press all
presses now become super (pun not intended) short because
you insert the press directly in front of the release, losing
any timing information about how long the key was pressed.

This is why using an i8042 filter for filtering key-combinations
(and the EC emulates a key-combination here) can never work reliably.

OTOH desktop environments already allow having Ctrl+Super+something
keybindings for DE actions. So we can re-use the tried and trusted
modifier handling in the DE to deal with combi part leaving just
the issue of mapping PS/2 scancode 0x76 aka evdev code
85 / KEY_ZENKAKUHANKAKU to something usable by the DE.

ATM both GNOME and KDE already have support for
Ctrl+Super+something for touchpad-toggle except that KDE expects
a "Zenkaku_Hankaku" keysym where as GNOME expects "XF86TouchpadToggle"
arguably the GNOME solution is slightly better because Japanese
keyboard layouts already use/send the "Zenkaku_Hankaku" keysym
unrelated to touchpad-toggle use. And I don't know what happens
when pressing ctrl+super+Zenkaku_Hankaku while using a Japanese
layout.

I think maybe we just need to patch atkbd.c at the kernel to
map scancode 0x76 -> KEY_TOUCHPAD_TOGGLE since normal PS/2
keyboards never generate 0x76, this would lose the mapping to
KEY_ZENKAKUHANKAKU but since /usr/share/X11/xkb/keycodes/evdev
does not even map KEY_ZENKAKUHANKAKU I don't think loosing that
mapping will do a big deal.

So I think that going with the evdev mapping + teaching KDE
that Ctrl+Super+XF86TouchpadToggle is just XF86TouchpadToggle
is the best way forward to solve this once and for all.

>>> It suppresses the reserved scancode produced by pressing the FN-key on its
>>> own, which fixes a warning spamming the dmesg log otherwise.
>> Can you not also suppress this by mapping the key to "unknown" in hwdb?
> Maybe, I didn't try. Was convenient to just do it here since I already had the filter. Will look into it once it is decided what to do with the touchpad toggle issue.

Please give using hwdb for this a try.

Regards,

Hans


