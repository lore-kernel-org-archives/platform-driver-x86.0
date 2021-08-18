Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933B5C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 15:31:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 666F560187
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 15:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239819AbhHRPbi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 11:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23052 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239585AbhHRPbi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 11:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629300663;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h/owzJ9OdIFmjMuhB2v6yqkUl6El3RbbrYd2ICWJXDs=;
        b=QnclFL/aO+5ZSqK9nv00DHrKFcvICMyuE3vWPqxYyPHXP63CxcuJL8mMQvTBD0ngXgT8tm
        ZdbcGMN2VldDCAh69G1IqVC6krpYjkHD8xuO4eU866pbyB8XXUgpuJBiMF6Tg/ehC0DoUk
        BiTYWQzDKTDP7J01GPc1Sml7R+vtnN0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-LinSIQ0CM665zYQ-hAtvag-1; Wed, 18 Aug 2021 11:30:27 -0400
X-MC-Unique: LinSIQ0CM665zYQ-hAtvag-1
Received: by mail-ej1-f70.google.com with SMTP id h7-20020a17090619c700b005bc3c7dead9so1014010ejd.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 08:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h/owzJ9OdIFmjMuhB2v6yqkUl6El3RbbrYd2ICWJXDs=;
        b=rQZnSYj+8vBnPwdktpkReXRxitFqCl4+dRDb4jvMGZJo7r5z0vZu9beIXL1v4PCAJQ
         7AN4iinBgIHGsWaBNcdpzT337j29Y17ZoV9eOqMCUP9hy4OL76cruVyP3CuF2AY6EFtG
         3mh5uzjyATOr5PDb0vVYdOYc+UUisGA/zFmmg4HmVCFwe6Z78C1SqzWnzGM981F4QCoF
         bcYGaHqdYUrPlLUDiZpAfunImi4GEDpC08DzkEGDCSSEQJeE3fDtqVq/UmE6+BK3HqLL
         sLNwOt19bDedjDDIlLkSgfTwTZGqtLuvnP5WhUDBttm8czNrIpsscbXn9PTHOwykK+3n
         EzIQ==
X-Gm-Message-State: AOAM531W+c1yMe5j4l7hmZqusgwtZG+gmnh7PCaKOm2Aemhb6P+C8GfT
        2c2mfq0bK79NKez6bafAUx6jNhhP8xAijVS6RsUZRw5pArhyM3fULdEkPa1M2tKTDhA7h52zhxj
        n2GHDW6/AUrOlU6P23pkdweKbCNPs/29i+c955vL8VOVXzuEZXK4rLpLRfW+luL+H2jbYiXm1Zk
        Brtcc3SJdXaQ==
X-Received: by 2002:a17:906:c316:: with SMTP id s22mr10510648ejz.39.1629300622640;
        Wed, 18 Aug 2021 08:30:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR1vdkW3yBfrlvyMbpvk3mDP2EP2aFqfWJTvmBLQ8z/ggdBh77AQjJYuJghESJuCJq7rEMbA==
X-Received: by 2002:a17:906:c316:: with SMTP id s22mr10510621ejz.39.1629300622385;
        Wed, 18 Aug 2021 08:30:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n13sm26850ejk.97.2021.08.18.08.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 08:30:22 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: lg-laptop: Support for battery charge limit
 on newer models
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Matan Ziv-Av <matan@svgalib.org>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <9338b0b1-e76e-68f5-36de-a642745ba6ad@svgalib.org>
 <7d2ea9fc-6942-d7c9-c6cf-61072dc13ba9@redhat.com>
 <d8f5fb50-68d5-b331-3a56-e638e423d269@svgalib.org>
 <JC7il3WRp7mOUsysl5Ovyvp8xpmqQJ_HpkO0DSIRoJUi7yN3MLcAfsl-5I10D2X1O4kc9foQKsIFuUuMIk8RuwoOmqgKEU_TpzjDc82wQoY=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c82478f9-980a-c49d-9975-d977fe63c44d@redhat.com>
Date:   Wed, 18 Aug 2021 17:30:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <JC7il3WRp7mOUsysl5Ovyvp8xpmqQJ_HpkO0DSIRoJUi7yN3MLcAfsl-5I10D2X1O4kc9foQKsIFuUuMIk8RuwoOmqgKEU_TpzjDc82wQoY=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/18/21 5:01 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. augusztus 18., szerda 15:36 keltezéssel, Matan Ziv-Av írta:
>> [...]
>>> If this hotkey changes the kbd-backlight level "in hardware"
>>> then it should not send a key-press instead you should specify
>>>
>>> led_classdev.flags = LED_BRIGHT_HW_CHANGED
>>>
>>> For the kbd-backlight led_classdev and then call:
>>>
>>> 	led_classdev_notify_brightness_hw_changed(&kbd_backlight, new_backlight_level);
>>>
>>> When receiving the event. upower will pick the event send by this up
>>> and then notify interested parties such as e.g. gnome-settings-daemon
>>> which will then show a nice OSD with the new backlight level similar
>>> to how it is done for e.g. volume controls.
>>>
>>>
>>> If you can also send patches to change these 2 things, so that lg-laptop
>>> conforms with the standard userspace APIs used for this that would be great.
>>
>> I sent patches for this (in a separate thread). But in my testing, this
>> does not happen automatically and I did not find yet how to configure
>> udev/upower/kde to display this notification.
>>
> 
> You can check the events by running something like:
> 
>   dbus-monitor --system "type='signal',interface='org.freedesktop.UPower.KbdBacklight',member='BrightnessChanged'"

Right, one important remark though, for some reason when the brightness_hw_changed
API was added to the LED subsystem it was decided to make this a Kconfig
option, so in order for this to work you must also make sure to have:

CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

in your .config .

Regards,

Hans

