Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774F9E92FFD
	for <platform-driver-x86@archiver.kernel.org>; Sat,  7 Oct 2023 07:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343670AbjJGH0A (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 7 Oct 2023 03:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343632AbjJGHZ7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Oct 2023 03:25:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFD4B9;
        Sat,  7 Oct 2023 00:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696663558; x=1728199558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J282I5R9WNoyobuH7Ogbg9U0iV/eHTpeZxVkwzl1QWA=;
  b=N8E6Rki+v34L3ysgoaZN4BosEwukqSWvzgAU8i5c6V56DPEBYgegNLhX
   vDjIZWC032r/zEb4kr/3v2Vg0ZZHIBMxcp8u8FCxP6rA1bC27jCtmHufH
   bBKGe+uPVSRsSVbmnKdlNZl169RdLs1mMJJnvMklFYBQ3HV/uwG8qticO
   hRoyxhNje/NqnbD6+9AMf95b+dbyPL8TRqQBAO1pGO/hzVRUJ+Z0/6lkH
   a5Ywz4/dsxlHANnBCnZYQQ1M2iIAo30DCgXn4L6Q30GJ/JYzqgzAZjWWb
   UO9vZI2i3LASym8h1UkMFxq9XXOsDZH08t91y3mew4+L/9Qig6Ya4lUUp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="5460244"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="5460244"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 00:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="999620260"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="999620260"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 00:25:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qp1hA-00000003Xh1-3huf;
        Sat, 07 Oct 2023 10:25:52 +0300
Date:   Sat, 7 Oct 2023 10:25:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v3 1/1] platform/x86: asus-wireless: Replace open coded
 acpi_match_device()
Message-ID: <ZSEIAL4m9WbpJTW8@smile.fi.intel.com>
References: <20231006155351.3503665-1-andriy.shevchenko@linux.intel.com>
 <371fc87d-ade3-51b8-6f56-4d99dad88873@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <371fc87d-ade3-51b8-6f56-4d99dad88873@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Oct 06, 2023 at 07:08:35PM +0200, Hans de Goede wrote:
> On 10/6/23 17:53, Andy Shevchenko wrote:

...

> Thanks, patch looks good to me now:
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thanks, but it seems something went wrong (most likely due to age of the
patches in my local tree) and confusing "BUILD SUCCESS" from LKP.

> > +	id = acpi_match_device(device_ids, adev);

This should be acpi_match_acpi_device().

> > +	if (!id)
> >  		return 0;

-- 
With Best Regards,
Andy Shevchenko


