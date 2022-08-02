Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B3AC00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 13:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233142AbiHBNZg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 09:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234420AbiHBNZf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 09:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B831265C4
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659446732;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c6hvN5FBJsW9wwrYI65tJxm9MctAeSuII4F/HL68hIk=;
        b=jIi4RXju4iNDCsiPKOEfQ3EfFsTgufVndZf7p2HcwxY/ACLBmoaaDcjY+6T+1KgvtZ2Oj1
        k5EfVLVIDcQiC8+aYnHFIM/zQBvyxf4eyEF6Phq/A1f7qluPg4a/a+yFERQBJpegjw1kel
        AJg83kBOQLufeg3CiEqX4cMjnNhADtM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-OC-D34KbMs-aWs-T-2DgNQ-1; Tue, 02 Aug 2022 09:25:24 -0400
X-MC-Unique: OC-D34KbMs-aWs-T-2DgNQ-1
Received: by mail-ed1-f70.google.com with SMTP id w17-20020a056402269100b0043da2189b71so3609748edd.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Aug 2022 06:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c6hvN5FBJsW9wwrYI65tJxm9MctAeSuII4F/HL68hIk=;
        b=RhyOS7ezhkDg7XpXpu7CffrtNTeh2MhcWDRCOCNBQEQZ+xOtsNtHJvWECqxpgL6toh
         1kPdI/Ee4lgKGW2e0H+7x3c8P9e/O4lFPWu/FIPLTl9zuJoS09icXovnhZJpld/ivnLU
         v2juzfjQtSVx0vVG3s26FNM4JEDkxQTqyzLoQ7brQFUwyFOcetcGwyaxmFlpPl9PT0Qb
         0+Pdv+0oHPzqswmbCrmZGxD3730zxtGTMzMhQwZBfhovn4Qtks6V8cc/TO0HRY6gLxQd
         G51kNibgPT+0kZ6YNPeYnBe8EfmTTaY4Dd8R5yPJwJ2vbL6lfjHEDgkQ86Zo4rimTpOR
         ViLw==
X-Gm-Message-State: AJIora8DJDH2UcKpVnJOkE//DY+SnBELhd0pnKJFPGeHHUGjYLq8zbl4
        kf/NRDlavlSfQP3QET/5npYY234thgVPB+Tw13P2bB3cgksoQDpE+/tFS+dwXZgeBzUT851zNTA
        SSXMOeqr6moeISo8g8BW7UthzYfxQoETQ8Q==
X-Received: by 2002:a17:906:9b0a:b0:72b:4f33:b247 with SMTP id eo10-20020a1709069b0a00b0072b4f33b247mr16511911ejc.267.1659446722803;
        Tue, 02 Aug 2022 06:25:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sfdbQWrKlR67nuID8gqziZF5TpuPMBhJAs06gM64Z/b6G6R4susmgElS735cU8IPlANTDZZg==
X-Received: by 2002:a17:906:9b0a:b0:72b:4f33:b247 with SMTP id eo10-20020a1709069b0a00b0072b4f33b247mr16511898ejc.267.1659446722622;
        Tue, 02 Aug 2022 06:25:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g26-20020a170906539a00b0073080c22898sm2509071ejo.15.2022.08.02.06.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 06:25:22 -0700 (PDT)
Message-ID: <5147fb06-541a-211a-9cea-603563ea39a5@redhat.com>
Date:   Tue, 2 Aug 2022 15:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 00/11] platform/x86/amd/pmf: Introduce AMD PMF Driver
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 13:25, Shyam Sundar S K wrote:
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
> v3:
> -----------
> - Cleanup ACPI code path
> - Optimize metrics table collection mechanism
> - Avoid races between the acpi handler and the metrics table worker
>   thread.
> - Remove redundant structures and functions.
> - Improve the code handling the apmf handler routine.

Thank you.

I've just completed my review of v3. I have no remarks for the patches
which I've not replied to.

Regards,

Hans'

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
>  drivers/platform/x86/amd/pmf/Kconfig     |  16 +
>  drivers/platform/x86/amd/pmf/Makefile    |   9 +
>  drivers/platform/x86/amd/pmf/acpi.c      | 290 +++++++++++++++++
>  drivers/platform/x86/amd/pmf/auto-mode.c | 301 ++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c      | 385 +++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h       | 333 ++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/sps.c       | 149 +++++++++
>  10 files changed, 1493 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/pmf/Kconfig
>  create mode 100644 drivers/platform/x86/amd/pmf/Makefile
>  create mode 100644 drivers/platform/x86/amd/pmf/acpi.c
>  create mode 100644 drivers/platform/x86/amd/pmf/auto-mode.c
>  create mode 100644 drivers/platform/x86/amd/pmf/core.c
>  create mode 100644 drivers/platform/x86/amd/pmf/pmf.h
>  create mode 100644 drivers/platform/x86/amd/pmf/sps.c
> 

