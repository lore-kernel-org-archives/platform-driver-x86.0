Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41DECDB46E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Oct 2023 14:08:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235188AbjJLOIK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Oct 2023 10:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378233AbjJLOIJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Oct 2023 10:08:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833D6BB
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Oct 2023 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697119685; x=1728655685;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=mBUqXeFVWwHlyEVukC/tlsjLTBODaT0pP2H5nJWMdP4=;
  b=EajUdUPPRgnGFMCNVcnkDZMxiDtF6aWRxamiVuctetRRK/lf/5HU2jar
   bw5Icvv/8QTqMpCuMwhBGoh15+RQUbMhx0DWoo0Vbj46Y0IO/hdV0v9R1
   pNgpoVEjV4WlllVa8mz/8D7x9hnhntQ3I0RDHLne09oKRFmBOpNBdl6pz
   IGAnBlRqJh32z1E2mRhlzs3C3rzA4WhNCJC1qXiJG8Xh0LhL3ytV69oLt
   dNEr05WzmoB5pp3D5WBMib+gTaV2cMLjeIz+b63ippFF/6T4lb6KlYCKn
   9LzUQRJY2HAO9tOaEmbRovnqc719G3amL2qfObfVV8VB2RN8T6pm9HW8J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471187222"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="471187222"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 07:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="898126966"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="898126966"
Received: from asroczyn-mobl.ger.corp.intel.com ([10.249.36.107])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 07:06:14 -0700
Date:   Thu, 12 Oct 2023 17:08:00 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: Re: [PATCH v8 3/3] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
In-Reply-To: <20231010145003.139932-3-Shyam-sundar.S-k@amd.com>
Message-ID: <5f3241ba-a9a0-10c5-f139-c6bb42c75ac9@linux.intel.com>
References: <20231010145003.139932-1-Shyam-sundar.S-k@amd.com> <20231010145003.139932-3-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-747970976-1697119575=:1692"
Content-ID: <b2d0252-9ae9-b1cc-2a6b-75cb7b3bbcb4@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-747970976-1697119575=:1692
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <178f6c8-d2c0-b524-456-bf48e697040@linux.intel.com>

On Tue, 10 Oct 2023, Shyam Sundar S K wrote:

> There have been instances when the default size (1M) of the STB is not
> sufficient to get the complete traces of the failure. In such scenarios
> we can use a module_param to enable full trace that shall contain more
> debugging data. This is not a regular case and hence not enabling this
> capability by default.
> 
> With this change, there will be two cases on how the driver fetches the
> stb data:
> 1) A special case (proposed now) - which is required only for certain
> platforms. Here, a new module param will be supplied to the driver that
> will have a special PMFW supporting enhanced dram sizes for getting
> the stb data. Without the special PMFW support, just setting the module
> param will not help to get the enhanced stb data.
> 
> To adapt to this change, we will have a new amd_pmc_stb_handle_efr() to
> handle enhanced firmware reporting mechanism. Note that, since num_samples
> based r/w pointer offset calculation is not required for enhanced firmware
> reporting we will have this mailbox command sent only in case of regular
> STB cases.
> 
> 2) Current code branch which fetches the stb data based on the parameters
> like the num_samples, fsize and the r/w pointer.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Applied to review-ilpo with following changes and notes:

- I renamed flex_arr -> stb_data_arr (in patches 2 and 3)

- I had to resolve a conflict in patch 3 with another addition, which
  also came from you. Please try to proactively construct your series
  such that this kind of problems are avoided (preferrable) or, if
  unavoidable, at least note the existance of the conflict.

Please check I didn't break anything with my conflict resolution & renames.

-- 
 i.

> ---
> v7->v8:
> - No change
> 
> v6->v7:
> - No change
> 
> v5->v6:
>  - Make changes as per Hans on v5
>  - based on review-ilpo branch
> 
> v4->v5:
>  - Fix exisiting code problems when reading stb buffer as a circular data
>  - based on review-ilpo branch
> 
> v3->v4:
>  - Update code branches and commit-msg as per Ilpo's remark.
> 
> v2->v3:
>  - no change
> 
> v1->v2:
>  - rebase to 'review-hans' branch
>  - drop 2/4 of v1
>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index e190ec5a602f..9d041000084e 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -53,6 +53,7 @@
>  
>  /* STB Spill to DRAM Parameters */
>  #define S2D_TELEMETRY_BYTES_MAX		0x100000U
> +#define S2D_RSVD_RAM_SPACE		0x100000
>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>  
>  /* STB Spill to DRAM Message Definition */
> @@ -165,6 +166,10 @@ static bool disable_workarounds;
>  module_param(disable_workarounds, bool, 0644);
>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>  
> +static bool dump_custom_stb;
> +module_param(dump_custom_stb, bool, 0644);
> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
> +
>  static struct amd_pmc_dev pmc;
>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
> @@ -241,6 +246,25 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>  	.release = amd_pmc_stb_debugfs_release,
>  };
>  
> +/* Enhanced STB Firmware Reporting Mechanism */
> +static int amd_pmc_stb_handle_efr(struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	struct amd_pmc_stb_v2_data *flex_arr;
> +	u32 fsize;
> +
> +	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
> +	flex_arr = kmalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
> +	if (!flex_arr)
> +		return -ENOMEM;
> +
> +	flex_arr->size = fsize;
> +	memcpy_fromio(flex_arr->data, dev->stb_virt_addr, fsize);
> +	filp->private_data = flex_arr;
> +
> +	return 0;
> +}
> +
>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> @@ -260,6 +284,14 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	if (ret)
>  		dev_warn_once(dev->dev, "S2D force flush not supported\n");
>  
> +	/*
> +	 * We have a custom stb size and the PMFW is supposed to give
> +	 * the enhanced dram size. Note that we land here only for the
> +	 * platforms that support enhanced dram size reporting.
> +	 */
> +	if (dump_custom_stb)
> +		return amd_pmc_stb_handle_efr(filp);
> +
>  	/* Get the num_samples to calculate the last push location */
>  	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>  	/* Clear msg_port for other SMU operation */
> 
--8323329-747970976-1697119575=:1692--
