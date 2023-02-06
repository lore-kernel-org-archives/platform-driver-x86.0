Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6A0C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 12:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjBFMuN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 07:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjBFMuN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 07:50:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867544C2E
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 04:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675687771;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PpljKuxnqwd1vCc9A+qtmo/K/pkdw0gqUE4LwAXX/ko=;
        b=TFiZeUSbNZ5+dIe0xdfhOp7uWSx2+Y6A+S+9Zf5DOE0IPCqdMOkxwklr89DzxklCyQ9fz1
        MlczY6mNV6n9H+80Cw3Of2NNNKfqbK+fEQQmYMRn2rUJSobWyMZ1Vp7liyta8LKLxLTEO7
        gUByDtEru2zKeX6cV3p6oOMpx0fBKuU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-41FhjVqDMTq2tioO4dDMdg-1; Mon, 06 Feb 2023 07:49:30 -0500
X-MC-Unique: 41FhjVqDMTq2tioO4dDMdg-1
Received: by mail-ed1-f72.google.com with SMTP id d21-20020aa7c1d5000000b004a6e1efa7d0so7412932edp.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Feb 2023 04:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpljKuxnqwd1vCc9A+qtmo/K/pkdw0gqUE4LwAXX/ko=;
        b=jaA3mT4BOabcbPYOsVJFmDHBteJ5zRnDWQqDhp5Sb7hXWOG2NlL/PF79G1T1s4g/zp
         Drwp+eiPQCt7O4oZto3KSqeEziLv19WFBkLZ6VPZP6AY+qPD1a1Z6GxauGyhb5/DGgSj
         gIV42PwolizpUJ7mHCztKa00bRxR1YvLEE8in9p0tmlvjuFkwW5SgRj8mPxb28Bxt9RP
         bhdrtMqzCZ6tCd7A4hp+qO2R0RP8tBnjKSbZL9qn4XBydcYz8DJdl3AmRdQwQ6ModhIZ
         W4RDdpuH2Qy6LSwoYqfjitHe5+KCFnkjS3A42DtsL7yp2EhcqEAOETAsqGK5lM2gxcNt
         9m5g==
X-Gm-Message-State: AO0yUKX7FM/XU9hUxUpsLU5zanjUbj5awHrFkqb4qWZRj4Kbj2dBuoOy
        SHtwXc6mc52kHKEVFc16IuQV8b646uprRnPbgj3x1cQFm0rxrhpBDoRnkMm54xzHDZiwF3rqLOs
        I2Z+FNlBymCg5W2ZTxrL2VOyH25CoKSd6+w==
X-Received: by 2002:a17:907:3f85:b0:88f:8a5:b4cd with SMTP id hr5-20020a1709073f8500b0088f08a5b4cdmr21560138ejc.1.1675687769566;
        Mon, 06 Feb 2023 04:49:29 -0800 (PST)
X-Google-Smtp-Source: AK7set8hfVSmP7owsZwu+VRcTehyIYonNXyAtrL5RDgp6hez2Iv11nVI7+cMcNUn9s9VHCm+7O00Yg==
X-Received: by 2002:a17:907:3f85:b0:88f:8a5:b4cd with SMTP id hr5-20020a1709073f8500b0088f08a5b4cdmr21560128ejc.1.1675687769399;
        Mon, 06 Feb 2023 04:49:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cf8-20020a170906b2c800b00882f9130eb3sm5393776ejb.223.2023.02.06.04.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 04:49:28 -0800 (PST)
Message-ID: <918ac0c5-9f35-0099-5be8-6dbc72aa88e9@redhat.com>
Date:   Mon, 6 Feb 2023 13:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/7] Add TPMI support
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202010738.2186174-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230202010738.2186174-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/2/23 02:07, Srinivas Pandruvada wrote:
> The TPMI (Topology Aware Register and PM Capsule Interface) provides a
> flexible, extendable and PCIe enumerable MMIO interface for PM features.
> 
> For example Intel Speed Select Technology (Intel SST) can replace all
> mailbox commands with direct MMIO access. This reduces latency for
> SST commands and also defines an architectural interface which will
> persist for several next generations.
> 
> Also Intel RAPL (Running Average Power Limit) provides a MMIO
> interface using TPMI. This has advantage over traditional MSR
> (Model Specific Register) interface, where a thread needs to be scheduled
> on the target CPU to read or write. Also the RAPL features vary between
> CPU models, and hence lot of model specific code. Here TPMI provides an
> architectural interface by providing hierarchical tables and fields,
> which will not need any model specific implementation.
> 
> Same value is for Intel Uncore frequency where MSR interface can't
> be used because of multiple domains.
> 
> The TPMI interface uses a PCI VSEC structure to expose the location of
> MMIO region, which is handled by Intel VSEC driver. Intel VSEC driver is
> already present in upstream kernel.
> 
> This series contains the base driver, which parses TPMI MMIO region
> and creates device nodes for supported features. The current set of
> PM feature support includes, Intel Speed Select, RAPL, Uncore frequency
> scaling.
> 
> The first there patches updates Intel VSEC driver to add TPMI VSEC ID
> and enhance to reuse the code.
> The next three patches adds TPMI base driver support.
> The last patch adds MAINTAINERS entry.
> 
> The TPMI documentation can be downloaded from:
> https://github.com/intel/tpmi_power_management
> 
> This series cleanly applies on 6.2-rc1.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> Srinivas Pandruvada (7):
>   platform/x86/intel/vsec: Add TPMI ID
>   platform/x86/intel/vsec: Enhance and Export intel_vsec_add_aux()
>   platform/x86/intel/vsec: Support private data
>   platform/x86/intel: Intel TPMI enumeration driver
>   platform/x86/intel/tpmi: Process CPU package mapping
>   platform/x86/intel/tpmi: ADD tpmi external interface for tpmi feature
>     drivers
>   MAINTAINERS: Add entry for TPMI driver
> 
>  MAINTAINERS                         |   6 +
>  drivers/platform/x86/intel/Kconfig  |  13 +
>  drivers/platform/x86/intel/Makefile |   4 +
>  drivers/platform/x86/intel/tpmi.c   | 415 ++++++++++++++++++++++++++++
>  drivers/platform/x86/intel/vsec.c   |  21 +-
>  drivers/platform/x86/intel/vsec.h   |   6 +
>  include/linux/intel_tpmi.h          |  30 ++
>  7 files changed, 490 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/tpmi.c
>  create mode 100644 include/linux/intel_tpmi.h
> 

