Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38098C83F14
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Aug 2023 11:20:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjH2LTq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Aug 2023 07:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbjH2LT2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Aug 2023 07:19:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6389F1B4
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Aug 2023 04:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693307963; x=1724843963;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=ocnBImR6IWIg4NQFiW7MloxXKb4Yi2oYtbSYq7LENds=;
  b=c3b4YlQBNPeveNmrTTI2gI8hu5P0/+6KDltD8FnqyqFIKZEuxVTUnV/B
   TZ04/LAXHTQolyNEOlJWN1yns8ug8gc+bgyDrD1Oc5TWaFUgGewUW7d6Y
   H6GG1DWmEXQu4aJ7cdp/Fahybrkg3oSFreOWEqs4Br9clkO2Yndlt/6Pf
   t1xDDhLmDEWUwxH6QOtalKQPYQHu3UsOigKnXobCd6oRr8fuEM7HL+Es9
   cgJI3L7iEAzHHZF5sQKbmQJmo0l9TK8sfqm+Lfw1O34kavtQ53KppINpy
   H8HGOBd1ABwCvO954caQxJYohC5tWRZBj1YbvE2N/VRkTVCaPViRz95jI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="365545835"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="365545835"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 04:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="768036524"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="768036524"
Received: from tgodea-mobl.ger.corp.intel.com ([10.251.214.174])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 04:19:20 -0700
Date:   Tue, 29 Aug 2023 14:19:16 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
In-Reply-To: <ce8d2e56-29cc-4b6e-6b61-69c28b7b7d10@amd.com>
Message-ID: <fae9a214-1d65-f7b-7329-f13ddb669daa@linux.intel.com>
References: <20230829035239.4132737-1-Shyam-sundar.S-k@amd.com> <20230829035239.4132737-2-Shyam-sundar.S-k@amd.com> <31b525c2-1271-f9b0-af58-6b68b5d9f967@linux.intel.com> <ce8d2e56-29cc-4b6e-6b61-69c28b7b7d10@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1076844689-1693307905=:1757"
Content-ID: <2872d795-6dc1-3781-de9c-78e910a1da4d@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1076844689-1693307905=:1757
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <7d41eb27-f632-4f87-3fb3-6088c33a33eb@linux.intel.com>

On Tue, 29 Aug 2023, Shyam Sundar S K wrote:

> 
> 
> On 8/29/2023 3:09 PM, Ilpo Järvinen wrote:
> > On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
> > 
> >> There have been instances when the default size (1M) of the STB is not
> >> sufficient to get the complete traces of the failure. In such scenarios
> >> we can use a module_param to enable full trace that shall contain more
> >> debugging data. This is not a regular case and hence not enabling this
> >> capability by default.
> >>
> >> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
> >> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
> >> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >> v2->v3:
> >>  - no change
> >>
> >> v1->v2:
> >>  - rebase to 'review-hans' branch
> >>  - drop 2/4 of v1
> >>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
> >>
> >>  drivers/platform/x86/amd/pmc/pmc.c | 34 +++++++++++++++++++-----------
> >>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
> >>  2 files changed, 23 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> >> index 443bb78ea5f4..0e61ae74f1a9 100644
> >> --- a/drivers/platform/x86/amd/pmc/pmc.c
> >> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> >> @@ -53,6 +53,7 @@
> >>  
> >>  /* STB Spill to DRAM Parameters */
> >>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
> >> +#define S2D_TELEMETRY_FSIZE_MAX		0x200000
> >>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
> >>  
> >>  /* STB Spill to DRAM Message Definition */
> >> @@ -160,6 +161,10 @@ static bool disable_workarounds;
> >>  module_param(disable_workarounds, bool, 0644);
> >>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
> >>  
> >> +static bool dump_custom_stb;
> >> +module_param(dump_custom_stb, bool, 0644);
> >> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
> >> +
> >>  static struct amd_pmc_dev pmc;
> >>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
> >>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
> >> @@ -239,7 +244,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
> >>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> >>  {
> >>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> >> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
> >> +	u32 *buf, num_samples, val, stb_rdptr_offset = 0;
> >>  	int ret;
> >>  
> >>  	/* Write dummy postcode while reading the STB buffer */
> >> @@ -247,10 +252,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> >>  	if (ret)
> >>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
> >>  
> >> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
> >> -	if (!buf)
> >> -		return -ENOMEM;
> >> -
> >>  	/* Spill to DRAM num_samples uses separate SMU message port */
> >>  	dev->msg_port = 1;
> >>  
> >> @@ -264,20 +265,27 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> >>  	dev->msg_port = 0;
> >>  	if (ret) {
> >>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> >> -		kfree(buf);
> >>  		return ret;
> >>  	}
> >>  
> >>  	/* Start capturing data from the last push location */
> >> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> >> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
> >> -		stb_rdptr_offset = num_samples - fsize;
> >> +	if (dump_custom_stb &&
> >> +	    (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)) {
> >> +		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
> >> +		stb_rdptr_offset = 0;
> >> +	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> > 
> > I find the logic here somewhat suspicious in the first if check (I fail 
> > to follow the reasoning here despite spending considerable amount of time 
> > staring at it).
> > 
> > Lets assume dump_custom_stb is set. If dev->dram_size is large, the first 
> > if condition will be false because LHS of <= is large. Thus, we go to the 
> > second branch and dump exactly as many samples as before this patch. 
> > ...And that is opposite of what this patch claims to do?
> > 
> 
> Let me explain:
> 
> We have cases where the S2D (Spill to DRAM) STB (Smart Trace Buffer -
> which is meant to have debug data that gives information about the
> system conditions, be it success or failure.) may not fit in the current
> stb buffer size of 1M (i.e. S2D_TELEMETRY_BYTES_MAX). The stb buffer
> size of 1M is sufficient for most of the platforms, but there could be
> exceptions.
> 
> In those cases, the dram_size would be updated by the PMFW (Power
> Management Firmware) coupled with "dump_custom_stb" to fit into a custom
> requirement.
> 
> As an example (with this proposed change):
> 
> when dump_custom_stb is SET and dev->dram_size is 3M (received from
> PMFW) the first if() will be successful and it takes the corresponding
> code path.

Heh, I can see the numbers work in that case, however, the above still 
doesn't really explain why only S2D_TELEMETRY_BYTES_MAX is copied if 
dram_size - S2D_TELEMETRY_BYTES_MAX > S2D_TELEMETRY_FSIZE_MAX and not
S2D_TELEMETRY_FSIZE_MAX as I would expect?

-- 
 i.
--8323329-1076844689-1693307905=:1757--
