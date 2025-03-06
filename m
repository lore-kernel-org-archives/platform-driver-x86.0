Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0974414
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Mar 2025 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272426; cv=none; b=JrVZZAr27JX9dBY2lqQBWaDl6DFvlLQIsUEaBc+Z6fd/ej4pzPtTHjkI3kF1scW4PCqRjyN3snHVBvkMMTCd1cJdwu1HR0y4RPzozIrqpY+lqDAdxPEN8oxVekG/q6wi5PkcSWGcUPNKlAYQbJ/AohSDw591/81OFarMRg6qZ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272426; c=relaxed/simple;
	bh=dIH+peJSIZDYtgWcc30vB3apsd35CWdib5i4AMd7wec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fL9uqi6j2Ayn+DJe4pITBOzB1zUBQQGImew82c+46DasOssNFvFxFZ2SRaCkj9fkL2DAAPJwM5CctPKFmPpZL5SCs9TfXVY4B3LaIo7YVxbpXTgJedIud502Ju+2Ubdbu7gpnYTfsuHPM4Br/Nit3iSRJkNDEeiALNciSuzPHnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GAlSykXK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GAlSykXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741272422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UPQmW4x3hv7vfssggktazri6arnz2h1pY5Q0QlpQ/g=;
	b=GAlSykXKxR1LSk3INrM+eKm1BdImEDA1vwZskdywHPM+DlO8/MSuKnxsESvZ3iuYEBuS27
	wLzEM5cNALB5L/dZUZijCLocRVS1k1eMn6vT3jXD5dqix3SzuDOFjrZ72l+m+S1FBGWmwh
	+62eeV56qSFWkKR6wgg4mvCMqm/W+WU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-3q4k7CytNfm5jRRqM-5R6Q-1; Thu, 06 Mar 2025 09:47:01 -0500
X-MC-Unique: 3q4k7CytNfm5jRRqM-5R6Q-1
X-Mimecast-MFC-AGG-ID: 3q4k7CytNfm5jRRqM-5R6Q_1741272420
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab68fbe53a4so97678666b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Mar 2025 06:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272420; x=1741877220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/UPQmW4x3hv7vfssggktazri6arnz2h1pY5Q0QlpQ/g=;
        b=tzBdyvIoY5LUZfiNlqbitNWT96TKRCBxq+SNCZB92nQIHzJDusIQRrjA6NOXO33xyn
         3OgQmyozmRFw2ETGY3WNAwqyMvX6ZFW6k5T8OwSQLdUXj3GVDjBijpuGAGWEVNK9JwPx
         ZZdu2Pr8rwGy2DzTzV+WJdUqF93uiEIu2WhcOaDGBdrgQ8sDfp/cOAwqNU1A28z1U4MH
         qhn/bWLZ6bjBk8kwdHx7tfFvTfwNbdAntlJdmMoidj9N+CAGoW2h7ZkMbPjKlg12chki
         blXkis6yznVFgvmLzjeMZo2q07fx5HYndSrEcy7gkJsH81Np6e93IYtCpaDPnt+UY4mo
         sslQ==
X-Forwarded-Encrypted: i=1; AJvYcCUubEgGVMhrfBzNlBdfTpuWPI3XujVdUCCoa5X+/1aKIX2DiHHfKQ+pYpqeU/Wlb5BuveuOz+e197eNNgGOKowC5xxs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyirb41yKgLBijYuW05AwRgW6ye8Fd4Ap+fL949t7BUX6K52YfT
	YlrQixD0KDYpVIXkB2tkdMrCIN5o6TbzoLsv1HWwgUUTE27DCKN08e5nlfAddDdhyqWHjsDhsYy
	OKvxlc1ou3Ne93zxWefeMyPj3WgnSPAWRsFko+ItQ7bv/38KdN7SP14Zp+HK3mLEpGVZ9fLM=
X-Gm-Gg: ASbGnctqKlXS7RzdevR7QZZk4MtwUh4jda6s/uR4f7bGy++jK193BA1L+FSjMyK/tSS
	DuKaGYW1ua9eR1AKKBVEwLYlCruCRkY8UY2G/45XZOt5TUenvL5Q90nItgHGJpS9MVj6N39+Df7
	SYZLxXr948TRwCKghJiQz5o20JUMzCaVS5+v91ErvYECKUSxtdVoqR/nOytvmWSpCsbHCd6Egaw
	MPWNUnyD8x8b6K4jQq3zxZmsE2KgoGsUY3mmqFY7VsnQNCHAM8qxTUt4JlekgAfOvH732vanfK5
	rhLc/u9gFNBbMwPPU3yc3tfZ7bQ6RmrhPymVnAZr/LscNl11KtZF0KFZ0j+rDhQR5ev2gNOBVf6
	0GI4k93AoYBwaxc6gWjMrB0lbG/1RNmsGVpm6W/2EP3B1FCchL90HylGwfh50bgX6eg==
X-Received: by 2002:a17:906:c149:b0:ac1:ea9f:a6ad with SMTP id a640c23a62f3a-ac20da8a2d8mr906149966b.36.1741272420241;
        Thu, 06 Mar 2025 06:47:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQSJy5EZecYrt7HyqKAx52JErQCORb4yUwLr82VGXJYHf8aYHWvYrqfEqLs8/0TfmH39+utA==
X-Received: by 2002:a17:906:c149:b0:ac1:ea9f:a6ad with SMTP id a640c23a62f3a-ac20da8a2d8mr906144766b.36.1741272419726;
        Thu, 06 Mar 2025 06:46:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768ef30sm1040565a12.69.2025.03.06.06.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:46:58 -0800 (PST)
Message-ID: <b0d0eac1-76e5-462b-9ff5-605536fa00b4@redhat.com>
Date: Thu, 6 Mar 2025 15:46:58 +0100
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
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20250303190442.551961-1-wse@tuxedocomputers.com>
 <20250303190442.551961-2-wse@tuxedocomputers.com>
 <1bee0a62-058b-482a-8eec-d45b8aca1614@redhat.com>
 <d74c348d-474a-4871-8b94-d836e8d054e8@tuxedocomputers.com>
 <1fbdfe7f-0f25-4de0-805c-b712663f7681@redhat.com>
 <e6f5234c-98ab-4a06-aa1a-59726f395ea4@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e6f5234c-98ab-4a06-aa1a-59726f395ea4@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Werner,

On 5-Mar-25 4:41 PM, Werner Sembach wrote:
> Hi Hans,
> 
> Am 05.03.25 um 15:18 schrieb Hans de Goede:
>> Hi Werner,
>>
>> On 5-Mar-25 1:07 PM, Werner Sembach wrote:
>>> Am 05.03.25 um 12:25 schrieb Hans de Goede:
>>>> Hi Werner,
>>>>
>>>> On 3-Mar-25 8:04 PM, Werner Sembach wrote:
>>>>> This small driver does 2 things:
>>>>>
>>>>> It remaps the touchpad toggle key from Control + Super + Hangaku/Zenkaku to
>>>>> F21 to conform with established userspace defaults. Note that the
>>>>> Hangaku/Zenkaku scancode used here is usually unused, with real
>>>>> Hangaku/Zenkaku keys using the tilde scancode.
>>>> So this control + super + scancode 0x76 sending is also seen on
>>>> quite a few other laptops and I think we need a generic fix for this.
>>>>
>>>> I recently noticed that KDE's keyboard-shortcut settings actually has
>>>> a  control + super + Hangaku/Zenkaku -> touchpad-toggle key binding
>>>> in its default bindings (IIRC). But that cannot work because xkb actually
>>>> has no mapping for evdev code 85 / KEY_ZENKAKUHANKAKU if you look in:
>>>>
>>>> /usr/share/X11/xkb/keycodes/evdev and then look for 93 (*) you will
>>>> find no mapping. I think this KDE default binding may be from a long
>>>> time ago when this did work. Or maybe KDE uses the FOO part of KEY_FOO
>>>> as symbolic when there is no xkb mapping ?
>>> It does not work on X11, but it does work on Wayland (there xev also sees the Zenkaku/Hankaku keypress). Don't ask me why.
>> Interesting, so in xev under Wayland you see something like this
>> on release:
>>
>>      state 0x0, keycode 38 (keysym 0x61, a), same_screen YES,
>>
>> With there actually being a keysym of "Zenkaku_Hankaku" there ?
> 
> No. Sorry I got it a little bit wrong above, I didn't know it exactly anymore and had to retest:
> 
> 
> With the keyboard shortcut deactivated, xev on wayland shows this:
> 
> KeyPress event, serial 39, synthetic NO, window 0x1200001,
>     root 0x4f7, subw 0x0, time 246681, (83,3), root:(1273,701),
>     state 0x0, keycode 133 (keysym 0xffeb, Super_L), same_screen YES,
>     XLookupString gives 0 bytes:
>     XmbLookupString gives 0 bytes:
>     XFilterEvent returns: False
> 
> KeyPress event, serial 39, synthetic NO, window 0x1200001,
>     root 0x4f7, subw 0x0, time 246682, (83,3), root:(1273,701),
>     state 0x40, keycode 37 (keysym 0xffe3, Control_L), same_screen YES,
>     XLookupString gives 0 bytes:
>     XmbLookupString gives 0 bytes:
>     XFilterEvent returns: False
> 
> KeyPress event, serial 39, synthetic NO, window 0x1200001,
>     root 0x4f7, subw 0x0, time 246686, (83,3), root:(1273,701),
>     state 0x44, keycode 93 (keysym 0x0, NoSymbol), same_screen YES,
>     XLookupString gives 0 bytes:
>     XmbLookupString gives 0 bytes:
>     XFilterEvent returns: False
> 
> KeyRelease event, serial 39, synthetic NO, window 0x1200001,
>     root 0x4f7, subw 0x0, time 246690, (83,3), root:(1273,701),
>     state 0x44, keycode 93 (keysym 0x0, NoSymbol), same_screen YES,
>     XLookupString gives 0 bytes:
>     XFilterEvent returns: False
> 
> KeyRelease event, serial 39, synthetic NO, window 0x1200001,
>     root 0x4f7, subw 0x0, time 246696, (83,3), root:(1273,701),
>     state 0x44, keycode 37 (keysym 0xffe3, Control_L), same_screen YES,
>     XLookupString gives 0 bytes:
>     XFilterEvent returns: False
> 
> KeyRelease event, serial 39, synthetic NO, window 0x1200001,
>     root 0x4f7, subw 0x0, time 246703, (83,3), root:(1273,701),
>     state 0x40, keycode 133 (keysym 0xffeb, Super_L), same_screen YES,
>     XLookupString gives 0 bytes:
>     XFilterEvent returns: False
> 
> 
> With the shortcut active, xev on wayland shows this (and the shortcut works):
> 
> KeyPress event, serial 39, synthetic NO, window 0x1200001,
>     root 0x4f7, subw 0x0, time 365034, (83,3), root:(1273,701),
>     state 0x0, keycode 133 (keysym 0xffeb, Super_L), same_screen YES,
>     XLookupString gives 0 bytes:
>     XmbLookupString gives 0 bytes:
>     XFilterEvent returns: False
> 
> KeyPress event, serial 39, synthetic NO, window 0x1200001,
>     root 0x4f7, subw 0x0, time 365036, (83,3), root:(1273,701),
>     state 0x40, keycode 37 (keysym 0xffe3, Control_L), same_screen YES,
>     XLookupString gives 0 bytes:
>     XmbLookupString gives 0 bytes:
>     XFilterEvent returns: False
> 
> KeyRelease event, serial 39, synthetic NO, window 0x1200001,
>     root 0x4f7, subw 0x0, time 365060, (83,3), root:(1273,701),
>     state 0x44, keycode 37 (keysym 0xffe3, Control_L), same_screen YES,
>     XLookupString gives 0 bytes:
>     XFilterEvent returns: False
> 
> KeyRelease event, serial 39, synthetic NO, window 0x1200001,
>     root 0x4f7, subw 0x0, time 365060, (83,3), root:(1273,701),
>     state 0x40, keycode 133 (keysym 0xffeb, Super_L), same_screen YES,
>     XLookupString gives 0 bytes:
>     XFilterEvent returns: False

Ah ok, so in KDE the shortcut somehow works under Wayland despite
the lack of xkb keysym mapping (maybe match on keycode?) and then 
the compositor absorbs / eats the Zenkaku_Hankaku key-press +
release as it does with other compositor handled hotkeys leaving
apps like xev to just see the modifier press/release events
(which the compositor cannot delay / filter for the same reasons
as why an i8042 kbd filter won't work).

>> Because that is not working on Wayland on my laptop with the same
>> issue (after disabling the hwdb mapping) and I don't understand
>> how that could work at all given that /usr/share/X11/xkb/keycodes/evdev
>> has no mapping for EV keycode 85 (93 in that file) ?
>>
>>> Also: Other DEs don't have this binding.
>> Yes that is an issue, but see below.
>>
>>>> *) 85 + 8 all codes there are shifted up 8 compared to the KEY_FOO
>>>> defines because codes 0-7 are reserved for modifier.
>>>>
>>>> I hit the same issue years ago on "T-boa Tbook air" laptop and
>>>> their I fixed this by mapping Hangaku/Zenkaku -> f21 in
>>>> /lib/udev/hwdb.d/60-keyboard.hwdb :
>>>>
>>>> ###########################################################
>>>> # T-bao
>>>> ###########################################################
>>>>
>>>> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnT-bao:pnTbookair:*
>>>>    KEYBOARD_KEY_76=f21                                    # Touchpad toggle
>>>>
>>>> + teaching GNOME to also accept Ctrl + Super + XF86TouchpadToggle
>>>> as touchpad-toggle:
>>>>
>>>> https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/blob/master/data/org.gnome.settings-daemon.plugins.media-keys.gschema.xml.in?ref_type=heads#L577
>>> Yeah KDE would need a similar fix and other DEs probably too. I hoped for a generic fix that does not need adjustments in so many projects.
>>>
>>> My first try was to do it on the XKB level but on Wayland the RedirectKey action is not implemented https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/merge_requests/794#note_2803713 (and probably wont be even in the future https://github.com/xkbcommon/libxkbcommon/issues/18#issuecomment-72728366) so I can't "unpress" control and super.
>>>
>>> If it is a more general issue, why not fix it on a more general level in the kernel? Maybe a generic filter applyable via a command line quirk and/or a quirk list?
>> The problem is that filtering keys with modifiers like you are doing
>> here just does not work.
>>
>> Your filter is seriously messing with the timing of the keypresses
>> which can be a real issue when not actually using the toggle touchpad
>> hotkey.
>>
>> Lets say the user is playing a game and has mapped super to
>> one of the fire buttons and is using an in game weapon with
>> some sort of auto-repeat firing.
>>
>> And your seqpos variable likely is 0 when super gets pressed,
>> now the keyboard sends 0xe0, 0x5b which your filter filters
>> out, and the user keeps super pressed because they expect
>> the weapon to start firing on auto-repeat. But the super
>> press is never send until super is released or another key
>> is pressed so things don't work.
>>
>> Likewise if the DE, an app or accessibility settings want to
>> differentiate between a short and a long super press all
>> presses now become super (pun not intended) short because
>> you insert the press directly in front of the release, losing
>> any timing information about how long the key was pressed.
>>
>> This is why using an i8042 filter for filtering key-combinations
>> (and the EC emulates a key-combination here) can never work reliably.
> Ok, thought I had a clean solution, but doesn't seems so xD.

Yeah these single key which the EC makes send a whole key sequence
EC level key-bindings are a pain to deal with. Some for some other
keys emulating Windows hotkey presses like "Super + P", but those
are simply send unmodified to the DE to let the DE deal with them.

Sending these unmodified to the DE pretty much is the only thing
we can do.

>> OTOH desktop environments already allow having Ctrl+Super+something
>> keybindings for DE actions. So we can re-use the tried and trusted
>> modifier handling in the DE to deal with combi part leaving just
>> the issue of mapping PS/2 scancode 0x76 aka evdev code
>> 85 / KEY_ZENKAKUHANKAKU to something usable by the DE.
>>
>> ATM both GNOME and KDE already have support for
>> Ctrl+Super+something for touchpad-toggle except that KDE expects
>> a "Zenkaku_Hankaku" keysym where as GNOME expects "XF86TouchpadToggle"
>> arguably the GNOME solution is slightly better because Japanese
>> keyboard layouts already use/send the "Zenkaku_Hankaku" keysym
>> unrelated to touchpad-toggle use. And I don't know what happens
>> when pressing ctrl+super+Zenkaku_Hankaku while using a Japanese
>> layout.
> When I interpret the xkb-config correctly, JIS keyboards use the tilde scancode/keycode for the physical zenkaku/hankaku keys, at least in the default config HZTG (henkaku/zankaku toggle) is aliased to TLDE

Yes I don't think the 0x76 ps/2 scancode is used on any actual
keyboards other then for this toggle touchpad key thing.

>> I think maybe we just need to patch atkbd.c at the kernel to
>> map scancode 0x76 -> KEY_TOUCHPAD_TOGGLE since normal PS/2
>> keyboards never generate 0x76, this would lose the mapping to
>> KEY_ZENKAKUHANKAKU but since /usr/share/X11/xkb/keycodes/evdev
>> does not even map KEY_ZENKAKUHANKAKU I don't think loosing that
>> mapping will do a big deal.
> 
> At least from kernel side this would be a very small patch, are there any objections to it?

Well it would break the currently working touchpad toggle in KDE,
but the same applies to doing the mapping in hwdb.

I think it would be best to just post the patch + create
a KDE issue and then see from there.

Regards,

Hans


