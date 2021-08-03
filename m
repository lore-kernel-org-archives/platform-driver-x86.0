Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B7AC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 21:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AE2F60231
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 21:49:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhHCVuJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 17:50:09 -0400
Received: from mga12.intel.com ([192.55.52.136]:21002 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229745AbhHCVuJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 17:50:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="193387758"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="193387758"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 14:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="419809267"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga003.jf.intel.com with ESMTP; 03 Aug 2021 14:49:56 -0700
Received: from debox1-desk1.jf.intel.com (debox1-desk1.jf.intel.com [10.54.75.53])
        by linux.intel.com (Postfix) with ESMTP id 89C9F58093B;
        Tue,  3 Aug 2021 14:49:56 -0700 (PDT)
Message-ID: <facd47b64a5efa4e0e70cd29586173e44a8929c2.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Fix potential buffer
 overflows
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Evgeny Novikov <novikov@ispras.ru>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc:     David E Box <david.e.box@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Date:   Tue, 03 Aug 2021 14:49:56 -0700
In-Reply-To: <20210803181135.22298-1-novikov@ispras.ru>
References: <20210803181135.22298-1-novikov@ispras.ru>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On Tue, 2021-08-03 at 21:11 +0300, Evgeny Novikov wrote:
> It looks like pmc_core_get_low_power_modes() mixes up modes and
> priorities. In addition to invalid behavior, potentially this can
> cause buffer overflows since the driver reads priorities from the
> register and then it uses them as indexes for array lpm_priority
> that can contain 8 elements at most. The patch swaps modes and
> priorities.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Fixes: 005125bfd70e ("platform/x86: intel_pmc_core: Handle sub-states
> generically")
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c
> b/drivers/platform/x86/intel_pmc_core.c
> index b0e486a6bdfb..667b3df03764 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -1469,8 +1469,8 @@ static void pmc_core_get_low_power_modes(struct
> pmc_dev *pmcdev)
>                 int pri0 = GENMASK(3, 0) & priority;
>                 int pri1 = (GENMASK(7, 4) & priority) >> 4;
>  
> -               lpm_priority[pri0] = mode;
> -               lpm_priority[pri1] = mode + 1;

Agree with the buffer overflow concern if hardware were to return an
incorrect value. But the assignment and indexing are correct. The list
was made to get the modes in priority order which is the order of
states the hardware will attempt to use if able.

I'll submit a patch for the overflow.

David


> +               lpm_priority[mode] = pri0;
> +               lpm_priority[mode + 1] = pri1;
>         }
>  
>         /*


