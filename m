Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23CCC47071
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Nov 2023 17:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjKPRPd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Nov 2023 12:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjKPRPc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2023 12:15:32 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0D9D63
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Nov 2023 09:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700154929; x=1731690929;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+UFMKGsUVpgNLMMFEx1u70JvvEN6F6MpLAof61ouRkk=;
  b=SpEUKX1JVNB3kTM/TCfx+jnvuDwaYjAVL1FxaD09VfWQ6g6/ibZSt8pc
   izqIuSwKj2pxobKMXec7YE5hkTPFHWw49RVigvVO7pKVRVe1KVCIz3Vt1
   GNW3FOOcii+e67rf1bWLcmQmchJC9XpJIfDF4Xs7AuIluvusIbq/joajz
   rLD+1ajSteIhSAo/k0lh05lgUwm7ez9LJCwziXTBKRjse98z6/NG8vFQS
   7VzHePtSPvtC88F6uMrD1Xj+ajxyZ+EkvXReXiiCzuFuaZJkBYark7AbJ
   ioZECesdedHMdq2YIsW+CV+EZ7xuPAd42njaMBmi4iaA6EwzEepri4n/s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="455427782"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="455427782"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 09:15:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="831334701"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="831334701"
Received: from jhsteyn-mobl1.ger.corp.intel.com ([10.252.40.9])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 09:15:15 -0800
Date:   Thu, 16 Nov 2023 19:15:12 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>
Subject: Re: [PATCH v4] platform/x86/amd/pmc: adjust getting DRAM size
 behavior
In-Reply-To: <db938696-6ac1-4ac5-9143-f3b54bd2cf40@amd.com>
Message-ID: <7f838ef1-b554-1710-f62-aaed202a9cd1@linux.intel.com>
References: <20231116170121.3372222-1-Shyam-sundar.S-k@amd.com> <db938696-6ac1-4ac5-9143-f3b54bd2cf40@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 16 Nov 2023, Mario Limonciello wrote:

> On 11/16/2023 11:01, Shyam Sundar S K wrote:
> > amd_pmc_get_dram_size() is used to get the DRAM size information. But in
> > the current code, mailbox command to get the DRAM size info is sent based
> > on the values of dev->major and dev->minor.
> > 
> > But dev->major and dev->minor will have either junk or zero assigned to
> > them until at least once a call to amd_pmc_get_smu_version() is made which
> > ideally populates dev->major and dev->minor.
> > 
> > Ideally to suffice this, adding a amd_pmc_get_smu_version() call to
> > amd_pmc_get_dram_size() would solve, but that has a downside of elevating
> > the boot times.
> > 
> > After talking to the PMFW team, its understood that the "get dram size"
> > mbox command would only be supported on specific platforms (like Mendocino)
> > and not all. So, adjust getting DRAM size behavior such that,
> > 
> > - if that's Rembrandt or Mendocino and the underlying PMFW knows how
> > to execute the "get dram size" command it shall give the custom dram size.
> > 
> > - if the underlying FW does not report the dram size, we just proceed
> > further and assign the default dram size.
> > 
> > Simplest way to address this is to remove amd_pmc_get_dram_size() function
> > and directly call the "get dram size" command in the amd_pmc_s2d_init().
> > 
> > Reported-by: Mark Hasemeyer <markhas@chromium.org>
> > Closes:
> > https://lore.kernel.org/platform-driver-x86/3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com/
> > Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
> > Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Ilpo when committing can you please add a stable tag for this?
>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

I'll add it, thanks.

-- 
 i.

