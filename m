Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614FAC00140
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Aug 2022 11:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237835AbiHELQ4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Aug 2022 07:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiHELQ4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Aug 2022 07:16:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 494FD101F4
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Aug 2022 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659698214;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fmkieuRV1ERKFgxAIJxu/u7LTM9kQq49dbtELpACyvg=;
        b=N32mWhQHqn1zHPjlow2SwfYCpT8srrcFPDYH4TEm41cobEZinswBKHHzlLUJX3REmjSUDW
        fO1y+V96dlvpi6YI8tv0JWjNcNNUSZHv7D4qBlFDhRjEhQNDiyCjxCq5BRADFjuP3mrlK7
        w3bbpaefba9+JhEjdhsWai7jCb/bCAA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-4baXHC5XNCyyASzoormz0Q-1; Fri, 05 Aug 2022 07:16:53 -0400
X-MC-Unique: 4baXHC5XNCyyASzoormz0Q-1
Received: by mail-ed1-f69.google.com with SMTP id q18-20020a056402519200b0043dd2ff50feso1414322edd.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Aug 2022 04:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=fmkieuRV1ERKFgxAIJxu/u7LTM9kQq49dbtELpACyvg=;
        b=KSyLL/JuDEC8zDADv6E9T8ImaNWClDIhxKbLi0FdtI0WF4k4RaTPoYYvhaeb3JmzmL
         jb7aG0ctReGBSHMsbCgqHqgPqNSqwpcPI7Do2Gh3TLkKoqPOl6XPADo3a0mGzBHJG4ux
         j6IkXgDW+HTxEwQLp178kCLg5r6M2ykN7rJwLzmfJQxUUEuLj/0xgNG37amOLzIuvyVU
         5y6ea7srzzpTkeBy3U1HAYxSnEipHHcSc5MGl+LAX0KNcPD9sCdYJ8IcQJ94udS1pzbT
         VIVssmbOl6wC8oyHAEmIkBtKcuD1A4t/SfSa0zRV04IrpAZt75Z7EVCINE7BiqR1hMeD
         9Smg==
X-Gm-Message-State: ACgBeo2nQQH2SIWgNXk3/3IbBLteqvrxgYlQTRIzA5dyz0ffrlSL+G18
        Gp38n9DPb4e7buLhvkNES5xEhqgXxs4YbDHhOY2dwiFec3OQf+avc2T3hWMtW7AXFYO1VqnIf8A
        WX74UNH3oorzkgmF4QvB4fm/JjM3/p3oELA==
X-Received: by 2002:a17:907:2c4a:b0:730:87fe:2a88 with SMTP id hf10-20020a1709072c4a00b0073087fe2a88mr4820080ejc.313.1659698212204;
        Fri, 05 Aug 2022 04:16:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5LPcgUh3Q3TviDiYom3bw9KxWCVGOihq/2sSYb5KlUEtTG6qZHYfpBpVDAzloKHy8BG96KQg==
X-Received: by 2002:a17:907:2c4a:b0:730:87fe:2a88 with SMTP id hf10-20020a1709072c4a00b0073087fe2a88mr4820068ejc.313.1659698211966;
        Fri, 05 Aug 2022 04:16:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ss28-20020a170907c01c00b0072b565507c5sm1409902ejc.203.2022.08.05.04.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 04:16:51 -0700 (PDT)
Message-ID: <4ef4335e-8794-9814-9990-674a132b7719@redhat.com>
Date:   Fri, 5 Aug 2022 13:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 00/11] platform/x86/amd/pmf: Introduce AMD PMF Driver
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 17:11, Shyam Sundar S K wrote:
> AMD PMF Driver (a.k.a Platform Management Framework) provides a
> centralized framework based on sensor inputs, OS hints, platform state
> and APU metrics to dynamically manage perf, power and system thermals.
> 
> The goal of the driver is to enhance end user experience by making AMD
> PCs smarter, quieter, power efficient by adapting to user behavior and
> environment.
> 
> The larger goals include:
> 
> - Enable easy customization of smart PC solutions by OEMs.
> - Provide a framework for OEMs to add in custom algorithms and solutions
> - Improve standby and dynamic platform power through active power
>   management of platform devices.
> 
> In this series, support for following features has been added.
> - "Static Power Slider" meant to manage the power budget based on the
>   power modes or the slider position.
> - "Auto Mode" tracks the moving power average of the APU and takes
>   intelligent decisions to switch between different modes.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> v4:
> -----------
> - Remove duplicate variables in auto_mode_mode_config() structure
> - call apmf_event_handler() handler manually so that we don't miss out
>   any notifies
> - Misc. error handling.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

The patches sitting here allows the LKP testing infra to test
the patches. I will move these over to a 6.0-rc1 based feature
branch once 6.0-rc1 is out.

Note I did do a few small last fixes while merging this, see
my replies to individual patches.

Please test the version in the review-hans branch and base
any future patches on top of the version in the review-hans
branch.

Regards,

Hans


> v3:
> -----------
> - Cleanup ACPI code path
> - Optimize metrics table collection mechanism
> - Avoid races between the acpi handler and the metrics table worker
>   thread.
> - Remove redundant structures and functions.
> - Improve the code handling the apmf handler routine.
> 
> v2 Resend:
> -----------
> - Patches from 9 to 11 were not sent due to wrong email address. Hence
>   resending.
> 
> v1->v2:
> -------
> - optimize the ACPI path by having a common routine
>   apmf_if_call_store_buffer()
> - Simply Static slider interaction with platform_profile
> - Remove CONFIG_DEBUG_FS stub code
> - Drop changes introduced in platform_profile_get()
> - Drop CnQF support. Will be sent as a patch-set later.
> - Other code improvements
> 
> Shyam Sundar S K (11):
>   platform/x86/amd/pmf: Add support for PMF core layer
>   platform/x86/amd/pmf: Add support for PMF APCI layer
>   platform/x86/amd/pmf: Add support SPS PMF feature
>   platform/x86/amd/pmf: Add debugfs information
>   platform/x86/amd/pmf: Add heartbeat signal support
>   platform/x86/amd/pmf: Add fan control support
>   platform/x86/amd/pmf: Get performance metrics from PMFW
>   platform/x86/amd/pmf: Add support for Auto mode feature
>   platform/x86/amd/pmf: Handle AMT and CQL events for Auto mode
>   platform/x86/amd/pmf: Force load driver on older supported platforms
>   MAINTAINERS: Add AMD PMF driver entry
> 
>  MAINTAINERS                              |   7 +
>  drivers/platform/x86/amd/Kconfig         |   2 +
>  drivers/platform/x86/amd/Makefile        |   1 +
>  drivers/platform/x86/amd/pmf/Kconfig     |  15 +
>  drivers/platform/x86/amd/pmf/Makefile    |   9 +
>  drivers/platform/x86/amd/pmf/acpi.c      | 287 +++++++++++++++++
>  drivers/platform/x86/amd/pmf/auto-mode.c | 301 ++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c      | 385 +++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h       | 329 +++++++++++++++++++
>  drivers/platform/x86/amd/pmf/sps.c       | 149 +++++++++
>  10 files changed, 1485 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/pmf/Kconfig
>  create mode 100644 drivers/platform/x86/amd/pmf/Makefile
>  create mode 100644 drivers/platform/x86/amd/pmf/acpi.c
>  create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c
>  create mode 100644 drivers/platform/x86/amd/pmf/core.c
>  create mode 100644 drivers/platform/x86/amd/pmf/pmf.h
>  create mode 100644 drivers/platform/x86/amd/pmf/sps.c
> 

