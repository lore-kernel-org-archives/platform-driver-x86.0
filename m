Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E6BC4743D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Jun 2021 09:00:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 220546101A
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Jun 2021 09:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhFHJC3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Jun 2021 05:02:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59759 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230197AbhFHJCX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Jun 2021 05:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623142828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q8pQTS5vz7W3pBaGE0d38TVTbjri0nLjhaoLXCAvVt4=;
        b=HcVt12BMAiXCn35SHF3s8IDfBi88MB7DNNuQQMVJTDJE2d6qvfqTQWfPi2Twgfy321Nnr7
        e6e0Z6U066d+QOXMm/7zTQO1pL5MrvpA1klcaA7r/Z8g8mrcMfPfe9bTyRCbELmi+AiHn5
        f+17Iu/gCGAcNeydCnzusoWj2tIOKro=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-ttihcdByNq6NVAE5wwaHTw-1; Tue, 08 Jun 2021 05:00:27 -0400
X-MC-Unique: ttihcdByNq6NVAE5wwaHTw-1
Received: by mail-ej1-f71.google.com with SMTP id z6-20020a17090665c6b02903700252d1ccso6447168ejn.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Jun 2021 02:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q8pQTS5vz7W3pBaGE0d38TVTbjri0nLjhaoLXCAvVt4=;
        b=p1neLotGtYw/vbc+1aSXnkvyGvTLLYSthOOu0JmRangOXltQn/GjaW4pCKq70gqjBT
         S1QoDr8RtNvNDLw4st1pci55LL2XSPt+XbK38r9hj3bCLUYIx4vzVFzWVbShbH8X/0JC
         VmKfdoVd/9v7y2btCPjgefzDfyW29Y5dMbufNfkx9nccUvxPmOm5rUnfmCC30B6y3r9G
         26dNLtbls3NmWyKIwDccyClkCVTj6nVCacHscna+Nucib8JsGN7B3N7AzM4didTnJj6V
         haLyGJu6a26/TlBxl8sgcnk8G6Y8J9kc+4NvP/5x6vBHV0UbeqjSA8f4pQSnKRRlQvSq
         h04w==
X-Gm-Message-State: AOAM532dSmUQkX7+4PCttsV4n3vrpoifG+Pawv7rnraKq1mJZ5hsbCx1
        hdvCCYHa7BEFm1NT6SeC/0QZH5ZAASs7TJdW7b6Hu83OFTnHqBKyeE/XXQikB+2l2ho7jEqaGvN
        LpyJidHAX/0M4/JQkOoqg135CDJI36h2f5A==
X-Received: by 2002:a17:906:a04e:: with SMTP id bg14mr5775587ejb.366.1623142825959;
        Tue, 08 Jun 2021 02:00:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0+0lBjVs9CJK1gPDtNITf0ZqRD1SRcnD3pEOFRUdvDJbycYeSORdCpGk0gKsOlfgba/chOA==
X-Received: by 2002:a17:906:a04e:: with SMTP id bg14mr5775558ejb.366.1623142825703;
        Tue, 08 Jun 2021 02:00:25 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id di16sm8488697edb.62.2021.06.08.02.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 02:00:25 -0700 (PDT)
Subject: Re: [PATCH v5 0/6] Introduce intel_skl_int3472 module
To:     Daniel Scally <djrscally@gmail.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210603224007.120560-1-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4400512a-b788-7074-d3c6-0ec228b43d7e@redhat.com>
Date:   Tue, 8 Jun 2021 11:00:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603224007.120560-1-djrscally@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/4/21 12:40 AM, Daniel Scally wrote:
> Hello all
> 
> Bit longer than hoped but here's v5.
> 
> v4:
> https://lore.kernel.org/lkml/20210520140928.3252671-1-djrscally@gmail.com/
> 
> v3
> https://lore.kernel.org/lkml/20210222130735.1313443-1-djrscally@gmail.com/
> 
> v2
> https://lore.kernel.org/platform-driver-x86/20210118003428.568892-1-djrscally@gmail.com/
> 
> v1
> https://lore.kernel.org/linux-media/20201130133129.1024662-1-djrscally@gmail.com/T/#m91934e12e3d033da2e768e952ea3b4a125ee3e67
> 
> The only changes are the dropped patches, renamed functions in 2/6 and most of
> Andy's suggestions on 5/6 - I didn't hit them all yet but didn't want to delay
> this any more.
> 
> Series level changelog:
> 
> 	- Dropped all but the essential patches to simplify merge plan - thanks
> 	Hans.

Thank you. Andy has already sends me a pull-req for the gpiolib-acpi changes
and I expect Rafael to send me a pull-req (from an immutable branch) for the
ACPI bits soon-ish.

When I merge those both into pdx86 I should be able to pick-up 5/6.

Given the long time this has been in the making I'm tempted to do that
(pick up 5/6 as is) and then we can do further cleanups like looking into
using the existing fixed-regulator code later. My mean reason to do this
would be to get this code into the hands of users starting with the 5.14
kernel.

So question, how usable is this (from the kernel pov, I know userspace
needs work too) once I merge 5/6. Is the kernel-side support for the cameras
on some Surface devices then complete or are more patches necessary in
other subsystems ?

Note another advantage of just merging 5/6 as is and doing the fixed-regulator
bits on top, is that having those in a separate commit makes it easier to
see if these indeed result in a nice cleanup (vs sticking with the current code).

Regards,

Hans






> 
> Daniel Scally (6):
>   ACPI: scan: Extend acpi_walk_dep_device_list()
>   ACPI: scan: Add function to fetch dependent of acpi device
>   gpiolib: acpi: Export acpi_get_gpiod()
>   gpiolib: acpi: Add acpi_gpio_get_io_resource()
>   platform/x86: Add intel_skl_int3472 driver
>   mfd: tps68470: Remove tps68470 MFD driver
> 
>  MAINTAINERS                                   |   5 +
>  drivers/acpi/ec.c                             |   2 +-
>  drivers/acpi/pmic/Kconfig                     |   2 +-
>  drivers/acpi/pmic/intel_pmic_chtdc_ti.c       |   2 +-
>  drivers/acpi/scan.c                           | 104 ++++-
>  drivers/gpio/Kconfig                          |   2 +-
>  drivers/gpio/gpiolib-acpi.c                   |  61 ++-
>  drivers/i2c/i2c-core-acpi.c                   |   8 +-
>  drivers/mfd/Kconfig                           |  18 -
>  drivers/mfd/Makefile                          |   1 -
>  drivers/mfd/tps68470.c                        |  97 ----
>  drivers/platform/surface/aggregator/core.c    |   6 +-
>  drivers/platform/surface/surface3_power.c     |  22 +-
>  .../platform/surface/surface_acpi_notify.c    |   7 +-
>  drivers/platform/x86/Kconfig                  |   2 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/intel-int3472/Kconfig    |  30 ++
>  drivers/platform/x86/intel-int3472/Makefile   |   5 +
>  .../intel_skl_int3472_clk_and_regulator.c     | 196 ++++++++
>  .../intel-int3472/intel_skl_int3472_common.c  | 106 +++++
>  .../intel-int3472/intel_skl_int3472_common.h  | 118 +++++
>  .../intel_skl_int3472_discrete.c              | 417 ++++++++++++++++++
>  .../intel_skl_int3472_tps68470.c              | 137 ++++++
>  include/acpi/acpi_bus.h                       |   8 +
>  include/linux/acpi.h                          |  11 +-
>  include/linux/gpio/consumer.h                 |   2 +
>  26 files changed, 1205 insertions(+), 165 deletions(-)
>  delete mode 100644 drivers/mfd/tps68470.c
>  create mode 100644 drivers/platform/x86/intel-int3472/Kconfig
>  create mode 100644 drivers/platform/x86/intel-int3472/Makefile
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
> 

