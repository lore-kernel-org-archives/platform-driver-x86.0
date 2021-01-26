Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F178EC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 01:05:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAF4E206A1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 01:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390060AbhA0BD5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jan 2021 20:03:57 -0500
Received: from mga06.intel.com ([134.134.136.31]:27230 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727831AbhAZWCA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 17:02:00 -0500
IronPort-SDR: cEgNN3N+CzRq/7NDT/KN08hK/cDVSkFrcoVU3D2VzpRWV/PsgM3Ld5uYqWuEnsmE/mtzRqxE9x
 c3DyyDw47Opw==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="241508067"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; 
   d="scan'208";a="241508067"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 14:00:10 -0800
IronPort-SDR: AFz7R2ksriA2vwmIk/CN8ZQQkC2qEXvnRS930791YbIObtBRPGRzNuxIhQwFDVrr3nY3kqq3RX
 glSi27bOH03A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; 
   d="scan'208";a="402887935"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2021 14:00:07 -0800
Received: from debox1-desk1.jf.intel.com (debox1-desk1.jf.intel.com [10.54.75.143])
        by linux.intel.com (Postfix) with ESMTP id 90FBA58010C;
        Tue, 26 Jan 2021 14:00:07 -0800 (PST)
Message-ID: <c7099bece001aa0803c8357a44b114d2d26e94e4.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: pmt: Make PMT Kconfig options depend on
 INTEL_PMT_CLASS
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 26 Jan 2021 14:00:07 -0800
In-Reply-To: <20210126202042.95301-1-hdegoede@redhat.com>
References: <20210126202042.95301-1-hdegoede@redhat.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

Sorry for missing the discussion on this. Need to fix my mail
filtering. I just submitted patches that instead make INTEL_PMT_CLASS
non-user-selectable, leaving the other dependencies in place. Having
the class driver user-selectable was a mistake.

I also did go ahead and add a dependancy on the MFD driver since all
current PMT features are only exposed through this driver. So users
will only see the following options:

MFD_INTEL_PMT
	INTEL_PMT_TELEMETRY (selects INTEL_PMT_CLASS)
	INTEL_PMT_CRASHLOG (selects INTEL_PMT_CLASS)

David

On Tue, 2021-01-26 at 21:20 +0100, Hans de Goede wrote:
> Make the PMT Kconfig options depend on INTEL_PMT_CLASS instead of
> selecting it. Select should only be used with hidden options and
> INTEL_PMT_CLASS is not hidden.
> 
> This will stop Kconfig from asking if INTEL_PMT_TELEMETRY and
> INTEL_PMT_CRASHLOG should be enabled after the user says no
> to the INTEL_PMT_CLASS prompt.
> 
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Cc: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig
> b/drivers/platform/x86/Kconfig
> index 9a73e7baa344..d4f32fc0e40e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1383,7 +1383,7 @@ config INTEL_PMT_CLASS
>  
>  config INTEL_PMT_TELEMETRY
>         tristate "Intel Platform Monitoring Technology (PMT)
> Telemetry driver"
> -       select INTEL_PMT_CLASS
> +       depends on INTEL_PMT_CLASS
>         help
>           The Intel Platform Monitory Technology (PMT) Telemetry
> driver provides
>           access to hardware telemetry metrics on devices that
> support the
> @@ -1394,7 +1394,7 @@ config INTEL_PMT_TELEMETRY
>  
>  config INTEL_PMT_CRASHLOG
>         tristate "Intel Platform Monitoring Technology (PMT) Crashlog
> driver"
> -       select INTEL_PMT_CLASS
> +       depends on INTEL_PMT_CLASS
>         help
>           The Intel Platform Monitoring Technology (PMT) crashlog
> driver provides
>           access to hardware crashlog capabilities on devices that
> support the


