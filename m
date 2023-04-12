Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4534AC7619A
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 11:03:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjDLLDb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 07:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjDLLDa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 07:03:30 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97A26A5F
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681297409; x=1712833409;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DBPMt6ZprRjnA/Q/feY1q3islRydQqF554/06Wk0Qo4=;
  b=dW7SkLN1+LthW0ZbxvF85eDteSqLnwaP2GEAyxAGtZUM9p2G17eqd+yl
   8nwtGkuPS0Z0ml/sugsb1ubjYn1tbJ6nlWxTXDIHqoGHTSwn17KQrjVMP
   IkA4v2F2/DHbF3wZ2H021mfbdDyEZj5ShyGAVcxGHU0UVdFWWxd4W4qFP
   4bJkPczb94sWa/X+LQ+8WgAjoT2MOKRUQ6ij1FayI+FF+UYYdOQTwOnJA
   i+iOYOmnIxZTr/ubbWxeVfUIQajNjXmqs47EpaBfC81w+p3iUag9CNI6A
   0q5nTL+8DfLpUCFvtzDCI3iYSdTHcoG4CcsycCDlYIxuyCz2GXBwcqYIh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="341353330"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="341353330"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 04:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="758199714"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="758199714"
Received: from chanse1-mobl2.ger.corp.intel.com ([10.251.213.80])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 04:03:27 -0700
Date:   Wed, 12 Apr 2023 14:03:25 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/2] platform/x86/amd: pmc: update metrics table info
 for Pink Sardine
In-Reply-To: <20230412102156.2592318-2-Shyam-sundar.S-k@amd.com>
Message-ID: <89ad92cd-6f5-c748-6b34-b1fda49a57ce@linux.intel.com>
References: <20230412102156.2592318-1-Shyam-sundar.S-k@amd.com> <20230412102156.2592318-2-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 12 Apr 2023, Shyam Sundar S K wrote:

> Starting from Pink Sardine, number of IP blocks were added to the SoC
> and the PMFW has the ability to give debug stats on each the IP blocks
> after a S0ix cycle within part of the SMU metrics table. Add this new
> capability to the driver.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2:
>  - Based on review-hans branch
>  - No code change
> 
>  drivers/platform/x86/amd/pmc.c | 56 ++++++++++++++++++++++++++--------
>  1 file changed, 43 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 9f8bc6711413..bb7597ca334f 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -45,7 +45,6 @@
>  #define AMD_PMC_STB_DUMMY_PC		0xC6000007
>  
>  /* STB S2D(Spill to DRAM) has different message port offset */
> -#define STB_SPILL_TO_DRAM		0xBE
>  #define AMD_S2D_REGISTER_MESSAGE	0xA20
>  #define AMD_S2D_REGISTER_RESPONSE	0xA80
>  #define AMD_S2D_REGISTER_ARGUMENT	0xA88
> @@ -98,7 +97,6 @@
>  #define PMC_MSG_DELAY_MIN_US		50
>  #define RESPONSE_REGISTER_LOOP_MAX	20000
>  
> -#define SOC_SUBSYSTEM_IP_MAX	12
>  #define DELAY_MIN_US		2000
>  #define DELAY_MAX_US		3000
>  #define FIFO_SIZE		4096
> @@ -132,9 +130,18 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>  	{"ISP",		BIT(6)},
>  	{"NBIO",	BIT(7)},
>  	{"DF",		BIT(8)},
> -	{"USB0",	BIT(9)},
> -	{"USB1",	BIT(10)},
> +	{"USB3_0",	BIT(9)},
> +	{"USB3_1",	BIT(10)},
>  	{"LAPIC",	BIT(11)},
> +	{"USB3_2",	BIT(12)},
> +	{"USB3_3",	BIT(13)},
> +	{"USB3_4",	BIT(14)},
> +	{"USB4_0",	BIT(15)},
> +	{"USB4_1",	BIT(16)},
> +	{"MPM",		BIT(17)},
> +	{"JPEG",	BIT(18)},
> +	{"IPU",		BIT(19)},
> +	{"UMSCH",	BIT(20)},
>  	{}
>  };
>  
> @@ -148,6 +155,8 @@ struct amd_pmc_dev {
>  	u32 cpu_id;
>  	u32 active_ips;
>  	u32 dram_size;
> +	u32 num_ips;
> +	u32 s2d_msg_id;
>  /* SMU version information */
>  	u8 smu_program;
>  	u8 major;
> @@ -195,8 +204,8 @@ struct smu_metrics {
>  	u64 timein_s0i3_totaltime;
>  	u64 timein_swdrips_lastcapture;
>  	u64 timein_swdrips_totaltime;
> -	u64 timecondition_notmet_lastcapture[SOC_SUBSYSTEM_IP_MAX];
> -	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
> +	u64 timecondition_notmet_lastcapture[32];
> +	u64 timecondition_notmet_totaltime[32];
>  } __packed;
>  
>  static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
> @@ -262,7 +271,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	dev->msg_port = 1;
>  
>  	/* Get the num_samples to calculate the last push location */
> -	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, 1);
> +	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, 1);
>  	/* Clear msg_port for other SMU operation */
>  	dev->msg_port = 0;
>  	if (ret) {
> @@ -308,6 +317,23 @@ static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
>  	.release = amd_pmc_stb_debugfs_release_v2,
>  };
>  
> +static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
> +{
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_PCO:
> +	case AMD_CPU_ID_RN:
> +	case AMD_CPU_ID_YC:
> +	case AMD_CPU_ID_CB:
> +		dev->num_ips = 12;
> +		dev->s2d_msg_id = 0xBE;
> +		break;
> +	case AMD_CPU_ID_PS:
> +		dev->num_ips = 21;
> +		dev->s2d_msg_id = 0x85;
> +		break;
> +	}
> +}
> +
>  static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
>  {
>  	if (dev->cpu_id == AMD_CPU_ID_PCO) {
> @@ -470,7 +496,7 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>  		   table.timeto_resume_to_os_lastcapture);
>  
>  	seq_puts(s, "\n=== Active time (in us) ===\n");
> -	for (idx = 0 ; idx < SOC_SUBSYSTEM_IP_MAX ; idx++) {
> +	for (idx = 0 ; idx < dev->num_ips ; idx++) {
>  		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
>  			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
>  				   table.timecondition_notmet_lastcapture[idx]);
> @@ -901,7 +927,7 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
>  		goto err_dram_size;
>  	}
>  
> -	amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, STB_SPILL_TO_DRAM, 1);
> +	amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, 1);
>  	if (!dev->dram_size)
>  		goto err_dram_size;
>  
> @@ -922,7 +948,10 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	/* Spill to DRAM feature uses separate SMU message port */
>  	dev->msg_port = 1;
>  
> -	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, 1);
> +	/* Get num of IP blocks within the SoC */
> +	amd_pmc_get_ip_info(dev);
> +
> +	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, 1);
>  	if (size != S2D_TELEMETRY_BYTES_MAX)
>  		return -EIO;
>  
> @@ -932,8 +961,8 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
>  
>  	/* Get STB DRAM address */
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, 1);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, 1);
>  
>  	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>  
> @@ -1022,7 +1051,8 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  
>  	mutex_init(&dev->lock);
>  
> -	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)) {
> +	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB ||
> +			   dev->cpu_id == AMD_CPU_ID_PS)) {

These same cpu_id checks are now done in two place. Create a helper for 
it.

Curiously enough, the other place already had _PS added there, was this 
place perhaps missed when 035c8a91a11f ("platform/x86/amd/pmc: Add new 
platform support") was done? The debugfs will use incorrect 
STB_SPILL_TO_DRAM for _PS in amd_pmc_stb_debugfs_open_v2() before this 
change?

>  		err = amd_pmc_s2d_init(dev);
>  		if (err)
>  			goto err_pci_dev_put;
> 

-- 
 i.

