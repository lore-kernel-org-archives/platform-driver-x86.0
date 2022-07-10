Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D82C43334
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 15:28:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiGJP17 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 11:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiGJP16 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 11:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BD479DFF2
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657466876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WEgc4+9EZyWOg0DX1APF1+peVAF/Sf5RwA1DWtcyQls=;
        b=RUpHmKoPheQr+PLhu/555ZV7Q1Mfj0evTog10PHypJI3itORN402oqMinFsYv4rWh1chh8
        TDtPyta3XhvxzrQBCrcVmnaGKeqKPf5eomf8HYt9ajKY/ZytN26me9QUhlsMZ2mM+m8GxS
        ZF2b2tbPsKl174YoWPnXMTWr6nrQDAQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-BJ4sVrqgPBqTw5He3np3Mg-1; Sun, 10 Jul 2022 11:27:55 -0400
X-MC-Unique: BJ4sVrqgPBqTw5He3np3Mg-1
Received: by mail-ed1-f69.google.com with SMTP id n8-20020a05640205c800b00434fb0c150cso2647381edx.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 08:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WEgc4+9EZyWOg0DX1APF1+peVAF/Sf5RwA1DWtcyQls=;
        b=uaxVvM6HLsOm14eXN3oClvTq4BQjZYCuR7VVzS5ihFlxayM8c49rT+BsY25DGX/IHC
         SLNxXeT0rJtaUZzcOWKn910tTNtoXmOeVpcy6iScyJfjtpT1krubGOqPIK9d+geUCwg5
         Pr+wPaD2dxSX/6lYngY+EkYwcfM/dmvrX0qAhVY+weotUQnPh36MHMPK99F7+gE/3esU
         dj5+QtPfPwA5Tzco0U/o5G6LHU5u6QlWAWmpWQGVtOr6qoMrffQAvJp/waDlhhIVsyKi
         eReb61cz7GU6XeXTNaQb4J3bWoAF8D/K9ew/WxmIiBtPJ2NwVgdz1+vcCuUfMkxoP++h
         WDmg==
X-Gm-Message-State: AJIora+iSw0aYrp4s9hmISAESLJL66XF9BshJwGy9qF78Ky4bylhtV/D
        r8UcBICtHyDCOrA+an7LR4YNIbZuOqsVb1cdb3fg/8i6lmHxSHOZkUaG/86TBwQyB45Qjo2OB7v
        U55w/uWoRMvsRzcPUEkcczHeuD0ubD3u0PA==
X-Received: by 2002:a05:6402:35c5:b0:437:140d:5cb3 with SMTP id z5-20020a05640235c500b00437140d5cb3mr18766583edc.72.1657466874434;
        Sun, 10 Jul 2022 08:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sar1BApa+f5UiaF83FXmU4bkBODkz9o1fNx7/o9HOXstI0QKL9JWDfHduHhfrrwr0qUspBig==
X-Received: by 2002:a05:6402:35c5:b0:437:140d:5cb3 with SMTP id z5-20020a05640235c500b00437140d5cb3mr18766565edc.72.1657466874293;
        Sun, 10 Jul 2022 08:27:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y26-20020a056402135a00b00435a742e350sm2895727edw.75.2022.07.10.08.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 08:27:53 -0700 (PDT)
Message-ID: <c00dc0f7-dfe8-ecd7-ee6d-72b11a4ab3dc@redhat.com>
Date:   Sun, 10 Jul 2022 17:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/2] Fix 2 5.19 power-off regressions caused by
 sys-off-handler work
Content-Language: en-US
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, x86@kernel.org,
        linux-efi@vger.kernel.org
References: <20220708131412.81078-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220708131412.81078-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/8/22 15:14, Hans de Goede wrote:
> Hi All,
> 
> I noticed that my Lenovo Yoga Tablet 2 1050L was hanging on power-off again
> with 5.19, even though I had implemented a workaround for this in 5.17 .
> 
> I quickly realized that this was caused by the recent sys-off-handler work
> and fixed this by switching the workaround over to register_sys_off_handler
> with a priority of SYS_OFF_PRIO_FIRMWARE + 1, so that the workaround runs
> before acpi_power_off() get a chance to run.
> 
> This made me realize that the efi_power_off handler which sometimes is
> used in preference of acpi_power_off had the same problem, so the second
> patch in this series fixes that.
> 
> I plan to include patch 1/2 in a fixes pull-req to Linus soon. Ard,
> if I can get your Ack for 2/2 then I can include this in the pull-req
> if you want; or you can send this to Linus yourself.

I've added these to my review-hans (soon to be for-next) branch now
and I'll include them in my upcoming 5.19 fixes pull-req.

Regards,

Hans

> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (2):
>   platform/x86: x86-android-tablets: Fix Lenovo Yoga Tablet 2 830/1050
>     poweroff again
>   efi: Fix efi_power_off() not being run before acpi_power_off() when
>     necessary
> 
>  drivers/firmware/efi/reboot.c              | 21 +++++++++++----------
>  drivers/platform/x86/x86-android-tablets.c | 17 +++++++++++++----
>  2 files changed, 24 insertions(+), 14 deletions(-)
> 

