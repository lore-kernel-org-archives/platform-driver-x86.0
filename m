Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5841E92704
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 14:09:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbjJEOJU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbjJEOHR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 10:07:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD9F10C1;
        Thu,  5 Oct 2023 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513712; x=1728049712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ov3uZERNNKNe8VXagBJx34KCc0xbHymNQE9Hhsq5WBQ=;
  b=IpWlq0ZzAn72psRKGqfE9zs00OhuFqZzfD6hpr2cqc3tVeBksKy7xQ5i
   +KFKteO7RxHK7mozER1AQWN9MCoBTG/OuY3PY8j5cps6mcdJKrnfDCAo2
   kzUakwz2NRGDPn+oGzgaSjE+Ia1XkHtK697ktB7hmUmupJpkxH2XIrIGl
   RsYSJ/jjWdE+48j2LG37r3QpGSvl+doqJwlbBQgORa/7fxPtnpK7FW7W+
   Yf56B3nAZ7TJ3M27t5DkM7S4irvhduoZU/YWssHKA4F5ruBdv3gq6GIeE
   WpCT/9l45AFk+T2KOzkwz4iQZGBp5Ij/sGzdYT42HNymAfAo38DgceKE8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469718401"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="469718401"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 01:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="745375831"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="745375831"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 01:59:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qoKCl-00000002yrg-1efJ;
        Thu, 05 Oct 2023 11:59:35 +0300
Date:   Thu, 5 Oct 2023 11:59:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [UPDATE][PATCH] platform/x86/intel-uncore-freq: Conditionally
 create attribute for read frequency
Message-ID: <ZR569/9k5YWomvFB@smile.fi.intel.com>
References: <20231004181915.1887913-1-srinivas.pandruvada@linux.intel.com>
 <e84bc80e-1fd9-f07b-526a-b4eb4780ea9b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e84bc80e-1fd9-f07b-526a-b4eb4780ea9b@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Oct 05, 2023 at 09:03:20AM +0200, Hans de Goede wrote:
> On 10/4/23 20:19, Srinivas Pandruvada wrote:

…

> Can you for future updated patches please use the ususal [PATCH v2],
> [PATCH v3], etc. prefix ?

Side note: the `git format-patch ...` has -vX option, where X is a version.

-- 
With Best Regards,
Andy Shevchenko


