Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293E1C11F68
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Jul 2021 10:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 058F0613FA
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Jul 2021 10:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhGBKEK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Jul 2021 06:04:10 -0400
Received: from mga04.intel.com ([192.55.52.120]:52125 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231302AbhGBKEJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Jul 2021 06:04:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="206885169"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="206885169"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 03:01:38 -0700
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="477149988"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 03:01:36 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lzFzH-007eep-NY; Fri, 02 Jul 2021 13:01:31 +0300
Date:   Fri, 2 Jul 2021 13:01:31 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Gayatri Kammela <gayatri.kammela@intel.com>
Cc:     platform-driver-x86@vger.kernel.org, mgross@linux.intel.com,
        hdegoede@redhat.com, irenic.rajneesh@gmail.com,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        David Box <david.e.box@intel.com>
Subject: Re: [PATCH v1 0/4] Add Alder Lake PCH-S support to PMC core driver
Message-ID: <YN7j+2zBmQlmBUzG@smile.fi.intel.com>
References: <cover.1625191274.git.gayatri.kammela@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1625191274.git.gayatri.kammela@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 01, 2021 at 07:19:59PM -0700, Gayatri Kammela wrote:
> Hi,
> The patch series add Alder Lake PCH-S support to PMC core driver.
> 
> Patch 1: Add Alderlake support to pmc_core driver
> Patch 2: Add Latency Tolerance Reporting (LTR) support to Alder Lake
> Patch 3: Add Alder Lake low power mode support for pmc_core
> Patch 4: Add GBE Package C10 fix for Alder Lake

I have seen only three out of four patches. I think to avoid such you better
use --cc parameter to the `git send-email ...` (Or you may utilize the script
I'm using myself:
https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh).

Nevertheless, before doing anything on this, can you move the stuff under
drivers/platform/x86/intel/pmc/ first, please?

-- 
With Best Regards,
Andy Shevchenko


