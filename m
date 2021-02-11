Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BCEC433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 23:53:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10BF664E44
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 23:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhBKXxD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:53:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41761 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231142AbhBKXwc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Feb 2021 18:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613087464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m6jCEXX0+0xKYDDnmIQcWryZ0O00Muz0nXL+by1mPc4=;
        b=VW4DCaO26VRX2wHYgns4VkYCjAAeWplOyqN2Oy0aozyQSvw8mR/eTEWN90Cs8QesyStI5Q
        hg9JUHsoGJgLAAmk2sWghqCkIngMw4mMVGNY0qgHRJl9zBVjGfiQIHHCQ3y+SiCMHBrKXG
        K1Qz6TzqeHXiraOLMYmwsmyZv8jGxGo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-h8Hmn9vlNEeEzl7F2s774w-1; Thu, 11 Feb 2021 18:51:03 -0500
X-MC-Unique: h8Hmn9vlNEeEzl7F2s774w-1
Received: by mail-ej1-f70.google.com with SMTP id bx12so5776828ejc.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Feb 2021 15:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m6jCEXX0+0xKYDDnmIQcWryZ0O00Muz0nXL+by1mPc4=;
        b=dfxyjsEfO60IPlwyvaiByzIMkU1oZIgPVd4iajZaUZdKwC1YxkP5n+HTr2yf39buBl
         sTFML9eFFrGUswgvfgjZr7QM4ojIqAlHdqBlC4L7s2XwAtilHN+5C7pWd2i9DvIju5R5
         iF37Mv64i3BTKbrMkxCYqs0gkFEaRB+08OzoMKjCe6HxYx5iIq/127/5Ut5U4o2i4YH8
         4MFE75UTieAM4DoGDJfxGG1vptdX+DqZUvcqHceY8iW0YjZrfm9uA85Tas0q0m1yoYeg
         eVLFY7XfQ4P/r27ck/Km5qUrnQcTrz4y52DlZLEwGFsOJc8US6VTrKD/qY1lm1Iq97RE
         T78A==
X-Gm-Message-State: AOAM531HNdWUAvtiNS0/9LsLyTV1/G4kld1q8IIzOu1sc4KV9XWcMkH9
        0F3ZdqmY6NCMPtiwDSzEwJtvyjlKBIiisKgthNLqwGfijqAV5+qpQIbBJJrcD0hPiKcwPWmmoQF
        WPrNTc/YWad1L10r8/GVqy6dPbZhvkit+gg==
X-Received: by 2002:a50:e80d:: with SMTP id e13mr568620edn.251.1613087461853;
        Thu, 11 Feb 2021 15:51:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylZWVllSYzRV1wfi12HDbqoC8ARJr+TzMt/IWIKOvRUo45NdOXEthlkmVpzv6eKwiXlMM2DQ==
X-Received: by 2002:a50:e80d:: with SMTP id e13mr568603edn.251.1613087461561;
        Thu, 11 Feb 2021 15:51:01 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k9sm5129068edo.30.2021.02.11.15.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 15:51:01 -0800 (PST)
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: handle HKEY
 0x4012, 0x4013 events
To:     Alexander Kobel <a-kobel@a-kobel.de>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
 <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
 <TY2PR03MB3645D33506D85E1EECD6DABA8C8F9@TY2PR03MB3645.apcprd03.prod.outlook.com>
 <0e85bd26-bf2f-734c-1334-15ad591ec811@redhat.com>
 <499bd1fb-159b-53b0-173e-90167a2d23fa@a-kobel.de>
 <7f40435e-4287-fc67-55d1-52ee41efcbf0@redhat.com>
 <dcd315d6-2aa6-a4ab-6346-d6b2199c2878@a-kobel.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9f1229ab-41d1-440a-5843-6a026bb418fb@redhat.com>
Date:   Fri, 12 Feb 2021 00:51:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <dcd315d6-2aa6-a4ab-6346-d6b2199c2878@a-kobel.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/12/21 12:07 AM, Alexander Kobel wrote:
> Hi Hans,
> 
> and thanks also for the source code review. I will address those valid points once I know whether the patch might be accepted, see below.
> 
> 
> On 2/11/21 5:24 PM, Hans de Goede wrote:
>> Hi Alexander,
>>
>> On 2/10/21 6:51 PM, Alexander Kobel wrote:
>>> <snip>>> Works like a charm.
>>> I realized that the device also emits 0x60c0 (TP_HKEY_EV_TABLET_CHANGED) when the keyboard cover is attached or detached, yet *not* when it's folded. I don't quite get why I nevertheless receive only one notification to userspace according to acpi_listen, despite the fact that the 0x60c0 handler also calls tpacpi_input_send_tabletsw and hotkey_tablet_mode_notify_change. Is there a deduplication behind the scenes?
>>
>> Yes the input subsystem layer will not send events when nothing has changed.
> 
> I see, thanks for the confirmation.
> 
>>> I also realized that intel_vbtn reports the change, too. Would it be in order to modify intel_vbtn in a next step and blacklist this device to avoid duplicates?
>>
>> Hmm, that is a bit of a problem I would prefer to avoid having to deny-list things in intel_vbtn.
> 
> Agreed.
> 
>> So do the 2 behave exactly the same? Also wrt when the kbd is folded behind the kbd. IOW
>> are the 2 SW_TABLET_MODE reports fully in sync in all possible states:
>>
>> 1. Just the tablet
>> 2. Tablet + keyboard attached, keyboard in use
>> 3. Tablet + keyboard attached, keyboard folded away behind tablet 
>>
>> ?
> 
> They are in sync, at least as soon as the state changes and an event is emitted. The only functional difference seems to be that thinkpad_acpi offers the sysfs entry hotkey_tablet_mode to read the current state, that's it.
> This is nice after bootup or for scripts started at random time without the chance of observing state changes. E.g., I'd like to have autorotation triggered via the orientation sensor, but only if the device is in tablet mode; so my autorotation handler would read that sysfs entry as the first thing. If there's no way to read the state, I have to resort to watching the state toggle and cache it for myself in userspace.
> But perhaps intel-vbtn offers a similar interface for that purpose that I don't know?

No, but you can query the switch state with the evtest util.

> I can almost work around that by checking for the existence of the "PRIMAX ThinkPad X1 Tablet Thin Keyboard Gen 2" input. But that's not a nice workaround, and it doesn't detect the folding away (input is still registered, although the firmware doesn't send key presses anymore).
> 
> So, indeed the benefit of my patch is rather minor. If that means it should be discarded, that's fine for me (I learned a lot while writing and refining it, always nice). If someone can give me a hint on how to read intel-vbtn state one-shot, even better, then it'd be mostly obsolete.

I was surprised that your device supports intel-vbtn, there might very well be other X1 tablet generations / models which support GTOP but not intel-vbtn...

> What might be more interesting is the potential handling different attachable devices, such as the portable dock (I guess this is the "Pico Cartridge", since it comes with another battery). For this one, I would actually expect an SW_DOCK event, and via the GTOP queries, this could be detected and distinguished from other attachment options. I assume intel-vbtn can't cover that case out-of-the-box.

Right, that would be another case where having GTOP support would be helpful.

> Unfortunately, I don't have such a dock (yet), so that's just guessing.
> 
> 
> Out of curiosity: is your ThinkPad 10 fully handled by intel-vbtn?


I've the first generation ThinkPad 10 with a Bay Trail SoC. Not only does it not have intel-vbtn support, it also does not have GTOP support.

I just checked and currently thinkpad_acpi does not even load on my ThinkPad 10. It does a "HKEY" device, but with a HID of LEN0168, where as thinkpad_acpi only binds to 
LEN0068 and LEN0268. I could make thinkpad_acpi bind, but it won't do anything useful. I just checked and there is nothing useful in the whole LEN0168 HKEY device.

>>> On the other hand, userspace should expect duplicate messages to some degree and use a hysteresis approach anyway. Every now and then, the contact of the magnetic plug is not established perfectly on the first attempt. So perhaps not really an issue.
>>
>> The only userspace consumer of this which I know is mutter (part of gnome-shell) and it
>> will just take the value from the last event. So if the 2 are always in sync then
>> the event send by the second input-dev will essentially be a no-op since the value will
>> be the same as the other event.
> 
> Well, naturally another consumer is the acpi framework, e.g., acpi_listen or acpid. There, we have the possibility to install user-defined handlers. The same holds for window manager handlers such as sway's bindswitch tablet:{on,off,toggle} or, I presume, xbindkeys.
> 
> IMHO all reasonable handlers are idempotent, but users can be arbitrarily crazy. As mentioned, even if events are emitted exactly once on the software side, non-idempotent behavior will still occasionally be buggy, because the hardware connection is dodgy at times.
> 
>> We do need to resolve the question of how to handle this before I can merge the patch,
>> atm I think that just having it reported twice is fine (as long as both reports are in
>> sync).
> 
> They are in sync, that much I can confirm. But as mentioned, if you refrain from integrating the patch, I'm fine with that.
> In that case, we should probably just add a dummy handler for HKEYs 0x4012 and 0x4013 with comments towards intel-vbtn, to avoid the unknown HKEY warning cluttering the system log.

Hmm, I'm honestly not sure what to do here...

I guess we can always grab your patch from the archives if it turns out to be useful on another device.

And until then a dummy handler indeed is probably best.

Can you do a v2 of your original patch with:

1. A comment about SW_TABLET_MODE being handled by intel-vbtn
2. In that comment also put a link to this mailinglist discussion:
https://lore.kernel.org/platform-driver-x86/38cb8265-1e30-d547-9e12-b4ae290be737@a-kobel.de/

Regards,

Hans

