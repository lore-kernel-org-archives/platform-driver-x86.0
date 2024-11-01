Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0AA1553AB
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 Nov 2024 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456889; cv=none; b=MyQGsKZAkuMZ2xXEGV/EqlxjijEKkcLJfLWrdKWnk9vQtH0437SiA3kqbKYxzfc3G9aZPo8sMrRrouJAJ33GPenP6F8nbqqsofzN2hYrJjtIDQiaJZtrnUmAt++G+rqrMxS1/qHbRDb0aBSXaYEw5Gl4MwGH7tSaC6TnFAqhADc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456889; c=relaxed/simple;
	bh=xRVtsxuexCI2SZMtGiFuWAmJemnLn6VdExgrDnLJq5k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=q8G54G5CsYl90aEE8bnN8bjJRwDQcsMgtJa+kYEJ2wLs8rGXq4P0ef3h6VxWvSMRi47lEp9MamNPF7Od9ZQQ3yhacw7c6c80o4VjcfCqaFkgy6fv4tasI4Mc4LnTHt6rqxmlWt9hpNgpqGAjqOgCMoHtti+Pvy/sE0YHQel4qGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8rkczrW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8rkczrW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730456888; x=1761992888;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xRVtsxuexCI2SZMtGiFuWAmJemnLn6VdExgrDnLJq5k=;
  b=X8rkczrWj9TvVIDCp02S3PJuDXtW33M0yx5nHGvlKJDtH/DmXo0YrImt
   W8yfs2+Y5ivR22EdLSPQ11cdk8rP725oL80reyJD1LyCJscFYSCERFiUZ
   hvYPIfyvKyP72X9jbhy4Cq6ifnZelPULsWMNo6MAR38Idfs814k7Wzu1o
   ubYsbt+xjLMCvnj1lSPJaoQuZluCHaFo6Tx8QxV5aEOP3r1HFeFdGvoRC
   hpMYF5finPAfiUImbi0Sm1kFXmlgoVx4yxI7kh+T/yml5XWoBbTKxQrsI
   4JjvthDSSoVbhLwBGJzRONEGMHmBUt/ii4SoRG2Kfi4EdbuOZSdv5EjtA
   A==;
X-CSE-ConnectionGUID: HJASZKAgRneB+2Mvbf4EIA==
X-CSE-MsgGUID: AjxebLQlTL2vMBURnO1f/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="41616746"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="41616746"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:28:07 -0700
X-CSE-ConnectionGUID: ldzaYUB4SGmgluYX71RBBQ==
X-CSE-MsgGUID: kKpom/8YQQCYw7YHddIHTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83740431"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:28:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 1 Nov 2024 12:28:00 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 3/8] platform/x86/amd/pmc: Define enum for S2D/PMC
 msg_port
In-Reply-To: <20241029155440.3499273-4-Shyam-sundar.S-k@amd.com>
Message-ID: <1bf70e8a-5e28-57f3-1cba-41adf83f5a3b@linux.intel.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com> <20241029155440.3499273-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Oct 2024, Shyam Sundar S K wrote:

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
> index 5efec020ecac..2b06861c479b 100644
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
> @@ -156,7 +161,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>  
>  	/* Spill to DRAM num_samples uses separate SMU message port */
> -	dev->msg_port = 1;
> +	dev->msg_port = MSG_PORT_S2D;
>  
>  	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
>  	if (ret)
> @@ -173,7 +178,7 @@ static int amd_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	/* Get the num_samples to calculate the last push location */
>  	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
>  	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> +	dev->msg_port = MSG_PORT_PMC;
>  	if (ret) {
>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>  		return ret;
> @@ -266,7 +271,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
>  				    &amd_stb_debugfs_fops);
>  
>  	/* Spill to DRAM feature uses separate SMU message port */
> -	dev->msg_port = 1;
> +	dev->msg_port = MSG_PORT_S2D;
>  
>  	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
>  	if (size != S2D_TELEMETRY_BYTES_MAX)
> @@ -284,7 +289,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
>  	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>  
>  	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> +	dev->msg_port = MSG_PORT_PMC;
>  
>  	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
>  	if (!dev->stb_virt_addr)

This change is incomplete, you missed all places using it:

if (dev->msg_port) { 

+ add helper for this:

dev->msg_port ? "S2D" : "PMC"

-- 
 i.

