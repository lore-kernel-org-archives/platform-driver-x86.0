Return-Path: <SRS0=CVlQ=DC=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE538C4363D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Sep 2020 17:26:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AD7521D42
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Sep 2020 17:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbgIYR0u (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 25 Sep 2020 13:26:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:3512 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729640AbgIYR0u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Sep 2020 13:26:50 -0400
IronPort-SDR: zoF6RbIxbyGVwGnKNmfk4tIRJviFt4NdtDCnWc1wCIj8DKYpkZZ42XetzUkD7hqsiBR8p4weLv
 Mk7TIHqfMqSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="141565414"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
   d="scan'208";a="141565414"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 07:48:35 -0700
IronPort-SDR: QYEhwwYGnWdbVhhU2n3L3MtrvrZzS+ywnP7UW871ZdZo4bYZdLegYqju8wHljjcA31sGWxhn1M
 qULrAnBRac8g==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
   d="scan'208";a="348419567"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 07:48:34 -0700
Received: from localhost (mtg-dev.jf.intel.com [10.54.74.10])
        by smtp.ostc.intel.com (Postfix) with ESMTP id 8E9BE6369;
        Fri, 25 Sep 2020 07:48:34 -0700 (PDT)
Date:   Fri, 25 Sep 2020 07:48:34 -0700
From:   mark gross <mgross@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Mark Gross and Hans de Goede as x86
 platform drivers maintainers
Message-ID: <20200925144834.GC71987@mtg-dev.jf.intel.com>
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
Acked-by: Mark Gross <mgross@linux.intel.com>

thanks!

--mark

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
