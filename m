Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705BD6CDD8
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188512; cv=none; b=CLkKgBRTFTCJQtv5LEdQma60Hqr5lAjH/aUDPdOm+wzXS4+JCt3LZ9V7qF+MA2IfmKarXzKBL1U0rUK/75vQab/AxzV0/PpR4PylsVU0ZooIADp0uSrBogB914vrvUBmf+o/yacwiFnMoafmkRnc5/GM0bJfT6d4Y9Gx6AGRrws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188512; c=relaxed/simple;
	bh=uWLL7p1f6vsmj5GIvuEzo0WH78dNDTkehsYrS/resG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=StzuNeN1wvuiyfdp6BYYSkqFinZZUSnX172n0cSID4B/oaF68mgNgg6KOEdmGcURUvlBRLbA1pIaVestRv1m3P5kw30V+ao/pW4FZ9NQhdyqoCpnShVBM5FOuffx0tHHGJWCnnfIgKUrYrBfYTwXph6JIjGTOvSQFUxHBCadpjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GfNwhU1W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GfNwhU1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713188509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPTUWhnjHYDYxaOETRnQEAhauA7WnR4Yz9YPG9WxzBE=;
	b=GfNwhU1WPS8sOoFi8dsfbw0xJx+qP3/SuOXz3WfliQJlxfy9Db4ZUIOQmPbcM1Q6S4y2Bz
	VVEsvshQF1Ul+1cu1+p61qv1XvcArDrljLUuERY/MFI9n3xgHoSCX4JV/R7m1nn0m4qfiw
	H7t2V1tsNWk8ImNBugX/aRmCVnE1L4o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-o-3gsjSGOBmdQXgnLANIYw-1; Mon, 15 Apr 2024 09:41:46 -0400
X-MC-Unique: o-3gsjSGOBmdQXgnLANIYw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-56bf2d59fceso2815858a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 06:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188506; x=1713793306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPTUWhnjHYDYxaOETRnQEAhauA7WnR4Yz9YPG9WxzBE=;
        b=tWlXc4L0uXDDttFp9jdNqW5dMGWJUZNnJfoDUFUwBuyNydLhAQUyLA9Nve7yzG9SwT
         te0kcrCAq7Wm+LUL3dzVUEsi/9TC/q/9gFvrhqsfRwAHe8dSSDic/Ze2L6llgfXGKltT
         8dx6/eRcHcUdMuNoCVZfgOVFD4kOwvkKwPn17L16DCyF92OdoDHhyN9/GTibQ0htJxvc
         5JQ3OZyOk0YiemZNPtcuZMoc56a1xFrRDTTMDa1ocHle24916p63NKIPSQ9tNIyv+UeK
         0CgvJhvRKrQox13/k6oguvqF8fnS+DVx1SWzIs3J2W0Wz5MILigIRGyW5Lr1JMNwwAmN
         Q4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXCTo+Zu0UtosXbhytan4tFtijps5vO4iKion8cLH5kIQuKRc/2En1JJBYj7+67QGlSFiRvDoUQohQDgrqIw3lsND/IlWfJCkBM37GFbx+ZmvWA+Q==
X-Gm-Message-State: AOJu0Yyf15xeL9e8Wv0l3W5WNWAmKOvS64UB84ljtUE/hXPhve1R95oA
	EYtUMglxeqoxoZC+dC7ISnF4ixsODWQYqF5APAa8IUS4JLFRuqzYj6MlHzwD2Pj3zRD92Pm/HLj
	VHa2ZdAccrovbmmJXTwrSrmitNZjV+EflAY4LDOBU2PECPNAZapk3zZqrWTEd+QhCphlWUEY=
X-Received: by 2002:a50:c35d:0:b0:56d:c937:7558 with SMTP id q29-20020a50c35d000000b0056dc9377558mr7852734edb.9.1713188505746;
        Mon, 15 Apr 2024 06:41:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkXqOWBy7Ors730YRyD2qVGzAr5WNYuSHifbDlDxuCsCw/Yivz1Y0VqZSDumN784f6HbtNYw==
X-Received: by 2002:a50:c35d:0:b0:56d:c937:7558 with SMTP id q29-20020a50c35d000000b0056dc9377558mr7852719edb.9.1713188505337;
        Mon, 15 Apr 2024 06:41:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d19-20020a50fe93000000b0056c56d18d07sm4874430edt.48.2024.04.15.06.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 06:41:44 -0700 (PDT)
Message-ID: <2dca9f65-d274-4166-badf-baba84a253a5@redhat.com>
Date: Mon, 15 Apr 2024 15:41:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86/amd/pmc: Add AMD MP2 STB functionality
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam-sundar.S-k@amd.com,
 ilpo.jarvinen@linux.intel.com, sathyanarayanan.kuppuswamy@linux.intel.com,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
References: <20240404090702.325838-1-Basavaraj.Natikar@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240404090702.325838-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/4/24 11:07 AM, Basavaraj Natikar wrote:
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

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
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

