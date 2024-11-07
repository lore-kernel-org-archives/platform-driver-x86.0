Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0316A1EE033
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976202; cv=none; b=jqVKDNx1ZhgM0lqJiE9w+B5z+wVyc8FCZC9iW99LBRTBuJ7Qjgua9JqJDIpF5mvyK4K7SP+zXJ5LzbHpWTc7L4kRnCTiaqBuBE2DDuBGoErjJiTgpS8CVFXoshXUTEPf7+6ic4tQowVsCFWNHhjmgGvODVQUI2gYGjwILXKNXjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976202; c=relaxed/simple;
	bh=UcA+xSb8wFlt/ndBJ5qdW6UWF9sfX25R2gaTSLRB4/0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t51ugttDqgNByv4DMiS9gYvwedz1kwZma3quMwXScHsb2Uleq3zRUCvTthrWDFXXvy9ZIDUmqAiS+lw2D1l7fNwW/p4ddiuvH4acXKQMLKhK9I9Ref9vqTQLxE06Vv2oIEwqG46MiPZM4MPqKNRWU4v2k4TVcRBDWTrtoL5VfNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzLjEL/u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzLjEL/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730976201; x=1762512201;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UcA+xSb8wFlt/ndBJ5qdW6UWF9sfX25R2gaTSLRB4/0=;
  b=OzLjEL/u9IxcyiwW6zQbA1gO1Va5bfNHVsp/tpeBRfKjH90r8PWdw6u4
   mlKJxz6BHJgKkHdONV/sOUIo6iMEGsv3voshnH1QFHg8CKnLjnB5JduRT
   dMHjDLC7KkKoQVid6omS8+h319c4lHBhltBsMKwuvnSNzaGJGcOsqavdf
   Y+0quSppmjMlgoI9y15WNf6vpMhQflTF1iB24lfs3S0PHCOMT8Wbiqe+6
   HsOihD27HBeN6s3BK8Y8azU+kNd3/b9Ll5BKbvweI5qLQp8bag6M5Xykc
   0iCruLgA3a+cgeGpqPVmHzthWGgwAJKzb6193XDhIRJB9d27L7HgaJjmy
   Q==;
X-CSE-ConnectionGUID: K3aYfn60TLaleid3BNoaOA==
X-CSE-MsgGUID: PzSpe3A9S965QmGwSNa+uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30985699"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30985699"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:43:21 -0800
X-CSE-ConnectionGUID: VArmQv4bS6ueLGcBzyaBJw==
X-CSE-MsgGUID: r5yvCGxfS9qhEEbWGO7Z0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85123532"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:43:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 7 Nov 2024 12:43:15 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 05/11] platform/x86/amd/pmc: Define enum for S2D/PMC
 msg_port and add helper function
In-Reply-To: <20241107072714.943423-6-Shyam-sundar.S-k@amd.com>
Message-ID: <ab525157-a530-ac5e-8f57-2d18e2a62d6f@linux.intel.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com> <20241107072714.943423-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Nov 2024, Shyam Sundar S K wrote:

> To distinguish between the PMC message port and the S2D (Spill to DRAM)
> message port, replace the use of 0 and 1 with an enum.
> 
> To avoid printing the S2D or PMC port multiple times in debug print,
> add new routine to retrieve the message port information, which can be
> used to print the right msg_port getting used.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/mp1_stb.c |  8 ++++----
>  drivers/platform/x86/amd/pmc/pmc.c     | 15 ++++++++++-----
>  drivers/platform/x86/amd/pmc/pmc.h     |  5 +++++
>  3 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> index 5c03ac92558f..9ee629db9af9 100644
> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -155,7 +155,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>  
>  	/* Spill to DRAM num_samples uses separate SMU message port */
> -	dev->msg_port = 1;
> +	dev->msg_port = MSG_PORT_S2D;
>  
>  	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
>  	if (ret)
> @@ -172,7 +172,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	/* Get the num_samples to calculate the last push location */
>  	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>  	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> +	dev->msg_port = MSG_PORT_PMC;
>  	if (ret) {
>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>  		return ret;
> @@ -267,7 +267,7 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
>  	}
>  
>  	/* Spill to DRAM feature uses separate SMU message port */
> -	dev->msg_port = 1;
> +	dev->msg_port = MSG_PORT_S2D;
>  
>  	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
>  	if (size != S2D_TELEMETRY_BYTES_MAX)
> @@ -285,7 +285,7 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
>  	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>  
>  	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> +	dev->msg_port = MSG_PORT_PMC;
>  
>  	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>  	if (!dev->stb_virt_addr)
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 7726a05091a5..ce0050699a5a 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -449,11 +449,16 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  			    &amd_pmc_idlemask_fops);
>  }
>  
> +static char *amd_pmc_print_msg_port(struct amd_pmc_dev *dev)

Change name as this doesn't print anything.

> +{
> +	return dev->msg_port ? "S2D" : "PMC";

== ...

Although a switch/case might be preferrable here (return "invalid" or 
something in default branch).

> +}
> +
>  static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>  {
>  	u32 value, message, argument, response;
>  
> -	if (dev->msg_port) {
> +	if (dev->msg_port == MSG_PORT_S2D) {
>  		message = AMD_S2D_REGISTER_MESSAGE;
>  		argument = AMD_S2D_REGISTER_ARGUMENT;
>  		response = AMD_S2D_REGISTER_RESPONSE;
> @@ -464,13 +469,13 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>  	}
>  
>  	value = amd_pmc_reg_read(dev, response);
> -	dev_dbg(dev->dev, "AMD_%s_REGISTER_RESPONSE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
> +	dev_dbg(dev->dev, "AMD_%s_REGISTER_RESPONSE:%x\n", amd_pmc_print_msg_port(dev), value);
>  
>  	value = amd_pmc_reg_read(dev, argument);
> -	dev_dbg(dev->dev, "AMD_%s_REGISTER_ARGUMENT:%x\n", dev->msg_port ? "S2D" : "PMC", value);
> +	dev_dbg(dev->dev, "AMD_%s_REGISTER_ARGUMENT:%x\n", amd_pmc_print_msg_port(dev), value);
>  
>  	value = amd_pmc_reg_read(dev, message);
> -	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
> +	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", amd_pmc_print_msg_port(dev), value);
>  }
>  
>  int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
> @@ -480,7 +485,7 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
>  
>  	mutex_lock(&dev->lock);
>  
> -	if (dev->msg_port) {
> +	if (dev->msg_port == MSG_PORT_S2D) {
>  		message = AMD_S2D_REGISTER_MESSAGE;
>  		argument = AMD_S2D_REGISTER_ARGUMENT;
>  		response = AMD_S2D_REGISTER_RESPONSE;
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 188284feca72..8252d3a52849 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -14,6 +14,11 @@
>  #include <linux/types.h>
>  #include <linux/mutex.h>
>  
> +enum s2d_msg_port {
> +	MSG_PORT_PMC,
> +	MSG_PORT_S2D,
> +};
> +
>  struct amd_mp2_dev {
>  	void __iomem *mmio;
>  	void __iomem *vslbase;
> 

-- 
 i.

