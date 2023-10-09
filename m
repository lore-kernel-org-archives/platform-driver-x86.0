Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD33E95A96
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 15:22:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376537AbjJIPWR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 11:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376759AbjJIPWQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 11:22:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E5A1B0
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 08:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696864935; x=1728400935;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/B7PVCO2dAKg6fj+z+hsFa26FupSGsC3yGIV4DWr50w=;
  b=Cj+/PZW3diw9MS+qiDsZdS4jFWsLVLEV/YKi0c7ShYniVKLs2dGIOiHs
   GFSUz6yMpcpN70nK7BczxIPoq/yi0H3AxIuqJqWOqkG9fLSqeEyD7fs5s
   Cov24hbfFgOp2ujhOvAdOpP4m57SjvQvBg9tTV9G1985+YMDT73k8pWaJ
   A1jqKy5Rdy3EmrPqc2wlSm36OfW8js9iKZsPyaLX4EZEj9OqDte6bwY2v
   e+TYCQ7qo0bCFtJHmw93kJoZiax2sZ8egwrMkwt4njj2JSFQGLLEiw+vz
   KoqeneTN4Zome5c7/bESFcCChbTE2YN7Zs+3T/Yxnt2rClHt8RYWOUjEf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="381434119"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="381434119"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="729708025"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="729708025"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 08:13:49 -0700
Date:   Mon, 9 Oct 2023 18:13:46 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: Re: [PATCH v7 3/3] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
In-Reply-To: <819ca2b6-ba97-4c65-8ffb-45f02c43fd6f@amd.com>
Message-ID: <b5b863e3-4f53-6f5-5acc-9119925ce853@linux.intel.com>
References: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com> <20231009141254.22114-3-Shyam-sundar.S-k@amd.com> <40ffb29-6b4f-b72e-2e1e-7c5ad34dec1c@linux.intel.com> <819ca2b6-ba97-4c65-8ffb-45f02c43fd6f@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-531060733-1696864431=:1721"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-531060733-1696864431=:1721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> On 10/9/2023 8:36 PM, Ilpo Järvinen wrote:
> > On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> > 
> >> There have been instances when the default size (1M) of the STB is not
> >> sufficient to get the complete traces of the failure. In such scenarios
> >> we can use a module_param to enable full trace that shall contain more
> >> debugging data. This is not a regular case and hence not enabling this
> >> capability by default.
> >>
> >> With this change, there will be two cases on how the driver fetches the
> >> stb data:
> >> 1) A special case (proposed now) - which is required only for certain
> >> platforms. Here, a new module param will be supplied to the driver that
> >> will have a special PMFW supporting enhanced dram sizes for getting
> >> the stb data. Without the special PMFW support, just setting the module
> >> param will not help to get the enhanced stb data.
> >>
> >> To adapt to this change, we will have a new amd_pmc_stb_handle_efr() to
> >> handle enhanced firmware reporting mechanism. Note that, since num_samples
> >> based r/w pointer offset calculation is not required for enhanced firmware
> >> reporting we will have this mailbox command sent only in case of regular
> >> STB cases.
> >>
> >> 2) Current code branch which fetches the stb data based on the parameters
> >> like the num_samples, fsize and the r/w pointer.
> >>
> >> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
> >> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
> >> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >> v6->v7:
> >> - Code simplication
> >>
> >> v5->v6:
> >> - No change
> >>
> >> v4->v5:
> >>  - create a new function amd_pmc_stb_handle_efr() to handle enhanced firmware reporting mechanism
> >>  - based on review-ilpo branch
> >>  
> >> v3->v4:
> >>  - Update code branches and commit-msg as per Ilpo's remark.
> >>
> >> v2->v3:
> >>  - no change
> >>
> >> v1->v2:
> >>  - rebase to 'review-hans' branch
> >>  - drop 2/4 of v1
> >>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
> >>
> >>  drivers/platform/x86/amd/pmc/pmc.c | 32 ++++++++++++++++++++++++++++++
> >>  1 file changed, 32 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> >> index e0b5d9de473a..af6d400193ff 100644
> >> --- a/drivers/platform/x86/amd/pmc/pmc.c
> >> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> >> @@ -53,6 +53,7 @@
> >>  
> >>  /* STB Spill to DRAM Parameters */
> >>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
> >> +#define S2D_RSVD_RAM_SPACE		0x100000
> >>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
> >>  
> >>  /* STB Spill to DRAM Message Definition */
> >> @@ -165,6 +166,10 @@ static bool disable_workarounds;
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
> >> @@ -241,6 +246,25 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
> >>  	.release = amd_pmc_stb_debugfs_release,
> >>  };
> >>  
> >> +/* Enhanced STB Firmware Reporting Mechanism */
> >> +static int amd_pmc_stb_handle_efr(struct file *filp)
> >> +{
> >> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> >> +	struct amd_pmc_stb_v2_data *flex_arr;
> >> +	u32 fsize;
> >> +
> >> +	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
> >> +	flex_arr = kmalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
> >> +	if (!flex_arr)
> >> +		return -ENOMEM;
> >> +
> >> +	flex_arr->size = fsize;
> >> +	memcpy_fromio(flex_arr->data, dev->stb_virt_addr, fsize);
> >> +	filp->private_data = flex_arr;
> >> +
> >> +	return 0;
> > 
> > Thanks, this make much more sense than the early versions!
> > 
> > Just one confirmation, is dev->dram_size >= S2D_RSVD_RAM_SPACE always
> > guaranteed so that the fsize never underflows?
> > 
> 
> Yes, that's right.

Okay thanks,

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-531060733-1696864431=:1721--
