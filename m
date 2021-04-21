Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFA7C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 17:32:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16B2061459
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 17:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235199AbhDURd2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Apr 2021 13:33:28 -0400
Received: from mga03.intel.com ([134.134.136.65]:17539 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235303AbhDURd2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Apr 2021 13:33:28 -0400
IronPort-SDR: o++UO7LnLRZ9V3mVFlAmcjQbqnF6VaXZ0hVnvD/a++hNzYgstFTDHNbSr6RyVnxYACwR44sT70
 gWctEawMoJvw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="195767473"
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; 
   d="scan'208";a="195767473"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 10:32:54 -0700
IronPort-SDR: CDaZpIxq2ZZnt2SZWMmShEx5WpDwsDd1+BtNwR838e8UDi07Erpse9OqKPQ/fKIvvAXbmlB6ik
 +NG0W2+ZJXyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,240,1613462400"; 
   d="scan'208";a="391544525"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2021 10:32:53 -0700
Received: from debox1-desk1.jf.intel.com (debox1-desk1.jf.intel.com [10.54.75.174])
        by linux.intel.com (Postfix) with ESMTP id BE40258090E;
        Wed, 21 Apr 2021 10:32:53 -0700 (PDT)
Message-ID: <eff01b04545eb14f5547b45b1c620e244ce25631.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: add ACPI dependency
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Arnd Bergmann <arnd@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Gayatri Kammela <gayatri.kammela@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 21 Apr 2021 10:32:53 -0700
In-Reply-To: <20210421134957.3329062-1-arnd@kernel.org>
References: <20210421134957.3329062-1-arnd@kernel.org>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for the fix Arnd. Thought I could get away with not adding the
dependency since the function is stubbed but didn't realize struct
acpi_device wouldn't be defined. Should have build tested it.

David

On Wed, 2021-04-21 at 15:49 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver now fails to build without ACPI:
> 
> drivers/platform/x86/intel_pmc_core.c: In function
> 'pmc_core_get_tgl_lpm_reqs':
> drivers/platform/x86/intel_pmc_core.c:617:41: error: invalid use of
> undefined type 'struct acpi_device'
>   617 |         out_obj = acpi_evaluate_dsm(adev->handle,
> &s0ix_dsm_guid, 0,
> 
> This could probably be made optional, but it won't be used without
> ACPI in practice, so just add a Kconfig dependency.
> 
> Fixes: 428131364f00 ("platform/x86: intel_pmc_core: Get LPM
> requirements for Tiger Lake")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig
> b/drivers/platform/x86/Kconfig
> index 697fc446ac41..2714f7c3843e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1194,6 +1194,7 @@ config INTEL_MRFLD_PWRBTN
>  config INTEL_PMC_CORE
>         tristate "Intel PMC Core driver"
>         depends on PCI
> +       depends on ACPI
>         help
>           The Intel Platform Controller Hub for Intel Core SoCs
> provides access
>           to Power Management Controller registers via various
> interfaces. This


