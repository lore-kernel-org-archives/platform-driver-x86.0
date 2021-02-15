Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684A8C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 14:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E25F614A5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 14:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhBOOfp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Feb 2021 09:35:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41156 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230031AbhBOOfn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 09:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613399655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d2J+8Tfem94WsFrszmXvqkgjRa934v/heCKhqM64Y7M=;
        b=Lhs5ucQmH+PJDWWwvPNSNj/AbJGougIT6VLZ47k22wQ5Dp2574mQ7L47Jily6fjtwEivXo
        BkpLoiemQKBmvDhNdic7yze5BxW+c27oS73ZctmAYTLY/vvBdLgC32CNNY2C9PHv0WGeEZ
        qjZGp2D3arD6zwFUhhtKeu+IohS56q0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-8mK7kpl1OKmo-HlGYWgEDg-1; Mon, 15 Feb 2021 09:34:11 -0500
X-MC-Unique: 8mK7kpl1OKmo-HlGYWgEDg-1
Received: by mail-ed1-f72.google.com with SMTP id l22so703112eds.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 06:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d2J+8Tfem94WsFrszmXvqkgjRa934v/heCKhqM64Y7M=;
        b=Oc6fe99x+ssDRHuC8PPqI2yXwMqQcL1DXx1OWGBnEyxZfbEOwJAsRhcuQWyMLVOnsz
         fXLgciJj5p+DcXvhHEBwUTIN7FHzRKty/evxuZN9CMMSN6Ad+mMFhQ0jDVNq2Ctepq5x
         6+Jwb74UhEYYENKQ6BxjJEbU5flfa/mjiWihaOSW7UOaJEH9wbaFKHtmSyz9H6ehc+CZ
         2yBjihYVO8FIjQIJZqCyHoBnzqIMBT2H58mGzFP9BPRm0Hth/SRPlrqZQgcjpIuP5LOU
         xti5Gxirl5CJOsePWJ1K1EtzBJQwbYVw0duz4RdHFyzVLGBPg3Z9J/8NZw4p6ussv4DS
         AS3w==
X-Gm-Message-State: AOAM530DX97I0wL/pbeYmgFuf4zxEP9Y0nXaKPTA3cPU7IRdfztluQ/q
        1sH6WhgLkVT6wUs2Wu2xCLyNWJfMbWd4EvZbNxyl6eMcZODgsF6BYxmY5IZQcGA0S76x1H//zP1
        ZuadoUAlDC30rjR4uvRKpWCHoBdBiaoAShg==
X-Received: by 2002:a05:6402:3069:: with SMTP id bs9mr15921822edb.151.1613399649825;
        Mon, 15 Feb 2021 06:34:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNUE1ybmiPJKS3BTRwzixs3/QMCzPSsX2m5S3uk+QJ1dTn5R58eECNp2pJwtfpKd7T/RVaag==
X-Received: by 2002:a05:6402:3069:: with SMTP id bs9mr15921804edb.151.1613399649641;
        Mon, 15 Feb 2021 06:34:09 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v9sm775630edj.89.2021.02.15.06.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 06:34:09 -0800 (PST)
Subject: Re: [PATCH v2 0/4] platform/surface: Add platform profile driver for
 Surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Mark Gross <mgross@linux.intel.com>, Len Brown <lenb@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210211201703.658240-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <898aa498-8256-d59f-9e72-0e1199b3a62a@redhat.com>
Date:   Mon, 15 Feb 2021 15:34:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211201703.658240-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/11/21 9:16 PM, Maximilian Luz wrote:
> This series adds a driver to provide platform profile support on 5th-
> and later generation Microsoft Surface devices with a Surface System
> Aggregator Module. On those devices, the platform profile can be used to
> influence cooling behavior and power consumption.
> 
> To achieve this, a new platform profile is introduced: the
> 'balanced-performance' profile.
> 
> In addition, a couple of fix-ups are performed:
> - Hide CONFIG_ACPI_PLATFORM_PROFILE and change drivers so that it is
>   selected instead of depended on.
> - Fix some references to documentation in a comment.
> 
> Note: This series (or more specifically "platform/surface: Add platform
> profile driver") depends on the "platform/surface: Add Surface
> Aggregator device registry" series.
> 
> Changes in v2:
>  - Introduce new 'balanced-performance' platform profile and change
>    profile mapping in driver.
>  - Perform some fix-ups for the ACPI platform profile implementation:
>    - Fix some references to documentation in a comment.
>    - Hide CONFIG_ACPI_PLATFORM_PROFILE

Thanks, the entire series looks good to me, so for the series:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Rafael, can you (once 5.12-rc1 is out) pick 1-3/4 and then provide a
stable branch for me to merge?

Then I will pick up 4/4.

Regards,

Hans




> 
> Maximilian Luz (4):
>   ACPI: platform: Hide ACPI_PLATFORM_PROFILE option
>   ACPI: platform: Fix file references in comment
>   ACPI: platform: Add balanced-performance platform profile
>   platform/surface: Add platform profile driver
> 
>  .../ABI/testing/sysfs-platform_profile        |  18 +-
>  MAINTAINERS                                   |   6 +
>  drivers/acpi/Kconfig                          |  16 +-
>  drivers/acpi/platform_profile.c               |   1 +
>  drivers/platform/surface/Kconfig              |  22 ++
>  drivers/platform/surface/Makefile             |   1 +
>  .../surface/surface_platform_profile.c        | 190 ++++++++++++++++++
>  drivers/platform/x86/Kconfig                  |   4 +-
>  include/linux/platform_profile.h              |   6 +-
>  9 files changed, 237 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/platform/surface/surface_platform_profile.c
> 

