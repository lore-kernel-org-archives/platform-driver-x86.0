Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FCAC7EE23
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 May 2023 08:35:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbjEWIf1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 May 2023 04:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236132AbjEWIdp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 04:33:45 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3841AE47
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684830681; x=1716366681;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bueOSJjgNCTsQ/xvOElzEQ+1qyU/N6oNeiOgFlGrH1w=;
  b=eD5rHOOkh/xcVExAaHI62xYhV1rk+9n5imUra9v0dsJDIgXycGda7Lhu
   DIJnGrYBfiKtFYWh/eUWcXwe6EgFbXD4Qu/aiQyUlQ9zMyq/sk036pibb
   ok3KLOgKO+KY9Gm2TGi3mMgyLUe5pwMVPvXeMHHNlOqLyu5nx93Wv5EMO
   1bO+e3C2VJ3i2KBrq/euL11hWb7mdN4Xf8BOA6zys0W0UT4LE/cpuU/L8
   Ig9dIzqjoX7F0JKnXjJQ4WzhOMhOfo55on1opXGVEZlLdooFGy4yzxHb/
   Bfua4CQ2VgcUABfwaJNvZfWX70+228EDHTnfIdA7yHMzya370JDaCr83e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="350684752"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="350684752"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 01:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="768926154"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="768926154"
Received: from oodnolex-mobl1.ccr.corp.intel.com ([10.252.55.104])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 01:31:19 -0700
Date:   Tue, 23 May 2023 11:31:16 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 4/4] platform/x86/amd: pmc: Update metrics table info
 for Pink Sardine
In-Reply-To: <20230516091308.3905113-5-Shyam-sundar.S-k@amd.com>
Message-ID: <f1b5d35a-471b-3b51-ef24-d534f7c745ee@linux.intel.com>
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com> <20230516091308.3905113-5-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 16 May 2023, Shyam Sundar S K wrote:

> Starting from Pink Sardine, number of IP blocks were added to the SoC
> and the PMFW has the ability to give debug stats on each the IP blocks
> after a S0ix cycle within part of the SMU metrics table. Add this new
> capability to the driver.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc.c | 53 ++++++++++++++++++++++++++--------
>  1 file changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 7e5e6afb3410..0e67325a5aec 100644
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
> @@ -99,7 +98,6 @@
>  #define PMC_MSG_DELAY_MIN_US		50
>  #define RESPONSE_REGISTER_LOOP_MAX	20000
>  
> -#define SOC_SUBSYSTEM_IP_MAX	12
>  #define DELAY_MIN_US		2000
>  #define DELAY_MAX_US		3000
>  #define FIFO_SIZE		4096
> @@ -133,9 +131,18 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
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
> @@ -149,6 +156,8 @@ struct amd_pmc_dev {
>  	u32 cpu_id;
>  	u32 active_ips;
>  	u32 dram_size;
> +	u32 num_ips;
> +	u32 s2d_msg_id;
>  /* SMU version information */
>  	u8 smu_program;
>  	u8 major;
> @@ -196,8 +205,8 @@ struct smu_metrics {
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
> @@ -263,7 +272,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	dev->msg_port = 1;
>  
>  	/* Get the num_samples to calculate the last push location */
> -	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, true);
> +	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>  	/* Clear msg_port for other SMU operation */
>  	dev->msg_port = 0;
>  	if (ret) {
> @@ -310,6 +319,23 @@ static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
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

Changelog doesn't seem to mention the addition of ->s2d_msg_id at all but 
only describes the num_ips change.

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
> @@ -471,7 +497,7 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>  		   table.timeto_resume_to_os_lastcapture);
>  
>  	seq_puts(s, "\n=== Active time (in us) ===\n");
> -	for (idx = 0 ; idx < SOC_SUBSYSTEM_IP_MAX ; idx++) {
> +	for (idx = 0 ; idx < dev->num_ips ; idx++) {
>  		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
>  			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
>  				   table.timecondition_notmet_lastcapture[idx]);
> @@ -919,7 +945,7 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
>  		goto err_dram_size;
>  	}
>  
> -	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, STB_SPILL_TO_DRAM, true);
> +	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
>  	if (ret || !dev->dram_size)
>  		goto err_dram_size;
>  
> @@ -940,7 +966,10 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	/* Spill to DRAM feature uses separate SMU message port */
>  	dev->msg_port = 1;
>  
> -	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, true);
> +	/* Get num of IP blocks within the SoC */
> +	amd_pmc_get_ip_info(dev);
> +
> +	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
>  	if (size != S2D_TELEMETRY_BYTES_MAX)
>  		return -EIO;
>  
> @@ -950,8 +979,8 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
>  
>  	/* Get STB DRAM address */
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, true);
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, true);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
>  
>  	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>  
> 

-- 
 i.

