Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBDACD5BB9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Sep 2023 13:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbjISNI3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Sep 2023 09:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbjISNI2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2023 09:08:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A6E129
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Sep 2023 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695128900; x=1726664900;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=o0IDmA0n27YTIdX5PSVODQ7GmiZrm5jQgXGbJJyI3x4=;
  b=K5Ruc7z2cOFXUwYIpukOH/+3HNEu5gRJjsScmhIapPF7QMSeVPJWfDuH
   QHR3MSnVXLPGvT7jBFvF8L/cFYIxlpmiMP4cDo1krSeYaLl8Jdgh+XZXB
   9rtgY+WX36QzgFM6DsOtVSym3TWfJk0ant6Hr76nCMjuLnQf9Aq2fb/8V
   9pjWtkeRUB+3boPy5kxvtwuFpXWd8uHvG0ANPOKejhJGuS4baWHJlDZdM
   OuIrH1vBQIZTynHnhfWoUF9gHy5f6ZMvuKgsBaXcAI1nS6EuOQInTVu5n
   oJHZAcCcm9cS0hTNH7RkPQGs/Rzo2PM0cHmoCTeJn5ipkSpSohGKE+2AS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410865473"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="410865473"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 06:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="811723085"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="811723085"
Received: from laichele-mobl1.ger.corp.intel.com ([10.252.38.7])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 06:07:39 -0700
Date:   Tue, 19 Sep 2023 16:07:38 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Suma Hegde <suma.hegde@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v3 2/3] platform/x86/amd/hsmp: add support for metrics
 tbl
In-Reply-To: <20230919092057.2235437-2-suma.hegde@amd.com>
Message-ID: <38442217-9629-5fa8-8d36-4eebc6fda4f4@linux.intel.com>
References: <20230919092057.2235437-1-suma.hegde@amd.com> <20230919092057.2235437-2-suma.hegde@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 19 Sep 2023, Suma Hegde wrote:

> AMD MI300 MCM provides GET_METRICS_TABLE message to retrieve
> all the system management information from SMU.
> 
> The metrics table is made available as hexadecimal sysfs binary file
> under per socket sysfs directory created at
> /sys/devices/platform/amd_hsmp/socket%d/metrics_bin
> 
> Metrics table definitions will be documented as part of Public PPR.
> The same is defined in the amd_hsmp.h header.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v1:
> 1. Remove HSMP_DEVNODE_NAME and HSMP_CDEV_NAME macro definitions in
> this patch
> 2. Remove extra space in comments for HSMP_GET_METRIC_TABLE_VER,
>    HSMP_GET_METRIC_TABLE and HSMP_GET_METRIC_TABLE_DRAM_ADDR enum
>    definition in amd_hsmp.h files
> 3. Change check, count == 0 to !count in hsmp_metric_tbl_read() function
> 4. Add hsmp_metric_table_visible() function 
> 5. hsmp_create_metric_tbl_sysfs_file() is renamed as hsmp_init_metric_tbl_bin_attr()
>    and code is also modified slightly
> 6. Modify hsmp_create_sysfs_file() to use devm_device_add_groups()
> 7. Change from cleanup label to deregister label
> 8. Add dev_err print in hsmp_get_tbl_dram_base()
> 9. Reword "Unable to Failed" in hsmp_get_tbl_dram_base()
> 10. Add HSMP_GRP_NAME_SIZE and NUM_ATTRS macros
> 11. Remove sysfs cleanup code in hsmp_pltdrv_remove()
> 12. Correct ATRR typo error
> 13. Change sprintf to snprintf
> 14. Check metrics table support only against HSMP_PROTO_VER6
> Changes since v2:
> 1. squash documentation patch into this patch
> 2. change from num_sockets to plat_dev.num_sockets
> 
>  Documentation/arch/x86/amd_hsmp.rst  |  16 +++
>  arch/x86/include/uapi/asm/amd_hsmp.h | 109 ++++++++++++++++
>  drivers/platform/x86/amd/hsmp.c      | 180 ++++++++++++++++++++++++++-
>  3 files changed, 302 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 440e4b645a1c..a4c308784818 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -41,6 +41,22 @@ In-kernel integration:
>   * Locking across callers is taken care by the driver.
>  
>  
> +HSMP sysfs interface
> +====================
> +
> +1. Metrics table binary sysfs
> +
> +AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
> +all the system management information from SMU.
> +
> +The metrics table is made available as hexadecimal sysfs binary file
> +under per socket sysfs directory created at
> +/sys/devices/platform/amd_hsmp/socket%d/metrics_bin
> +
> +Metrics table definitions will be documented as part of Public PPR.
> +The same is defined in the amd_hsmp.h header.
> +
> +
>  An example
>  ==========
>  

I'd have expected to have the sysfs documentation appear under 
Documentation/ABI/testing/sysfs-...


The code change itself seems pretty okay now.

-- 
 i.

> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index 769b939444ae..f3479b768fb9 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -47,6 +47,9 @@ enum hsmp_message_ids {
>  	HSMP_SET_PCI_RATE,		/* 20h Control link rate on PCIe devices */
>  	HSMP_SET_POWER_MODE,		/* 21h Select power efficiency profile policy */
>  	HSMP_SET_PSTATE_MAX_MIN,	/* 22h Set the max and min DF P-State  */
> +	HSMP_GET_METRIC_TABLE_VER,	/* 23h Get metrics table version */
> +	HSMP_GET_METRIC_TABLE,		/* 24h Get metrics table */
> +	HSMP_GET_METRIC_TABLE_DRAM_ADDR,/* 25h Get metrics table dram address */
>  	HSMP_MSG_ID_MAX,
>  };
>  
> @@ -64,6 +67,14 @@ enum hsmp_msg_type {
>  	HSMP_GET  = 1,
>  };
>  
> +enum hsmp_proto_versions {
> +	HSMP_PROTO_VER2	= 2,
> +	HSMP_PROTO_VER3,
> +	HSMP_PROTO_VER4,
> +	HSMP_PROTO_VER5,
> +	HSMP_PROTO_VER6
> +};
> +
>  struct hsmp_msg_desc {
>  	int num_args;
>  	int response_sz;
> @@ -295,6 +306,104 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
>  	 * input: args[0] = min df pstate[15:8] + max df pstate[7:0]
>  	 */
>  	{1, 0, HSMP_SET},
> +
> +	/*
> +	 * HSMP_GET_METRIC_TABLE_VER, num_args = 0, response_sz = 1
> +	 * output: args[0] = metrics table version
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_METRIC_TABLE, num_args = 0, response_sz = 0
> +	 */
> +	{0, 0, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 2
> +	 * output: args[0] = lower 32 bits of the address
> +	 * output: args[1] = upper 32 bits of the address
> +	 */
> +	{0, 2, HSMP_GET},
> +};
> +
> +/* Metrics table for EPYC socket(supported only from proto version 6) */
> +struct hsmp_metric_table {
> +	__u32 accumulation_counter;
> +
> +	//TEMPERATURE
> +	__u32 max_socket_temperature;
> +	__u32 max_vr_temperature;
> +	__u32 max_hbm_temperature;
> +	__u64 max_socket_temperature_acc;
> +	__u64 max_vr_temperature_acc;
> +	__u64 max_hbm_temperature_acc;
> +
> +	//POWER
> +	__u32 socket_power_limit;
> +	__u32 max_socket_power_limit;
> +	__u32 socket_power;
> +
> +	//ENERGY
> +	__u64 timestamp;
> +	__u64 socket_energy_acc;
> +	__u64 ccd_energy_acc;
> +	__u64 xcd_energy_acc;
> +	__u64 aid_energy_acc;
> +	__u64 hbm_energy_acc;
> +
> +	//FREQUENCY
> +	__u32 cclk_frequency_limit;
> +	__u32 gfxclk_frequency_limit;
> +	__u32 fclk_frequency;
> +	__u32 uclk_frequency;
> +	__u32 socclk_frequency[4];
> +	__u32 vclk_frequency[4];
> +	__u32 dclk_frequency[4];
> +	__u32 lclk_frequency[4];
> +	__u64 gfxclk_frequency_acc[8];
> +	__u64 cclk_frequency_acc[96];
> +
> +	//FREQUENCY RANGE
> +	__u32 max_cclk_frequency;
> +	__u32 min_cclk_frequency;
> +	__u32 max_gfxclk_frequency;
> +	__u32 min_gfxclk_frequency;
> +	__u32 fclk_frequency_table[4];
> +	__u32 uclk_frequency_table[4];
> +	__u32 socclk_frequency_table[4];
> +	__u32 vclk_frequency_table[4];
> +	__u32 dclk_frequency_table[4];
> +	__u32 lclk_frequency_table[4];
> +	__u32 max_lclk_dpm_range;
> +	__u32 min_lclk_dpm_range;
> +
> +	//XGMI
> +	__u32 xgmi_width;
> +	__u32 xgmi_bitrate;
> +	__u64 xgmi_read_bandwidth_acc[8];
> +	__u64 xgmi_write_bandwidth_acc[8];
> +
> +	//ACTIVITY
> +	__u32 socket_c0_residency;
> +	__u32 socket_gfx_busy;
> +	__u32 dram_bandwidth_utilization;
> +	__u64 socket_c0_residency_acc;
> +	__u64 socket_gfx_busy_acc;
> +	__u64 dram_bandwidth_acc;
> +	__u32 max_dram_bandwidth;
> +	__u64 dram_bandwidth_utilization_acc;
> +	__u64 pcie_bandwidth_acc[4];
> +
> +	//THROTTLERS
> +	__u32 prochot_residency_acc;
> +	__u32 ppt_residency_acc;
> +	__u32 socket_thm_residency_acc;
> +	__u32 vr_thm_residency_acc;
> +	__u32 hbm_thm_residency_acc;
> +	__u32 spare;
> +
> +	// New Items at end to maintain driver compatibility
> +	__u32 gfxclk_frequency[8];
>  };
>  
>  /* Reset to default packing */
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 99727cd705cf..fc6fba18844e 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -20,7 +20,7 @@
>  #include <linux/semaphore.h>
>  
>  #define DRIVER_NAME		"amd_hsmp"
> -#define DRIVER_VERSION		"1.0"
> +#define DRIVER_VERSION		"2.0"
>  
>  /* HSMP Status / Error codes */
>  #define HSMP_STATUS_NOT_READY	0x00
> @@ -51,6 +51,8 @@
>  #define HSMP_DEVNODE_NAME	"hsmp"
>  
>  struct hsmp_socket {
> +	struct bin_attribute hsmp_attr;
> +	void __iomem *metric_tbl_addr;
>  	struct semaphore hsmp_sem;
>  	u16 sock_ind;
>  };
> @@ -59,6 +61,7 @@ struct hsmp_plat_device {
>  	struct miscdevice hsmp_device;
>  	struct hsmp_socket *sock;
>  	struct device *dev;
> +	u32 proto_ver;
>  	u16 num_sockets;
>  };
>  
> @@ -330,9 +333,160 @@ static const struct file_operations hsmp_fops = {
>  	.compat_ioctl	= hsmp_ioctl,
>  };
>  
> +static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> +				    struct bin_attribute *bin_attr, char *buf,
> +				    loff_t off, size_t count)
> +{
> +	struct hsmp_socket *sock = bin_attr->private;
> +	struct hsmp_message msg = { 0 };
> +	int ret;
> +
> +	if (!count || count > sizeof(struct hsmp_metric_table))
> +		return 0;
> +
> +	msg.msg_id	= HSMP_GET_METRIC_TABLE;
> +	msg.sock_ind	= sock->sock_ind;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +	memcpy(buf, sock->metric_tbl_addr, count);
> +
> +	return count;
> +}
> +
> +static int hsmp_get_tbl_dram_base(u16 sock_ind)
> +{
> +	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
> +	struct hsmp_message msg = { 0 };
> +	phys_addr_t dram_addr;
> +	int ret;
> +
> +	msg.sock_ind	= sock_ind;
> +	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
> +	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * calculate the metric table DRAM address from lower and upper 32 bits
> +	 * sent from SMU and ioremap it to virtual address.
> +	 */
> +	dram_addr = msg.args[0] | ((u64)(msg.args[1]) << 32);
> +	if (!dram_addr) {
> +		dev_err(plat_dev.dev, "Invalid dram address for metric table\n");
> +		return -ENOMEM;
> +	}
> +	sock->metric_tbl_addr = devm_ioremap(plat_dev.dev, dram_addr,
> +					     sizeof(struct hsmp_metric_table));
> +	if (!sock->metric_tbl_addr) {
> +		dev_err(plat_dev.dev, "Failed to ioremap metric table addr\n");
> +		return -ENOMEM;
> +	}
> +	return 0;
> +}
> +
> +static umode_t hsmp_metric_table_visible(struct kobject *kobj, struct bin_attribute *battr, int id)
> +{
> +	struct hsmp_socket *sock = battr->private;
> +	int ret;
> +
> +	if (plat_dev.proto_ver == HSMP_PROTO_VER6) {
> +		ret = hsmp_get_tbl_dram_base(sock->sock_ind);
> +		if (ret)
> +			return 0;
> +		return battr->attr.mode;
> +	} else {
> +		return 0;
> +	}
> +}
> +
> +#define HSMP_ATTR_NAME_SIZE	25
> +#define HSMP_GRP_NAME_SIZE	15
> +#define NUM_ATTRS		1
> +static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, int sock_ind)
> +{
> +	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
> +	char *name;
> +
> +	sysfs_attr_init(&plat_dev.sock[sock_ind].hsmp_attr);
> +	name = devm_kzalloc(plat_dev.dev, HSMP_ATTR_NAME_SIZE, GFP_KERNEL);
> +	if (!name)
> +		return -ENOMEM;
> +	snprintf(name, HSMP_ATTR_NAME_SIZE, "metrics_bin");
> +	hattr->attr.name	= name;
> +	hattr->attr.mode	= 0444;
> +	hattr->read		= hsmp_metric_tbl_read;
> +	hattr->size		= sizeof(struct hsmp_metric_table);
> +	hattr->private		= &plat_dev.sock[sock_ind];
> +	hattrs[0]		= hattr;
> +
> +	return 0;
> +}
> +
> +static int hsmp_create_sysfs_file(void)
> +{
> +	const struct attribute_group **hsmp_attr_grps;
> +	struct bin_attribute **hsmp_bin_attrs;
> +	struct attribute_group *attr_grp;
> +	int ret, i;
> +
> +	hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group *) *
> +				      (plat_dev.num_sockets + 1), GFP_KERNEL);
> +	if (!hsmp_attr_grps)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < plat_dev.num_sockets; i++) {
> +		attr_grp = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group), GFP_KERNEL);
> +		if (!attr_grp)
> +			return -ENOMEM;
> +
> +		attr_grp->name = devm_kzalloc(plat_dev.dev, HSMP_GRP_NAME_SIZE, GFP_KERNEL);
> +		if (!attr_grp->name)
> +			return -ENOMEM;
> +		snprintf((char *)attr_grp->name, HSMP_GRP_NAME_SIZE, "socket%d", i);
> +
> +		hsmp_bin_attrs = devm_kzalloc(plat_dev.dev, sizeof(struct bin_attribute *) *
> +					      (NUM_ATTRS + 1), GFP_KERNEL);
> +		if (!hsmp_bin_attrs)
> +			return -ENOMEM;
> +
> +		attr_grp->bin_attrs		= hsmp_bin_attrs;
> +		attr_grp->is_bin_visible	= hsmp_metric_table_visible;
> +		hsmp_attr_grps[i]		= attr_grp;
> +
> +		ret = hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, i);
> +		if (ret)
> +			return ret;
> +	}
> +	ret = devm_device_add_groups(plat_dev.dev, hsmp_attr_grps);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int hsmp_cache_proto_ver(void)
> +{
> +	struct hsmp_message msg = { 0 };
> +	int ret;
> +
> +	msg.msg_id	= HSMP_GET_PROTO_VER;
> +	msg.sock_ind	= 0;
> +	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (!ret)
> +		plat_dev.proto_ver = msg.args[0];
> +
> +	return ret;
> +}
> +
>  static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  {
> -	int i;
> +	int ret, i;
>  
>  	plat_dev.sock = devm_kzalloc(&pdev->dev,
>  				     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
> @@ -353,7 +507,27 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
>  	plat_dev.hsmp_device.mode	= 0644;
>  
> -	return misc_register(&plat_dev.hsmp_device);
> +	ret = misc_register(&plat_dev.hsmp_device);
> +	if (ret)
> +		return ret;
> +
> +	ret = hsmp_cache_proto_ver();
> +	if (ret) {
> +		dev_err(plat_dev.dev, "Failed to read HSMP protocol version\n");
> +		goto deregister;
> +	}
> +
> +	ret = hsmp_create_sysfs_file();
> +	if (ret) {
> +		dev_err(plat_dev.dev, "Failed to create sysfs file\n");
> +		goto deregister;
> +	}
> +
> +	return 0;
> +
> +deregister:
> +	misc_deregister(&plat_dev.hsmp_device);
> +	return ret;
>  }
>  
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
> 
