Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F581C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 11:23:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69143611BF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 11:23:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350144AbhESLY5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 07:24:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36450 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347682AbhESLYe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 07:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621423394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bKAEh1z/d5nDiV4o1C6pzw2U33MXtuo+4PcFDKB1npc=;
        b=c0Yci4Gi8mswHVh3aSNcjuZ0K2t+J7KXEzKA44EMENgohEIO3xBa40kADewBKpnocygtow
        uCD0St/E28t5i2y7vbKJZ4tdPGV0CHCuMHUFaw+bt8HdExqWEr5TBHyVDMY5fIaTEqTDjP
        t4mYQmBD1UnfJO96UDZ3N0p4/sZpjEM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-4Wf8NTUmNiq_U7XEWQM9hA-1; Wed, 19 May 2021 07:23:12 -0400
X-MC-Unique: 4Wf8NTUmNiq_U7XEWQM9hA-1
Received: by mail-ej1-f72.google.com with SMTP id 16-20020a1709063010b029037417ca2d43so3573424ejz.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 04:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bKAEh1z/d5nDiV4o1C6pzw2U33MXtuo+4PcFDKB1npc=;
        b=q6vjfDh9ZkDgLU0xuMqYMdpyVnlKuGClo1V62RfBmq5ifeAfb9iY7iZx574W1rGBWn
         nADgizHKzu7ELl95li+o8z4emzDDML0MIJWXG+dtRdJAEv1qwMoWq1kjaAXkZongIibm
         jFQTRekOyuMsMpffqhgiIv7r+FJ21AlzvN3PvMiMx06pIIe10XYVijPGT7RCKFhURwl6
         Jad6nalFI0nAI0Q+Q11SOQ90KM2eijzV8hOMiTTCsXJp4gqlssaEi9i8YDWeoGDGSiFr
         Gu2X5UeWtsmx8kgF3vbQfMCgOVaZeUOcjMp32CWcwKqoj1y/6tYYpK4sGdXqwZvXdyK8
         TU7w==
X-Gm-Message-State: AOAM533ZkpukrVDcRHAicyruV0q28uohediYFz6hTIe3+7H2dunvsSuh
        25YXbUMtQ42c2FBW2mn/GbHzzxuFbG70aZgf2uwgH32Mio8DYVqGV8XPSz84y/MZrIUjNY0L1e2
        EpBEhwYnnJEAkqo+WbsMN4pIO4LkL0YfXCg==
X-Received: by 2002:a17:906:4c54:: with SMTP id d20mr12249819ejw.513.1621423391241;
        Wed, 19 May 2021 04:23:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAi8o1sKevYe1sIY7/X8jq2Iq3OcSUFcAZep5m3xnlVBab6lPvM+v5zy672zJHynsNx4Rgrw==
X-Received: by 2002:a17:906:4c54:: with SMTP id d20mr12249805ejw.513.1621423391006;
        Wed, 19 May 2021 04:23:11 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v12sm16226265edb.81.2021.05.19.04.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 04:23:10 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: acer-wmi: Add support for Acer Helios 300
 RGB keyboard backlight
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jafar Akhondali <jafar.akhoondali@gmail.com>, jlee@suse.com,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <CAMW3L+24ZGowtpURUbjoCoA+eZMF0wDae1izxS+HM2uz1L9Rig@mail.gmail.com>
 <9e455325-d9d6-557d-e9a5-779f59e2af4c@redhat.com> <20210519085429.GA2025@bug>
 <e933a326-830c-4df8-eeb0-f8e48a4b9627@redhat.com>
 <20210519110542.GA24621@duo.ucw.cz>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ae8c476a-25dc-758d-7031-c5030b975bb4@redhat.com>
Date:   Wed, 19 May 2021 13:23:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519110542.GA24621@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/19/21 1:05 PM, Pavel Machek wrote:
> Hi!
>>>>> The Acer helios 300 provides gaming functions WMI that is available in
>>>>> Windows, however this was not implemented in Linux. The process of finding
>>>>> the related method was done by decompiling PredatorSense(official Acer
>>>>> gaming functions software for Predator series) and decompiling WQ
>>>>> buffers. This patch provides a gaming interface which will then expose a
>>>>> character device named "acer-gkbbl". This character device accepts 16
>>>>> bytes long config, which is specific for the backlight method. The
>>>>> meaning of each bytes ordered by bit position is as follows:
>>>>>
>>>>> Bit 0 -> Backlight modes:
>>>>> 1: Breath
>>>>> 2: Neon
>>>>> 3: Wave
>>>>> 4: Shifting
>>>>> 5: Zoom
>>>>> Bit 1 -> Animation Speed: from 1 to 9 ( 1 is slowest, 9 is fastest)
>>>>> Bit 2 -> Brightness from 0 to 100 ( 0 is no backlight, 100 is brightest)
>>>>> Bit 3 -> Unknown. Wave effect uses 8, other modes must use 0
>>>>> Bit 4 -> Animation Direction:
>>>>> 1: Right-to-Left
>>>>> 2: Left-to-Right
>>>>> Bit 5 -> Red Color Selection
>>>>> Bit 6 -> Green Color Selection
>>>>> Bit 7 -> Blue Color Selection
>>>>> Bit 8 -> Currently unknown, or not used in known model
>>>>> Bit 9 -> Currently unknown, or not used in known model
>>>>> Bit 10 -> Currently unknown, or not used in known model
>>>>> Bit 11 -> Currently unknown, or not used in known model
>>>>> Bit 12 -> Currently unknown, or not used in known model
>>>>> Bit 13 -> Currently unknown, or not used in known model
>>>>> Bit 14 -> Currently unknown, or not used in known model
>>>>> Bit 15 -> Currently unknown, or not used in known model
>>>>>
>>>>> Filling this config is out of scope for the kernel module, and this module
>>>>> only acts as an interface.
>>>>>
>>>>> Currently, I'm not sure with the method for communicating with user-space,
>>>>> but since leds.h subsystem wouldn't fit for complex actions such as this
>>>>> complex config, I couldn't find any better method than char dev.
>>>>
>>>> Thank you for your patch, given that there is no existing kernel
>>>> interface which is a good match for the features exported by this
>>>> keyboard I'm fine with just having a raw interface where userspace
>>>> writes GAMING_KBBL_CONFIG_LEN bytes as you suggest.
>>>
>>> Keyboard backlight goes through LED interface (so please cc the mailing list) and
>>> no, passing raw bytes to hardware is not an acceptable interface.
>>>
>>>> But lets not use a classdev + chardev for this please, you can
>>>> just add a binary write-only sysfs-atrribute under the wmi-dev for
>>>> this with a name like (for example) gaming_kbd_backlight_config
>>>> and then userspace can write to that without needing a class + char
>>>> dev just for this single write.
>>>
>>> NAK. We have existing interfaces for this.
>>
>> I don't think we have existing interfaces for things like wave / zoom /
>> neon effects.  I guess this could use the new CONFIG_LEDS_CLASS_MULTICOLOR
>> API to set the color + overall brightness, combined with a custom sysfs attribute
>> under the led_classdev's device's dir for selecting the things for which there
>> is no standard API ?
> 
> We do have RGB LEDs, and some of them can do hardware-accelerated
> effects. We do have pattern trigger.
> 
> We do have other hardware (Mauro is just trying to merge support) that
> has limited set of effects.

Can you provide a link to the patches from Mauro, those might be
helpful for Jafar to take a look at to get some idea how he can
implement this using the LED API.

Regards,

Hans

