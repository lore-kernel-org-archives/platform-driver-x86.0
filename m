Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511CEC83F19
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243272AbjH3SrY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243071AbjH3KL0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Aug 2023 06:11:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA941B0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2023 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693390283; x=1724926283;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xXWFJzwv+Qa3EwwR9NeWJkyaD1P7M/XDPdR/MkKg7cs=;
  b=hVVr8fy2xLHwHlF06qcOkk20GT9Emg+DO0ICSZziZ57o+/ECtFjUtsQ1
   3V17dLahZGH4vBDmAMch+fGRlivov9qu6VKiPA5hk9EW6YTnymeP6wjvM
   /PJrdh27hPPbvBlLKvu9bn+jN93LSseDPNF/ZQ22rT5WJdtlv3cMknFRJ
   MWODgfDu0tIog1ERvr1RudYADneMiUj67FquCo/6fQrPso/1LTrNx0+kU
   be2JGCOLctO3AMSps6kyGe3R0O9+BcBNcdObVZ3Ouen9mSzQOmxez9cof
   0xnODkIdqYcixOJgW4xKCzczKqE2EcJ6HZLqKAEyygEhZU9K5JFnNV56j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="461975780"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="461975780"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 03:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732562620"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="732562620"
Received: from aghiriba-mobl.ger.corp.intel.com ([10.251.213.104])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 03:09:46 -0700
Date:   Wed, 30 Aug 2023 13:09:44 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
In-Reply-To: <e49f5ce4-4113-1370-624a-d747ecb1c167@amd.com>
Message-ID: <dec5e1ae-8640-e1a-d166-301b2f5d3788@linux.intel.com>
References: <20230829035239.4132737-1-Shyam-sundar.S-k@amd.com> <20230829035239.4132737-2-Shyam-sundar.S-k@amd.com> <31b525c2-1271-f9b0-af58-6b68b5d9f967@linux.intel.com> <ce8d2e56-29cc-4b6e-6b61-69c28b7b7d10@amd.com> <fae9a214-1d65-f7b-7329-f13ddb669daa@linux.intel.com>
 <06125c23-c086-ff61-de5a-aedd47ab79ee@amd.com> <e7ffa6a8-8fb2-8f6-1fbd-e898c48c4ec8@linux.intel.com> <e49f5ce4-4113-1370-624a-d747ecb1c167@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-740176247-1693390188=:1710"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-740176247-1693390188=:1710
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 30 Aug 2023, Shyam Sundar S K wrote:
> On 8/29/2023 8:00 PM, Ilpo Järvinen wrote:
> > On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
> >> On 8/29/2023 4:49 PM, Ilpo Järvinen wrote:
> >>> On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
> >>>> On 8/29/2023 3:09 PM, Ilpo Järvinen wrote:
> >>>>> On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
> >>>>>
> >>>>>> There have been instances when the default size (1M) of the STB is not
> >>>>>> sufficient to get the complete traces of the failure. In such scenarios
> >>>>>> we can use a module_param to enable full trace that shall contain more
> >>>>>> debugging data. This is not a regular case and hence not enabling this
> >>>>>> capability by default.
> >>>>>>
> >>>>>> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
> >>>>>> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
> >>>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >>>>>> ---
> >>>>>> v2->v3:
> >>>>>>  - no change
> >>>>>>
> >>>>>> v1->v2:
> >>>>>>  - rebase to 'review-hans' branch
> >>>>>>  - drop 2/4 of v1
> >>>>>>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
> >>>>>>
> >>>>>>  drivers/platform/x86/amd/pmc/pmc.c | 34 +++++++++++++++++++-----------
> >>>>>>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
> >>>>>>  2 files changed, 23 insertions(+), 12 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> >>>>>> index 443bb78ea5f4..0e61ae74f1a9 100644
> >>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
> >>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> >>>>>> @@ -53,6 +53,7 @@
> >>>>>>  
> >>>>>>  /* STB Spill to DRAM Parameters */
> >>>>>>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
> >>>>>> +#define S2D_TELEMETRY_FSIZE_MAX		0x200000
> >>>>>>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
> >>>>>>  
> >>>>>>  /* STB Spill to DRAM Message Definition */
> >>>>>> @@ -160,6 +161,10 @@ static bool disable_workarounds;
> >>>>>>  module_param(disable_workarounds, bool, 0644);
> >>>>>>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
> >>>>>>  
> >>>>>> +static bool dump_custom_stb;
> >>>>>> +module_param(dump_custom_stb, bool, 0644);
> >>>>>> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
> >>>>>> +
> >>>>>>  static struct amd_pmc_dev pmc;
> >>>>>>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
> >>>>>>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
> >>>>>> @@ -239,7 +244,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
> >>>>>>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> >>>>>>  {
> >>>>>>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> >>>>>> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
> >>>>>> +	u32 *buf, num_samples, val, stb_rdptr_offset = 0;
> >>>>>>  	int ret;
> >>>>>>  
> >>>>>>  	/* Write dummy postcode while reading the STB buffer */
> >>>>>> @@ -247,10 +252,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> >>>>>>  	if (ret)
> >>>>>>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
> >>>>>>  
> >>>>>> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
> >>>>>> -	if (!buf)
> >>>>>> -		return -ENOMEM;
> >>>>>> -
> >>>>>>  	/* Spill to DRAM num_samples uses separate SMU message port */
> >>>>>>  	dev->msg_port = 1;
> >>>>>>  
> >>>>>> @@ -264,20 +265,27 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> >>>>>>  	dev->msg_port = 0;
> >>>>>>  	if (ret) {
> >>>>>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> >>>>>> -		kfree(buf);
> >>>>>>  		return ret;
> >>>>>>  	}
> >>>>>>  
> >>>>>>  	/* Start capturing data from the last push location */
> >>>>>> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> >>>>>> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
> >>>>>> -		stb_rdptr_offset = num_samples - fsize;
> >>>>>> +	if (dump_custom_stb &&
> >>>>>> +	    (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)) {
> >>>>>> +		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
> >>>>>> +		stb_rdptr_offset = 0;
> >>>>>> +	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> >>>>>
> >>>>> I find the logic here somewhat suspicious in the first if check (I fail 
> >>>>> to follow the reasoning here despite spending considerable amount of time 
> >>>>> staring at it).
> >>>>>
> >>>>> Lets assume dump_custom_stb is set. If dev->dram_size is large, the first 
> >>>>> if condition will be false because LHS of <= is large. Thus, we go to the 
> >>>>> second branch and dump exactly as many samples as before this patch. 
> >>>>> ...And that is opposite of what this patch claims to do?
> >>>>>
> >>>>
> >>>> Let me explain:
> >>>>
> >>>> We have cases where the S2D (Spill to DRAM) STB (Smart Trace Buffer -
> >>>> which is meant to have debug data that gives information about the
> >>>> system conditions, be it success or failure.) may not fit in the current
> >>>> stb buffer size of 1M (i.e. S2D_TELEMETRY_BYTES_MAX). The stb buffer
> >>>> size of 1M is sufficient for most of the platforms, but there could be
> >>>> exceptions.
> >>>>
> >>>> In those cases, the dram_size would be updated by the PMFW (Power
> >>>> Management Firmware) coupled with "dump_custom_stb" to fit into a custom
> >>>> requirement.
> >>>>
> >>>> As an example (with this proposed change):
> >>>>
> >>>> when dump_custom_stb is SET and dev->dram_size is 3M (received from
> >>>> PMFW) the first if() will be successful and it takes the corresponding
> >>>> code path.
> >>>
> >>> Heh, I can see the numbers work in that case, however, the above still 
> >>> doesn't really explain why only S2D_TELEMETRY_BYTES_MAX is copied if 
> >>> dram_size - S2D_TELEMETRY_BYTES_MAX > S2D_TELEMETRY_FSIZE_MAX and not
> >>> S2D_TELEMETRY_FSIZE_MAX as I would expect?
> >>>
> >>
> >> I guess if your question is on:
> >>
> >> -->the if() case:
> >>
> >> why:
> >>
> >> dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
> >>
> >> and not
> >>
> >> dev->fsize = S2D_TELEMETRY_FSIZE_MAX;
> >>
> >> if yes, I think the intention of the code change is correct.
> > 
> > I agree with you here, the statement itself inside the first if block is 
> > not wrong.
> > 
> >> The entire
> >> buffer has multiple segments out of which the driver can only access the
> >> STB buffer region. In general cases its S2D_TELEMETRY_BYTES_MAX(1M) and
> >> with the proposed patch a custom STB buffer range that cannot exceed
> >> S2D_TELEMETRY_FSIZE_MAX.
> >>
> >> taking the above example, assume
> >>
> >> case 1:
> >> dev->dram_size is 3M, S2D_TELEMETRY_BYTES_MAX is 1M, so the dev->fsize
> >> is 2M.
> >>
> >> case 2:
> >> dev->dram_size is 2M, S2D_TELEMETRY_BYTES_MAX is 1M, so the dev->fsize
> >> is 1M.
> >>
> >> so, it depends on the incoming dev->dram_size from the PMFW based on
> >> which the dev->fsize is calculated and cannot be directly
> >> S2D_TELEMETRY_FSIZE_MAX (always).
> > 
> > Again your examples leave the most interesting case out... So what if 
> > dev->dram_size above 3M, do you want dev->fsize to be
> > S2D_TELEMETRY_FSIZE_MAX or up to S2D_TELEMETRY_BYTES_MAX (the latter 
> > depends on the num_samples)?
> > 
> > Or are saying that configuration never happens? If that's the case, then 
> > the entire <= condition looks unnecessary (which is why it looked 
> > suspicious) and you could simply do:
> > 	if (dump_custom_stb) {
> > 		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
> > 		...
> > 
> > ...But then, dev->dram_size is assigned S2D_TELEMETRY_DRAMBYTES_MAX if 
> > DRAM size wasn't provided so it doesn't look convincing to me 
> > dev->dram_size would be limited to 3M.
> 
> The examples what I gave was for reference purpose only and lets not
> stick to 3M.

Those examples failed to cover the case I was interested in and that 3M 
just happens to exactly be the boundary above which the cases I was asking 
about reside which is why I mentioned it (that 3M is simply derived from 
the numbers in your code, not directly related to the example you gave).

> There are two cases:
> 1: A special case (proposed now), which is required only for certain
> platforms. Here, a new module param will be supplied to the driver that
> will have a special PMFW supporting enchanced dram sizes for getting the
> stb data.
> 
> like you mentioned, we can just guard that with a simple:
> 
> if (dump_custom_stb) {
>  		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
> 
> 
> but think of a scenario where any end user can just reload the driver
> with this new module param on regular platform? that would result in
> getting junk stb data to the userspace or in some cases the entire
> behavior is undefined.
> 
> Hence would like to add extra conditions to make sure that even if the
> new module param is supplied, the underlying PMFW should also be ready
> to handle such thing and that is the reason you see:
> 
> if (dump_custom_stb && (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <=
> S2D_TELEMETRY_FSIZE_MAX))
> 
> 2: A general purpose regular one - (current existing code), which says
> about where to get the stb data. That is decided on the parameters like
> the num_samples, fsize and the r/w pointer.
> 
> the crux is: the additional conditions are for protection only and
> definately not a overkill.

Okay, thanks. I can accept that as you seem to think there's nothing 
wrong with the logic. Not that I'm still entirely convinced since I 
couldn't get an answer to those simple questions I asked about the case 
where dram_size > 3M but it doesn't really matter. (I still need to read
the answer between the lines for the case where dram_size > 3M and that 
message is conflicted.)

But please do explain either in the commit message and/or with a comment 
the purpose of that check because that condition together with the 
surrounding logic looks very suspicious, keeping in mind that when 
somebody reads this bit of code 10 years from now he/she should be able 
understand why you added it there.

-- 
 i.

--8323329-740176247-1693390188=:1710--
