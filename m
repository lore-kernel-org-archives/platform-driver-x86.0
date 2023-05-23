Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4B4C77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 May 2023 08:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236131AbjEWIS2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 May 2023 04:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235980AbjEWIRn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2023 04:17:43 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC56C5
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 May 2023 01:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684829750; x=1716365750;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=A+/G1BtLvC4i88GBzKVgpWI1o1kztcliv3o6gmNTAE8=;
  b=ICgCXA6ytgQcdH6WKAymadRYjytGaIc5A1YW25GMbdcbo+T4aXBN9tA5
   jM/OudeIhvDhVcQuIwgQbnmBRf4Ju1e6+8GtS7HlPu84vhbTeoNmehVZQ
   hy+/6/1BeoyCJcbdP8XEE70GSacvBzOtuQOc6/Rm2diDsU4oyxTR5A5Wn
   A+O5HJn4Sk9JIYGcd/9B8G82L2RgUx6VqBpEjuYtw8Jhc37vMvqt7LN/W
   tZKCVV64z5qweJknbWWD2Vz/FUJzj6Ebqt3npmLovfQjaiGOtWAQaVfIm
   Sx586m8l70hS4CWitmdxrIn4/bHiJ3aS+M/HD25WHGKCaKCCWPRZHcVF5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="333536896"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="333536896"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 01:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="950463056"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="950463056"
Received: from oodnolex-mobl1.ccr.corp.intel.com ([10.252.55.104])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 01:15:47 -0700
Date:   Tue, 23 May 2023 11:15:45 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 2/4] platform/x86/amd: pmc: Get STB DRAM size from
 PMFW
In-Reply-To: <20230516091308.3905113-3-Shyam-sundar.S-k@amd.com>
Message-ID: <cb258d52-a44b-b342-2463-13483f988c64@linux.intel.com>
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com> <20230516091308.3905113-3-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-211742160-1684829749=:3565"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-211742160-1684829749=:3565
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Tue, 16 May 2023, Shyam Sundar S K wrote:

> Recent PMFW's have support for querying the STB DRAM size. Add this
> support to the driver.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

> ---
>  drivers/platform/x86/amd/pmc.c | 37 +++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index f28c295b47dd..e2439fda5c02 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -115,6 +115,7 @@ enum s2d_arg {
>  	S2D_PHYS_ADDR_LOW,
>  	S2D_PHYS_ADDR_HIGH,
>  	S2D_NUM_SAMPLES,
> +	S2D_DRAM_SIZE,
>  };
>  
>  struct amd_pmc_bit_map {
> @@ -147,6 +148,7 @@ struct amd_pmc_dev {
>  	u32 base_addr;
>  	u32 cpu_id;
>  	u32 active_ips;
> +	u32 dram_size;
>  /* SMU version information */
>  	u8 smu_program;
>  	u8 major;
> @@ -890,11 +892,39 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  	{ }
>  };
>  
> +static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
> +{
> +	int ret;
> +
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_YC:
> +		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
> +			ret = -EINVAL;
> +			goto err_dram_size;
> +		}
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		goto err_dram_size;
> +	}
> +
> +	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, STB_SPILL_TO_DRAM, true);
> +	if (ret || !dev->dram_size)
> +		goto err_dram_size;
> +
> +	return 0;
> +
> +err_dram_size:
> +	dev_err(dev->dev, "DRAM size command not supported for this platform\n");
> +	return ret;
> +}
> +
>  static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  {
>  	u32 phys_addr_low, phys_addr_hi;
>  	u64 stb_phys_addr;
>  	u32 size = 0;
> +	int ret;
>  
>  	/* Spill to DRAM feature uses separate SMU message port */
>  	dev->msg_port = 1;
> @@ -903,6 +933,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	if (size != S2D_TELEMETRY_BYTES_MAX)
>  		return -EIO;
>  
> +	/* Get DRAM size */
> +	ret = amd_pmc_get_dram_size(dev);
> +	if (ret)
> +		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
> +
>  	/* Get STB DRAM address */
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, true);
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, true);
> @@ -912,7 +947,7 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	/* Clear msg_port for other SMU operation */
>  	dev->msg_port = 0;
>  
> -	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, S2D_TELEMETRY_DRAMBYTES_MAX);
> +	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>  	if (!dev->stb_virt_addr)
>  		return -ENOMEM;
>  
> 
--8323329-211742160-1684829749=:3565--
