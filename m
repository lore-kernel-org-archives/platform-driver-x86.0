Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B541C636C9
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 15:32:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F8D86109E
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 15:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234458AbhGQPfq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Jul 2021 11:35:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25585 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234432AbhGQPfq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Jul 2021 11:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626535969;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kPx5lscN4uL5j5r5RwYLU17Da84bWZ603ZzJhrNc8ho=;
        b=MBK4JMQmKA1SlMNudlkuiAk/jVkgbY2TK3FdMz03znY6x+O4EujhrJKUq8QoHyfxBRd6D/
        8LrOLM9TSdw/dQBabbqjPO0jpRT93mDjDxLnpHKBSmFxyuHBvTgyfBL0tB4JKtXFuVRVv1
        Ykx0Gr2HNYFX8EVAMspmuYwmuUC04iw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-7tc6oHRnOAe6FGsyG8TduQ-1; Sat, 17 Jul 2021 11:32:47 -0400
X-MC-Unique: 7tc6oHRnOAe6FGsyG8TduQ-1
Received: by mail-ed1-f70.google.com with SMTP id f20-20020a0564020054b0290395573bbc17so6443357edu.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jul 2021 08:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kPx5lscN4uL5j5r5RwYLU17Da84bWZ603ZzJhrNc8ho=;
        b=hH0sFS2rva7YojtgyZTNW0TKypdYog6i8ybnaKSNqcOxxjNtIqQS6CrK2glzute7cM
         OcIqkSMMqEAOx/gVTkxIq4aUusyC7MSPTAFsLhkm4qiffmZqkwo847ldvEthq7/o9hsM
         2NB/aKAtoRicvCyyJNk89pGRGaTbxWqAYMf1N5bY6CBjC3DHV9Y4MxfPSgp94v5ruDOF
         zbpBG6Wcm9shdKys2tGtWCSllF+yNwLKTk5X0G43SWkgnhhjvTxH87ymXDBt+0yra6Bo
         xS/1ZOsFAb7OlcBtXFKgKPr68TL30Q++LQOmVjNZNwKN/sv4grT349WfDPtAoN1+Pkq7
         2VxQ==
X-Gm-Message-State: AOAM530B38CLJJ35KxMZ5iIhp5GrXYw/s1CqT/3NmI0WPZNpfzo53sg8
        T4HKt/10tursEglHYS4LwbyV+YV5PP9JRCAyyHZLrNg9L4p9W9LyMwGPdgyb9GKMpkIyEFoGeGU
        QNBHmfNLfU3dBFnZQBE4qDNUVLOGtj19UNQ==
X-Received: by 2002:a05:6402:2899:: with SMTP id eg25mr22305931edb.13.1626535966439;
        Sat, 17 Jul 2021 08:32:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvEeHXTbnIqQjLgBnN+499hJOrKn4KHt9H2RXK7mwNrjqaOTiZ0IrY5GKZmGSI1sZuXHL1Vg==
X-Received: by 2002:a05:6402:2899:: with SMTP id eg25mr22305916edb.13.1626535966309;
        Sat, 17 Jul 2021 08:32:46 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b10sm5014305edd.91.2021.07.17.08.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 08:32:46 -0700 (PDT)
Subject: Re: [PATCH v5 0/5] Add Alder Lake PCH-S support to PMC core driver
To:     Gayatri Kammela <gayatri.kammela@intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com, irenic.rajneesh@gmail.com,
        andriy.shevchenko@linux.intel.com, vicamo.yang@canonical.com,
        srinivas.pandruvada@intel.com, david.e.box@intel.com,
        linux-kernel@vger.kernel.org, tamar.mashiah@intel.com,
        gregkh@linuxfoundation.org, rajatja@google.com,
        Shyam-sundar.S-k@amd.com, Alexander.Deucher@amd.com,
        mlimonci@amd.com
References: <cover.1626459866.git.gayatri.kammela@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2a5ef70e-7194-1dcf-6653-9901c7470ace@redhat.com>
Date:   Sat, 17 Jul 2021 17:32:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1626459866.git.gayatri.kammela@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/16/21 8:38 PM, Gayatri Kammela wrote:
> Hi,
> The patch series move intel_pmc_core* files to pmc subfolder as well as
> add Alder Lake PCH-S support to PMC core driver.
> 
> Patch 1: Move intel_pmc_core* files to pmc subfolder
> Patch 2: Add Alderlake support to pmc core driver
> Patch 3: Add Latency Tolerance Reporting (LTR) support to Alder Lake
> Patch 4: Add Alder Lake low power mode support for pmc core
> Patch 5: Add GBE Package C10 fix for Alder Lake
> 
> Changes since v1:
> 1) Add patch 1 to v2 i.e., Move intel_pmc_core* files to pmc subfolder.
> 2) Modify commit message for patch 2.
> 
> Changes since v2:
> 1) Dropped intel_pmc_ prefix from the file names.
> 
> Changes since v3:
> 1) Fixed an error reported by lkp.
> 
> Changes since v4:
> 1) Updated MAINTAINERS
> 
> 
> David E. Box (1):
>   platform/x86/intel: pmc/core: Add GBE Package C10 fix for Alder Lake
>     PCH
> 
> Gayatri Kammela (4):
>   platform/x86/intel: intel_pmc_core: Move intel_pmc_core* files to pmc
>     subfolder
>   platform/x86/intel: pmc/core: Add Alderlake support to pmc core driver
>   platform/x86/intel: pmc/core: Add Latency Tolerance Reporting (LTR)
>     support to Alder Lake
>   platform/x86/intel: pmc/core: Add Alder Lake low power mode support
>     for pmc core
> 
>  MAINTAINERS                                   |   2 +-
>  drivers/platform/x86/Kconfig                  |  21 --
>  drivers/platform/x86/Makefile                 |   1 -
>  drivers/platform/x86/intel/Kconfig            |   1 +
>  drivers/platform/x86/intel/Makefile           |   1 +
>  drivers/platform/x86/intel/pmc/Kconfig        |  22 ++
>  drivers/platform/x86/intel/pmc/Makefile       |   5 +
>  .../{intel_pmc_core.c => intel/pmc/core.c}    | 309 +++++++++++++++++-
>  .../{intel_pmc_core.h => intel/pmc/core.h}    |  17 +
>  .../pmc/pltdrv.c}                             |   0
>  10 files changed, 352 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/pmc/Kconfig
>  create mode 100644 drivers/platform/x86/intel/pmc/Makefile
>  rename drivers/platform/x86/{intel_pmc_core.c => intel/pmc/core.c} (85%)
>  rename drivers/platform/x86/{intel_pmc_core.h => intel/pmc/core.h} (95%)
>  rename drivers/platform/x86/{intel_pmc_core_pltdrv.c => intel/pmc/pltdrv.c} (100%)
> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: David Box <david.e.box@intel.com>
> Cc: You-Sheng Yang <vicamo.yang@canonical.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
> 
> base-commit: d936eb23874433caa3e3d841cfa16f5434b85dcf

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

