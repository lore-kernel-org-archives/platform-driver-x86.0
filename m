Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18087C28D13
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Aug 2022 15:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242676AbiHYPEk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Aug 2022 11:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242785AbiHYPEW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Aug 2022 11:04:22 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F239B8A44
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 08:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661439858; x=1692975858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OZalt7Mwmo3Par7USUlkx+8Wlhe9D82+kpGrWnA7U7I=;
  b=lVPogN+wZlt7E0/HnK4padqgoQNDOiQF6tHPD8AWBYPdH/wCiwMr6QRs
   sn3XmhxwwAf6HgOsvpTOWOzNAUJdtNrgqHZ5ysC92sunAWuFfxOACYdUS
   mcxsly3sPhldhXxwmUQFhG59BAOLmA0hHed9DwC+pgEcZGwQRpThHdzlY
   sbV1ZQMJrS+iMlh4hvVbqkiFqmFsv41fm/PQlmRjbiZORxjqQNjhJTXxY
   QF7/jSpEAbb/g1snZPnjggVLf0cxsaZ0naAvaFkd0WF3wEJ27yQQV8xb+
   YjQeVUO4y4YEcgp2lqsnuOrQFIJJHMFNb5kOuXd3CTghrJ866BKJrhM6+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="274013397"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="274013397"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 08:04:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="678492137"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 08:04:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oREP0-003RQ7-0m;
        Thu, 25 Aug 2022 18:04:14 +0300
Date:   Thu, 25 Aug 2022 18:04:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/3] platform/x86: msi-laptop: Fix old-ec check for
 backlight registering
Message-ID: <YwePbbTA11UQ3FT0@smile.fi.intel.com>
References: <20220825141336.208597-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825141336.208597-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Aug 25, 2022 at 04:13:34PM +0200, Hans de Goede wrote:
> Commit 2cc6c717799f ("msi-laptop: Port to new backlight interface
> selection API") replaced this check:
> 
> 	if (!quirks->old_ec_model || acpi_video_backlight_support())
> 		pr_info("Brightness ignored, ...");
> 	else
> 		do_register();
> 
> With:
> 
> 	if (quirks->old_ec_model ||
> 	    acpi_video_get_backlight_type() == acpi_backlight_vendor)
> 		do_register();
> 
> But since the do_register() part was part of the else branch, the entire
> condition should be inverted.  So not only the 2 statements on either
> side of the || should be inverted, but the || itself should be replaced
> with a &&.
> 
> In practice this has likely not been an issue because the new-ec models
> (old_ec_model==false) likely all support ACPI video backlight control,
> making acpi_video_get_backlight_type() return acpi_backlight_video
> turning the second part of the || also false when old_ec_model == false.

...

>  	/* Register backlight stuff */
> -
> -	if (quirks->old_ec_model ||
> +	if (quirks->old_ec_model &&
>  	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
>  		struct backlight_properties props;

checkpatch might complain for absence of blank line here, btw. Perhaps
you may just move the above one here at the same patch.

>  		memset(&props, 0, sizeof(struct backlight_properties));

-- 
With Best Regards,
Andy Shevchenko


