Return-Path: <SRS0=1Jx7=C6=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDC6C43464
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 07:48:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8679E20809
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Sep 2020 07:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E6QP8axm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgIUHsE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Sep 2020 03:48:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38804 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726236AbgIUHsD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Sep 2020 03:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600674481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eTQla1wWc2DuKAFbAWEO7bH25cFe4XfCFRxO9yvvPGc=;
        b=E6QP8axmyZmcUlLYLYttAoCXedtH8XHZ1qU7jdD/O+jMCWoMh4yzPSwzSSmNFVtxO1qLbo
        jCeC3qLxzuykUXOsPqYpCVBKUFP/jE3EO6FIfb62ZRMhKMO6LYjaZea6/S12Xq94YDqNQW
        reryVA2wozm+wEGXOKzm4iMEnQ/Fjt0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-36fMkBb4NI-lKL3E-G1pNA-1; Mon, 21 Sep 2020 03:47:59 -0400
X-MC-Unique: 36fMkBb4NI-lKL3E-G1pNA-1
Received: by mail-ej1-f72.google.com with SMTP id f17so4549817ejq.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2020 00:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eTQla1wWc2DuKAFbAWEO7bH25cFe4XfCFRxO9yvvPGc=;
        b=SE/xRgM3EarjiF94ub6PXGSYRy6DLKAqhEt9Sj7z7ZXZTlRTOslLisLDPIGOLKMWbC
         ExGeaEJRpEcxSx1bNIXzkiuiScywnh94URywG+wnhXyII1sKj9dD4cQePjFBL0Igl7Ln
         GZkX9VH//bk/7fSc9TyGMzCXoEUwgBLK/20ocs70u8UZFj8HEHjtV6mx8oAxpU1HfxF4
         21J0Qsnicfau2xuGHGRMGN1Oio9Zwwu6jFD8lazW5C068sYT9k9erCmwrgyABM3ZynFr
         UN9DlozIJDyJemRjIf7giNL+B4Dw2oUlw2XETGIobc0fzkubhnCQ/pQkQGRNZDMWcSvZ
         J/6w==
X-Gm-Message-State: AOAM530X11zIDZ2sBt9yml9HlKG1duvHaonyBZilFuzRgwq4EBdImFdJ
        RXJxhwC3VJb0RymkjF4gI8mngVjHdLCEPGxOM+28QMCXqenlNfZsCLGRWdDBATVXKVG02iGTvgP
        +ZiGz/0EnWQRodQXMrXlTUsQv+bG1DieUHQ==
X-Received: by 2002:aa7:c387:: with SMTP id k7mr49833614edq.242.1600674477869;
        Mon, 21 Sep 2020 00:47:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySRYmf1cRjKRvs+uG95SsitJlwdKhXg834ItlFxclbEGgFf4ZeJeQWVzA2garDcUr/Lid0yA==
X-Received: by 2002:aa7:c387:: with SMTP id k7mr49833604edq.242.1600674477583;
        Mon, 21 Sep 2020 00:47:57 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f4sm7893292edm.76.2020.09.21.00.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 00:47:56 -0700 (PDT)
Subject: Re: LG laptop driver not working on recent models
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alessandro Zarrilli <alessandro@zarrilli.net>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <CAJubAmEg_uXsWRqHXA2_L8i2AVU_ZLH19txYqgVpP5s+AwNzfA@mail.gmail.com>
 <CAHp75VdKkZ0Ra3FMvbfq2hJH7_KZ5S_XLCxmrgFOAMiGDe6AKQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <78578539-19c2-8915-91f8-8a82bafb5135@redhat.com>
Date:   Mon, 21 Sep 2020 09:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdKkZ0Ra3FMvbfq2hJH7_KZ5S_XLCxmrgFOAMiGDe6AKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/20/20 8:04 PM, Andy Shevchenko wrote:
> +Cc: PDx86 mailing list and co-maintainers

So unrelated to the original issue, but I assume that this
battery_care_limit is a threshold above which the
laptop will not start charging, i.e. if it is set to 80
as Alessandro is trying to do and the laptop is plugged
into the charger after being discharged to 90% then it will
NOT charge.

Assuming I have got this right, then now a days we have
a standard power_supply class sysfs attribute for this,
charge_start_threshold .

Or maybe I got it wrong and the battery_care_limit means
never charge above that value? Then the new standard
power_supply class sysfs attribute would be
charge_stop_threshold.

These attributes should be added to the existing
/sys/class/power_supply/BAT? entry which is registered
for the battery by the drivers/apci/battery.c driver.

Now normally it is not possible to add sysfs attributes
to a power-supply added by another driver, but recently
some work has been done to make this possible, for
pretty much the same reasons as why we want this in
the lg-laptop driver now.

Specifically the thinkpad_acpi driver uses this new
mechanism to register both a charge_start_threshold and
a charge_stop_threshold with the /sys/class/power_supply/BAT0
entry for the Thinkpad's battery.

There are some discussions/plans in the GNOME project to
add support for selecting battery charge profiles from the
GUI. But this will only work if the foo-laptop driver for the
laptop implements the new standard charge_start_threshold and
charge_stop_threshold sysfs attributes under
/sys/class/power_supply/BAT?

So if someone with access to a LG-gram laptop could make the
driver register these standard attributes that would be great.

See thinkpad_acpi for an example how to do this.

Regards,

Hans



> 
> On Sat, Sep 19, 2020 at 2:44 PM Alessandro Zarrilli
> <alessandro@zarrilli.net> wrote:
>>
>> Note: I'm adding Andy in CC because I see he was the committer of the driver I'm going to talk about.
>>
>> Hi Matan,
>>
>> I see you are the maintainer of the Linux kernel LG Gram laptop driver (linux/drivers/platform/x86/lg-laptop.c).
>>
>> I've just bought the LG Gram 2020 version (product code 17Z990). I'm running Kernel 5.4.0, but unfortunately it seems your driver is not working correctly on this laptop model.
>>
>> Take for example "battery care limit", the feature I'm interested the most:
>>
>> # cat /sys/devices/platform/lg-laptop/battery_care_limit
>> 0
>> # echo 80 > /sys/devices/platform/lg-laptop/battery_care_limit
>> # cat /sys/devices/platform/lg-laptop/battery_care_limit
>> 0
>> # echo 100 > /sys/devices/platform/lg-laptop/battery_care_limit
>> # cat /sys/devices/platform/lg-laptop/battery_care_limit
>> 0
>>
>> Is there any chance you could fix this? Can I help in any way? I'm not skilled in C programming (just used it a long time ago), but I'm an old time developer and Linux system administrator: if you give me some hints, maybe I could sort it out myself.
>>
>> Thanks and regards
>> Alessandro
> 
> 
> 

