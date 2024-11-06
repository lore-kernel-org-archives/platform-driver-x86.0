Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E251D5CFA
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887743; cv=none; b=lN1n6mpioLxSBTM/V7KcCKWB4Hb6PgK4q7Lv8nBw05fgQhdeWVRbzqsR8TavDJE9UTCagKM1tORinNmF2QKF0wMd4COIBNbU/QiUYyLIFwE5mqC7dIZIUVePTPtMfg/v+/Srt3op+T41dQUlhipI/penJkB34NEyFuNOq2CRVdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887743; c=relaxed/simple;
	bh=Zr/BqvkUidAqBneFXF14IwFCmfOe8/SPnqNJSrVUdoM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HZFCvbXmqF3J+sC+A6RBeU5zhZn34QPYdoFdcjdiBr9/klUJ9+grZuopdjHxgi7+PcOlEMSn8rXBPNCnUjyVQ7GxMbmiBKCKU/Gn/GnDXeDKxsQpl5R5P+WUYX60VvBbQb3ILIDVL6vD5mlHogRDOLm/ZFYgJQd/hvCvQwLEaxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWhdEz81; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWhdEz81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730887742; x=1762423742;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Zr/BqvkUidAqBneFXF14IwFCmfOe8/SPnqNJSrVUdoM=;
  b=TWhdEz81g9BgYtNH6gy+HQR+GuCywhS2cddOj+IQ0WoKtdEBSefxu/KB
   1Ztqde3XrSP3KKu8wMqmt9sDiR98hJAqefahsZ9H8sR/t6eUoPsr1sunR
   K27Cwl8d/0bXXQvyRH/XNlu+wQfxcl/UmUv8pfDdnlPkZ5CsL3CvIk/sl
   REErydYtMx2TiMiiZ28qE/Nyj9eFd8qJLaweyDqhdG12gDig3u76up860
   x1ipk+BqFZO+w/XWNL6wVGFXCu11XBBV9yppUdqumRvDEp20rTU0m/3M5
   CS6gO1rJx+u3XzU5yv4wfIbcigdmSadCdXwiv+VP0Du4q5TgLS0q5078i
   Q==;
X-CSE-ConnectionGUID: 3TMmxvbwQV+vNbsa6l6sXw==
X-CSE-MsgGUID: NodM/RoyTJmWNS6apgVvYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="33520713"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="33520713"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:09:02 -0800
X-CSE-ConnectionGUID: rEnlUc1WQT6xm13Hft+WhQ==
X-CSE-MsgGUID: WM/B9lvsQlaxhT9/WuLHAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84377542"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:08:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 Nov 2024 12:08:55 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 06/13] platform/x86/amd/pmc: Define enum for S2D/PMC
 msg_port
In-Reply-To: <20241105173637.733589-7-Shyam-sundar.S-k@amd.com>
Message-ID: <32a61666-c395-e400-3e2c-e60c26f8a6b9@linux.intel.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com> <20241105173637.733589-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Nov 2024, Shyam Sundar S K wrote:

> To distinguish between the PMC message port and the S2D (Spill to DRAM)
> message port, replace the use of 0 and 1 with an enum.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/mp1_stb.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> index 5c03ac92558f..fd7ca1626cfe 100644
> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -47,6 +47,11 @@ enum s2d_arg {
>  	S2D_DRAM_SIZE,
>  };
>  
> +enum s2d_msg_port {
> +	MSG_PORT_PMC,
> +	MSG_PORT_S2D,
> +};
> +
>  struct amd_stb_v2_data {
>  	size_t size;
>  	u8 data[] __counted_by(size);
> @@ -155,7 +160,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>  
>  	/* Spill to DRAM num_samples uses separate SMU message port */
> -	dev->msg_port = 1;
> +	dev->msg_port = MSG_PORT_S2D;
>  
>  	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
>  	if (ret)
> @@ -172,7 +177,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	/* Get the num_samples to calculate the last push location */
>  	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>  	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> +	dev->msg_port = MSG_PORT_PMC;
>  	if (ret) {
>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>  		return ret;
> @@ -267,7 +272,7 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
>  	}
>  
>  	/* Spill to DRAM feature uses separate SMU message port */
> -	dev->msg_port = 1;
> +	dev->msg_port = MSG_PORT_S2D;
>  
>  	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
>  	if (size != S2D_TELEMETRY_BYTES_MAX)
> @@ -285,7 +290,7 @@ int amd_stb_s2d_init(struct amd_pmc_dev *dev)
>  	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>  
>  	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> +	dev->msg_port = MSG_PORT_PMC;
>  
>  	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>  	if (!dev->stb_virt_addr)
> 

Hi,

This still isn't doing all what it should, you need to change all these:

if (dev->msg_port)

to:

if (dev->msg_port == MSG_PORT_S2D)

(and if there were !dev->msg_port ones, use the other enum obviously.)

And the helper, likewise comes too late in the series so it cannot help 
here and you'd need to do that == on print lines too so either make the 
helper conversion before this patch or in this patch.

-- 
 i.

