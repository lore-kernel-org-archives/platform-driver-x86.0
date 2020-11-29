Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1699C3E8C5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Nov 2020 12:11:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B82520731
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Nov 2020 12:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C4KDuQiY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgK2MLV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 29 Nov 2020 07:11:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29148 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725830AbgK2MLU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Nov 2020 07:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606651793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q17WZb6papiBE5FQ+pJ7FwuY9Ov9KBfLCpRangcQ/u0=;
        b=C4KDuQiYS/sz6TP8HZkYn+ZFbgDTQ5UyfZLSNt69Q39uRtFcUcca/1Kk1HptmygbFbm/RX
        gCuoeurs5y4VUEyzuTy43QgJJPL55zj64ujtGxe2KcD+kjio4GIU9tGrLX+ZjTHzQjKQtb
        xSX3w+DAV/tGHO0D3uwIZSNt/95WHbw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-9SVqhimZNNmXFNJyW4BUTQ-1; Sun, 29 Nov 2020 07:09:51 -0500
X-MC-Unique: 9SVqhimZNNmXFNJyW4BUTQ-1
Received: by mail-ed1-f71.google.com with SMTP id w24so1451781edt.11
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Nov 2020 04:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q17WZb6papiBE5FQ+pJ7FwuY9Ov9KBfLCpRangcQ/u0=;
        b=fGnxUOx5V0+gdyx0xPJfIUd/HtVwrxlQ+ZKtoPkwesD0xgCwhDAPsu4kGG4mrmIzK7
         TmVKI5KzaPWQVhs9GVXLEAA4OMNsQ69XYRt6qUKVMzby2oB3RY57sIGQgS47t+/BxdNE
         seswLEvWs2GmyK9Y1JlxnFE3kESSfkg2DhYprnazffItFkpl33ggDdUt28scmMPyfHrx
         pmpXOJlIJdY3D6scf38ApZYZ8BqTv3DXjXMTsu0fNiods/fzfK+SEIk7iOZbld36HRGE
         EuU06hgJs1rKjU6t0+QkZh4QVEbfC822YvyJr+APFYPVrOo82jD+T44ypJ258o0pDDrU
         3RxQ==
X-Gm-Message-State: AOAM533TAmTUGXtOB+TLv7eqeQRaZEv1sOcp7iEguPAQe0Jz/Xw9M6pn
        6SHfPhKRVKHtTI2OzrlpHJjtvHwV+Bb5wPr5sPjNI5zWI8LYTfi0/2zGdSC9POXXgInTtDs0a8E
        7jN6Xrxs8ex3D4Z22FiHfznUwH9ADaNk01UskZlJCi4ej3+1xVvG70zpxUFZ4aO5rmxcFj61ELr
        V32qA/rrbWKg==
X-Received: by 2002:aa7:cc19:: with SMTP id q25mr7479097edt.290.1606651786241;
        Sun, 29 Nov 2020 04:09:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjzeP1YfIxJ5NTYUW57z3PGaJimjdx09PLLQiFVhqaryWtDzl4zOTnFZUJ5bwIzzWQeqIIUQ==
X-Received: by 2002:aa7:cc19:: with SMTP id q25mr7479070edt.290.1606651785832;
        Sun, 29 Nov 2020 04:09:45 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id l25sm70464ejz.84.2020.11.29.04.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Nov 2020 04:09:45 -0800 (PST)
Subject: Re: [PATCH] platform/x86: hp-wmi: Add support for home in HP OMEN
 laptops
To:     Dana Goyette <danagoyette@gmail.com>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <174c79fb794.120dada4b39603.5369737602791060462@sidsun.com>
 <cad5f2ab-e319-b6fd-360d-5beb62d6899f@redhat.com>
 <b8c32747-2704-8a2d-dc32-b6154128d295@gmail.com>
 <9ca5bc3c-807c-3dbc-41a9-741a3407c66c@gmail.com>
 <2853bc2b-be49-9ff7-3f9e-6caca8162b26@redhat.com>
 <b0acdbd5-6f0e-5b3b-1682-1be551d48c20@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c2363226-5854-8769-37b6-eff51caf3fe6@redhat.com>
Date:   Sun, 29 Nov 2020 13:09:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b0acdbd5-6f0e-5b3b-1682-1be551d48c20@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/29/20 6:38 AM, Dana Goyette wrote:
> On 11/28/20 3:13 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 11/28/20 3:55 AM, Dana Goyette wrote:
>>>
>>>
>>>> On 11/27/20 6:19 PM, Dana Goyette wrote:
>>>>
>>>> FYI, the HP Omen 15 2020 has a different keyboard, where Home is a proper separate key.  The India model has yet another layout, with a full numeric keypad that also includes Home.  So unless we want to get into DMI matching, it's safest to map the key to something distinct.
>>>>
>>>> Layout on the US model:
>>>>
>>>> [Omen]   [Calc] [PrtScr]
>>>> [Insert] [Home] [PgUp]
>>>> [Pause]  [End]  [PgDn]
>>>>
>>>> Layout on the India model:
>>>> [Omen]    [Calc] [Insert] [PrtScr]
>>>> [NumLock] [/]    [*]      [-]
>>>> [7/Home]  [8]    [9/PgUp] [+]
>>>>
>>>> (Where's Delete?  Above Backspace.)
>>>
>>> Upon looking at the driver's source, the 2020 model won't be encountering that path, so "home" may be okay after all.  When I press that key, the event is different (it's not HPWMI_BEZEL_BUTTON).
>>>
>>> hp_wmi: Unknown event_id - 29 - 0x21a5
>>
>> Hmm, but the event_data is the same as before, so maybe event-id 29 is simply
>> the new HPWMI_BEZEL_BUTTON... I wonder if other keys generate this event-id too,
>> and if they also use the same event_data values is before.
>>
>> Or IOW I wonder if we can / want to re-use the hp_wmi_keymap (and the existing
>> input_dev) for the new event-id 29, or if we want a new input_dev and sparse-keymap
>> for the new event-id.
>>
>> My initial feeling is to re-use the existing input_dev and keymap at which point
>> the event-id being different does not help us. We should probably just assign
>> KEY_CONFIG to it.  Users who want it to send home can then remap that,
>> either through hwdb, so that it gets re-mapped to KEY_HOME at the kernel level,
>> or at some higher level.
>>
>> Note in my original reply I said to use KEY_CONTROL_PANEL, but that has the
>> disadvantage that its keycode is above 247 which is not supported under X11.
>> Looking at this again I wonder why we have KEY_CONTROL_PANEL at all, since
>> the comments on KEY_CONFIG pretty much over opening the control-panel:
>>
>> #define KEY_CONFIG              171     /* AL Consumer Control Configuration */
>>
>> Alternatives which are also under 247 are:
>>
>> KEY_COMPUTER
>> KEY_HOMEPAGE
>> KEY_DASHBOARD
>> KEY_MEDIA
>>
>> I see that despite me reviewing this, the patch never landed, so we are free to
>> do what we want here with having to worry about breaking existing setups.
>>
>> Regards,
>>
>> Hans
>>
> 
> I tried various keys in xdotool, and `xdotool key XF86Tools` opens Gnome's Settings application.  From what I can tell, KEY_CONFIG is mapped to that: https://bugs.freedesktop.org/show_bug.cgi?id=12228
> 
> There's also precedent in the Huawei laptop driver for using KEY_CONFIG:
> https://lore.kernel.org/patchwork/patch/1024465/

Ack, so lets just go with KEY_CONFIG here.

> 
> For completeness, I'm adding further information about the hotkeys on the HP Omen 15 2020 (AMD), though the other keys are probably out of the scope of this patch.
> 
> ---
> 
> 
> Omen key:
> * On Windows, brings up Omen command center
> * hp-wmi: Unknown event_id - 29 - 0x21a5
> * Since it's an unknown event, it's not sent via the event device.
> 
> 
> Fn-Escape (unmarked):
> * On Windows, triggers a small HP system info window.
> * hp_wmi: Unknown event_id - 29 - 0x21a7
> * My last HP (EliteBook 8530w from 2008) had Fn-Escape too, but I don't recall what it did in Linux.

Again event_id 29, I really think we need a patch to just treat
event_id 29 the same as HPWMI_BEZEL_BUTTON.

And we could/should map 0x21a7 to KEY_FN_ESC, then userspace could
potentially do something with this if it wants.

> Fn-F2 / Fn-F3 (backlight down/up):
> * Sends proper events via ACPI Video. but also does something on atkbd:

Good.

> * atkbd serio0: Unknown key released (translated set 2, code 0xab on isa0060/serio0).
> * atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.

Ideally we would silence these by adding a hwdb entry mapping them to be
ignored, see:

https://github.com/systemd/systemd/blob/master/hwdb.d/60-keyboard.hwdb#L333

(the Dell Inspiron 1520 and Latitude 2110 entry in case the line numbers
change due to new commits) for an example of this.

Note please group any new 60-keyboard.hwdb entries for this together with
the already existing HP entries.

> Fn-F4 (keyboard backlight toggle):
> * Toggle seems to happen in firmware
> * Nothing on hp-wmi
> * Nothing on any event devices

Likely there is some firmware interface for this, but possibly we first need
to make some call to tell the firmware that we are capable of dealing with
this. Anyways kbd backlight support (including registering a:
/sys/class/leds/hp_foo::kbd_backlight/ LED-class device for this so that
e.g. the GNOME3 integration for this can work is something which is currently
not supported at all. So way more then just detecting the key-press is missing
and this really is a completely separate project.


> Fn-F11 (touchpad lock):
> * Locking works (touchpad is frozen while LED is on)

So this is handled in firmware.

> * From unlocked: hp-wmi: Unknown key code - 0x21a9.  (LED turns on.)
> * From locked:   hp-wmi: Unknown key code - 0x121a9  (LED turns off.)
> * Sends EV_MSC/MSC_SCAN (value 0x21a9 or 0x121a9) to userspace.
> * Sends EV_KEY/KEY_UNKNOWN down and up immediately (no hold or repeat).

Nice, these should be mapped to KEY_F22 for when the touchpad gets
turned on, so use F22 for 0x121a9 I guess) and to KEY_F23 for when
the touchpad gets turned off. This will make at least GNOME3 show
OSD notifications showing that the touchpad is on/off like it does
for volume mute/unmute. I realize that using F22/F23 for this may
look a but weird, but userspace has re-purposed a bunch of the
high F-key numbers to avoid the key-codes higher then 247 not being
supported in X11 problem.

I know about the following re-purposed F2# keys for this:

F20: mic-mute toggle
F21: touchpad on/off toggle (to be handled by software)
F22: touchpad on (notification for this being handled in firmware)
F23: touchpad off (notification for this being handled in firmware)

You can see these being re-defined like this in:

/usr/share/X11/xkb/symbols/inet

(search for FK20)

> Fn-F12 (windows key lock):
> * No LED, but the lock works.
> * From unlocked: hp-wmi: Unknown key code - 0x21a4  (Now locked.)
> * From locked:   hp-wmi: Unknown key code - 0x121a4 (Now unlocked.)
> * Sends EV_MSC/MSC_SCAN (value 0x21a4 or 0x121a4) to userspace.
> * Sends EV_KEY/KEY_UNKNOWN down and up immediately (no hold or repeat).

Hmm, can you explain what this does does it disable the Windows (aka meta/super)
key to avoid accidentally pressing it ?

Regards,

Hans

