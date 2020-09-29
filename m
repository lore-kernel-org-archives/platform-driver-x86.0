Return-Path: <SRS0=2mT5=DG=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C528CC4727C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Sep 2020 18:27:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 544DD20936
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Sep 2020 18:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgI2S06 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Sep 2020 14:26:58 -0400
Received: from mga07.intel.com ([134.134.136.100]:36040 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727605AbgI2S05 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Sep 2020 14:26:57 -0400
IronPort-SDR: XI/g0QNXxTxfJYXYcydUfzFDY+bcHPIviPLDWoQr0b6ACWeFKl0xexhxIcT06F8QuueJiQBN37
 fyNpE/mcaKkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="226408248"
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; 
   d="scan'208";a="226408248"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 11:26:53 -0700
IronPort-SDR: E3h5pjNUa2k+hsVPeVabMItukvnrZg0HsmZjP1N0nonohx9YakaAVFK/G4Ul0Iifd01TmF8eHt
 +7kEoHWx0L5A==
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; 
   d="scan'208";a="293750018"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 11:26:52 -0700
Received: from localhost (mtg-dev.jf.intel.com [10.54.74.10])
        by smtp.ostc.intel.com (Postfix) with ESMTP id D8AAF6369;
        Tue, 29 Sep 2020 11:26:50 -0700 (PDT)
Date:   Tue, 29 Sep 2020 11:26:50 -0700
From:   mark gross <mgross@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Mark Gross and Hans de Goede as x86
 platform drivers maintainers
Message-ID: <20200929182650.GC19084@mtg-dev.jf.intel.com>
Reply-To: mgross@linux.intel.com
References: <20200925065812.3973-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925065812.3973-1-hdegoede@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Acked-by: Mark Gross <mgross@linux.intel.com>

sorry if this is a duplicate reply.

--mark

On Fri, Sep 25, 2020 at 08:58:12AM +0200, Hans de Goede wrote:
> Darren Hart and Andy Shevchenko lately have not had enough time to
> maintain the x86 platform drivers, dropping their status to:
> "Odd Fixes".
> 
> Mark Gross and Hans de Goede will take over maintainership of
> the x86 platform drivers. Replace Darren and Andy's entries with
> theirs and change the status to "Maintained".
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ab6570bb2d14..1ff02b889f49 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18894,10 +18894,10 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/mm
>  F:	arch/x86/mm/
>  
>  X86 PLATFORM DRIVERS
> -M:	Darren Hart <dvhart@infradead.org>
> -M:	Andy Shevchenko <andy@infradead.org>
> +M:	Hans de Goede <hdegoede@redhat.com>
> +M:	Mark Gross <mgross@linux.intel.com>
>  L:	platform-driver-x86@vger.kernel.org
> -S:	Odd Fixes
> +S:	Maintained
>  T:	git git://git.infradead.org/linux-platform-drivers-x86.git
>  F:	drivers/platform/olpc/
>  F:	drivers/platform/x86/
> -- 
> 2.28.0
> 
