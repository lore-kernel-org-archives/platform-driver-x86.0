Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239367F7F9
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708952446; cv=none; b=XkLzL+KfFMSGl00zc/EaoLfSrNGkvX+NBk3/mpNoRzIm/01/LfKyGI5I2Rtk74OP1PNZbkNVgylTg6JK3jU4fQchnHD19We1g/MzFfGsINXb7Dt4vNcvLdbRwibY6m3D0btIwnOsgezGylMMnTCJPKXF+DHlb3+2cGSajDz7vkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708952446; c=relaxed/simple;
	bh=/84sLB0Rj/LbFz5g463Ce4uFj7aRaxDkIdaqeS/XEnM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ioCtaP93NAGtn6jfc8dXy/J9ZCGGHNnQ3jLEg09M98jn7nKBJGimNMVYOF2Lq/mLiK018EUFyj5V5ZBZxQDt9/HiNfMLFB+rdN4kJIUQ2A6HeqA8H+VEhKbZ0bulu1ohkqN2npgO+gm2MFUQXKuTsOCA7kB2OcDjXWy8N74amtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCZp5seg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCZp5seg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708952444; x=1740488444;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/84sLB0Rj/LbFz5g463Ce4uFj7aRaxDkIdaqeS/XEnM=;
  b=hCZp5seglyn09VJTmB44C0hGhQ/WcUb0jdDKqFAr+++y7ocrGZ66hIs/
   NcK1/VdmxkMFWOh7GdFccAmE3eMoDS2maoCySVGOnHRd0K279R5Bhdz3A
   ydJNuyFdwvhpY/616K4j+bJTIUNKCcG6pXqO/njCyIVpmfQ1eY5TCEfmZ
   Nzz0c0+V+Sd42OaMqWJf7Rd0fL1RpBam3Yib3kLQQyEJprewRVb6vy4Wr
   ZnrYpuliJdgKsFoiFTibMsvjA6g0826FAFxffKn8COShj/keFTjqBHLil
   V2HagbXaZmSqqXTQcCCy9INCnZFpeIMIUX6H3JrAZR34q1lrn1EzxNA0R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14668010"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="14668010"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 05:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6585481"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.12])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 05:00:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Feb 2024 15:00:35 +0200 (EET)
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: Shyam-sundar.S-k@amd.com, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/amd/pmc: Add AMD MP2 STB functionality
In-Reply-To: <20240226075533.2138661-1-Basavaraj.Natikar@amd.com>
Message-ID: <f87b8083-c4fa-ce3c-fc59-a311f5693f55@linux.intel.com>
References: <20240226075533.2138661-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Feb 2024, Basavaraj Natikar wrote:

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

> +++ b/drivers/platform/x86/amd/pmc/mp2_stb.c

> +#include <linux/debugfs.h>
> +#include <linux/iopoll.h>
> +#include <linux/pci.h>
> +
> +#include "pmc.h"
> +
> +#define KB(x) ((x) * 1024UL)

Use linux/sizes.h ones instead of create your own ones.

> +#define VALID_MSG 0xA
> +#define VALID_RESPONSE 2
> +
> +#define AMD_C2P_MSG(regno) (0x10500 + ((regno) * 4))
> +#define AMD_P2C_MSG(regno) (0x10680 + ((regno) * 4))
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
> +	/* Get response with status within a max of 1600 ms timeout */
> +	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG(0), cmd_resp.resp,
> +				(cmd_resp.response.response == 0x0 &&
> +				 cmd_resp.response.status == command_sts &&
> +				 cmd_resp.response.cmd_id == cmd_id), 500, 1600000))

Add #define for the timeout (with name a containing the unit). For large 
time related numbers, please use USEC_PER_xSEC defines + add the include 
for them.

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
> +	writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG(1));
> +	writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG(0));

#include for these two?

> +}
> +
> +static int amd_mp2_stb_region(int len)
> +{
> +	struct device *dev = &mp2->pdev->dev;
> +
> +	if (!mp2->stbdata) {
> +		mp2->vslbase = dmam_alloc_coherent(dev, KB(len), &mp2->dma_addr, GFP_KERNEL);
> +		if (!mp2->vslbase)
> +			return -ENOMEM;
> +
> +		mp2->stbdata = devm_kzalloc(dev, KB(len), GFP_KERNEL);

If these two KB(len) are related, put the size into a local variable.

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
> +	stb_dv.data_valid = readl(mp2->mmio + AMD_P2C_MSG(1));
> +
> +	if (stb_dv.val.valid != VALID_MSG) {
> +		dev_err(&mp2->pdev->dev, "Invalid stb data\n");

STB

> +		return -EBADMSG;
> +	}
> +
> +	/* Either 2KB or 16KB of stb data length is valid */
> +	if (stb_dv.val.length != 1 && stb_dv.val.length != 4) {

Add #defines for these literals, then you don't need the comment any more.

> +		dev_err(&mp2->pdev->dev, "Unsupported length\n");
> +		return -EMSGSIZE;
> +	}
> +
> +	mp2->stb_len = BIT(stb_dv.val.length);
> +
> +	rc = amd_mp2_stb_region(mp2->stb_len);
> +	if (rc) {
> +		dev_err(&mp2->pdev->dev, "Failed to init stb region, rc %d\n", rc);

STB

> +		return rc;
> +	}
> +
> +	amd_mp2_stb_send_cmd(VALID_MSG, true);
> +	status = amd_mp2_wait_response(VALID_MSG, VALID_RESPONSE);
> +	if (status == VALID_RESPONSE) {
> +		memcpy_fromio(mp2->stbdata, mp2->vslbase, KB(mp2->stb_len));
> +		filp->private_data = mp2->stbdata;
> +		mp2->is_stb_data = true;
> +	} else {
> +		dev_err(&mp2->pdev->dev, "Failed to start stb dump, status %d\n", status);

STB

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
> +	return simple_read_from_buffer(buf, size, pos, filp->private_data, KB(mp2->stb_len));
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
> 

-- 
 i.

