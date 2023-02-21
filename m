Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F1EC64EC4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Feb 2023 10:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbjBUKEX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Feb 2023 05:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233773AbjBUKEW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2023 05:04:22 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6678CBB87
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 02:04:21 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="360061584"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="360061584"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 02:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="795467364"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="795467364"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 21 Feb 2023 02:04:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pUPVS-009ub8-1N;
        Tue, 21 Feb 2023 12:04:18 +0200
Date:   Tue, 21 Feb 2023 12:04:18 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 8/9] platform/x86: x86-android-tablets: Add gpio_keys
 support to x86_android_tablet_init()
Message-ID: <Y/SXIoUsoC1jI12r@smile.fi.intel.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
 <20230220221212.196009-9-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220221212.196009-9-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Feb 20, 2023 at 11:12:11PM +0100, Hans de Goede wrote:
> Add gpio_keys instantation support to x86_android_tablet_init(), to avoid
> this having to be repeated in various x86_dev_info.init() functions.

...

> +	.gpio_keys_button = &asus_me176c_tf103c_lid,
> +	.gpio_keys_gpiochip = "INT33FC:02",
> +	.gpio_keys_pin = 12,

Maybe

struct x86_gpio_button {
	struct gpio_keys_button *button;
	const char *chip;
	int pin;
};

	.button = {
		.button = ,
		.chip = ,
		.pin = ,
	},

?

-- 
With Best Regards,
Andy Shevchenko


