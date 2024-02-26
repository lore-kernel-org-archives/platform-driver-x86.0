Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F7012E1D5
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708971519; cv=none; b=hGNgq+C9XAJaBX9P/S6BRBnE/bD76isrIdGyk60fWjCRU+OBkmaQV7+MJflL8pvK5ca/2xh/6WTvQS8lQwciVoyxM3JPAq5pDvBDWYqEG+I/ujxgz05wOV+bM/DiEH3MUdoaFzmS2YbfCmhC1lv30NYniJu4MSAUqkAKPkehBOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708971519; c=relaxed/simple;
	bh=EXfE1Gtakmeu9HuSEOIMXVlOTFouZZYjy3PLPAxaFe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dc7QNrQNz8SARPrrJUJQd7HKZxTONaT6GhkIBY0j0bbsBxDl6TVb31MBuMHzm9sB0W6IzYABgpqIT4BK0odqmq1GNozbikQDzx9Es+ne+8p1r3MnPA7zW5zk3RUSGV4JFZLN1yCcClj0fxfVIrcxa3W/ndnO/0zGBHqqe/CAecw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgKEkQkY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgKEkQkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708971517; x=1740507517;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=EXfE1Gtakmeu9HuSEOIMXVlOTFouZZYjy3PLPAxaFe4=;
  b=jgKEkQkYoM374kGbEOzFkWXiSoboyfp/IEF054zKXI3zm19qQYcQQrsx
   A7atgDFi0kUCbKg+nJdyMRtW2dWHjJVp1QPogRfV8kAynSF4DbTIBsWWF
   igilVr39lKtp8KiXWmxQGqW9/CJ0cWtQ8XnzjPnvhI7tCbnKmzmy1G3to
   qRHvrH97SmUHs6tlITelFqjIc8LWQSFNEEfXkrWlOtSgWMAurPaKaYqsd
   bE6H7z/uyPQqPReVPZ9zP7VciGuVvJHXfct7ubLKttSRp1apNKXtPs9B1
   uUDzAOc1TVNCbjWRTYB5cQC/YJFWsLeCIbucyF6fXEIyH0YmGHarlLyIR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="13983167"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="13983167"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 10:18:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="11538172"
Received: from tvereenx-mobl.amr.corp.intel.com (HELO [10.251.5.170]) ([10.251.5.170])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 10:18:28 -0800
Message-ID: <29b9bb82-8eb2-4030-953c-b213e1a5861a@linux.intel.com>
Date: Mon, 26 Feb 2024 10:18:27 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add AMD MP2 STB functionality
Content-Language: en-US
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam-sundar.S-k@amd.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org
References: <20240226151309.2147799-1-Basavaraj.Natikar@amd.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240226151309.2147799-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2/26/24 7:13 AM, Basavaraj Natikar wrote:
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
> Changes in v2:
> 	- Used linux/sizes.h instead of defining KB.
> 	- Defined timeout containing unit as per USEC_PER_MSEC.
> 	- Modified macro of AMD_C2P_MSG and AMD_P2C_MSG.
> 	- Changed string stb to STB in log messages.
> 	- Defined literals using Macro.
>
>  drivers/platform/x86/amd/pmc/Kconfig   |  23 +++
>  drivers/platform/x86/amd/pmc/Makefile  |   1 +
>  drivers/platform/x86/amd/pmc/mp2_stb.c | 227 +++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmc/pmc.c     |   5 +
>  drivers/platform/x86/amd/pmc/pmc.h     |  12 ++
>  5 files changed, 268 insertions(+)
>  create mode 100644 drivers/platform/x86/amd/pmc/mp2_stb.c
>
> diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
> index 883c0a95ac0c..8177486babf9 100644
> --- a/drivers/platform/x86/amd/pmc/Kconfig
> +++ b/drivers/platform/x86/amd/pmc/Kconfig
> @@ -18,3 +18,26 @@ config AMD_PMC
>  
>  	  If you choose to compile this driver as a module the module will be
>  	  called amd-pmc.
> +
> +config AMD_MP2_STB
> +	bool "AMD SoC MP2 STB function"
> +	depends on AMD_PMC
> +	help
> +	  AMD MP2 STB function provides a data buffer used to log debug
> +	  information about the system execution during S2Idle suspend/resume.
> +	  A data buffer known as the STB (Smart Trace Buffer) is a circular
> +	  buffer which is a low-level log for the SoC which is used to debug
> +	  any hangs/stalls during S2Idle suspend/resume.
> +
> +	  The current PMC driver retrieves STB data from MP1, but there can be
> +	  scenarios where MP1 might hang or become unresponsive, leading to the
> +	  loss of critical data present in the STB buffer. This defeats the
> +	  purpose of the STB buffer, which was originally meant to help identify
> +	  system failures.
> +
> +	  Creates stb_read_previous_boot debugfs to get STB, a userspace daemon
> +	  can access STB log of last S2Idle suspend/resume which can help to
> +	  debug if hangs/stalls during S2Idle suspend/resume
> +
> +	  Say Y or N here if you have a notebook powered by AMD RYZEN CPU/APU
> +	  and supports MP2 STB.
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
> index 000000000000..258de76cddce
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
> @@ -0,0 +1,227 @@
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
> +#include <linux/iopoll.h>
> +#include <linux/pci.h>
> +#include <linux/sizes.h>
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
> +#define SLEEP_US (0.5 * USEC_PER_MSEC)
> +#define TIMEOUT_US (1600 * USEC_PER_MSEC)
> +
> +#define LEN_2KB_BIT 1
> +#define LEN_16KB_BIT 4
> +
> +static struct amd_mp2_dev *mp2;
> +
> +struct mp2_cmd_base {
> +	union {
> +		u32 ul;
> +		struct {
> +			u32 cmd_id : 4;
> +			u32 intr_disable : 1;
> +			u32 dma_addr : 1;
> +			u32 rsvd : 26;
> +		} cmd;
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
> +		} response;
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
> +static int amd_mp2_wait_response(u8 cmd_id, u32 command_sts)
> +{
> +	struct mp2_cmd_response cmd_resp;
> +
> +	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG0, cmd_resp.resp,
> +				(cmd_resp.response.response == 0x0 &&
> +				 cmd_resp.response.status == command_sts &&
> +				 cmd_resp.response.cmd_id == cmd_id), SLEEP_US, TIMEOUT_US))
> +		return cmd_resp.response.status;
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static void amd_mp2_stb_send_cmd(u8 cmd_id, uint8_t da)
> +{
> +	struct mp2_cmd_base cmd_base;
> +
> +	cmd_base.ul = 0;
> +	cmd_base.cmd.cmd_id = cmd_id;
> +	cmd_base.cmd.intr_disable = 1;
> +	cmd_base.cmd.dma_addr = da;
> +
> +	writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
> +	writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
> +}
> +
> +static int amd_mp2_stb_region(int len)
> +{
> +	struct device *dev = &mp2->pdev->dev;
> +
> +	len *= SZ_1K;
> +
> +	if (!mp2->stbdata) {
> +		mp2->vslbase = dmam_alloc_coherent(dev, len, &mp2->dma_addr, GFP_KERNEL);
> +		if (!mp2->vslbase)
> +			return -ENOMEM;
> +

I don't see you freeing this memory. Don't you need to free it?

> +		mp2->stbdata = devm_kzalloc(dev, len, GFP_KERNEL);
> +		if (!mp2->stbdata)
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_mp2_process_cmd(struct file *filp)
> +{
> +	struct mp2_stb_data_valid stb_dv;
> +	int status, rc;
> +
> +	stb_dv.data_valid = readl(mp2->mmio + AMD_P2C_MSG1);
> +
> +	if (stb_dv.val.valid != VALID_MSG) {
> +		dev_err(&mp2->pdev->dev, "Invalid STB data\n");
> +		return -EBADMSG;
> +	}
> +
> +	if (stb_dv.val.length != LEN_2KB_BIT && stb_dv.val.length != LEN_16KB_BIT) {
> +		dev_err(&mp2->pdev->dev, "Unsupported length\n");
> +		return -EMSGSIZE;
> +	}
> +
> +	mp2->stb_len = BIT(stb_dv.val.length);
> +
> +	rc = amd_mp2_stb_region(mp2->stb_len);
> +	if (rc) {
> +		dev_err(&mp2->pdev->dev, "Failed to init STB region, rc %d\n", rc);
> +		return rc;
> +	}
> +
> +	amd_mp2_stb_send_cmd(VALID_MSG, true);
> +	status = amd_mp2_wait_response(VALID_MSG, VALID_RESPONSE);
> +	if (status == VALID_RESPONSE) {
> +		memcpy_fromio(mp2->stbdata, mp2->vslbase, SZ_1K * mp2->stb_len);
> +		filp->private_data = mp2->stbdata;
> +		mp2->is_stb_data = true;
> +	} else {
> +		dev_err(&mp2->pdev->dev, "Failed to start STB dump, status %d\n", status);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_mp2_stb_debugfs_open(struct inode *inode, struct file *filp)
> +{
> +	if (!mp2->is_stb_data)
> +		return amd_mp2_process_cmd(filp);
> +
> +	filp->private_data = mp2->stbdata;
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_mp2_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> +					loff_t *pos)
> +{
> +	if (!filp->private_data)
> +		return -EINVAL;
> +
> +	return simple_read_from_buffer(buf, size, pos, filp->private_data, SZ_1K * mp2->stb_len);
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
> +int amd_mp2_stb_init(struct amd_pmc_dev *dev)
> +{
> +	struct pci_dev *pdev;
> +	int rc;
> +
> +	pdev = pci_get_device(PCI_VENDOR_ID_AMD, 0x172c, NULL);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	mp2 = devm_kzalloc(dev->dev, sizeof(*mp2), GFP_KERNEL);
> +	if (!mp2)
missing pci_dev_put(pdev) here. I recommend doing it at the end with
goto for error paths.
> +		return -ENOMEM;
> +
> +	mp2->pdev = pdev;
> +
> +	rc = pcim_enable_device(pdev);
> +	if (rc) {
> +		pci_dev_put(pdev);
> +		return rc;
> +	}
> +
> +	rc = pcim_iomap_regions(pdev, BIT(2), "mp2 stb");
> +	if (rc) {
> +		pci_dev_put(pdev);

Wondering whether you need to disable pci_device?

> +		return rc;
> +	}
> +
> +	/* MP2 MMIO is mapped to BAR2 */
> +	mp2->mmio = pcim_iomap_table(pdev)[2];
> +	pci_set_master(pdev);
> +	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> +	if (rc) {
> +		dev_err(&pdev->dev, "failed to set DMA mask\n");
> +		pci_dev_put(pdev);
> +		return rc;
> +	}
> +
> +	amd_mp2_dbgfs_register(dev);
> +	dev->mp2 = mp2;
> +
> +	return 0;
> +}
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 108e12fd580f..8baab1c3cca9 100644
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
> @@ -1122,6 +1124,9 @@ static void amd_pmc_remove(struct platform_device *pdev)
>  		acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
>  	amd_pmc_dbgfs_unregister(dev);
>  	pci_dev_put(dev->rdev);
> +	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
> +		if (dev->mp2 && dev->mp2->pdev)
> +			pci_dev_put(dev->mp2->pdev);
>  	mutex_destroy(&dev->lock);
>  }
>  
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 827eef65e133..be0f6b674133 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -14,6 +14,16 @@
>  #include <linux/types.h>
>  #include <linux/mutex.h>
>  
> +struct amd_mp2_dev {
> +	void __iomem *mmio;
> +	void __iomem *vslbase;
> +	void *stbdata;
> +	struct pci_dev *pdev;
> +	dma_addr_t dma_addr;
> +	int stb_len;
> +	bool is_stb_data;
> +};
> +
>  struct amd_pmc_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -38,10 +48,12 @@ struct amd_pmc_dev {
>  	struct dentry *dbgfs_dir;
>  	struct quirk_entry *quirks;
>  	bool disable_8042_wakeup;
> +	struct amd_mp2_dev *mp2;
>  };
>  
>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
> +int amd_mp2_stb_init(struct amd_pmc_dev *dev);
>  
>  /* List of supported CPU ids */
>  #define AMD_CPU_ID_RV			0x15D0

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

