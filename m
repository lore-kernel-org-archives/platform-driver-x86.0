Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3CCC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Nov 2022 11:38:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiK1LiU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Nov 2022 06:38:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiK1LiT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Nov 2022 06:38:19 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48EA2BE
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 03:38:18 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="294514344"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="294514344"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 03:38:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="768014617"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="768014617"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 28 Nov 2022 03:38:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ozcSl-0016ng-2N;
        Mon, 28 Nov 2022 13:38:15 +0200
Date:   Mon, 28 Nov 2022 13:38:15 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add Lenovo Yoga Tab 3
 (YT3-X90F) charger + fuel-gauge data
Message-ID: <Y4Sdp8AMOYAbRbil@smile.fi.intel.com>
References: <20221127182458.104528-1-hdegoede@redhat.com>
 <Y4SLhlW1t5epgamh@smile.fi.intel.com>
 <58a7f20d-dd47-1ffc-f7b2-f1d30a0a7d69@redhat.com>
 <Y4SVh6qV7Se2Qc3k@smile.fi.intel.com>
 <0c686ea2-338b-28cf-688f-13d99ca92611@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c686ea2-338b-28cf-688f-13d99ca92611@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Nov 28, 2022 at 12:24:59PM +0100, Hans de Goede wrote:
> On 11/28/22 12:03, Andy Shevchenko wrote:
> > On Mon, Nov 28, 2022 at 11:44:36AM +0100, Hans de Goede wrote:
> >> On 11/28/22 11:20, Andy Shevchenko wrote:
> >>> On Sun, Nov 27, 2022 at 07:24:58PM +0100, Hans de Goede wrote:

...

> >>>> +	/*
> >>>> +	 * The "bq25892_0" charger IC has its /CE (Charge-Enable) and OTG pins
> >>>> +	 * connected to GPIOs, rather then having them hardwired to the correct
> >>>> +	 * values as is normally done.
> >>>> +	 *
> >>>> +	 * The bq25890_charger driver controls these through I2C, but this only
> >>>> +	 * works if not overridden by the pins. Set these pins here:
> >>>> +	 * 1. Set /CE to 0 to allow charging.
> >>>
> >>> If I read this correctly then the /CE is an active low pin and setting to 0
> >>> means active state
> >>
> >> Correct.
> >>
> >>> which...
> >>>
> >>>> +	 * 2. Set OTG to 0 disable V5 boost output since the 5V boost output of
> >>>> +	 *    the main "bq25892_1" charger is used when necessary.
> >>>> +	 */
> >>>> +
> >>>> +	/* /CE pin */
> >>>> +	ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, &gpiod);
> >>>> +	if (ret < 0)
> >>>> +		return ret;
> >>>
> >>>> +	gpiod_set_value(gpiod, 0);
> >>>
> >>> ...contradicts with the virtual state here. Perhaps you missed the
> >>> corresponding flag to enable negation?
> >>
> >> x86_android_tablet_get_gpiod() gets the GPIO directly from
> >> the gpio-chip using gpiochip_get_desc() since these GPIOs are
> >> not described in ACPI. There is no option to pass a gpio_lookup_flags
> >> flag like GPIO_ACTIVE_LOW this way since we are not doing an actual lookup.
> > 
> > gpiod_toggle_active_low() is your friend, no?
> 
> Note that the GPIO is never actually requested and doing
> gpiod_toggle_active_low() on a non requested gpio_desc is not nice.
> 
> Normally the GPIO_ACTIVE_LOW flag gets cleared on gpiod_free() to
> leave it in a clean state for any future users, so we would need to
> do something like:
> 
> gpiod_toggle_active_low(gpiod);
> gpiod_set_value(gpiod, 1);
> gpiod_toggle_active_low(gpiod);
> 
> or actually request the GPIO, which means adding an lenovo_yt3_exit()
> to unrequest them; and adding a global lenovo_yt3_gpios[] variable
> to store the descs in between init + exit.
> 
> This is something which I did consider, since it would also list
> the GPIOs in /sys/kernel/debug/gpio which would be somewhat nice,
> otoh it is a bunch of extra code just for getting the GPIOs
> listed in  debugfs file.
> 
> Still if you really want me to mark it as active-low I believe
> that doing a proper request of the GPIO + free on exit() is
> the right way to go here.  That or just leave this as is in
> this version 1 of this patch.
> 
> Please let me know how you want to proceed with this.

I do not insist, but my objection here is the terminology (active state,
inactive state vs. 0, 1 or other way around) and inconsistency with what you
put as a value and what comment says taking into account / (or
negation) of the real signal.

Ideally yes, would be nice to have it indeed requested since it's in use even
from the Linux kernel perspective (one may debug its usage or see via user
space, note as well that non-requested pin maybe easily altered in the Linux).

But if you guarantee nothing of this happens, feel free to amend the comment
to make it more clear and proceed.

> >>>> +	ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, &gpiod);
> >>>> +	if (ret < 0)
> >>>> +		return ret;
> >>>> +
> >>>> +	gpiod_set_value(gpiod, 0);

-- 
With Best Regards,
Andy Shevchenko


