Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA5DC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:05:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51ADF207BC
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbhADOF1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 09:05:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40375 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726612AbhADOF0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 09:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609769039;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LQaJPfZS9IN8prAInhDkGxmNfkRtYb3fsvM3sk6h598=;
        b=eknw3H1vtQ/NDq6vTSjwSTflpXWhZiagdd9tB9jC/vNbklpoDtBgplKTGsG+QIm+bcrGMc
        Y+7xqKCq3BP6Y3PcwYcZZR1WyyCm0tO0M2Og1E4Q6yteol5GzOTUJCxfR7Bf1SsRZwZYG4
        xIItJu/d4UWW0gf2m5XylKw9WtPqhwQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-ebyw-XxJMJyUUxxyf86EQg-1; Mon, 04 Jan 2021 09:03:57 -0500
X-MC-Unique: ebyw-XxJMJyUUxxyf86EQg-1
Received: by mail-ej1-f71.google.com with SMTP id d19so7052001ejo.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 06:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LQaJPfZS9IN8prAInhDkGxmNfkRtYb3fsvM3sk6h598=;
        b=oLoejSBdwe6STFtmPnPs6tpBaNBJ7CMgdXQTcjgctvZ1tyst+CtH/YVGV3UKy2JTFU
         FGPfesIzmwP/FCbvxyLp+igPD/pITzfJQqMl9zODIohwsNFaCvwRsOiv6yAijh/ULfdu
         WaBjf3oSQz8BnntjkByB87n5k9onGiW9SoQsx4S9eISg/kfZA3wQUijOcoLFA7fDYYOZ
         bhiTG7N9K2B+jHtod/GhIoRxW108dBHWfCNUtNtTs4cnCXXGkb79eCz34sK161F3URwp
         NoRkXhpGf/WLfuucS56bG2gWZI8INOkVy65h64ADeHPpWt1MuLlBqimEDNgRCC4eKJ36
         BGJg==
X-Gm-Message-State: AOAM530roIsNL37GgWHYovjzsW72YGJ3WYUfRQcHAQsgpFL/r98ICYm+
        4fCBk/BG5oTQIkjoqeGhQLKzw4sJBkI0iOtNXr87rbUV4ehZzKkyu4Dyvpjw0ttU9nfhykRwkCO
        Jv6Ca0vVOiIhrQMrlFu8GXj/1h06Yo24rEQ==
X-Received: by 2002:aa7:c58a:: with SMTP id g10mr70097214edq.315.1609769035611;
        Mon, 04 Jan 2021 06:03:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPekFWfhsBMgkYgJPAnbn5o8ZyHSTRvbX77ON1dbclQllpjZ7UB6efzcyuP2vzmwipcjck8w==
X-Received: by 2002:aa7:c58a:: with SMTP id g10mr70097191edq.315.1609769035396;
        Mon, 04 Jan 2021 06:03:55 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id p12sm23445779ejc.116.2021.01.04.06.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 06:03:54 -0800 (PST)
Subject: Re: [PATCH 00/24] platform/x86: ideapad-laptop: cleanup, keyboard
 backlight and "always on USB charging" control support, reenable touchpad
 control
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
 <YGRDwoO_mZPu_JF1FiT-FpjTx11PTttBt1TuVvH9e7lLxLsv6f0EkQZI6u_GtLGUOQzQPQTZwsYD0Rse7TiUEQiBCio2oVzXiG-OETPf9mA=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fa684b4c-4f0e-ec0e-4522-cffb2bba106f@redhat.com>
Date:   Mon, 4 Jan 2021 15:03:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YGRDwoO_mZPu_JF1FiT-FpjTx11PTttBt1TuVvH9e7lLxLsv6f0EkQZI6u_GtLGUOQzQPQTZwsYD0Rse7TiUEQiBCio2oVzXiG-OETPf9mA=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Barnabás,

On 1/4/21 1:03 PM, Barnabás Pőcze wrote:
> 2020. december 16., szerda 2:39 keltezéssel, Barnabás Pőcze írta:
> 
>> This series contains patches that aim to bring more consistency
>> to the code; add keyboard backlight control support; add
>> "always on USB charging" control support.
>> Furthermore, commit 7f363145992cebf4ea760447f1cfdf6f81459683 is reverted
>> since it made it impossible to disable/enable the touchpad via the
>> ideapad-laptop module and on some devices the method implemented in the
>> module works correctly to disable/enable the touchpad.
>>
>> Barnabás Pőcze (24):
>> platform/x86: ideapad-laptop: remove unnecessary dev_set_drvdata()
>> call
>> platform/x86: ideapad-laptop: use appropriately typed variable to
>> store the return value of ACPI methods
>> platform/x86: ideapad-laptop: sort includes lexicographically
>> platform/x86: ideapad-laptop: use sysfs_emit()
>> platform/x86: ideapad-laptop: use for_each_set_bit() helper to
>> simplify event processing
>> platform/x86: ideapad-laptop: use msecs_to_jiffies() helper instead of
>> hand-crafted formula
>> platform/x86: ideapad-laptop: use dev_{err,warn} or appropriate
>> variant to display log messages
>> platform/x86: ideapad-laptop: convert ACPI helpers to return -EIO in
>> case of failure
>> platform/x86: ideapad-laptop: always propagate error codes from device
>> attributes' show() callback
>> platform/x86: ideapad-laptop: misc. device attribute changes
>> platform/x86: ideapad-laptop: group and separate (un)related constants
>> into enums
>> platform/x86: ideapad-laptop: rework and create new ACPI helpers
>> platform/x86: ideapad-laptop: rework is_visible() logic
>> platform/x86: ideapad-laptop: check for Fn-lock support in HALS
>> platform/x86: ideapad-laptop: check for touchpad support in _CFG
>> platform/x86: ideapad-laptop: change 'status' debugfs file format
>> platform/x86: ideapad-laptop: change 'cfg' debugfs file format
>> Revert "platform/x86: ideapad-laptop: Switch touchpad attribute to be
>> RO"
>> platform/x86: ideapad-laptop: fix checkpatch warnings, more consistent
>> style
>> platform/x86: ideapad-laptop: send notification about touchpad state
>> change to sysfs
>> platform/x86: ideapad-laptop: add keyboard backlight control support
>> platform/x86: ideapad-laptop: add "always on USB charging" control
>> support
>> Documentation/ABI: sysfs-platform-ideapad-laptop: update device
>> attribute paths
>> Documentation/ABI: sysfs-platform-ideapad-laptop: conservation_mode
>> and usb_charging
>>
>> .../ABI/testing/sysfs-platform-ideapad-laptop | 26 +-
>> drivers/platform/x86/ideapad-laptop.c | 1047 +++++++++++------
>> 2 files changed, 692 insertions(+), 381 deletions(-)
>>
>> ---
>>
>> 2.29.2
> 
> A patch in the series a serious flaw which I have just noticed;
> I will send a new version when the situation about a conflicting
> patch[1] becomes clear.
> 
> [1]: https://www.spinics.net/lists/platform-driver-x86/msg24007.html

Thank you for the headsup, I will try to make some time to review v1
of this series, so that you can take any review-remarks which I might
have into account when posting v2 (or add my reviewed-by for patches
for which I have no remark).

May I ask which patch is flawed and what the flaw is ? Then I can skip
that while reviewing. I hope to get around to reviewing v1 (this version)
of this series this Wednesday (but no promises).

Regards,

Hans

