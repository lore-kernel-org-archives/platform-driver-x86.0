Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2467DC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 11:35:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D51AF64E06
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 11:35:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233972AbhBCLe6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 06:34:58 -0500
Received: from mga09.intel.com ([134.134.136.24]:7701 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234120AbhBCLez (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 06:34:55 -0500
IronPort-SDR: VrvKHEtQL8ATDyXtz0b4tLZ/Y8dlwPje6Q+nHuZcag9pqKqdAxMgL+VoE54Fj/BBEZS4bviqHe
 gGQ8h88ySHsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="181171175"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="181171175"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 03:33:05 -0800
IronPort-SDR: sILv8woMiG3bCT3377Nmfxf5mQ1ib86LDdb7qFDU2Y54tMOPq7O6TCpLSd1bpph+a0J9ndujr4
 Hrq3yE2bsMEQ==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; 
   d="scan'208";a="433373037"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 03:33:04 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l7GP7-001cWu-OT; Wed, 03 Feb 2021 13:33:01 +0200
Date:   Wed, 3 Feb 2021 13:33:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v1] platform/x86: Kconfig: Surround WMI drivers by 'if
 ACPI_WMI'
Message-ID: <YBqJ7VmchoG6Kt8t@smile.fi.intel.com>
References: <20210126140052.3451769-1-andriy.shevchenko@linux.intel.com>
 <3578abae-bf14-c3fe-7726-25358e8993ea@redhat.com>
 <6b88be94-cc9c-e86c-82bc-f0d72e0c1c4f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b88be94-cc9c-e86c-82bc-f0d72e0c1c4f@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Feb 03, 2021 at 11:55:40AM +0100, Hans de Goede wrote:
> On 2/3/21 11:48 AM, Hans de Goede wrote:
> > On 1/26/21 3:00 PM, Andy Shevchenko wrote:
> >> Surround WMI drivers by 'if ACPI_WMI' instead of depending
> >> each of them separately.
> > 
> > This does not cover all drivers which depend on ACPI_WMI; and in
> > for-next there is a new UV_SYSFS Kconfig symbol in the middle of
> > the block which you are surrounding with if ACPI_WMI .. endif
> > and that new Kconfig symbol does not depend on ACPI_WMI.
> > 
> > Admittedly I should have payed more attention when the UV_SYSFS
> > symbol was merged, but atm there is no real ordering in the
> > Kconfig symbols.
> 
> Ok, so I just checked the Makefile and noticed that there is
> an ordering there. But most people start with looking at Kconfig
> when adding a new driver and the ordering is very much not clear
> there. Also splitting the Intel bits in three groups does not
> necessariyl help IMHO. E.g  CONFIG_INTEL_CHT_INT33FE is in the
> generic Intel block but it is definitely PMIC related.
> 
> And the WMI drivers are grouped, except that some of them
> (Asus, Dell, EEEPC at least) are not in the group...
> 
> So I still think just sorting the entire bups alphabetically
> is better. We can then also add a comment at the top to please
> keep things sorted alphabetically.

In long term I prefer split the entire folder to subfolders where you create
a new Kconfig with a rules like alphabetical order or so.

Shuffling now Kconfig and Makefile w/o above doesn't bring a value in my
opinion.


-- 
With Best Regards,
Andy Shevchenko


