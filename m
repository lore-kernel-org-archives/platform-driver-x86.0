Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096FAC6379F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Feb 2023 09:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbjBUJlz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Feb 2023 04:41:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbjBUJlx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2023 04:41:53 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C048C2310D
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 01:41:52 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="333949000"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="333949000"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 01:41:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="1000549045"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="1000549045"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2023 01:41:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pUP9h-009uBT-1o;
        Tue, 21 Feb 2023 11:41:49 +0200
Date:   Tue, 21 Feb 2023 11:41:49 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/9] platform/x86: x86-android-tablets: Move into its own
 subdir
Message-ID: <Y/SR3XV5urDF1aKj@smile.fi.intel.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
 <20230220221212.196009-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220221212.196009-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Feb 20, 2023 at 11:12:04PM +0100, Hans de Goede wrote:
> Move the x86-android-tablets code into its own subdir, this is
> a preparation patch for splitting the somewhat large file into
> multiple smaller files.

I'm in favour of the move, but some comments here and there...

...

> +# SPDX-License-Identifier: GPL-2.0+

Perhaps switch to "-or-later"?

...

> +config X86_ANDROID_TABLETS
> +	tristate "X86 Android tablet support"
> +	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB

I'm wondering if we can increase (compile) test coverage by splitting and
refactoring like

	depends on ACPI && EFI
	depends on (I2C && SPI && SERIAL_DEV_BUS && GPIOLIB) || COMPILE_TEST

-- 
With Best Regards,
Andy Shevchenko


