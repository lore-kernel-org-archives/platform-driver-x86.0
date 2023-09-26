Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A35DE7E631
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Sep 2023 13:16:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbjIZNQV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Sep 2023 09:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjIZNQU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2023 09:16:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12754101;
        Tue, 26 Sep 2023 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695734174; x=1727270174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xiIrvxsZxlZBMo4/9txgJFin042F3pKoeJWAP1ehUhM=;
  b=kvga3p2VDWGKFXt2TR5I9yiabc2ujPcVTf9XB1eYhCdJL4S4OYpDmhiK
   CoWc3ksOXPKeBMYzFw3Sqp1AQfSC/hI0OSCIgKmj3Fbklaj4hjT2f1tnS
   1ZhgaY1sn2opF5vVkd7PqcUJ3LP4/5bftAOnKijyAGtb/pALISo6EyFze
   JMp0d0bOCYIRAwiC3My4Inl0f6TXftEoEwloHWfvrsEMmLmJeyziCwn3/
   AGkJ17Xr8XX7Y0mryCJP0Oodq4vfF2OCeJYoI4qZCswU15tu4oaQz4kME
   QLEv9fmw2a0EAeo5vTVwaZRnciPswV5HgV1xGhayqk+7tScyg9HXHMYn5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371893408"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="371893408"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 06:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748813187"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="748813187"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 06:16:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ql7v6-00000000boq-480l;
        Tue, 26 Sep 2023 16:16:08 +0300
Date:   Tue, 26 Sep 2023 16:16:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] platform/x86: intel_speed_select_if: Remove
 hardcoded map size
Message-ID: <ZRLZmDmIkOo0YVz6@smile.fi.intel.com>
References: <20230925194555.966743-1-srinivas.pandruvada@linux.intel.com>
 <20230925194555.966743-4-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925194555.966743-4-srinivas.pandruvada@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 25, 2023 at 12:45:55PM -0700, Srinivas Pandruvada wrote:
> The driver is using 256 as the size while calling devm_ioremap(). The
> maximum offset is already part of struct isst_mmio_range. Use the
> maximum offset (end field of the struct) plus 4 as the map size to remove
> hardcoded value of 256.

...

> +	punit_dev->mmio_range = (struct isst_mmio_range *) ent->driver_data;
> +
> +	punit_dev->punit_mmio = devm_ioremap(&pdev->dev, base_addr,
> +					     punit_dev->mmio_range[1].end + sizeof(u32));

Can we rather fix the mmio_range driver data to have end be actually not the
offset of the last dword? (Better maybe to keep length there.)

With help of

	struct resource r;
	...
	r = DEFINE_RES_MEM(base_addr, mmio_range.beg + mmio_range.len);

you can switch to devm_ioremap_resource() API.

-- 
With Best Regards,
Andy Shevchenko


