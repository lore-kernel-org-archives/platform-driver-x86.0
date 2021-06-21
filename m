Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C993C4743C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 19:43:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25B6A6128C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 19:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhFUTp5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Jun 2021 15:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27870 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230222AbhFUTp4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Jun 2021 15:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624304621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rJ/UUtT2MczpruDqZre/gMP7nXOcZ+xrSxwnX+4iCXU=;
        b=S3mFiQWs3Wd01rnKscCCIUxBKrwxN4TpICWWW+L1dxGhCtLysqgodQd3nP8v1lrYCNVfyC
        /y72sj7XXULYiMjleNXWEsTuxezKrT5ELz/y1pO8G2IRcodt2ZlAHCzTIFKLSvasFIrXGz
        pF/2nfzIVykEVawmf2JQ+7HcADX5sDM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-ECDo60YsPfCq0_O8dioMHg-1; Mon, 21 Jun 2021 15:43:40 -0400
X-MC-Unique: ECDo60YsPfCq0_O8dioMHg-1
Received: by mail-ed1-f71.google.com with SMTP id z5-20020a05640235c5b0290393974bcf7eso8302043edc.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Jun 2021 12:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rJ/UUtT2MczpruDqZre/gMP7nXOcZ+xrSxwnX+4iCXU=;
        b=UE2mEfThxMa/xo0vgQfvhbldG2AC8+xgbtDSIFiWindg6KEK27kdWUoDk6fjYjMIEa
         eX7heslAzUG0frBZTbSMMbd+yJcZXxBFYQFsnKmAeoQfI0+pbrm9nad+sHTbaukcR4Ji
         A9lR8dtfpLocoYCB3mqlJxcyqSPvPGaVQfcyjyyi8MBC9npv4FMaERaFfNQrYaBIkAvG
         s/PJdotJ5NjgVOVwYghAZIdsGzI7b7NoRc8AYI1fIJLu3TrBbcEakpT5KSzcJSu97rar
         HV+JYpdDwcTk1uL+rdoIW+U4iwhWn7Hz98lY6VJiSx994hwnep6uj0PPrKj1x8TWoQMq
         fL2g==
X-Gm-Message-State: AOAM5313KF6JE4d6GY27dpgNcMFFwAxnMRTfr3aZnQGMACEEdg145IkS
        z4n1VYUJDjczRDxe4jfZ3Ui/hHLBdcMD0JaLsevRuUjahx+hVORsx18w+T+8kRvCSVO0qw4nbbi
        GyZspGp7m+k6S+dP9cKxM2d8xLcmhdVYPMw==
X-Received: by 2002:a17:906:7742:: with SMTP id o2mr27093300ejn.284.1624304619250;
        Mon, 21 Jun 2021 12:43:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQCAyZfEUAe+0uTSO2ffkLZDMmZOwNj3mRQ1gxJITzFrovhJSJ63M8Flq3OUw0CTP9OJlrKQ==
X-Received: by 2002:a17:906:7742:: with SMTP id o2mr27093290ejn.284.1624304619081;
        Mon, 21 Jun 2021 12:43:39 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ck2sm2373233edb.72.2021.06.21.12.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 12:43:38 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: add support for Acer Predator LEDs
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        leo60228 <leo@60228.dev>, platform-driver-x86@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-input@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <20210616005147.26212-1-leo@60228.dev>
 <87e6f17f-3d82-ac63-b5eb-e7f3205f59e8@metux.net>
 <ae4e7db3-ffc5-b8f3-c08c-bba6882d44ad@60228.dev>
 <62d2de8d-e539-5b4f-447a-5e6116844992@metux.net>
 <0148a2e3-c91e-7422-df3d-6942c38334ed@redhat.com>
 <436b87c1-5c24-05ce-98fd-c3664c7765e2@metux.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5661323e-9a75-cbbe-0e16-777355bba9f5@redhat.com>
Date:   Mon, 21 Jun 2021 21:43:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <436b87c1-5c24-05ce-98fd-c3664c7765e2@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/21/21 9:23 PM, Enrico Weigelt, metux IT consult wrote:
> On 16.06.21 19:50, Hans de Goede wrote:
> 
> Hi,
> 
>>> hmm, keyboard backlight ... don't we already have something for that
>>> in input subsys ? I believe that some lone LEDs aren't the right subsys
>>> for those stuff.
>>
>> Actually the standardized userspace API for exporting keyboard backlights
>> is using the LED class sysfs API, e.g.:
>>
>> cat /sys/class/leds/tpacpi\:\:kbd_backlight/brightnes
> 
> Sounds like we don't have an API for that particular case at all.
> Everbody just exposes LED class devices and userland always needs
> hardware specific code to practically use it.

The LED API actually has specific features which are typically
only used with kbd-backlights, such as the brightness_hw_changed
attribute which was specifically added to allow userspace to
monitor when a laptops embedded controller changes the kbd-backlight
brightness in response to a Fn + somekey hotkey keypress, so that
userspace can show an on-screen-display notification that the
kbd brightness has changed (like how it typically does for
audio volume changes too) and also showing the new brightness
level. See: Documentation/ABI/testing/sysfs-class-led for
the docs for the /sys/class/leds/<led>/brightness_hw_changed

So yes this very much is the standardized API for dealing with
kbd-backlights and has been so far years.

> We should at least have some standard mechanism for get least getting
> the connection between an input device and it's backlight device(s).
> 
>> And the same for Dell and other kbd backlights, also the upower
>> daemon even has code for dealing with kbd-backlights:
>> https://gitlab.freedesktop.org/upower/upower/-/blob/master/src/up-kbd-backlight.c
>> exporting them over its dbus API so that non-root users can
>> control them.
> 
> Looks like a very complicated way to do that. But actually I've never
> understood why I should use this strange upower thing anways :p

Just because you don't have a use for it does not mean that it
is not useful (and widely used) in cases where people use Linux
as a desktop OS, rather then for more embedded cases.

>> Basically using the LED class for kbd-backlight functionality
>> basically is the defacto standard under Linux, so exposing this
>> through the LED class is definitely the right thing to do.
> 
> In general, LED class isn't so bad, as it already gives us LED control
> (*1), but I don't see any portable way for finding the corresponding
> LED for some input device. In DRM I see the backlight as subdevice.

With USB-HID keyboards the LED class device will have the same HID-device
as parent as the input device. If there is no HID parent-device, then any
foo_kbd_backlight device will belong to the atkbd (PS/2) input-device.

Regards,

Hans

