Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0593CC197A0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Nov 2023 10:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjKQKLY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Nov 2023 05:11:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbjKQKLY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2023 05:11:24 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB5D85
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Nov 2023 02:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700215880; x=1731751880;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kRc2Wkp/pQ8AT/YIFD7ko45xDYH7AGF5dPlfrAey8ns=;
  b=FsPzHxGqP8kT1o45t7/fW4VjlHmLXfgoLikN3h6A3cpayHNdGKkjMN69
   mxP8oRHRSsg9OYIfMv7/vwOfcj2KeO6y0CIgn93UC+aRODtnL7KrCx8hW
   i1B24S3CNSxjWGECxgxPuOKs2LtCZHLhd45E71ccbisyGVj1e/pfMHzpB
   hfkp8K6IYw5VsXcAYXl9Y7wJkPmW5OjwEeXVT+NE/tNWWlHxpMRvnTcWH
   eEOu5drJ+za/HAUGEGQiSd878E7VVgKaL1TRyQa8o7xZKeQ+AmUqjezEh
   Al5nUau7Nf0tIlPLs0AhzmIpwveyhnybHJjN0zSl0DpCOiPq4c7ubS8Hj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="394125167"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="394125167"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:11:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="831573427"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="831573427"
Received: from scoltan-mobl.ger.corp.intel.com ([10.249.46.6])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:11:16 -0800
Date:   Fri, 17 Nov 2023 12:11:14 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>
Subject: Re: [PATCH v4] platform/x86/amd/pmc: adjust getting DRAM size
 behavior
In-Reply-To: <20231116170121.3372222-1-Shyam-sundar.S-k@amd.com>
Message-ID: <282b53e9-8247-a4cc-307c-7d4f1a924683@linux.intel.com>
References: <20231116170121.3372222-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 16 Nov 2023, Shyam Sundar S K wrote:

> amd_pmc_get_dram_size() is used to get the DRAM size information. But in
> the current code, mailbox command to get the DRAM size info is sent based
> on the values of dev->major and dev->minor.
> 
> But dev->major and dev->minor will have either junk or zero assigned to
> them until at least once a call to amd_pmc_get_smu_version() is made which
> ideally populates dev->major and dev->minor.
> 
> Ideally to suffice this, adding a amd_pmc_get_smu_version() call to
> amd_pmc_get_dram_size() would solve, but that has a downside of elevating
> the boot times.
> 
> After talking to the PMFW team, its understood that the "get dram size"
> mbox command would only be supported on specific platforms (like Mendocino)
> and not all. So, adjust getting DRAM size behavior such that,
> 
> - if that's Rembrandt or Mendocino and the underlying PMFW knows how
> to execute the "get dram size" command it shall give the custom dram size.
> 
> - if the underlying FW does not report the dram size, we just proceed
> further and assign the default dram size.
> 
> Simplest way to address this is to remove amd_pmc_get_dram_size() function
> and directly call the "get dram size" command in the amd_pmc_s2d_init().
> 
> Reported-by: Mark Hasemeyer <markhas@chromium.org>
> Closes: https://lore.kernel.org/platform-driver-x86/3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com/
> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v4:
> - Based on review-ilpo branch (tip commit: 94ace9eda882)
> - Add Mark as "Reported-by:"
> - Add more commit log notes.

Thank, applied now to review-ilpo branch. I had to reflow your commit 
message because the lines were too long (try to remain within 72 
characters in the future). I also made other minor adjustments to the 
commit message.


-- 
 i.

