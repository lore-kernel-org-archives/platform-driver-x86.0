Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA69C43217
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Nov 2022 11:04:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiK1LEC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Nov 2022 06:04:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiK1LEA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Nov 2022 06:04:00 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1271839A
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 03:03:59 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="295189508"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="295189508"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 03:03:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="637182980"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="637182980"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 28 Nov 2022 03:03:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ozbvD-0015lp-10;
        Mon, 28 Nov 2022 13:03:35 +0200
Date:   Mon, 28 Nov 2022 13:03:35 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add Lenovo Yoga Tab 3
 (YT3-X90F) charger + fuel-gauge data
Message-ID: <Y4SVh6qV7Se2Qc3k@smile.fi.intel.com>
References: <20221127182458.104528-1-hdegoede@redhat.com>
 <Y4SLhlW1t5epgamh@smile.fi.intel.com>
 <58a7f20d-dd47-1ffc-f7b2-f1d30a0a7d69@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58a7f20d-dd47-1ffc-f7b2-f1d30a0a7d69@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Nov 28, 2022 at 11:44:36AM +0100, Hans de Goede wrote:
> On 11/28/22 11:20, Andy Shevchenko wrote:
> > On Sun, Nov 27, 2022 at 07:24:58PM +0100, Hans de Goede wrote:

...

> >> +	/*
> >> +	 * The "bq25892_0" charger IC has its /CE (Charge-Enable) and OTG pins
> >> +	 * connected to GPIOs, rather then having them hardwired to the correct
> >> +	 * values as is normally done.
> >> +	 *
> >> +	 * The bq25890_charger driver controls these through I2C, but this only
> >> +	 * works if not overridden by the pins. Set these pins here:
> >> +	 * 1. Set /CE to 0 to allow charging.
> > 
> > If I read this correctly then the /CE is an active low pin and setting to 0
> > means active state
> 
> Correct.
> 
> > which...
> > 
> >> +	 * 2. Set OTG to 0 disable V5 boost output since the 5V boost output of
> >> +	 *    the main "bq25892_1" charger is used when necessary.
> >> +	 */
> >> +
> >> +	/* /CE pin */
> >> +	ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, &gpiod);
> >> +	if (ret < 0)
> >> +		return ret;
> > 
> >> +	gpiod_set_value(gpiod, 0);
> > 
> > ...contradicts with the virtual state here. Perhaps you missed the
> > corresponding flag to enable negation?
> 
> x86_android_tablet_get_gpiod() gets the GPIO directly from
> the gpio-chip using gpiochip_get_desc() since these GPIOs are
> not described in ACPI. There is no option to pass a gpio_lookup_flags
> flag like GPIO_ACTIVE_LOW this way since we are not doing an actual lookup.

gpiod_toggle_active_low() is your friend, no?

> >> +	ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, &gpiod);
> >> +	if (ret < 0)
> >> +		return ret;
> >> +
> >> +	gpiod_set_value(gpiod, 0);

-- 
With Best Regards,
Andy Shevchenko


