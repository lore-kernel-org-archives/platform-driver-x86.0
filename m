Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E89C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 18:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiGJSpD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 14:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGJSpC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 14:45:02 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8D8BC3E
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 11:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657478701; x=1689014701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UOI/DkhYhXoFkBLbb7RTEr8T/gc2iJbpQ2fEbtVsU+g=;
  b=GsnU8BPxFOGC4C/yKVgLHsEflLL1Et+1mUKJ1H5dU+iGrpyyHRLMTPN+
   ZU1yn6WDo3Pj7yqbo14CUtR4VRRlcWfNfyREafusREHlmDK4z9ZpgrhEn
   /CI2KGrR3HpaL0F8uy/IUaqY0kkUZriuvH51rRh0YrWQZvH++SWtq+jcM
   Jya9jbqXsV9pNdwwx65VLimRkp4p9f+gi8ZD8lttf2pMMcfErz/+7ulWM
   dIRf8Q+H9EKGCyLO67Z9j7RbarFUSF6pVUBwqA95tHyzIzDcQKjmUhCeJ
   bxDVNY13+Yg4zl9YeTXKSMxD22Pjp4F9xP6q2N9SuVUKtzWjO3fY0sR/Y
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="264942205"
X-IronPort-AV: E=Sophos;i="5.92,261,1650956400"; 
   d="scan'208";a="264942205"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 11:45:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,261,1650956400"; 
   d="scan'208";a="684165437"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 11:45:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oAbvN-001A75-28;
        Sun, 10 Jul 2022 21:44:57 +0300
Date:   Sun, 10 Jul 2022 21:44:57 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: intel_atomisp2_led: Also turn off the
 always-on camera LED on the Asus T100TAF
Message-ID: <YsseKWbSxr7cFbCi@smile.fi.intel.com>
References: <20220710173658.221528-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710173658.221528-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Jul 10, 2022 at 07:36:58PM +0200, Hans de Goede wrote:
> Like the Asus T100TA the Asus T100TAF has a camera LED which is always
> on by default and both also use the same GPIO for the LED.
> 
> Relax the DMI match for the Asus T100TA so that it also matches
> the T100TAF.

Shouldn't atomisp driver take care about this (presumable in the future)?

-- 
With Best Regards,
Andy Shevchenko


