Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFFD13340F
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Apr 2024 19:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712258894; cv=none; b=pDEE4zxCJs96LaCGWHQB3ntr15JQC1oovpm9IKri3vOZeicn/VsFAHLHMhE9In6eOfQ3k4I/8R11Kkw5YcYTAg3kAE+5cNNU8TZMArRHBFDGlSvirjtfeODGXkbzgQ0utgEiq4EXjTi0KLExGLO95Yz8Up1uA0kOU4bkuYNfwRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712258894; c=relaxed/simple;
	bh=OciKnNh4kJKFSSg+b7Zu8oR80qYUF106gxSRWgYukMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OePwb/QCNgUcMzsxK3IsepT7tQPoBs97u7KKBxI9DnaJ2YCSz421yMOXOVfS0COXEEp+mmOlm1JXOgs8ntWvP7FOuTMFQnf5u8d2duVRIyIqv5uwJwAdArjnw1efbM++O4Fyc6g9slI7bi/6Do0TVmpQRoQWxpfDIVC8+FgoPP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDm9R2pA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDm9R2pA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712258892; x=1743794892;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=OciKnNh4kJKFSSg+b7Zu8oR80qYUF106gxSRWgYukMA=;
  b=YDm9R2pAOoWvs4DqGbCB1MYnYRnTJ+pnn9DiOC4gmPEUWD7oQxDe+fZP
   NHYKO1Pk1A9C9wu16tIHYXOn6W5PI444EPXkFyvF43Q7Ag8MdiFzZuYNm
   oOzqviQ+7FXxKi7SlM6hIk4MWL7jkXURzSaywB2JKjWwZ5TpylTgVvOlS
   t62j8utIQLAhZEO+hkDBsaCbG27jxIGv1f/0bJod/4x9A3S2ili7IL4b+
   k9+CO+VSGo8N88uO7DrvSnhauD4uIXwubzl/U+7W2GU8i1n7tpS2+yim7
   HXsbOmV5lDaw8n3q29GJV3V8fSPpNHJ3/GVSHGs9DR5BxQRMA/lTvZ3i5
   Q==;
X-CSE-ConnectionGUID: drCIM4NlTuK3F9RQ9FU2Og==
X-CSE-MsgGUID: AiLPf60jRHiQxbCT99Jpfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11345227"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="11345227"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:28:12 -0700
X-CSE-ConnectionGUID: m4yP8EtZSpCWk9DeDj8/Nw==
X-CSE-MsgGUID: 6tpjzeWySgCAWuo3v2V7Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19007333"
Received: from ypottimu-mobl.amr.corp.intel.com (HELO [10.209.51.123]) ([10.209.51.123])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:28:11 -0700
Message-ID: <321d1c20-2bfa-4ec4-a5fa-87988d7e1160@linux.intel.com>
Date: Thu, 4 Apr 2024 12:28:10 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86/amd/pmc: Add AMD MP2 STB functionality
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam-sundar.S-k@amd.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
References: <20240404090702.325838-1-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240404090702.325838-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/4/24 2:07 AM, Basavaraj Natikar wrote:
> AMD MP2 STB function provides a data buffer used to log debug information
> about the system execution during S2Idle suspend/resume.
>
> A data buffer known as the STB (Smart Trace Buffer) is a circular buffer
> which is a low-level log to assist in debugging by providing insights
> into any potential hangs or stalls that may occur during the S2Idle
> suspend/resume processes.
>
> The current PMC driver retrieves STB data from MP1, but there can be
> scenarios where MP1 might hang or become unresponsive, leading to the
> loss of critical data present in the STB buffer. This defeats the purpose
> of the STB buffer, which was originally meant to help identify system
> failures.
>
> This feature creates stb_read_previous_boot debugfs allows users to
> retrieve the STB log from MP2 specifically from the last occurrence of
> the S2Idle suspend/resume. A userspace daemon can access STB log of last
> S2Idle suspend/resume which can help to troubleshoot potential issues
> related to hangs or stalls during the S2Idle suspend/resume sequence.
>
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---


Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>


> Changes in v4:
> 	- Modified Kconfig to provide clearer messages and configuration
> 	  options.
> 	- Referenced amd_pmc instead of global variable.
> 	- Used macros instead of constant literals.
> 	- Added pci_clear_master to the cleanup path.  
> 	- Renamed the 'cmd' and 'response' field names of a structure to
> 	  'field'.
> 	- Replaced dev_err with dev_dbg wherever appropriate.
> 	- Consolidated SZ_1K multiplication to a single location instead
> 	  of repeating it throughout the code.
> 	  
> Changes in v3:
> 	- Changed an error path for deinitialization or freeing resources.
> 	- Modified the macro and variable to have a more specific name.
> 	- Included header files for USEC_PER_MSEC, writeq, and writel.
> 	- Switched the data type of the 'len' variable from 'int' to 
> 	  'unsigned int'.
> 	- Used one variable for return values.
>
> Changes in v2:
> 	- Used linux/sizes.h instead of defining KB.
> 	- Defined timeout containing unit as per USEC_PER_MSEC.
> 	- Modified macro of AMD_C2P_MSG and AMD_P2C_MSG.
> 	- Changed string stb to STB in log messages.
> 	- Defined literals using Macro.
>
>  drivers/platform/x86/amd/pmc/Kconfig   |  15 ++
>  drivers/platform/x86/amd/pmc/Makefile  |   1 +
>  drivers/platform/x86/amd/pmc/mp2_stb.c | 279 +++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmc/pmc.c     |   4 +
>  drivers/platform/x86/amd/pmc/pmc.h     |  15 ++
>  5 files changed, 314 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/pmc/mp2_stb.c
>
> diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
> index 883c0a95ac0c..94f9563d8be7 100644
> --- a/drivers/platform/x86/amd/pmc/Kconfig
> +++ b/drivers/platform/x86/amd/pmc/Kconfig
> @@ -18,3 +18,18 @@ config AMD_PMC
>  
>  	  If you choose to compile this driver as a module the module will be
>  	  called amd-pmc.
> +
> +config AMD_MP2_STB
> +	bool "AMD SoC MP2 STB function"
> +	depends on AMD_PMC
> +	default AMD_PMC
> +	help
> +	  AMD MP2 STB function provides a data buffer used to log debug
> +	  information about the system execution during S2Idle suspend/resume.
> +	  A data buffer known as the STB (Smart Trace Buffer) is a circular
> +	  buffer which is a low-level log for the SoC which is used to debug
> +	  any hangs/stalls during S2Idle suspend/resume.
> +
> +	  Creates debugfs to get STB, a userspace daemon can access STB log of
> +	  last S2Idle suspend/resume which can help to debug if hangs/stalls
> +	  during S2Idle suspend/resume.
> diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
> index 4aaa29d351c9..f1d9ab19d24c 100644
> --- a/drivers/platform/x86/amd/pmc/Makefile
> +++ b/drivers/platform/x86/amd/pmc/Makefile
> @@ -6,3 +6,4 @@
>  
>  amd-pmc-objs := pmc.o pmc-quirks.o
>  obj-$(CONFIG_AMD_PMC) += amd-pmc.o
> +amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
> diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x86/amd/pmc/mp2_stb.c
> new file mode 100644
> index 000000000000..dfa55327e5f1
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD MP2 STB layer
> + *
> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/pci.h>
> +#include <linux/sizes.h>
> +#include <linux/time.h>
> +
> +#include "pmc.h"
> +
> +#define VALID_MSG 0xA
> +#define VALID_RESPONSE 2
> +
> +#define AMD_C2P_MSG0 0x10500
> +#define AMD_C2P_MSG1 0x10504
> +#define AMD_P2C_MSG0 0x10680
> +#define AMD_P2C_MSG1 0x10684
> +
> +#define MP2_RESP_SLEEP_US 500
> +#define MP2_RESP_TIMEOUT_US (1600 * USEC_PER_MSEC)
> +
> +#define MP2_STB_DATA_LEN_2KB 1
> +#define MP2_STB_DATA_LEN_16KB 4
> +
> +#define MP2_MMIO_BAR 2
> +
> +struct mp2_cmd_base {
> +	union {
> +		u32 ul;
> +		struct {
> +			u32 cmd_id : 4;
> +			u32 intr_disable : 1;
> +			u32 is_dma_used : 1;
> +			u32 rsvd : 26;
> +		} field;
> +	};
> +};
> +
> +struct mp2_cmd_response {
> +	union {
> +		u32 resp;
> +		struct {
> +			u32 cmd_id : 4;
> +			u32 status : 4;
> +			u32 response : 4;
> +			u32 rsvd2 : 20;
> +		} field;
> +	};
> +};
> +
> +struct mp2_stb_data_valid {
> +	union {
> +		u32 data_valid;
> +		struct {
> +			u32 valid : 16;
> +			u32 length : 16;
> +		} val;
> +	};
> +};
> +
> +static int amd_mp2_wait_response(struct amd_mp2_dev *mp2, u8 cmd_id, u32 command_sts)
> +{
> +	struct mp2_cmd_response cmd_resp;
> +
> +	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG0, cmd_resp.resp,
> +				(cmd_resp.field.response == 0x0 &&
> +				 cmd_resp.field.status == command_sts &&
> +				 cmd_resp.field.cmd_id == cmd_id), MP2_RESP_SLEEP_US,
> +				 MP2_RESP_TIMEOUT_US))
> +		return cmd_resp.field.status;
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static void amd_mp2_stb_send_cmd(struct amd_mp2_dev *mp2, u8 cmd_id, bool is_dma_used)
> +{
> +	struct mp2_cmd_base cmd_base;
> +
> +	cmd_base.ul = 0;
> +	cmd_base.field.cmd_id = cmd_id;
> +	cmd_base.field.intr_disable = 1;
> +	cmd_base.field.is_dma_used = is_dma_used;
> +
> +	writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
> +	writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
> +}
> +
> +static int amd_mp2_stb_region(struct amd_mp2_dev *mp2)
> +{
> +	struct device *dev = &mp2->pdev->dev;
> +	unsigned int len = mp2->stb_len;
> +
> +	if (!mp2->stbdata) {
> +		mp2->vslbase = dmam_alloc_coherent(dev, len, &mp2->dma_addr, GFP_KERNEL);
> +		if (!mp2->vslbase)
> +			return -ENOMEM;
> +
> +		mp2->stbdata = devm_kzalloc(dev, len, GFP_KERNEL);
> +		if (!mp2->stbdata)
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_mp2_process_cmd(struct amd_mp2_dev *mp2, struct file *filp)
> +{
> +	struct device *dev = &mp2->pdev->dev;
> +	struct mp2_stb_data_valid stb_dv;
> +	int status;
> +
> +	stb_dv.data_valid = readl(mp2->mmio + AMD_P2C_MSG1);
> +
> +	if (stb_dv.val.valid != VALID_MSG) {
> +		dev_dbg(dev, "Invalid STB data\n");
> +		return -EBADMSG;
> +	}
> +
> +	if (stb_dv.val.length != MP2_STB_DATA_LEN_2KB &&
> +	    stb_dv.val.length != MP2_STB_DATA_LEN_16KB) {
> +		dev_dbg(dev, "Unsupported length\n");
> +		return -EMSGSIZE;
> +	}
> +
> +	mp2->stb_len = BIT(stb_dv.val.length) * SZ_1K;
> +
> +	status = amd_mp2_stb_region(mp2);
> +	if (status) {
> +		dev_err(dev, "Failed to init STB region, status %d\n", status);
> +		return status;
> +	}
> +
> +	amd_mp2_stb_send_cmd(mp2, VALID_MSG, true);
> +	status = amd_mp2_wait_response(mp2, VALID_MSG, VALID_RESPONSE);
> +	if (status == VALID_RESPONSE) {
> +		memcpy_fromio(mp2->stbdata, mp2->vslbase, mp2->stb_len);
> +		filp->private_data = mp2->stbdata;
> +		mp2->is_stb_data = true;
> +	} else {
> +		dev_err(dev, "Failed to start STB dump, status %d\n", status);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_mp2_stb_debugfs_open(struct inode *inode, struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	struct amd_mp2_dev *mp2 = dev->mp2;
> +
> +	if (mp2) {
> +		if (!mp2->is_stb_data)
> +			return amd_mp2_process_cmd(mp2, filp);
> +
> +		filp->private_data = mp2->stbdata;
> +
> +		return 0;
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static ssize_t amd_mp2_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> +					loff_t *pos)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	struct amd_mp2_dev *mp2 = dev->mp2;
> +
> +	if (!mp2)
> +		return -ENODEV;
> +
> +	if (!filp->private_data)
> +		return -EINVAL;
> +
> +	return simple_read_from_buffer(buf, size, pos, filp->private_data, mp2->stb_len);
> +}
> +
> +static const struct file_operations amd_mp2_stb_debugfs_fops = {
> +	.owner = THIS_MODULE,
> +	.open = amd_mp2_stb_debugfs_open,
> +	.read = amd_mp2_stb_debugfs_read,
> +};
> +
> +static void amd_mp2_dbgfs_register(struct amd_pmc_dev *dev)
> +{
> +	if (!dev->dbgfs_dir)
> +		return;
> +
> +	debugfs_create_file("stb_read_previous_boot", 0644, dev->dbgfs_dir, dev,
> +			    &amd_mp2_stb_debugfs_fops);
> +}
> +
> +void amd_mp2_stb_deinit(struct amd_pmc_dev *dev)
> +{
> +	struct amd_mp2_dev *mp2 = dev->mp2;
> +	struct pci_dev *pdev;
> +
> +	if (mp2 && mp2->pdev) {
> +		pdev = mp2->pdev;
> +
> +		if (mp2->mmio)
> +			pci_clear_master(pdev);
> +
> +		pci_dev_put(pdev);
> +
> +		if (mp2->devres_gid)
> +			devres_release_group(&pdev->dev, mp2->devres_gid);
> +
> +		dev->mp2 = NULL;
> +	}
> +}
> +
> +void amd_mp2_stb_init(struct amd_pmc_dev *dev)
> +{
> +	struct amd_mp2_dev *mp2 = NULL;
> +	struct pci_dev *pdev;
> +	int rc;
> +
> +	mp2 = devm_kzalloc(dev->dev, sizeof(*mp2), GFP_KERNEL);
> +	if (!mp2)
> +		return;
> +
> +	pdev = pci_get_device(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_MP2_STB, NULL);
> +	if (!pdev)
> +		return;
> +
> +	dev->mp2 = mp2;
> +	mp2->pdev = pdev;
> +
> +	mp2->devres_gid = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
> +	if (!mp2->devres_gid) {
> +		dev_err(&pdev->dev, "devres_open_group failed\n");
> +		goto mp2_error;
> +	}
> +
> +	rc = pcim_enable_device(pdev);
> +	if (rc) {
> +		dev_err(&pdev->dev, "pcim_enable_device failed\n");
> +		goto mp2_error;
> +	}
> +
> +	rc = pcim_iomap_regions(pdev, BIT(MP2_MMIO_BAR), "mp2 stb");
> +	if (rc) {
> +		dev_err(&pdev->dev, "pcim_iomap_regions failed\n");
> +		goto mp2_error;
> +	}
> +
> +	mp2->mmio = pcim_iomap_table(pdev)[MP2_MMIO_BAR];
> +	if (!mp2->mmio) {
> +		dev_err(&pdev->dev, "pcim_iomap_table failed\n");
> +		goto mp2_error;
> +	}
> +
> +	pci_set_master(pdev);
> +
> +	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +	if (rc) {
> +		dev_err(&pdev->dev, "failed to set DMA mask\n");
> +		goto mp2_error;
> +	}
> +
> +	amd_mp2_dbgfs_register(dev);
> +
> +	return;
> +
> +mp2_error:
> +	amd_mp2_stb_deinit(dev);
> +}
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 108e12fd580f..916a302e5614 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -1106,6 +1106,8 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	amd_pmc_dbgfs_register(dev);
> +	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
> +		amd_mp2_stb_init(dev);
>  	pm_report_max_hw_sleep(U64_MAX);
>  	return 0;
>  
> @@ -1122,6 +1124,8 @@ static void amd_pmc_remove(struct platform_device *pdev)
>  		acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
>  	amd_pmc_dbgfs_unregister(dev);
>  	pci_dev_put(dev->rdev);
> +	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
> +		amd_mp2_stb_deinit(dev);
>  	mutex_destroy(&dev->lock);
>  }
>  
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 827eef65e133..9e32d3128c3a 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -14,6 +14,17 @@
>  #include <linux/types.h>
>  #include <linux/mutex.h>
>  
> +struct amd_mp2_dev {
> +	void __iomem *mmio;
> +	void __iomem *vslbase;
> +	void *stbdata;
> +	void *devres_gid;
> +	struct pci_dev *pdev;
> +	dma_addr_t dma_addr;
> +	int stb_len;
> +	bool is_stb_data;
> +};
> +
>  struct amd_pmc_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -38,10 +49,13 @@ struct amd_pmc_dev {
>  	struct dentry *dbgfs_dir;
>  	struct quirk_entry *quirks;
>  	bool disable_8042_wakeup;
> +	struct amd_mp2_dev *mp2;
>  };
>  
>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
> +void amd_mp2_stb_init(struct amd_pmc_dev *dev);
> +void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>  
>  /* List of supported CPU ids */
>  #define AMD_CPU_ID_RV			0x15D0
> @@ -53,5 +67,6 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>  #define AMD_CPU_ID_PS			0x14E8
>  #define AMD_CPU_ID_SP			0x14A4
>  #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
> +#define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
>  
>  #endif /* PMC_H */

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

