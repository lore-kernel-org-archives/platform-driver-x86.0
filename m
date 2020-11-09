Return-Path: <SRS0=xf+z=EP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B2AC2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 11:52:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA9C7206C0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 11:52:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729370AbgKILwQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Nov 2020 06:52:16 -0500
Received: from mga01.intel.com ([192.55.52.88]:40510 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729366AbgKILwQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 06:52:16 -0500
IronPort-SDR: gTKeD3zBX+Ym+H1bAkQffmLA/Awjzq0PKVFxSTjHlxa9zhKRa2V5qiBuHbxADsRWEsGrT8a5aN
 bPYle25uwl7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="187736139"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="187736139"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 03:52:15 -0800
IronPort-SDR: Lv7xUhZHJ6ZeQYNFPNyBhh9yF/RiC6TucB8tQ6vvcDzVwAI5/JfyDwkI3XK/mTOoBpvS5fGJTE
 0qaxXUhVCfnw==
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="472941721"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 03:52:14 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kc5jY-005AWD-OR; Mon, 09 Nov 2020 13:53:16 +0200
Date:   Mon, 9 Nov 2020 13:53:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v1 3/4] platform/x86: i2c-multi-instantiate: Make number
 of clients unsigned
Message-ID: <20201109115316.GA4077@smile.fi.intel.com>
References: <20201105110530.27888-1-andriy.shevchenko@linux.intel.com>
 <20201105110530.27888-3-andriy.shevchenko@linux.intel.com>
 <f1ca37a0-85db-0edd-7f4c-14143254ebfe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1ca37a0-85db-0edd-7f4c-14143254ebfe@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Nov 09, 2020 at 12:39:45PM +0100, Hans de Goede wrote:
> On 11/5/20 12:05 PM, Andy Shevchenko wrote:
> > There is no need to use signed type for number of clients. Moreover,
> > it's cleaner to show that we never go negative there.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I'm not a big fan of this change, it feels like needless churn to me.

Feel free to not apply it. I think I don't need to resend w/o it (IIRC the rest
pretty much independent of this change). But if you need a v2, tell me.

> Integers are signed by default and just because a value cannot become
> negative is not really a reason to make it unsigned. E.g. your typical
> "int i" is often used as an array index so it cannot go negative, still
> it almost always is an "int i" not an "unsigned int i".
> 
> IMHO good reasons for deviating from the default signedness and
> making a value unsigned are:
> 
> 1. Because the value cannot go negative and we need more range.
> 2. To avoid sign-extension when upcasting it to a larger integer type.
> 
> Neither is the case here.

I consider one more, i.e. if we know that value may not be negative the
unsigned type gives a hint. I always stumbled over signed integers used for
loop counters since they confuse me (Q in mind: "should I read code carefully
and check if it may or may not be signed? Why it's signed?").

That's why I like the idea of be a bit stricter about types.

Hope this explains my motivation.

> I do like the other 3 patches, thank you for those. I'm going to wait
> a bit with applying them though, to see where things go with the
> "[RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode to instantiated i2c-clients"
> 
> Merging them now may get in the way with merging that series if
> Wolfram wants to pick up the entire series (since it also involves
> an i2c-core change).

Usually I expect that RFC has less priority than normal series and I wouldn't
expect any maintainer (with some rare exceptions) to take series marked as RFC.
And TBH I was wondering why you marked them as such, to me that was fine to
send as normal one.

Thanks for the review!

-- 
With Best Regards,
Andy Shevchenko


