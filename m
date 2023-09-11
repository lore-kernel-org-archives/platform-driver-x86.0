Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5697CCA0EC6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 23:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233665AbjIKXU0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 19:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238947AbjIKVay (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 17:30:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F11244D00;
        Mon, 11 Sep 2023 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694467155; x=1726003155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yGWD+0QAiO0KJK3ZJuw6WyxLl7KFH8YmNMNIBv7XPaU=;
  b=E+vduMN4j1bZg5zf150SJxXE5lGdvkTws+V9KPel/00cHewkX2NxnvVK
   uwlC6WdFchK+lACjClRKZFOp6zarlGBQOrS/tYUnskhbY3GyOegh19Dui
   hG1q7CRfWr+/3PM8puZNnAhg6iRFS6eBnNvMTQaqcVNdz2Cs/gqk5wr2T
   QgDQ3JVrrqiFIieTH+71t+tlDBA34jWsoCV/WftXZ6q32dP5VleIDNB3j
   grVwnDMSWo2QLNLwFoI1eOmdfY89vTaogm5ubmDGjAKw3XH3jVN7mqoZe
   qa/HwfyZ6D0UVFoS1WSM+240hvNawAX2wFYqy3fdGOQnHKN7WTXw0OQiQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375544008"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="375544008"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 14:18:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="808961273"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="808961273"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 14:18:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qfoIj-008QUP-0D;
        Tue, 12 Sep 2023 00:18:33 +0300
Date:   Tue, 12 Sep 2023 00:18:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v3 3/4] platform/x86: intel_scu_ipc: Don't override scu
 in intel_scu_ipc_dev_simple_command()
Message-ID: <ZP+EKLClR1ldvY4x@smile.fi.intel.com>
References: <20230911193937.302552-1-swboyd@chromium.org>
 <20230911193937.302552-4-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911193937.302552-4-swboyd@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 11, 2023 at 12:39:35PM -0700, Stephen Boyd wrote:
> Andy discovered this bug during patch review. The 'scu' argument to this
> function shouldn't be overridden by the function itself. It doesn't make
> any sense. Looking at the commit history, we see that commit
> f57fa18583f5 ("platform/x86: intel_scu_ipc: Introduce new SCU IPC API")
> removed the setting of the scu to ipcdev in other functions, but not
> this one. That was an oversight. Remove this line so that we stop
> overriding the scu instance that is used by this function.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


