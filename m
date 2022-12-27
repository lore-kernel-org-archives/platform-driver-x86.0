Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06ABC4167B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Dec 2022 20:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbiL0USf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Dec 2022 15:18:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231723AbiL0US3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Dec 2022 15:18:29 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B150BC765;
        Tue, 27 Dec 2022 12:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672172308; x=1703708308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MPJuJRJSJFNtkmyjPg3s/23K/mJ7CjlZZ3hB3ocfIvM=;
  b=KDbMbC8vLJg0jdCBxB3xpR6ZDbMr1/n2c290uWwn3BLldwGDAh7HbEqK
   hSsnMMMeHcxr3R9FOVhuJJlk55jnwjqpFY9NkOV96u4UPrjoOrHdm1Eck
   /6E/7AtGa6vHr2UPYLbIWsN0XDBCY6rv6Sjr+x5rF0AbpRXEr4eVDCUcM
   FwW7FDnHZ/e4AoNJVSk+MZ2TZ3HnIxLdtyqwmw6h72+G8GfMyMnhFonJD
   2HZb/rI4+nW/d3gE9u/3LTW99YxEvQT7fg4eeL1OA1ch/KDchc41kjzkP
   KaNNHk/LleenlGYGmKe2LMDY6hYeafO/tfp4y1BYV9+3+0SxMLzKjyJ1l
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="318429896"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="318429896"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 12:18:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="716425849"
X-IronPort-AV: E=Sophos;i="5.96,279,1665471600"; 
   d="scan'208";a="716425849"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 27 Dec 2022 12:18:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pAGP3-000Dse-26;
        Tue, 27 Dec 2022 22:18:25 +0200
Date:   Tue, 27 Dec 2022 22:18:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: simatic-ipc: correct name of a model
Message-ID: <Y6tTEVjnS+RjAi9b@smile.fi.intel.com>
References: <20221222103720.8546-1-henning.schild@siemens.com>
 <20221222103720.8546-2-henning.schild@siemens.com>
 <Y6RRInVaXtOGr8hA@smile.fi.intel.com>
 <20221222150443.722e5bf8@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221222150443.722e5bf8@md1za8fc.ad001.siemens.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Dec 22, 2022 at 03:04:43PM +0100, Henning Schild wrote:
> Am Thu, 22 Dec 2022 14:44:18 +0200
> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > On Thu, Dec 22, 2022 at 11:37:19AM +0100, Henning Schild wrote:
> > > What we called IPC427G should be renamed to BX-39A to be more in
> > > line with the actual product name.  
> > 
> > Can you tell what does the current name mean?
> 
> 427G is an internal prototype name using the naming scheme that these
> kind of machines used to use for several generations. For some reason
> the naming scheme was changed and the public product name is BX-39A.
> 
> Please do not ask me why. But if you would happen to own such a device
> you would know it as BX-39A _only_.
> 
> > Depending on that I would consider either your approach here or
> > perhaps just adding a comment in each of the places.
> 
> Mentioning the name 427G, even as a comment, does not make much sense.
> Since the box is for sale it is called BX-39A and was never called 427G.
> 
> I used the internal prototype name and only recently learned that never
> became the final name. And this cleanup makes sure nobody gets
> confused.

Thanks for clarifications!

-- 
With Best Regards,
Andy Shevchenko


