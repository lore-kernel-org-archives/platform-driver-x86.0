Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB7C3E9F69;
	Tue, 31 Mar 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946645; cv=none; b=jHX6n4qznASJz7TBKJclhTmuYO7RgqxCT1RSTPAfWMBv712QCPGAVz6SxvM+0SJyxY4UZv4HV8+zPtRYeoertBQtUCMrOTH/5bnUNF6j4Vjm8UuPWEiWB3ZH0m2UWDSXxEDVP0nv40xl7GOUUgeOc2s+GSF7LuIrRErl3XXqVHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946645; c=relaxed/simple;
	bh=FXS21lgugIIVrzmN/kUlh5ta4ucvLzOfXEqZSKpNB6o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=P+jScGKgM6q9Ky0Pj5zOL8fhNGeS0CcuDigOYFv6LoNEh4mnwgXatDQ0NBRuNzYiwzoqZbZPgoa64Z1IUQ9QYgaIo7IprpQvHnvspqc9hYegtpTP9/riZ8mGbUi3Wyd3SSk8QOqxLaMJx3micN7R/WKh6hYIA5GwuLky8sJi86c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Upz0du6k; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Upz0du6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774946643; x=1806482643;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FXS21lgugIIVrzmN/kUlh5ta4ucvLzOfXEqZSKpNB6o=;
  b=Upz0du6kz9HPkT4ZA+9q2h5e2Gq6svMBtwj7gTMnMjUgCySqW39FmKhc
   rVKBb6WmgDQOJHhjf4O4gGlqxMT0iGS8LNChYYcX0EHG/jscS+6+hy7nG
   8ZT77+aRwG3oW2T70EIFi1TiHiHXUlnMmi94iI9Y5W7d4xC+fx2lCx6W0
   dX6OHSD1fVf8lDI5gvcm9E2stcFlZ1VVucTMCVMtuN76LVxNpwkh5NOEg
   K3D2lXaeIQg/RY3l0rd3ukrx8R+Qpm5WXK5bxnnn0+Qy//19B08YDQ3mM
   i7JBzP6FouV0WbU5vZqwDEm32ET7pNHsdbwkb26zfWhSMbI8/aYmxIfO4
   g==;
X-CSE-ConnectionGUID: 2SGPs6I6ROuBvD0S3dmYEQ==
X-CSE-MsgGUID: BGH1IfwPTyalzrOh0pGsag==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93337225"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="93337225"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:44:03 -0700
X-CSE-ConnectionGUID: 9LgDBDBJSAe3rLZfB/NJQg==
X-CSE-MsgGUID: SOQPc+pOTWeoAceW+h3dSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="249347541"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:43:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 31 Mar 2026 11:43:55 +0300 (EEST)
To: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Muralidhara M K <muralimk@amd.com>
Subject: Re: [PATCH 2/2] platform/x86/amd/hsmp: Add support for variable-sized
 metrics tables
In-Reply-To: <20260305105050.2940904-3-muthusamy.ramalingam@amd.com>
Message-ID: <81915669-87e0-f06d-7a91-eaec41ecc0e1@linux.intel.com>
References: <20260305105050.2940904-1-muthusamy.ramalingam@amd.com> <20260305105050.2940904-3-muthusamy.ramalingam@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Mar 2026, Muthusamy Ramalingam wrote:

> Add support for the new metrics table format introduced in AMD Family 1Ah
> Model 50h-5Fh processors with HSMP protocol version 7.
> 
> Use CPU family/model and protocol versions to map respective variable-sized
> metric table configurations.
> The exported hsmp_metric_tbl_read() function provides offset support for
> variable-sized tables.

This patch should be split into multiple changes.

> Co-developed-by: Muralidhara M K <muralimk@amd.com>
> Signed-off-by: Muralidhara M K <muralimk@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> ---
>  arch/x86/include/uapi/asm/amd_hsmp.h | 86 ++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/acpi.c |  9 +--
>  drivers/platform/x86/amd/hsmp/hsmp.c | 83 ++++++++++++++++++++++-----
>  drivers/platform/x86/amd/hsmp/hsmp.h |  3 +-
>  drivers/platform/x86/amd/hsmp/plat.c |  3 +-
>  5 files changed, 164 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index 603d62f8d4da..1daa7c5352f3 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -575,6 +575,92 @@ struct hsmp_metric_table {
>  	__u32 gfxclk_frequency[8];
>  };
>  
> +#define F1A_M50_M5F_MAX_CORES_PER_CCD_32	32
> +#define F1A_M50_M5F_MAX_FREQ_TABLE_SIZE		4
> +#define F1A_M50_M5F_MAX_XGMI			8
> +#define F1A_M50_M5F_MAX_PCIE			8
> +#define F1A_M50_M5F_MAX_CCD			8
> +
> +/* Metrics table (supported only with proto version 7) */
> +struct hsmp_metric_table_f1a_m50_5f_iod {
> +	__u32 num_active_ccds;
> +	__u32 accumulation_counter;
> +
> +	/* TEMPERATURE */
> +	__u64 max_socket_temperature_acc;
> +
> +	/* POWER */
> +	__u32 socket_power_limit;
> +	__u32 max_socket_power_limit;
> +	__u64 socket_power_acc;
> +	__u64 core_power_acc;
> +	__u64 uncore_power_acc;
> +
> +	/* ENERGY */
> +	__u64 timestamp;
> +	__u64 socket_energy_acc;
> +	__u64 core_energy_acc;
> +	__u64 uncore_energy_acc;
> +
> +	/* FREQUENCY */
> +	__u64 fclk_frequency_acc;
> +	__u64 uclk_frequency_acc;
> +	__u64 ddr_rate_acc;
> +	__u64 lclk_frequency_acc[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +
> +	/* FREQUENCY RANGE */
> +	__u32 fclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +	__u32 uclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +	__u32 ddr_rate_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +	__u32 max_df_pstate_range;
> +	__u32 min_df_pstate_range;
> +	__u32 lclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
> +	__u32 max_lclk_dpm_range;
> +	__u32 min_lclk_dpm_range;
> +
> +	/* XGMI */
> +	__u64 xgmi_bit_rate[F1A_M50_M5F_MAX_XGMI];
> +	__u64 xgmi_read_bandwidth[F1A_M50_M5F_MAX_XGMI];
> +	__u64 xgmi_write_bandwidth[F1A_M50_M5F_MAX_XGMI];
> +
> +	/* ACTIVITY */
> +	__u64 socket_c0_residency_acc;
> +	__u64 socket_df_cstate_residency_acc;
> +	__u64 dram_read_bandwidth_acc;
> +	__u64 dram_write_bandwidth_acc;
> +	__u32 max_dram_bandwidth;
> +	__u64 pcie_bandwidth_acc[F1A_M50_M5F_MAX_PCIE];
> +
> +	/* THROTTLERS */
> +	__u32 prochot_residency_acc;
> +	__u32 ppt_residency_acc;
> +	__u32 thm_residency_acc;
> +	__u32 vrhot_residency_acc;
> +	__u32 cpu_tdc_residency_acc;
> +	__u32 soc_tdc_residency_acc;
> +	__u32 io_mem_tdc_residency_acc;
> +	__u32 fit_residency_acc;
> +};
> +
> +struct hsmp_metric_table_f1a_m50_5f_ccd {
> +	__u32 core_apicid_of_thread0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_c0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_cc1[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_cc6[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_frequency[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_frequency_effective[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +	__u64 core_power[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
> +};
> +
> +/*
> + * Future processors within the same family and model may support a
> + * variable number of CCDs and cores
> + */
> +struct hsmp_metric_table_f1a_m50_5f {
> +	struct hsmp_metric_table_f1a_m50_5f_iod	iod;
> +	struct hsmp_metric_table_f1a_m50_5f_ccd	ccd[F1A_M50_M5F_MAX_CCD];
> +};
> +
>  /* Reset to default packing */
>  #pragma pack()
>  
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 97ed71593bdf..c91b694bd394 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -238,13 +238,14 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
>  	struct device *dev = container_of(kobj, struct device, kobj);
>  	struct hsmp_socket *sock = dev_get_drvdata(dev);
>  
> -	return hsmp_metric_tbl_read(sock, buf, count);
> +	return hsmp_metric_tbl_read(sock, buf, count, off);
>  }
>  
>  static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  					 const struct bin_attribute *battr, int id)
>  {
> -	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
> +	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6 ||
> +	    hsmp_pdev->proto_ver == HSMP_PROTO_VER7)
>  		return battr->attr.mode;
>  
>  	return 0;
> @@ -491,7 +492,8 @@ static int init_acpi(struct device *dev)
>  		return ret;
>  	}
>  
> -	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
> +	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6 ||
> +	    hsmp_pdev->proto_ver == HSMP_PROTO_VER7) {
>  		ret = hsmp_get_tbl_dram_base(sock_ind);
>  		if (ret)
>  			dev_info(dev, "Failed to init metric table\n");
> @@ -509,7 +511,6 @@ static int init_acpi(struct device *dev)
>  static const struct bin_attribute  hsmp_metric_tbl_attr = {
>  	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
>  	.read = hsmp_metric_tbl_acpi_read,
> -	.size = sizeof(struct hsmp_metric_table),
>  };
>  
>  static const struct bin_attribute *hsmp_attr_list[] = {
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 19f82c1d3090..55b941f8a819 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -348,9 +348,22 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  	return 0;
>  }
>  
> -ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
> +/**
> + * hsmp_metric_tbl_read - Read metric table
> + *
> + * This function maintains ABI compatibility for external consumers.
> + * It reads from offset 0, which works for all metrics table formats.
> + * External modules using this function will continue to work without
> + * modification.

Please don't write history descriptions like this into comments. Only 
focus on explain what it does now. The sentences like the last one belong 
more into changelog text.

> + *
> + * Return: number of bytes read or negative error code
> + */
> +
> +ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf,
> +			     size_t size, loff_t off)
>  {
>  	struct hsmp_message msg = { 0 };
> +	size_t var_size, remaining;
>  	int ret;
>  
>  	if (!sock || !buf)
> @@ -361,29 +374,37 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  		return -ENOMEM;
>  	}
>  
> -	/* Do not support lseek(), also don't allow more than the size of metric table */
> -	if (size != sizeof(struct hsmp_metric_table)) {
> -		dev_err(sock->dev, "Wrong buffer size\n");
> +	if (off < 0 || off > hsmp_pdev.hsmp_table_size) {
> +		dev_err(sock->dev, "Invalid offset\n");
>  		return -EINVAL;
>  	}
>  
> -	msg.msg_id	= HSMP_GET_METRIC_TABLE;
> -	msg.sock_ind	= sock->sock_ind;
> +	/* Compute remaining bytes using explicit cast to avoid signed/unsigned mixing */
> +	remaining = hsmp_pdev.hsmp_table_size - (size_t)off;
> +	var_size = min_t(size_t, size, remaining);

Both inputs are already size_t so you should use min() instead.

> +	if (off == 0) {
> +		msg.msg_id	= HSMP_GET_METRIC_TABLE;
> +		msg.sock_ind	= sock->sock_ind;
>  
> -	ret = hsmp_send_message(&msg);
> -	if (ret)
> -		return ret;
> -	memcpy_fromio(buf, sock->metric_tbl_addr, size);
> +		ret = hsmp_send_message(&msg);
> +		if (ret) {
> +			dev_err(sock->dev, "Failed to send HSMP_GET_METRIC_TABLE, ret: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +	memcpy_fromio(buf, (u8 __iomem *)sock->metric_tbl_addr + off, var_size);

This change which changes size/off handling should be made separately and 
properly explain the changes in the interface in its changelog text.

I started to wonder how is concurrency control supposed to work with 
these calls, there doesn't seem to be any locks taken?

> -	return size;
> +	return var_size;
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
>  
>  int hsmp_get_tbl_dram_base(u16 sock_ind)
>  {
>  	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
> +	struct hsmp_message msg_tbl_ver = { 0 };
>  	struct hsmp_message msg = { 0 };
>  	phys_addr_t dram_addr;
> +	u32 table_ver;
>  	int ret;
>  
>  	msg.sock_ind	= sock_ind;
> @@ -403,8 +424,44 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>  		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>  		return -ENOMEM;
>  	}
> -	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
> -					     sizeof(struct hsmp_metric_table));
> +
> +	/* Get metric table version */
> +	msg_tbl_ver.sock_ind    = sock_ind;
> +	msg_tbl_ver.response_sz = hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_VER].response_sz;
> +	msg_tbl_ver.msg_id      = HSMP_GET_METRIC_TABLE_VER;
> +
> +	ret = hsmp_send_message(&msg_tbl_ver);
> +	if (ret)
> +		return ret;
> +
> +	table_ver = msg_tbl_ver.args[0];
> +
> +	hsmp_pdev.hsmp_table_size = 0;

Is this necessary?

> +	/* Determine metric table size based on CPU family/model and table version */
> +	switch (boot_cpu_data.x86) {
> +	case 0x1A:
> +		if (boot_cpu_data.x86_model >= 0x50 &&
> +		    boot_cpu_data.x86_model <= 0x5F &&
> +		    table_ver == 0x00700000) {
> +			hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table_f1a_m50_5f);
> +		}
> +		break;
> +	case 0x19:
> +		if (boot_cpu_data.x86_model >= 0x90 &&
> +		    boot_cpu_data.x86_model <= 0x9F) {

Isn't this a new check compared with the old code? It should be added in 
own patch as well.

> +			hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
> +		}
> +		break;
> +	}
> +
> +	if (!hsmp_pdev.hsmp_table_size) {
> +		dev_err(sock->dev,
> +			"Metric table not supported for F%02Xh_M%02Xh (table version: 0x%08X)\n",
> +			boot_cpu_data.x86, boot_cpu_data.x86_model, table_ver);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr, hsmp_pdev.hsmp_table_size);
>  	if (!sock->metric_tbl_addr) {
>  		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>  		return -ENOMEM;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index b153527e0a0d..a887eaa061e4 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -55,6 +55,7 @@ struct hsmp_plat_device {
>  	u32 proto_ver;
>  	u16 num_sockets;
>  	bool is_probed;
> +	size_t hsmp_table_size;
>  };
>  
>  int hsmp_cache_proto_ver(u16 sock_ind);
> @@ -63,7 +64,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>  void hsmp_misc_deregister(void);
>  int hsmp_misc_register(struct device *dev);
>  int hsmp_get_tbl_dram_base(u16 sock_ind);
> -ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
> +ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size, loff_t off);
>  struct hsmp_plat_device *get_hsmp_pdev(void);
>  #if IS_ENABLED(CONFIG_HWMON)
>  int hsmp_create_sensor(struct device *dev, u16 sock_ind);
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index e07f68575055..9e37502defb2 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -59,7 +59,7 @@ static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj
>  
>  	sock = &hsmp_pdev->sock[sock_ind];
>  
> -	return hsmp_metric_tbl_read(sock, buf, count);
> +	return hsmp_metric_tbl_read(sock, buf, count, off);
>  }
>  
>  static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> @@ -94,7 +94,6 @@ static const struct bin_attribute attr##index = {			\
>  	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},	\
>  	.private = (void *)index,					\
>  	.read = hsmp_metric_tbl_plat_read,				\
> -	.size = sizeof(struct hsmp_metric_table),			\
>  };									\
>  static const struct bin_attribute _list[] = {				\
>  	&attr##index,							\
> 

-- 
 i.

