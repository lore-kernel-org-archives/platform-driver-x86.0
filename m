Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FA5C07E99
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Jul 2021 10:58:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 791836135B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Jul 2021 10:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhGELB0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Jul 2021 07:01:26 -0400
Received: from mail-pf1-f180.google.com ([209.85.210.180]:37866 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbhGELB0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Jul 2021 07:01:26 -0400
Received: by mail-pf1-f180.google.com with SMTP id 17so16155215pfz.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Jul 2021 03:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vgGsfXVeeB+tZ4bygz3ZO5Q0Rx8J7kY+Q6+Seq/FkFs=;
        b=ciC9MXEYvj3hkttbuVSvokbNIFA2EGz+ky1p0X7WjYtwoY00QFADWVtVI02PGYPiav
         PKBUBP4mzQtr/YjgDo69LRvltMIRlUUirXtch2uPS7t++tansAOraKmyqMfh5xlnxoVF
         QDzTrecBplFbPfP1CRc8G8dPAa+s7Ztcq5LUt+PaNvM1zn5IPOTmSaHtBDthiF1hrEJF
         l1gWqtRpHFQNzxeqNP/zDQ5mSWVxTxQ1rtMvwe7WHfF/wivwcz5gHUjYqNGVAzHGW1s1
         r9RcVKm2vnWql+6Trj8S4St9SAcd4RQL0o2pWjBHxY/S4oqX6zsp0UcHMfiU/Sc/IoFp
         DX2A==
X-Gm-Message-State: AOAM533JTFmJ4eL4CdvfDFR4dC5uiRkwZJpn/viNLLfps/j6mNYX8hS4
        I0vTSwjbypkE0ssqqXxjCAY=
X-Google-Smtp-Source: ABdhPJzPF9ad+W3ibgFxGI2PaHJiwnVyUkSe1XNLjENOjUYqWbOnjLlpJB2097wfuqvhDYnrVN6TjQ==
X-Received: by 2002:a65:4109:: with SMTP id w9mr14849908pgp.24.1625482729186;
        Mon, 05 Jul 2021 03:58:49 -0700 (PDT)
Received: from [10.101.46.79] (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id 195sm12602138pfw.133.2021.07.05.03.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 03:58:48 -0700 (PDT)
Subject: Re: [PATCH v1 0/4] Add Alder Lake PCH-S support to PMC core driver
To:     Gayatri Kammela <gayatri.kammela@intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com, hdegoede@redhat.com,
        irenic.rajneesh@gmail.com,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Box <david.e.box@intel.com>
References: <cover.1625191274.git.gayatri.kammela@intel.com>
From:   You-Sheng Yang <vicamo.yang@canonical.com>
Message-ID: <21ab8bdf-cc5e-55bd-6f82-bc267100d732@canonical.com>
Date:   Mon, 5 Jul 2021 18:58:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1625191274.git.gayatri.kammela@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi, this works for me.

Tested-By: You-Sheng Yang <vicamo.yang@canonical.com>

On 7/2/21 10:19 AM, Gayatri Kammela wrote:
> Hi,
> The patch series add Alder Lake PCH-S support to PMC core driver.
> 
> Patch 1: Add Alderlake support to pmc_core driver
> Patch 2: Add Latency Tolerance Reporting (LTR) support to Alder Lake
> Patch 3: Add Alder Lake low power mode support for pmc_core
> Patch 4: Add GBE Package C10 fix for Alder Lake
> 
> David E. Box (1):
>   platform/x86: intel_pmc_core: Add GBE Package C10 fix for Alder Lake
>     PCH
> 
> Gayatri Kammela (3):
>   platform/x86: intel_pmc_core: Add Alderlake support to pmc_core driver
>   platform/x86: intel_pmc_core: Add Latency Tolerance Reporting (LTR)
>     support to Alder Lake
>   platform/x86: intel_pmc_core: Add Alder Lake low power mode support
>     for pmc_core
> 
>  drivers/platform/x86/intel_pmc_core.c | 307 +++++++++++++++++++++++++-
>  drivers/platform/x86/intel_pmc_core.h |  17 ++
>  2 files changed, 321 insertions(+), 3 deletions(-)
> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: David Box <david.e.box@intel.com>
> 
> base-commit: 62fb9874f5da54fdb243003b386128037319b219
> 
