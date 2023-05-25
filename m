Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F43C7EE2C
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 09:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbjEYJ7b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 05:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbjEYJ7a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 05:59:30 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083A6122
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685008769; x=1716544769;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=RDN3HxvXJPNh3rlNPfPwOyt/Ii9izU/HNJkZskOQ5c8=;
  b=CwvzmrbwyCTxho6lDYNyqwWHi76PQ1qCwZjhPltCLhak3JNwiIjBzcNa
   NoMoeAEs8RPcBa0SCkR5bH/BXPaCQPjLayUpr24cnMUQuLI+tDO+Sl70k
   NXn5zxuh34tPMxhCXaSUvkhVRHNZzb+UdIDvQesQ1ubXVHwwih0wHzbI1
   OelqQJMrLRUkj3vB1OevM63zrOtmyMP157HV3Mo7U7yZ1oCXRm07+GbcH
   JDSWds9ajm1F9hI/Jr79/ug62CM0nuRCbfnjq2Lm0TSZgsK0F4AnTky44
   CeZpdCDeG6vRUO9jzfDmbHMRasMeXPR7p72V6O9f1691DDoXOPJKqne7w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="353866490"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="353866490"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="698916666"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="698916666"
Received: from aghiriba-mobl.ger.corp.intel.com ([10.249.40.17])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:59:25 -0700
Date:   Thu, 25 May 2023 12:59:23 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 3/4] platform/x86/amd: pmc: Add helper function to
 check the cpu id
In-Reply-To: <378b7e91-3b14-c6fa-036a-c91a30ab4665@amd.com>
Message-ID: <209390a5-4945-f99a-5951-9fc61e5f6060@linux.intel.com>
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com> <20230516091308.3905113-4-Shyam-sundar.S-k@amd.com> <d4e98445-d2f2-10f7-7f62-9bcb16deef79@linux.intel.com> <378b7e91-3b14-c6fa-036a-c91a30ab4665@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-804892440-1685008131=:1738"
Content-ID: <48a12368-34b3-d7d-f96-175258b61876@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-804892440-1685008131=:1738
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <1679d67b-7f72-93aa-7045-adfddd71d225@linux.intel.com>

On Thu, 25 May 2023, Shyam Sundar S K wrote:
> On 5/23/2023 1:56 PM, Ilpo Järvinen wrote:
> > On Tue, 16 May 2023, Shyam Sundar S K wrote:
> > 
> >> Add a helper routine to check the underlying cpu id, that can be used
> >> across the PMC driver to remove the duplicate code.
> >>
> >> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
> >>  1 file changed, 14 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> >> index e2439fda5c02..7e5e6afb3410 100644
> >> --- a/drivers/platform/x86/amd/pmc.c
> >> +++ b/drivers/platform/x86/amd/pmc.c
> >> @@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
> >>  	debugfs_remove_recursive(dev->dbgfs_dir);
> >>  }
> >>  
> >> +static bool amd_pmc_check_sup_cpuid(struct amd_pmc_dev *dev)
> > 
> > Does sup refer to "supported" or some other acronym? If the latter,
> 
> Yes, please read that as "supported"
> 
> > you should mention/open it in the changelog and/or in a comment. If the 
> > former, the function naming seems too generic (an observation entirely 
> > based on how/where the function is used, you're not exactly verbose on 
> > what this actually checks for other than what looks like a set of CPU 
> > IDs but clearly there's more behind it).
> 
> OK. renaming the function as amd_pmc_is_cpu_supported() would be fine?

This makes things odder, it gets used in two places:

	if (enable_stb) {
		if (amd_pmc_check_sup_cpuid(dev))
			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops_v2);
		else
			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops);
	}

What about that else branch (PMC is not supported so who does that make 
sense when the file is called pmc.c)? And here:

static int amd_pmc_probe(...)
{
	...
	if (enable_stb && amd_pmc_check_sup_cpuid(dev)) {
		err = amd_pmc_s2d_init(dev);
		if (err)
			...goto + returns error
	}


If enable_stb is not set, pmc not being supported is not going to return 
error?


-- 
 i.
--8323329-804892440-1685008131=:1738--
