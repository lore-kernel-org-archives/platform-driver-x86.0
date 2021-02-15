Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9806C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 14:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B67B64E32
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 14:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhBOOmP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Feb 2021 09:42:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31103 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229802AbhBOOmM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 09:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613400043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ov3T7Gy3P3ptFA2/hNy57tZUSgh2RTIIb39OsEKd8j8=;
        b=T2jXWLxGMR+GAV/QW3ObgCDxE3QIE8uHHJiYT9hUY3kUHzTULulRL+V89jOh9/3BA/0GJC
        BmP2YCjBgpXyujrJorf3GdRPlmNlEmvactVQyrX/9P5hlTC29A9mTtT87yk3aFDEEtJRsH
        jIIQSDr0XSFeotLuxT3jpmad07t6spg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-8b1oy3wGNGS09RKWC1dmqA-1; Mon, 15 Feb 2021 09:40:42 -0500
X-MC-Unique: 8b1oy3wGNGS09RKWC1dmqA-1
Received: by mail-ej1-f72.google.com with SMTP id yd11so4474881ejb.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 06:40:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ov3T7Gy3P3ptFA2/hNy57tZUSgh2RTIIb39OsEKd8j8=;
        b=VbkbJeXrMSCAnh+5Wohj6QpS0aAvAlI8xeMLLljlDhXNiVzspGpcxQvLSDMJMv+J0M
         S/r3sUolsQA7V2UwiIw2Y4/XczSFLhhzNw8l8DxlybPMoMaLQ0JQgCGvR9N/OmRppky4
         ZLoZCuZhOdTPv3yBW9rkY752RjEE9IduRT8dWfYPbfs48ik/6RvMMPnqzgbKjzP1bPjp
         yAuVMmkpY1DYcOO3XU+CLuEXBQWQMNbzfe7WChNZufb2eT2e0hNtS5iJQYyZu47YcsEq
         eKdsH+bPK5Xypw05HZ5ZpMraSRqJsI+/OI3QLRxXg5YqbarYv6DaaFU9ESottDb89B5U
         RpSA==
X-Gm-Message-State: AOAM531PlyvKul43p1J1jOghaUKVLPfiqlWU2culhJH+7Y+Yx+Sqg0Z1
        yT8L7c4NsBjXxOzA1NIyMJUqi/jG6TwI4yMpBJJgl3M2RaSDjrtFvxgijUFiYyPbIi2LS6grsTW
        RJNwb1U0tA0nHeU2v9vyYQTV8XN81BKPoH9oSQiLJYJa/nbvclEn/MhtNvEv2bpcQKUDLdx1yGS
        e0aJQvj/yJmA==
X-Received: by 2002:a17:906:dff1:: with SMTP id lc17mr15508332ejc.198.1613400040981;
        Mon, 15 Feb 2021 06:40:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznhGLAe9WUuZRzjJQDAYkrjQGuj9m7PnCzlF9BLw6wwh0UoMoqxW+XTDj/CH/qZx0Ixg1HVw==
X-Received: by 2002:a17:906:dff1:: with SMTP id lc17mr15508309ejc.198.1613400040678;
        Mon, 15 Feb 2021 06:40:40 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id lc11sm10665010ejc.95.2021.02.15.06.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 06:40:40 -0800 (PST)
Subject: Re: [PATCH RFC platform-next 0/8] platform: mellanox: Introduce
 initial chassis management support for modular Ethernet system
To:     Vadim Pasternak <vadimp@nvidia.com>, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20210203173622.5845-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ed879d55-f034-04d4-7b6f-0a39da532381@redhat.com>
Date:   Mon, 15 Feb 2021 15:40:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203173622.5845-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Vadim,

On 2/3/21 6:36 PM, Vadim Pasternak wrote:
> Add initial chassis management support for Nvidia modular Ethernet
> switch systems MSN4800, providing a high performance switching solution
> for Enterprise Data Centers (EDC) for building Ethernet based clusters,
> High-Performance Computing (HPC) and embedded environments.
> 
> This system could be equipped with the different types of replaceable
> line cards and management board. The first system flavor will support
> the line card type MSN4800-C16 equipped with Lattice CPLD devices aimed
> for system and ASIC control, one Nvidia FPGA for gearboxes (PHYs)
> management, and four Nvidia gearboxes for the port control and with
> 16x100GbE QSFP28 ports and also with various devices for electrical
> control.
> 
> The system is equipped with eight slots for line cards, four slots for
> power supplies and six slots for fans. It could be configured as fully
> populated or with even only one line card. The line cards are
> hot-pluggable.
> In the future when more line card flavors are to be available (for
> example line cards with 8x200Gb Eth port, with 4x400 Eth ports, or with
> some kind of smart cards for offloading purpose), any type of line card
> could be inserted at any slot.
> 
> The system is based on Nvidia Spectrum-3 ASIC. The switch height is
> 4U and it fits standard rack size.
> 
> The next coming  card generations are supposed to support:
> - Line cards with 8x200Gbe QSFP28 Ethernet ports.
> - Line cards with 4x400Gbe QSFP-DD Ethernet ports.
> - Smart cards equipped with Nvidia ARM CPU for offloading and for fast
>   access to the storage (EBoF).
> - Fabric cards for inter-connection.

Is there a specific reason why this series is RFC?  Typically that
indicates the code is not yet ready for merging and normally the
cover-letter indicates why the series is RFC.

The hardware this is for is pretty specialized, so I'm mostly just going
to trust that you know what you are doing here.

I see that this has not been reviewed by any of the other Melanox people,
it would be could if you could get someone else from your time to review
this series and give there Reviewed-by once they are happy with it.

Regards,

Hans




> 
> Patch set contains:
> Patch #1 – adds new types for modular system support.
> Patch #2 - adds support for the modular system equipped with replicable
> 		line cards.
> Patches #3 & #8 – add documentation.
> Patches #4 & #6 - extend logic for hotplug devices operations for the
> 		modular system support.
> Patch #5 – extends number of hwmon attributes for mlxreg-io driver,
> 		since modular system introduces more attributes.  
> Patches #7 - introduces initial support for Mellanox line card devices.
> 
> Vadim Pasternak (8):
>   platform_data/mlxreg: Add new types to support for modular systems
>   platform/x86: mlx-platform: Add initial support for new modular system
>   Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces
>   platform/mellanox: mlxreg-hotplug: Extend logic for hotplug devices
>     operations
>   platform/mellanox: mlxreg-io: Extend number of hwmon attributes
>   platform/mellanox: mlxreg-hotplug: Add line card event callbacks
>     support for modular system
>   platform/mellanox: mlxreg-lc: Add initial support for Mellanox line
>     card devices
>   Documentation/ABI: Add new line card attributes for mlxreg-io sysfs
>     interfaces
> 
>  Documentation/ABI/stable/sysfs-driver-mlxreg-io |  195 +++
>  drivers/platform/mellanox/Kconfig               |   12 +
>  drivers/platform/mellanox/Makefile              |    1 +
>  drivers/platform/mellanox/mlxreg-hotplug.c      |  120 +-
>  drivers/platform/mellanox/mlxreg-io.c           |    2 +-
>  drivers/platform/mellanox/mlxreg-lc.c           |  807 ++++++++++
>  drivers/platform/x86/mlx-platform.c             | 1817 ++++++++++++++++++++---
>  include/linux/platform_data/mlxreg.h            |   61 +
>  8 files changed, 2785 insertions(+), 230 deletions(-)
>  create mode 100644 drivers/platform/mellanox/mlxreg-lc.c
> 

