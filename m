Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FDDC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Dec 2021 13:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbhLTNJZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Dec 2021 08:09:25 -0500
Received: from mga03.intel.com ([134.134.136.65]:18760 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230238AbhLTNJZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Dec 2021 08:09:25 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="240114543"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="240114543"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 05:09:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="547324673"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 05:09:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mzIOS-0004eS-WA;
        Mon, 20 Dec 2021 15:07:56 +0200
Date:   Mon, 20 Dec 2021 15:07:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "Luke D. Jones" <luke@ljones.dev>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v1 1/3] platform/x86: asus-wmi: Join string literals back
Message-ID: <YcCALCOv46Y0TogB@smile.fi.intel.com>
References: <20211210163009.19894-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210163009.19894-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Dec 10, 2021 at 06:30:07PM +0200, Andy Shevchenko wrote:
> For easy grepping on debug purposes join string literals back in
> the messages.
> 
> No functional change.

Hans, any comments on the series?

-- 
With Best Regards,
Andy Shevchenko


