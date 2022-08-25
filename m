Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F2DC32774
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Aug 2022 15:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234565AbiHYPGI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Aug 2022 11:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238408AbiHYPGA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Aug 2022 11:06:00 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040EA12D27
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Aug 2022 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661439957; x=1692975957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XT/quHNgrhaaSWS2SOLacd8KC24hDsSJgWLoPrYrYDs=;
  b=hWCtKYga+Kvy9091NtcvL5rNFaGoW1SSmsvKq5Pn1yUoTM0aKHFBx64M
   bNglcxX+GN40P2Eki/hRz/O9dBGTIInAykbDFLwuMctyJ3F66gsWW4aBI
   vG7UMBMiNk86l2ZE5ruM84AKJr6ZFPEr31YRNE9QsHMMYbHOPFuMIQx2J
   nmZmzrgGSF+OxJktIx+zdyrgM0o2f31bK5MPy6tApJpKJcHNsUx+Uv09J
   YlYdl7Buupqk4FA1Xg2MKhM95UfH+AHGwEtt4nRFwbgB2kYTWpktgpaoV
   o/oazymasP+HZ7qnqXJzWSvzQPQ4iemchTY2DpHsqvDs1TV21TvqlLblV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="320341353"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="320341353"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 08:05:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="736282515"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 08:05:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oREQU-003RS8-0O;
        Thu, 25 Aug 2022 18:05:46 +0300
Date:   Thu, 25 Aug 2022 18:05:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/3] platform/x86: msi-laptop: Fix resource cleanup
Message-ID: <YwePyfayqSA7LIMJ@smile.fi.intel.com>
References: <20220825141336.208597-1-hdegoede@redhat.com>
 <20220825141336.208597-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825141336.208597-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Aug 25, 2022 at 04:13:36PM +0200, Hans de Goede wrote:
> Fix the input-device not getting free-ed on probe-errors and
> fix the msi_touchpad_dwork not getting cancelled on neither
> probe-errors nor on remove.

Sounds like a fix, shouldn't have a Fixes tag?

-- 
With Best Regards,
Andy Shevchenko


