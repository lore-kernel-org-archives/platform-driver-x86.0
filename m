Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A370AC3E8C5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Nov 2020 05:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A66E207FF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Nov 2020 05:39:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2TLtbuc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgK2FjT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 29 Nov 2020 00:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgK2FjT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Nov 2020 00:39:19 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51274C0613D1
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2020 21:38:39 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id b144so8018267qkc.13
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2020 21:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=nb6zt1LeAckqKrJh4uabjLB5MDj/++2P8/+UsZ7wjaQ=;
        b=i2TLtbucSBdM5/rtZqwvuu4nmbyl5X6jUcFsMMYI/DgOwKCPQY2P+pkRSWQOMRPMnG
         5lyc/B35uP28sCGgtSeF91L2moRFbvJmw7+8orlEc0VC5Z1urP6bCUYAVzyXo7PcqPGV
         04e4lytUnOJp5Sy+vKYyF/+1CNAAV40QSUJAAsGFG4ES8kl2z0L4+kz73XOY1GLAnQrh
         LtnXSnSxyaPtvsAIEr2375qShIKlSsuNqeN6H9BF4VLFPE1JNa/eZG96IxOnuBxMIu8g
         RnqmZZUJ3z6NDALMiuNvSzDVYutNOBziU2QGF/wYMkHFI4QyyTMpZXqSNXKMcmCmaocO
         ZPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nb6zt1LeAckqKrJh4uabjLB5MDj/++2P8/+UsZ7wjaQ=;
        b=YQ88TEXVBQWxSBYFay+GgFwCCzPqKVVl35BHVOH0ioFlgtEznlEImhblwvi/p3loFS
         Kk08oTpP4ED4i6JUovPRwX8k40IWXRKrIa70SclcJOS3p4ex3vrLjheH8skb7mEwupbn
         VWdEA7ERENNhiGp4P6ClrpGBqjknWqot0kA5m4wdcfj/kUFw1ot2qoqIjsyT52BQWC1Q
         d+LWXpi06Bfr+baMcvDvvL7aZbWtk6kkk20e/DeaKnPCwAB6lBS21qt3xH8gvnp9dcXa
         Ny5843uPyF2U8KDX5GrzwBmiXwEaKunIoDQm1qL44Qr6Phz3cUIGCFpvrTK7+Q0B8lgV
         k3Yg==
X-Gm-Message-State: AOAM533lithVjCXFNhBXOyTjMKfqkk2Rqxe+Yv6LGgXm/hUsjl19Eu8F
        jLzjBVU+ClG3QeA14fpKp/GqIKJCtsFyTQ==
X-Google-Smtp-Source: ABdhPJwOGFIaxfysVk3pfUfMxhUxeKEI/6CptcFfUQHV6BrSIV5zIhsQo6Rx7MMSRXqplmvBfm3cQA==
X-Received: by 2002:a37:6546:: with SMTP id z67mr16674761qkb.22.1606628317976;
        Sat, 28 Nov 2020 21:38:37 -0800 (PST)
Received: from ?IPv6:2600:6c52:7c00:284:e93f:9434:7c3d:367e? ([2600:6c52:7c00:284:e93f:9434:7c3d:367e])
        by smtp.gmail.com with ESMTPSA id r1sm6361266qta.32.2020.11.28.21.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 21:38:37 -0800 (PST)
Subject: Re: [PATCH] platform/x86: hp-wmi: Add support for home in HP OMEN
 laptops
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <174c79fb794.120dada4b39603.5369737602791060462@sidsun.com>
 <cad5f2ab-e319-b6fd-360d-5beb62d6899f@redhat.com>
 <b8c32747-2704-8a2d-dc32-b6154128d295@gmail.com>
 <9ca5bc3c-807c-3dbc-41a9-741a3407c66c@gmail.com>
 <2853bc2b-be49-9ff7-3f9e-6caca8162b26@redhat.com>
From:   Dana Goyette <danagoyette@gmail.com>
Message-ID: <b0acdbd5-6f0e-5b3b-1682-1be551d48c20@gmail.com>
Date:   Sat, 28 Nov 2020 21:38:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2853bc2b-be49-9ff7-3f9e-6caca8162b26@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 11/28/20 3:13 AM, Hans de Goede wrote:
> Hi,
> 
> On 11/28/20 3:55 AM, Dana Goyette wrote:
>>
>>
>>> On 11/27/20 6:19 PM, Dana Goyette wrote:
>>>
>>> FYI, the HP Omen 15 2020 has a different keyboard, where Home is a proper separate key.  The India model has yet another layout, with a full numeric keypad that also includes Home.  So unless we want to get into DMI matching, it's safest to map the key to something distinct.
>>>
>>> Layout on the US model:
>>>
>>> [Omen]   [Calc] [PrtScr]
>>> [Insert] [Home] [PgUp]
>>> [Pause]  [End]  [PgDn]
>>>
>>> Layout on the India model:
>>> [Omen]    [Calc] [Insert] [PrtScr]
>>> [NumLock] [/]    [*]      [-]
>>> [7/Home]  [8]    [9/PgUp] [+]
>>>
>>> (Where's Delete?  Above Backspace.)
>>
>> Upon looking at the driver's source, the 2020 model won't be encountering that path, so "home" may be okay after all.  When I press that key, the event is different (it's not HPWMI_BEZEL_BUTTON).
>>
>> hp_wmi: Unknown event_id - 29 - 0x21a5
> 
> Hmm, but the event_data is the same as before, so maybe event-id 29 is simply
> the new HPWMI_BEZEL_BUTTON... I wonder if other keys generate this event-id too,
> and if they also use the same event_data values is before.
> 
> Or IOW I wonder if we can / want to re-use the hp_wmi_keymap (and the existing
> input_dev) for the new event-id 29, or if we want a new input_dev and sparse-keymap
> for the new event-id.
> 
> My initial feeling is to re-use the existing input_dev and keymap at which point
> the event-id being different does not help us. We should probably just assign
> KEY_CONFIG to it.  Users who want it to send home can then remap that,
> either through hwdb, so that it gets re-mapped to KEY_HOME at the kernel level,
> or at some higher level.
> 
> Note in my original reply I said to use KEY_CONTROL_PANEL, but that has the
> disadvantage that its keycode is above 247 which is not supported under X11.
> Looking at this again I wonder why we have KEY_CONTROL_PANEL at all, since
> the comments on KEY_CONFIG pretty much over opening the control-panel:
> 
> #define KEY_CONFIG              171     /* AL Consumer Control Configuration */
> 
> Alternatives which are also under 247 are:
> 
> KEY_COMPUTER
> KEY_HOMEPAGE
> KEY_DASHBOARD
> KEY_MEDIA
> 
> I see that despite me reviewing this, the patch never landed, so we are free to
> do what we want here with having to worry about breaking existing setups.
> 
> Regards,
> 
> Hans
> 

I tried various keys in xdotool, and `xdotool key XF86Tools` opens 
Gnome's Settings application.  From what I can tell, KEY_CONFIG is 
mapped to that: https://bugs.freedesktop.org/show_bug.cgi?id=12228

There's also precedent in the Huawei laptop driver for using KEY_CONFIG:
https://lore.kernel.org/patchwork/patch/1024465/

For completeness, I'm adding further information about the hotkeys on 
the HP Omen 15 2020 (AMD), though the other keys are probably out of the 
scope of this patch.

---


Omen key:
* On Windows, brings up Omen command center
* hp-wmi: Unknown event_id - 29 - 0x21a5
* Since it's an unknown event, it's not sent via the event device.


Fn-Escape (unmarked):
* On Windows, triggers a small HP system info window.
* hp_wmi: Unknown event_id - 29 - 0x21a7
* My last HP (EliteBook 8530w from 2008) had Fn-Escape too, but I don't 
recall what it did in Linux.


Fn-F2 / Fn-F3 (backlight down/up):
* Sends proper events via ACPI Video. but also does something on atkbd:
* atkbd serio0: Unknown key released (translated set 2, code 0xab on 
isa0060/serio0).
* atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.


Fn-F4 (keyboard backlight toggle):
* Toggle seems to happen in firmware
* Nothing on hp-wmi
* Nothing on any event devices


Fn-F11 (touchpad lock):
* Locking works (touchpad is frozen while LED is on)
* From unlocked: hp-wmi: Unknown key code - 0x21a9.  (LED turns on.)
* From locked:   hp-wmi: Unknown key code - 0x121a9  (LED turns off.)
* Sends EV_MSC/MSC_SCAN (value 0x21a9 or 0x121a9) to userspace.
* Sends EV_KEY/KEY_UNKNOWN down and up immediately (no hold or repeat).


Fn-F12 (windows key lock):
* No LED, but the lock works.
* From unlocked: hp-wmi: Unknown key code - 0x21a4  (Now locked.)
* From locked:   hp-wmi: Unknown key code - 0x121a4 (Now unlocked.)
* Sends EV_MSC/MSC_SCAN (value 0x21a4 or 0x121a4) to userspace.
* Sends EV_KEY/KEY_UNKNOWN down and up immediately (no hold or repeat).
