Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7C01598F4
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 Nov 2024 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456169; cv=none; b=Vpgq+Zn8ahuq1f3BnyvVs7fGuhBOt9KyuphUVfJEeoqPdk9JZEolof3L3bQzQ5Kqkd+kJTN/WsY21kX1ZbmJNQ2HgdR2pNrTFLbuz/MvetMxImmry7ct51ttiB05mvUOkL2GH1uEXrgrIzemSO+T64w84ni37IzwZ12/Xd1bUuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456169; c=relaxed/simple;
	bh=zHFcclbcPpV4XaGW5L6B28U4ZAB/DicM1fPA7GchhE4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fJW/NI8vvRYlvmQ8otH8177l8dTNJdPUqTZhE5XDSmBIbKRWrc4wgJ2kpy6NfOUpJ9fGH+MimMUxjbA/TvfDHJ2CJSgDD/nXflinXaD+nnRM+cngn5er5s/bM3oTA4lE77Pm9Sa/o9uRh+RXEwUtaaQN0HBzlIELKyLsEAYQuQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5ZUd3ft; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5ZUd3ft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730456165; x=1761992165;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zHFcclbcPpV4XaGW5L6B28U4ZAB/DicM1fPA7GchhE4=;
  b=Z5ZUd3ftgNlNfgFse8+vX98Ctyq0HeuKAgSj8RIQ38bmj1WN6o5zqBgs
   MXwAZHM4WU1cT2ekDFOVh7LGKQXG7dMptBoP5lxJg2Vvzj4mA2HjCKKC3
   JbOxZs89piaV4SWTXVhpE5NVfjmhFibeZs6nBD2eymDXD53OjMbAO/xSU
   fV6FamJj5PNH/ss+R3V8F2Rni9sbZ6yznAPHSFVkBV/kTWWlAwEkpEA/3
   9FR1QQ4r7RWOpJtIy9TOfxMXbKg2o+5kEzZ1YYcxyiOc7iGi1RBbZPFv3
   WP2o+1UV/3PpsARIWZ1IBcSF5NcOnsXaGN+5IPcYUZvZJkxottgzXI/3z
   Q==;
X-CSE-ConnectionGUID: drIaKSg2SU+Lfy+y2unM+Q==
X-CSE-MsgGUID: K96v6leISWS746rrUzLdCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="41615903"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="41615903"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:16:05 -0700
X-CSE-ConnectionGUID: PhhvUjZbRSWKlP/VDfH9DA==
X-CSE-MsgGUID: GvLeRszER6699vJbzD6XOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83737675"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:16:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 1 Nov 2024 12:15:59 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 1/8] platform/x86/amd/pmc: Move STB functionality to
 a new file for better code organization
In-Reply-To: <20241029155440.3499273-2-Shyam-sundar.S-k@amd.com>
Message-ID: <3d8d3ad8-4cbd-8115-1c9f-9e1b625775b0@linux.intel.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com> <20241029155440.3499273-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Oct 2024, Shyam Sundar S K wrote:

> As the SoC evolves with each generation, the dynamics between the PMC and
> STB layers within the PMC driver are becoming increasingly complex, making
> it challenging to manage both in a single file and maintain code
> readability.
> 
> Additionally, during silicon bringup, the PMC functionality is often
> enabled first, with STB functionality added later. This can lead to missed
> updates in the driver, potentially causing issues.
>
> To address these challenges, it's beneficial to move all STB-related
> changes to a separate file. This approach will better accommodate newer
> SoCs, provide improved flexibility for desktop variants, and facilitate
> the collection of additional debug information through STB mechanisms.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/Makefile  |   2 +-
>  drivers/platform/x86/amd/pmc/mp1_stb.c | 295 +++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmc/pmc.c     | 289 +-----------------------
>  drivers/platform/x86/amd/pmc/pmc.h     |   9 +
>  4 files changed, 310 insertions(+), 285 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c
> 
> diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
> index f1d9ab19d24c..255d94ddf999 100644
> --- a/drivers/platform/x86/amd/pmc/Makefile
> +++ b/drivers/platform/x86/amd/pmc/Makefile
> @@ -4,6 +4,6 @@
>  # AMD Power Management Controller Driver
>  #
>  
> -amd-pmc-objs := pmc.o pmc-quirks.o
> +amd-pmc-objs := pmc.o pmc-quirks.o mp1_stb.o
>  obj-$(CONFIG_AMD_PMC) += amd-pmc.o
>  amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> new file mode 100644
> index 000000000000..9a34dd94982c
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD MP1 Smart Trace Buffer (STB) Layer
> + *
> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *          Sanket Goswami <Sanket.Goswami@amd.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <asm/amd_nb.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/uaccess.h>
> +
> +#include "pmc.h"
> +
> +/* STB Spill to DRAM Parameters */
> +#define S2D_TELEMETRY_BYTES_MAX		0x100000U
> +#define S2D_RSVD_RAM_SPACE		0x100000
> +#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
> +
> +/* STB Registers */
> +#define AMD_PMC_STB_PMI_0	0x03E30600

Is this still needed in pmc.c? I think all users moved to this file.

> +#define AMD_PMC_STB_DUMMY_PC	0xC6000007
> +
> +/* STB Spill to DRAM Message Definition */
> +#define STB_FORCE_FLUSH_DATA	0xCF
> +#define FIFO_SIZE		4096
> +
> +static bool enable_stb;
> +module_param(enable_stb, bool, 0644);
> +MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> +
> +static bool dump_custom_stb;
> +module_param(dump_custom_stb, bool, 0644);
> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
> +
> +enum s2d_arg {
> +	S2D_TELEMETRY_SIZE = 0x01,
> +	S2D_PHYS_ADDR_LOW,
> +	S2D_PHYS_ADDR_HIGH,
> +	S2D_NUM_SAMPLES,
> +	S2D_DRAM_SIZE,
> +};
> +
> +struct amd_pmc_stb_v2_data {
> +	size_t size;
> +	u8 data[] __counted_by(size);
> +};
> +
> +int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> +{
> +	int err;
> +
> +	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
> +	if (err) {
> +		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
> +		return pcibios_err_to_errno(err);
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
> +{
> +	int i, err;
> +
> +	for (i = 0; i < FIFO_SIZE; i++) {
> +		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
> +		if (err) {
> +			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
> +				AMD_PMC_STB_PMI_0);
> +			return pcibios_err_to_errno(err);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	u32 size = FIFO_SIZE * sizeof(u32);
> +	u32 *buf;
> +	int rc;
> +
> +	buf = kzalloc(size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	rc = amd_pmc_read_stb(dev, buf);
> +	if (rc) {
> +		kfree(buf);
> +		return rc;
> +	}
> +
> +	filp->private_data = buf;
> +	return rc;
> +}
> +
> +static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> +					loff_t *pos)
> +{
> +	if (!filp->private_data)
> +		return -EINVAL;
> +
> +	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> +				       FIFO_SIZE * sizeof(u32));
> +}
> +
> +static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
> +{
> +	kfree(filp->private_data);
> +	return 0;
> +}
> +
> +static const struct file_operations amd_pmc_stb_debugfs_fops = {
> +	.owner = THIS_MODULE,
> +	.open = amd_pmc_stb_debugfs_open,
> +	.read = amd_pmc_stb_debugfs_read,
> +	.release = amd_pmc_stb_debugfs_release,
> +};
> +
> +/* Enhanced STB Firmware Reporting Mechanism */
> +static int amd_pmc_stb_handle_efr(struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	struct amd_pmc_stb_v2_data *stb_data_arr;
> +	u32 fsize;
> +
> +	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
> +	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
> +	if (!stb_data_arr)
> +		return -ENOMEM;
> +
> +	stb_data_arr->size = fsize;
> +	memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
> +	filp->private_data = stb_data_arr;
> +
> +	return 0;
> +}
> +
> +static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
> +	struct amd_pmc_stb_v2_data *stb_data_arr;
> +	int ret;
> +
> +	/* Write dummy postcode while reading the STB buffer */
> +	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
> +	if (ret)
> +		dev_err(dev->dev, "error writing to STB: %d\n", ret);
> +
> +	/* Spill to DRAM num_samples uses separate SMU message port */
> +	dev->msg_port = 1;
> +
> +	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
> +	if (ret)
> +		dev_dbg_once(dev->dev, "S2D force flush not supported: %d\n", ret);
> +
> +	/*
> +	 * We have a custom stb size and the PMFW is supposed to give
> +	 * the enhanced dram size. Note that we land here only for the
> +	 * platforms that support enhanced dram size reporting.
> +	 */
> +	if (dump_custom_stb)
> +		return amd_pmc_stb_handle_efr(filp);
> +
> +	/* Get the num_samples to calculate the last push location */
> +	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
> +	/* Clear msg_port for other SMU operation */
> +	dev->msg_port = 0;
> +	if (ret) {
> +		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> +		return ret;
> +	}
> +
> +	fsize = min(num_samples, S2D_TELEMETRY_BYTES_MAX);
> +	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
> +	if (!stb_data_arr)
> +		return -ENOMEM;
> +
> +	stb_data_arr->size = fsize;
> +
> +	/*
> +	 * Start capturing data from the last push location.
> +	 * This is for general cases, where the stb limits
> +	 * are meant for standard usage.
> +	 */
> +	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> +		/* First read oldest data starting 1 behind last write till end of ringbuffer */
> +		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
> +		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
> +
> +		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> +		/* Second copy the newer samples from offset 0 - last write */
> +		memcpy_fromio(stb_data_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
> +	} else {
> +		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
> +	}
> +
> +	filp->private_data = stb_data_arr;
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
> +					   loff_t *pos)
> +{
> +	struct amd_pmc_stb_v2_data *data = filp->private_data;
> +
> +	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
> +}
> +
> +static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
> +{
> +	kfree(filp->private_data);
> +	return 0;
> +}
> +
> +static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
> +	.owner = THIS_MODULE,
> +	.open = amd_pmc_stb_debugfs_open_v2,
> +	.read = amd_pmc_stb_debugfs_read_v2,
> +	.release = amd_pmc_stb_debugfs_release_v2,
> +};
> +
> +static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
> +{
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_YC:
> +	case AMD_CPU_ID_CB:
> +		dev->s2d_msg_id = 0xBE;
> +		return true;
> +	case AMD_CPU_ID_PS:
> +		dev->s2d_msg_id = 0x85;
> +		return true;
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +		dev->s2d_msg_id = 0xDE;
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
> +{
> +	u32 phys_addr_low, phys_addr_hi;
> +	u64 stb_phys_addr;
> +	u32 size = 0;
> +	int ret;
> +
> +	if (!enable_stb)
> +		return 0;
> +
> +	if (amd_pmc_is_stb_supported(dev))
> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +				    &amd_pmc_stb_debugfs_fops_v2);
> +	else
> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +				    &amd_pmc_stb_debugfs_fops);
> +
> +	/* Spill to DRAM feature uses separate SMU message port */
> +	dev->msg_port = 1;
> +
> +	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
> +	if (size != S2D_TELEMETRY_BYTES_MAX)
> +		return -EIO;
> +
> +	/* Get DRAM size */
> +	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
> +	if (ret || !dev->dram_size)
> +		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
> +
> +	/* Get STB DRAM address */
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
> +
> +	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
> +
> +	/* Clear msg_port for other SMU operation */
> +	dev->msg_port = 0;
> +
> +	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
> +	if (!dev->stb_virt_addr)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index bbb8edb62e00..a977ff1e52b5 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -44,20 +44,6 @@
>  #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
>  #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
>  #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
> -#define AMD_PMC_STB_DUMMY_PC		0xC6000007
> -
> -/* STB S2D(Spill to DRAM) has different message port offset */
> -#define AMD_S2D_REGISTER_MESSAGE	0xA20
> -#define AMD_S2D_REGISTER_RESPONSE	0xA80
> -#define AMD_S2D_REGISTER_ARGUMENT	0xA88
> -
> -/* STB Spill to DRAM Parameters */
> -#define S2D_TELEMETRY_BYTES_MAX		0x100000U
> -#define S2D_RSVD_RAM_SPACE		0x100000
> -#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
> -
> -/* STB Spill to DRAM Message Definition */
> -#define STB_FORCE_FLUSH_DATA		0xCF
>  
>  /* Base address of SMU for mapping physical address to virtual address */
>  #define AMD_PMC_MAPPING_SIZE		0x01000
> @@ -97,7 +83,6 @@
>  
>  #define DELAY_MIN_US		2000
>  #define DELAY_MAX_US		3000
> -#define FIFO_SIZE		4096
>  
>  enum amd_pmc_def {
>  	MSG_TEST = 0x01,
> @@ -105,19 +90,6 @@ enum amd_pmc_def {
>  	MSG_OS_HINT_RN,
>  };
>  
> -enum s2d_arg {
> -	S2D_TELEMETRY_SIZE = 0x01,
> -	S2D_PHYS_ADDR_LOW,
> -	S2D_PHYS_ADDR_HIGH,
> -	S2D_NUM_SAMPLES,
> -	S2D_DRAM_SIZE,
> -};
> -
> -struct amd_pmc_stb_v2_data {
> -	size_t size;
> -	u8 data[] __counted_by(size);
> -};
> -
>  struct amd_pmc_bit_map {
>  	const char *name;
>  	u32 bit_mask;
> @@ -149,22 +121,11 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>  	{}
>  };
>  
> -static bool enable_stb;
> -module_param(enable_stb, bool, 0644);
> -MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> -
>  static bool disable_workarounds;
>  module_param(disable_workarounds, bool, 0644);
>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>  
> -static bool dump_custom_stb;
> -module_param(dump_custom_stb, bool, 0644);
> -MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
> -
>  static struct amd_pmc_dev pmc;
> -static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
> -static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
> -static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
>  
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>  {
> @@ -193,155 +154,6 @@ struct smu_metrics {
>  	u64 timecondition_notmet_totaltime[32];
>  } __packed;
>  
> -static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
> -{
> -	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	u32 size = FIFO_SIZE * sizeof(u32);
> -	u32 *buf;
> -	int rc;
> -
> -	buf = kzalloc(size, GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	rc = amd_pmc_read_stb(dev, buf);
> -	if (rc) {
> -		kfree(buf);
> -		return rc;
> -	}
> -
> -	filp->private_data = buf;
> -	return rc;
> -}
> -
> -static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> -					loff_t *pos)
> -{
> -	if (!filp->private_data)
> -		return -EINVAL;
> -
> -	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> -				       FIFO_SIZE * sizeof(u32));
> -}
> -
> -static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
> -{
> -	kfree(filp->private_data);
> -	return 0;
> -}
> -
> -static const struct file_operations amd_pmc_stb_debugfs_fops = {
> -	.owner = THIS_MODULE,
> -	.open = amd_pmc_stb_debugfs_open,
> -	.read = amd_pmc_stb_debugfs_read,
> -	.release = amd_pmc_stb_debugfs_release,
> -};
> -
> -/* Enhanced STB Firmware Reporting Mechanism */
> -static int amd_pmc_stb_handle_efr(struct file *filp)
> -{
> -	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	struct amd_pmc_stb_v2_data *stb_data_arr;
> -	u32 fsize;
> -
> -	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
> -	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
> -	if (!stb_data_arr)
> -		return -ENOMEM;
> -
> -	stb_data_arr->size = fsize;
> -	memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
> -	filp->private_data = stb_data_arr;
> -
> -	return 0;
> -}
> -
> -static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> -{
> -	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
> -	struct amd_pmc_stb_v2_data *stb_data_arr;
> -	int ret;
> -
> -	/* Write dummy postcode while reading the STB buffer */
> -	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
> -	if (ret)
> -		dev_err(dev->dev, "error writing to STB: %d\n", ret);
> -
> -	/* Spill to DRAM num_samples uses separate SMU message port */
> -	dev->msg_port = 1;
> -
> -	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
> -	if (ret)
> -		dev_dbg_once(dev->dev, "S2D force flush not supported: %d\n", ret);
> -
> -	/*
> -	 * We have a custom stb size and the PMFW is supposed to give
> -	 * the enhanced dram size. Note that we land here only for the
> -	 * platforms that support enhanced dram size reporting.
> -	 */
> -	if (dump_custom_stb)
> -		return amd_pmc_stb_handle_efr(filp);
> -
> -	/* Get the num_samples to calculate the last push location */
> -	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
> -	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> -	if (ret) {
> -		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> -		return ret;
> -	}
> -
> -	fsize = min(num_samples, S2D_TELEMETRY_BYTES_MAX);
> -	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
> -	if (!stb_data_arr)
> -		return -ENOMEM;
> -
> -	stb_data_arr->size = fsize;
> -
> -	/*
> -	 * Start capturing data from the last push location.
> -	 * This is for general cases, where the stb limits
> -	 * are meant for standard usage.
> -	 */
> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> -		/* First read oldest data starting 1 behind last write till end of ringbuffer */
> -		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
> -		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
> -
> -		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> -		/* Second copy the newer samples from offset 0 - last write */
> -		memcpy_fromio(stb_data_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
> -	} else {
> -		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
> -	}
> -
> -	filp->private_data = stb_data_arr;
> -
> -	return 0;
> -}
> -
> -static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
> -					   loff_t *pos)
> -{
> -	struct amd_pmc_stb_v2_data *data = filp->private_data;
> -
> -	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
> -}
> -
> -static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
> -{
> -	kfree(filp->private_data);
> -	return 0;
> -}
> -
> -static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
> -	.owner = THIS_MODULE,
> -	.open = amd_pmc_stb_debugfs_open_v2,
> -	.read = amd_pmc_stb_debugfs_read_v2,
> -	.release = amd_pmc_stb_debugfs_release_v2,
> -};
> -
>  static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>  {
>  	switch (dev->cpu_id) {
> @@ -350,18 +162,15 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>  	case AMD_CPU_ID_YC:
>  	case AMD_CPU_ID_CB:
>  		dev->num_ips = 12;
> -		dev->s2d_msg_id = 0xBE;
>  		dev->smu_msg = 0x538;
>  		break;
>  	case AMD_CPU_ID_PS:
>  		dev->num_ips = 21;
> -		dev->s2d_msg_id = 0x85;
>  		dev->smu_msg = 0x538;
>  		break;
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>  		dev->num_ips = 22;
> -		dev->s2d_msg_id = 0xDE;
>  		dev->smu_msg = 0x938;
>  		break;
>  	}
> @@ -625,20 +434,6 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>  	debugfs_remove_recursive(dev->dbgfs_dir);
>  }
>  
> -static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
> -{
> -	switch (dev->cpu_id) {
> -	case AMD_CPU_ID_YC:
> -	case AMD_CPU_ID_CB:
> -	case AMD_CPU_ID_PS:
> -	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> -	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		return true;
> -	default:
> -		return false;
> -	}
> -}
> -
>  static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  {
>  	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
> @@ -648,15 +443,6 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  			    &s0ix_stats_fops);
>  	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>  			    &amd_pmc_idlemask_fops);
> -	/* Enable STB only when the module_param is set */
> -	if (enable_stb) {
> -		if (amd_pmc_is_stb_supported(dev))
> -			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -					    &amd_pmc_stb_debugfs_fops_v2);
> -		else
> -			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -					    &amd_pmc_stb_debugfs_fops);
> -	}

Is it related to the logic change I ask about down below? It looks 
something that really ought to be done in a separate preparatory patch if 
that's the case since it seems entire independent of moving things to 
another file this patch is supposed to be all about.

>  }
>  
>  static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
> @@ -683,7 +469,7 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>  	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
>  }
>  
> -static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
> +int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
>  {
>  	int rc;
>  	u32 val, message, argument, response;
> @@ -975,69 +761,6 @@ static const struct pci_device_id pmc_pci_ids[] = {
>  	{ }
>  };
>  
> -static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
> -{
> -	u32 phys_addr_low, phys_addr_hi;
> -	u64 stb_phys_addr;
> -	u32 size = 0;
> -	int ret;
> -
> -	/* Spill to DRAM feature uses separate SMU message port */
> -	dev->msg_port = 1;
> -
> -	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
> -	if (size != S2D_TELEMETRY_BYTES_MAX)
> -		return -EIO;
> -
> -	/* Get DRAM size */
> -	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
> -	if (ret || !dev->dram_size)
> -		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
> -
> -	/* Get STB DRAM address */
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
> -
> -	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
> -
> -	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> -
> -	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
> -	if (!dev->stb_virt_addr)
> -		return -ENOMEM;
> -
> -	return 0;
> -}
> -
> -static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> -{
> -	int err;
> -
> -	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
> -	if (err) {
> -		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
> -		return pcibios_err_to_errno(err);
> -	}
> -
> -	return 0;
> -}
> -
> -static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
> -{
> -	int i, err;
> -
> -	for (i = 0; i < FIFO_SIZE; i++) {
> -		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
> -		if (err) {
> -			dev_err(dev->dev, "error reading data from stb: 0x%X\n", AMD_PMC_STB_PMI_0);
> -			return pcibios_err_to_errno(err);
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>  static int amd_pmc_probe(struct platform_device *pdev)
>  {
>  	struct amd_pmc_dev *dev = &pmc;
> @@ -1095,12 +818,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	/* Get num of IP blocks within the SoC */
>  	amd_pmc_get_ip_info(dev);
>  
> -	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
> -		err = amd_pmc_s2d_init(dev);
> -		if (err)
> -			goto err_pci_dev_put;
> -	}
> -
>  	platform_set_drvdata(pdev, dev);
>  	if (IS_ENABLED(CONFIG_SUSPEND)) {
>  		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
> @@ -1111,6 +828,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	amd_pmc_dbgfs_register(dev);
> +	err = amd_pmc_s2d_init(dev);
> +	if (err)
> +		goto err_pci_dev_put;

Why isn't this logic change in a separate patch?

> +
>  	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>  		amd_mp2_stb_init(dev);
>  	pm_report_max_hw_sleep(U64_MAX);
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index f1166d15c856..07fcb13a4136 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -70,4 +70,13 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>  #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
>  #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
>  
> +/* STB S2D(Spill to DRAM) has different message port offset */
> +#define AMD_S2D_REGISTER_MESSAGE	0xA20
> +#define AMD_S2D_REGISTER_RESPONSE	0xA80
> +#define AMD_S2D_REGISTER_ARGUMENT	0xA88
> +
> +int amd_pmc_s2d_init(struct amd_pmc_dev *dev);
> +int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> +int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
> +
>  #endif /* PMC_H */
> 

-- 
 i.

