Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E071AC83F12
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Aug 2023 09:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjH2Jkg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Aug 2023 05:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234898AbjH2JkH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Aug 2023 05:40:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979A410E
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Aug 2023 02:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693302003; x=1724838003;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IK0nbzcaWuX+3uyd3sCeuBYb+AyTKETTdpA1WoSX7Og=;
  b=jtQTPlxOBMLyv0SbW1lJm8TYoE3P/fMJoxFU58Kv4U9PPkXJnoqjHyjb
   Wh0+UtS/CwC3422oehELMLXJ47dIcPCG5N/jFfuJUHe/y5P8ZIClAel23
   vLs8kq0J3QKfj4RnK11diZ6snccSTriS8RaxyPfP8UreuYaXce+PU52LU
   mNm9OlyaRNoEOPKu6zNBkbEjimaBhjS0IKFT2THzMVYAMzSILifCtU7RK
   2K1jjtfHwKV+Y6vdpiPMSvJ7LsOrRwQ+96Kvyzn0XDznsqRDy1cjFBfAR
   Tmhckn1pQzgNEoazmxyJAXTnH/RUGz/gBvyGNk4MOSI1cd+6EAszw2x5S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="375287094"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="375287094"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 02:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="808603530"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="808603530"
Received: from tgodea-mobl.ger.corp.intel.com ([10.251.214.174])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 02:40:00 -0700
Date:   Tue, 29 Aug 2023 12:39:58 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
In-Reply-To: <20230829035239.4132737-2-Shyam-sundar.S-k@amd.com>
Message-ID: <31b525c2-1271-f9b0-af58-6b68b5d9f967@linux.intel.com>
References: <20230829035239.4132737-1-Shyam-sundar.S-k@amd.com> <20230829035239.4132737-2-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 29 Aug 2023, Shyam Sundar S K wrote:

> There have been instances when the default size (1M) of the STB is not
> sufficient to get the complete traces of the failure. In such scenarios
> we can use a module_param to enable full trace that shall contain more
> debugging data. This is not a regular case and hence not enabling this
> capability by default.
> 
> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2->v3:
>  - no change
> 
> v1->v2:
>  - rebase to 'review-hans' branch
>  - drop 2/4 of v1
>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 34 +++++++++++++++++++-----------
>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>  2 files changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 443bb78ea5f4..0e61ae74f1a9 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -53,6 +53,7 @@
>  
>  /* STB Spill to DRAM Parameters */
>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
> +#define S2D_TELEMETRY_FSIZE_MAX		0x200000
>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>  
>  /* STB Spill to DRAM Message Definition */
> @@ -160,6 +161,10 @@ static bool disable_workarounds;
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
> @@ -239,7 +244,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  {
>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
> +	u32 *buf, num_samples, val, stb_rdptr_offset = 0;
>  	int ret;
>  
>  	/* Write dummy postcode while reading the STB buffer */
> @@ -247,10 +252,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	if (ret)
>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>  
> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> -
>  	/* Spill to DRAM num_samples uses separate SMU message port */
>  	dev->msg_port = 1;
>  
> @@ -264,20 +265,27 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	dev->msg_port = 0;
>  	if (ret) {
>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> -		kfree(buf);
>  		return ret;
>  	}
>  
>  	/* Start capturing data from the last push location */
> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
> -		stb_rdptr_offset = num_samples - fsize;
> +	if (dump_custom_stb &&
> +	    (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)) {
> +		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
> +		stb_rdptr_offset = 0;
> +	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {

I find the logic here somewhat suspicious in the first if check (I fail 
to follow the reasoning here despite spending considerable amount of time 
staring at it).

Lets assume dump_custom_stb is set. If dev->dram_size is large, the first 
if condition will be false because LHS of <= is large. Thus, we go to the 
second branch and dump exactly as many samples as before this patch. 
...And that is opposite of what this patch claims to do?

> +		dev->fsize  = S2D_TELEMETRY_BYTES_MAX;

Please remove also the extra space here since you're touching this line.

-- 
 i.

> +		stb_rdptr_offset = num_samples - dev->fsize;

>  	} else {
> -		fsize = num_samples;
> +		dev->fsize = num_samples;
>  		stb_rdptr_offset = 0;
>  	}
>  
> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> +	buf = kzalloc(dev->fsize, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, dev->fsize);
>  	filp->private_data = buf;
>  
>  	return 0;
> @@ -286,11 +294,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
>  					   loff_t *pos)
>  {
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +
>  	if (!filp->private_data)
>  		return -EINVAL;
>  
>  	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> -					S2D_TELEMETRY_BYTES_MAX);
> +					dev->fsize);
>  }
>  
>  static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index c27bd6a5642f..f73d265430b8 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -26,6 +26,7 @@ struct amd_pmc_dev {
>  	u32 dram_size;
>  	u32 num_ips;
>  	u32 s2d_msg_id;
> +	u32 fsize;
>  /* SMU version information */
>  	u8 smu_program;
>  	u8 major;
> 
