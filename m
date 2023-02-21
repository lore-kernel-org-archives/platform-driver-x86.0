Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE17C61DA3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Feb 2023 09:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234063AbjBUJ7k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Feb 2023 04:59:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbjBUJ7j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2023 04:59:39 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004071E9C4
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 01:59:38 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="334787598"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="334787598"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 01:59:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="701946128"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="701946128"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 21 Feb 2023 01:59:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pUPQt-009uVa-2h;
        Tue, 21 Feb 2023 11:59:35 +0200
Date:   Tue, 21 Feb 2023 11:59:35 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 4/9] platform/x86: x86-android-tablets: Move shared
 power-supply fw-nodes to a separate file
Message-ID: <Y/SWB7vjyoWIOrOV@smile.fi.intel.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
 <20230220221212.196009-5-hdegoede@redhat.com>
 <Y/SV4Jfslvdpv+0t@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/SV4Jfslvdpv+0t@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Feb 21, 2023 at 11:58:56AM +0200, Andy Shevchenko wrote:
> On Mon, Feb 20, 2023 at 11:12:07PM +0100, Hans de Goede wrote:
> > Move the shared power-supply fw-nodes and related files to
> > a new separate shared-psy-info.c file.

...

> > +#ifndef __SHARED_PSY_INFO_H
> > +#define __SHARED_PSY_INFO_H
> 
> For all headers in this folder. Can we have them prefixed with PDX86
> or similar?

I meant in the definitions like above.

-- 
With Best Regards,
Andy Shevchenko


