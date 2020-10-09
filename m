Return-Path: <SRS0=ZlNf=DQ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C46C433DF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 09:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B82B22258
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Oct 2020 09:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iuJB+po/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgJIJkg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Oct 2020 05:40:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24184 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725900AbgJIJkf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Oct 2020 05:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602236433;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dj92Edw7u8W0cOHXcy/38tC08/v+6NZs0gdPN73kCUg=;
        b=iuJB+po/9zu+9dP95wFXh+0XIGQltjwNxjdHy4cIFUECkX41tymy86c6GJktWVbGWB47v9
        y7ywhv7Ys8VYcKOXytOU8l7EWeiIFD+9h9FpYl6fr82G5eC+6Sjj0/4epoeZv0R8Rvmrlq
        YYAkGU/S5bhcUiYRXVThW8Jls4L6X5I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-B--7UF6-N8m9XDdMx9arKA-1; Fri, 09 Oct 2020 05:40:32 -0400
X-MC-Unique: B--7UF6-N8m9XDdMx9arKA-1
Received: by mail-ed1-f71.google.com with SMTP id i22so3384613edu.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Oct 2020 02:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dj92Edw7u8W0cOHXcy/38tC08/v+6NZs0gdPN73kCUg=;
        b=WZ1KExo0rutw6fgqwVuUuGQloYHKmdVZotLLOpC+KZ7MRph1e1wFIQL9selrIt/Rbg
         jPxYVd/CcJwPj4Pjns7pHyf4OpcJfM6HlJ+eMGDjRfldOesmI3HQ872liYcc0EI3bBwv
         QeEBnFeb+qXKxrBwUMc2IwfzOMvJ/KqREXryZXAq0QLGOOMsCNTvXB9ow2rdNWO1CFE2
         AGgvMhqBJSQah18cmwE7iAMxue+DsdbvXD/rAUu0eqpwNoiEEWiIIQ46DGZKtfJBzmvh
         Ytgwk4vVJXAZUYxiFykHjXzICkC6+X5zPTXS+YCxlrnShau8i7cXRJ5Moe4fHEP1QG2v
         Ljbg==
X-Gm-Message-State: AOAM532VHECuC5GP0FT0L0guRuLxJUL+TnTy8kB+OyI26jD5VBlzVI5e
        b2spNCZtH9er7FT3peQw6I8cFkoc/G0dNRg819Bdkc4Wvb0pi7G6Ak910BYBy1iPMrcja3tQGxz
        LsWCgMbZUWsxdwO1Q1RoO1fXkde19yku3fQ==
X-Received: by 2002:a17:907:429f:: with SMTP id ny23mr12989556ejb.150.1602236430618;
        Fri, 09 Oct 2020 02:40:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySdu2xGsuTXFcfphW/krgwJUe+12BCDKugB/3FGsU92fLgeaH0rUdDYCfdOpUnuxcdhUEvig==
X-Received: by 2002:a17:907:429f:: with SMTP id ny23mr12989541ejb.150.1602236430383;
        Fri, 09 Oct 2020 02:40:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a27sm6246959ejb.67.2020.10.09.02.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 02:40:29 -0700 (PDT)
Subject: Re: [ PATCH v2 1/1] dell smbios driver : Consider Alienware a valid
 OEM String
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Cc:     Gerardo Esteban Malazdrewicz <gerardo@malazdrewicz.com.ar>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <b415a7bf2e98e734cc78579159e5c88fd5cd30df.camel@malazdrewicz.com.ar>
 <768985a8-7e6e-c91a-705b-2537047d0bdf@redhat.com>
 <20201007143317.bp5lsaa75ls5lhm3@pali>
 <DM6PR19MB2636BAADCEAD0840771BF424FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <45e82b6dabb591de630ac0e91a3ebb7937245fb1.camel@malazdrewicz.com.ar>
 <DM6PR19MB26363563F46E95E50AD28854FA0A0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <db8e8945-065c-ee3b-fd45-1f500982a9f3@redhat.com>
 <6ff262dee7187939a3392005b121ceec424ab6d3.camel@malazdrewicz.com.ar>
 <20201009082658.mzzfqltg7xijm6fp@pali>
 <209751e0-159c-9d10-91de-d77435e17c4a@redhat.com>
 <20201009092431.r6vovkaiukx7va6j@pali>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bfb4d032-052b-4eea-1eed-c327744848e7@redhat.com>
Date:   Fri, 9 Oct 2020 11:40:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009092431.r6vovkaiukx7va6j@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/9/20 11:24 AM, Pali Rohár wrote:
> On Friday 09 October 2020 11:14:33 Hans de Goede wrote:
>> Hi,
>>
>> On 10/9/20 10:26 AM, Pali Rohár wrote:
>>> On Friday 09 October 2020 02:33:49 Gerardo Esteban Malazdrewicz wrote:
>>>> dell-laptop doesn't even load as is ('No such device')
>>>>
>>>> However, adding an entry in dell_device_table, based on dmidecode
>>>> output (Vendor: Alienware, Type: 10), allows it to load.
>>>>
>>>> But I don't know how to test for any of this additional functionality.
>>>>
>>>> What should I look for?
>>>
>>> Hello! dell-laptop driver provides following features:
>>>
>>> * rfkill interface for enabling/disabling wifi and bluetooth
>>>     - check presence of "*dell*" by /sbin/rfkill utility
>>>
>>> * backlight interface for controlling display brightness
>>>     - check presence of "dell_backlight" in /sys/class/backlight/
>>>
>>> * touchpad led (if your touchpad has some led)
>>>     - check presence of "dell-laptop::touchpad" in /sys/class/leds
>>>
>>> * configuring keyboard backlight
>>>     - check presence of "dell::kbd_backlight" in /sys/class/leds
>>>
>>> * led for microphone mute
>>>     - check presence of "platform::micmute" in /sys/class/leds
>>
>> Thanks Pali, that is a great answer.
> ...
>> Pali, can you perhaps make a similar feature list for
>> the dell-wmi driver ?
> 
> dell-wmi is just listener for events delivered by WMI interface. All
> events are currently delivered only via input device to userspace as
> most of the events are key pressed or other similar events which maps to
> input device. Looking at the code, there is one exception about event
> KEY_KBDILLUMTOGGLE which is delivered to dell-laptop driver to notify it
> when dell firmware itself decided to change keyboard backlight level.
> 
> ...
>> Note that the dell-wmi driver also depends on the
>> dell-smbios-base module, so you should also check if the
>> dell-wmi driver offers any additional functionality
>> on your laptop (if it does then that would also be a reason
>> to move forward with your dell-smbios-base patch).
> 
> For two Dell laptops (Dell Inspiron M5110 and Dell Vostro V131) it is
> needed to call special SMBIOS function to enable receiving those WMI
> events. Therefore dell-wmi checks via DMI table if that special call is
> required then use dell-smbios-base module to issue needed call.
> 
> So theoretically if some key press events are not delivered on
> particular dell laptop, it is a good idea to add it on that
> dell_wmi_smbios_list, special SMBIOS call would be issued and check if
> something is changed... But for now we know only 2 laptops which
> required it (or better only 2 people complained that not all key press
> events are delivered and verified that special SMBIOS call was
> required).

Right, so Gerardo, I guess the laptop keyboard will have
some special hotkeys (possibly in combination with the "Fn")
keys as shortcuts for various things.

It would be good if you can verify that all those hotkeys
generate events.

What you can do is run "sudo evemu-record" and then select e.g.
first the "AT Translated Set 2 keyboard" device and see which
(special hotkey) keys generate events there. Then strike those
of the list to check and next check the "Dell WMI hotkeys"
device and see if any hotkeys report events there.

Note the display brightness up/down hotkeys might very well be
delivered through the "Video Bus" event. More in general you may
have some other input devices which deal with some of the hotkeys.

Regards,

Hans

