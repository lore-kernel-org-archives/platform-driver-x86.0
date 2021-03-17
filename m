Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084D4C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C268264EED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:40:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbhCQRjb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Mar 2021 13:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32817 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232263AbhCQRjJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 13:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616002749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Cmp3AOe6/8OTUuf+//7xGx20rFpuBW0gLXu6HX63aaI=;
        b=bm7idpENaui64ArPn1Zgu2CnS4oihDWaLtR4aspQcrnzwqFi03J9MxfTOmMt/NMbv1mSmw
        LLLVf6qTw4r6/6DTTtJtkFWIiOMrttRbv9vIVmxfe/Cgm/HYM8XbIwhsRBlR8ARB/9lbMr
        83NctUQEsyeLtaZL82Wi8/pML68qC6A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-nEBwpM82ONGMhx-T4sWO9g-1; Wed, 17 Mar 2021 13:39:06 -0400
X-MC-Unique: nEBwpM82ONGMhx-T4sWO9g-1
Received: by mail-ed1-f71.google.com with SMTP id o24so19729323edt.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 10:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cmp3AOe6/8OTUuf+//7xGx20rFpuBW0gLXu6HX63aaI=;
        b=IBT3aYBVgXNrs2hq1YWOp4JeV3AbcJaETbqX2haoVTzUuytGtLLludabIghQdnZAyk
         3Qg8IY9olcN7UdXoUF04Y76o4Yad0xHbB7PbpHfNl5BNJS07UepC5SHbhkHD5MXUwOTL
         j5+uhjx/nDsMZKCEc+9LcmUp+EryfGGZ9kKuPXbgpUm8WbcbTJPIWFc0C3pX6NT7PrCT
         mqkaCTGVghJBcrVwZ+WyYBmBkPogHveekUwhDvEeQDFmI7u6P2CZi1fSsmsLxuKbCSEG
         hT08MnGhUUeoCCrxNvKWtqCYVcavgv48dTztErmwPTyuozWX3ab9m8n2qPvNZVe5itF4
         63EA==
X-Gm-Message-State: AOAM531ZCoawQpKV3O4lY+u7sUqyuvL8RIboGq33hzvhY9IZBJcNy1vr
        ekXualbOA8s/w3NE7ixKm2/YwGxA0f5/KM5VZRZaBbbXRnNp/A6c7IRDBJ2z7LYD8EqzHXc/6Se
        Krg6Bfd6BeaUyvE8BtxSNtl6OU8q6UxKOAg==
X-Received: by 2002:aa7:d954:: with SMTP id l20mr43572185eds.1.1616002745374;
        Wed, 17 Mar 2021 10:39:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWI+Nz3oJ3aTMnmdebMc2YpP79z+h1kTt/FVhtFdhiJfuJf8XpXTs93ZM6FYn4/LO5RVWggg==
X-Received: by 2002:aa7:d954:: with SMTP id l20mr43572165eds.1.1616002745191;
        Wed, 17 Mar 2021 10:39:05 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gx2sm6670203ejc.82.2021.03.17.10.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 10:39:04 -0700 (PDT)
Subject: Re: [PATCH 0/2] power: supply: Add battery and AC drivers for Surface
 devices
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210309000530.2165752-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <edcbe108-8cd7-4034-222f-c8ce56918dee@redhat.com>
Date:   Wed, 17 Mar 2021 18:39:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309000530.2165752-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/21 1:05 AM, Maximilian Luz wrote:
> This series provides battery and AC drivers for Microsoft Surface
> devices, where this information is provided via an embedded controller
> (the Surface System Aggregator Module, SSAM) instead of the usual ACPI
> interface.
> 
> Specifically, 7th generation Surface devices, i.e. Surface Pro 7,
> Surface Book 3, Surface Laptop 3, as well as the Surface Laptop Go use
> this new interface.
> 
> Note: This series depends on the
> 
>     platform/surface: Add Surface Aggregator device registry
> 
> series. More specifically patch
> 
>     platform/surface: Set up Surface Aggregator device registry
> 
> The full series has been merged into the for-next branch of the
> platform-drivers-x86 tree [1]. The commit in question can be found at
> [2].
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=fc622b3d36e6d91330fb21506b9ad1e3206a4dde

Sebastian, I guess you want a pull-req from an immutable branch from me for
that dependend commit and then you will merge these 2 patches ?

Maximillian, this only needs that commit right, or would it be better if
I send Sebastian a pull-req for a branch with the entire series?

Regards,

Hans





> 
> Maximilian Luz (2):
>   power: supply: Add battery driver for Surface Aggregator Module
>   power: supply: Add AC driver for Surface Aggregator Module
> 
>  MAINTAINERS                            |   8 +
>  drivers/power/supply/Kconfig           |  32 +
>  drivers/power/supply/Makefile          |   2 +
>  drivers/power/supply/surface_battery.c | 901 +++++++++++++++++++++++++
>  drivers/power/supply/surface_charger.c | 296 ++++++++
>  5 files changed, 1239 insertions(+)
>  create mode 100644 drivers/power/supply/surface_battery.c
>  create mode 100644 drivers/power/supply/surface_charger.c
> 

