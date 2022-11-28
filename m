Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C9CC43217
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Nov 2022 10:21:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbiK1KU7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Nov 2022 05:20:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiK1KU6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Nov 2022 05:20:58 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038441A386
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 02:20:58 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="294500512"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="294500512"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2022 02:20:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="785573922"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="785573922"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2022 02:20:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ozbFv-0014eN-0g;
        Mon, 28 Nov 2022 12:20:55 +0200
Date:   Mon, 28 Nov 2022 12:20:54 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add Lenovo Yoga Tab 3
 (YT3-X90F) charger + fuel-gauge data
Message-ID: <Y4SLhlW1t5epgamh@smile.fi.intel.com>
References: <20221127182458.104528-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127182458.104528-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Nov 27, 2022 at 07:24:58PM +0100, Hans de Goede wrote:
> The Lenovo Yoga Tab 3 (YT3-X90F) is an Intel Cherry Trail based tablet
> which ships with Android as Factory OS. Its DSDT contains a bunch of I2C
> devices which are not actually there, causing various resource conflicts.
> Use acpi_quirk_skip_i2c_client_enumeration() to not enumerate these.
> 
> The YT3-X90F has quite a bit of exotic hardware, this adds initial
> support by manually instantiating the i2c-clients for the 2 charger +
> 2 fuel-gauge chips used for the 2 batteries.
> 
> Support for other parts of the hw will be added by follow-up patches.

...

> +	/*
> +	 * The "bq25892_0" charger IC has its /CE (Charge-Enable) and OTG pins
> +	 * connected to GPIOs, rather then having them hardwired to the correct
> +	 * values as is normally done.
> +	 *
> +	 * The bq25890_charger driver controls these through I2C, but this only
> +	 * works if not overridden by the pins. Set these pins here:
> +	 * 1. Set /CE to 0 to allow charging.

If I read this correctly then the /CE is an active low pin and setting to 0
means active state which...

> +	 * 2. Set OTG to 0 disable V5 boost output since the 5V boost output of
> +	 *    the main "bq25892_1" charger is used when necessary.
> +	 */
> +
> +	/* /CE pin */
> +	ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, &gpiod);
> +	if (ret < 0)
> +		return ret;

> +	gpiod_set_value(gpiod, 0);

...contradicts with the virtual state here. Perhaps you missed the
corresponding flag to enable negation?

> +	/* OTG pin */
> +	ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, &gpiod);
> +	if (ret < 0)
> +		return ret;
> +
> +	gpiod_set_value(gpiod, 0);

-- 
With Best Regards,
Andy Shevchenko


