Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E031C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 12:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239392AbiAKMjX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 07:39:23 -0500
Received: from mga06.intel.com ([134.134.136.31]:26283 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239542AbiAKMjX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 07:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641904763; x=1673440763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eq7WMnJ6wUQGYrvWMtNlALN3k4vanVCA7n34gfirn4w=;
  b=Ai6E/aMPqBq+XpR2zvXpPAxFME6DBnor/sAMjBnnmqRupO3egoPpZeJj
   60EsewFHzgEocImMkbB94te0b1YkeAqOP5l/z6zK2+dI1ggYWPc5A7RFY
   2kBbJoPKXPC1KwelsGth6IF/0f84YaEWF3d4coXSHU+sN/fihxJlQ/XoU
   OpnjqyJ+emRrQ/v56/76fLxkUQyT9hycfwyOn2PkMvZYWkwnPaKE8Wv1F
   V1o6ewaAKirs5GEL7rGk/86vAk05ZEY7PpwzqIRgRwvmMSrtLnnDSZ8bt
   XstkYoLg7JpUiHkk4k5Z0BKRR9/qOH3pMk6NSoYD9rf+O4nKaj+HgWgqM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="304213415"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="304213415"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 04:39:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="490364825"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 04:39:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1n7GPe-009E8B-ML;
        Tue, 11 Jan 2022 14:38:06 +0200
Date:   Tue, 11 Jan 2022 14:38:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Correct
 crystal_cove_charger module name
Message-ID: <Yd16LpJR2qXvGFmP@smile.fi.intel.com>
References: <20220111100708.38585-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111100708.38585-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jan 11, 2022 at 11:07:08AM +0100, Hans de Goede wrote:
> The module was renamed to intel_crystal_cove_charger before it was
> merged, updated bq24190_modules to match.

Depends-on: ?

-- 
With Best Regards,
Andy Shevchenko


