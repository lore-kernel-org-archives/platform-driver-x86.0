Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1358DEE4993
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 11:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbjHULZi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 07:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbjHULZi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 07:25:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF5DD8
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 04:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692617133; x=1724153133;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IaQNL0j2IroZuaW5soVxvNzOGrseLBenwy24BKOZOW0=;
  b=jZ7gRn7a9ZluzK8vRsRJfUBYgmJNWQRgFC7GDkdSt0tL8scfVufdmHIX
   KFZBWEsUAQSV2rqJC6ao/bsOzUoFlf8guLWr70ZKHP9zoW8EXfrbst1k2
   MHCTlA29zgw+JRnNvMvoyPcZyJuwsmDbYv9svQ/NCsYyRjRBIOK/ZFkZx
   5mualtoljtmUeWV4uyzKuBW+0VG8tjATQd8xteBL1Tv0x4kAmqRkxPDSG
   vpcrm2+XAo0xxYlY8v9CzW1hchf+qZkE4cfgw7iiSqP+tA/nNVLfujQwU
   HEBuri52lcttmMxXPOyjmlzCURc2mlUIVxgcAKAVQDOA7U/BzxLcWSgyx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="439935355"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="439935355"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 04:25:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="765332194"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="765332194"
Received: from nsnaveen-mobl.gar.corp.intel.com ([10.252.54.252])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 04:25:33 -0700
Date:   Mon, 21 Aug 2023 14:25:30 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Suma Hegde <Suma.Hegde@amd.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH 2/4] platform/x86/amd/hsmp: add support for metrics tbl
In-Reply-To: <20230818125119.1323499-3-Suma.Hegde@amd.com>
Message-ID: <6fda67c7-f2c4-26db-c3ce-b8b7b53f7ee@linux.intel.com>
References: <20230818125119.1323499-1-Suma.Hegde@amd.com> <20230818125119.1323499-3-Suma.Hegde@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 18 Aug 2023, Suma Hegde wrote:

> From: Suma Hegde <suma.hegde@amd.com>
> 
> AMD MI300 MCM provides GET_METRICS_TABLE message with which
> all the system management information from SMU can be retrieved in just
> one message.
> 
> The metrics table is available as hexadecimal sysfs binary file in
> /sys/devices/platform/amd_hsmp/socket%d_metrics_bin 
> Metrics table definitions will be documented as part of PPR which
> available in public domain. The same is defined in the amd_hsmp.h header
> file as well.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
>  arch/x86/include/uapi/asm/amd_hsmp.h | 109 +++++++++++++++++++
>  drivers/platform/x86/amd/hsmp.c      | 155 ++++++++++++++++++++++++++-
>  2 files changed, 259 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index 769b939444ae..832701b41c7d 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -47,6 +47,9 @@ enum hsmp_message_ids {
>  	HSMP_SET_PCI_RATE,		/* 20h Control link rate on PCIe devices */
>  	HSMP_SET_POWER_MODE,		/* 21h Select power efficiency profile policy */
>  	HSMP_SET_PSTATE_MAX_MIN,	/* 22h Set the max and min DF P-State  */
> +	HSMP_GET_METRIC_TABLE_VER,	/* 23h Get metrics table version  */
> +	HSMP_GET_METRIC_TABLE,		/* 24h Get metrics table  */

extra spaces before */

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
> index 699c22f7cd42..cab59750cde2 100644
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
> @@ -47,7 +47,12 @@
>  #define HSMP_INDEX_REG		0xc4
>  #define HSMP_DATA_REG		0xc8
>  
> +#define HSMP_CDEV_NAME		"hsmp_cdev"
> +#define HSMP_DEVNODE_NAME	"hsmp"
> +
>  struct hsmp_socket {
> +	struct bin_attribute hsmp_attr;
> +	void __iomem *metric_tbl_addr;
>  	struct semaphore hsmp_sem;
>  	u16 sock_ind;
>  };
> @@ -56,6 +61,7 @@ struct hsmp_plat_device {
>  	struct miscdevice hsmp_device;
>  	struct hsmp_socket *sock;
>  	struct device *dev;
> +	u32 proto_ver;
>  };
>  
>  static u16 num_sockets;
> @@ -328,9 +334,122 @@ static const struct file_operations hsmp_fops = {
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
> +	if (count == 0 || count > sizeof(struct hsmp_metric_table))

!count

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
> +#define HSMP_ATRR_NAME_SIZE 25

ATTR (typo)?

> +static int hsmp_create_metric_tbl_sysfs_file(int sock_ind)
> +{
> +	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
> +	char *name;
> +
> +	sysfs_attr_init(&plat_dev.sock[sock_ind].hsmp_attr);
> +	name = devm_kzalloc(plat_dev.dev, HSMP_ATRR_NAME_SIZE, GFP_KERNEL);
> +	if (!name)
> +		return -ENOMEM;
> +	sprintf(name, "socket%d_metrics_bin", sock_ind);

snprintf()

> +	hattr->attr.name	= name;
> +	hattr->attr.mode	= 0444;
> +	hattr->read		= hsmp_metric_tbl_read;
> +	hattr->size		= sizeof(struct hsmp_metric_table);
> +	hattr->private		= &plat_dev.sock[sock_ind];
> +
> +	return device_create_bin_file(plat_dev.dev, hattr);
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
> +	if (!dram_addr)
> +		return -ENOMEM;
> +	sock->metric_tbl_addr = devm_ioremap(plat_dev.dev, dram_addr,
> +					     sizeof(struct hsmp_metric_table));
> +	if (!sock->metric_tbl_addr) {
> +		dev_err(plat_dev.dev, "Unable to ioremap metric table addr\n");
> +		return -ENOMEM;
> +	}
> +	return 0;
> +}
> +
> +static int hsmp_create_sysfs_file(void)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < num_sockets; i++) {
> +		ret = hsmp_get_tbl_dram_base(i);
> +		if (ret)
> +			goto cleanup;
> +
> +		ret = hsmp_create_metric_tbl_sysfs_file(i);
> +		if (ret) {
> +			dev_err(plat_dev.dev, "Unable to create sysfs file for metric table\n");
> +			goto cleanup;
> +		}
> +	}
> +
> +	return 0;
> +
> +cleanup:
> +	while (i > 0)
> +		device_remove_bin_file(plat_dev.dev, &plat_dev.sock[--i].hsmp_attr);
> +	return ret;
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
>  				     (num_sockets * sizeof(struct hsmp_socket)),
> @@ -344,18 +463,44 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  		plat_dev.sock[i].sock_ind = i;
>  	}
>  
> -	plat_dev.hsmp_device.name	= "hsmp_cdev";
> +	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
>  	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
>  	plat_dev.hsmp_device.fops	= &hsmp_fops;
>  	plat_dev.hsmp_device.parent	= &pdev->dev;
> -	plat_dev.hsmp_device.nodename	= "hsmp";
> +	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
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
> +		goto cleanup;
> +	}
> +
> +	/* metrics table is supported only from proto ver6 EPYCs */
> +	if (plat_dev.proto_ver >= HSMP_PROTO_VER6) {
> +		ret = hsmp_create_sysfs_file();
> +		if (ret)
> +			goto cleanup;
> +	}
> +	return 0;
> +
> +cleanup:

Instead naming labels as "cleanup", try to name them according to what you 
cleanup, so e.g. here deregister:

> +	misc_deregister(&plat_dev.hsmp_device);
> +	return ret;
>  }
>  
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
>  {
> +	int i;
> +
> +	if (plat_dev.proto_ver >= HSMP_PROTO_VER6) {
> +		for (i = 0; i < num_sockets; i++)
> +			device_remove_bin_file(plat_dev.dev, &plat_dev.sock[i].hsmp_attr);
> +	}
>  	misc_deregister(&plat_dev.hsmp_device);
>  }
>  
> 

-- 
 i.

