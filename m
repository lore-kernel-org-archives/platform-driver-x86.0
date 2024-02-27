Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F25138480
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709030927; cv=none; b=HUIg665anal3E0tDsqRK11w06hKTNS4vX4QjpDlS6d8mogCG+mgfAS0z1kuLDzyhKcJokFPCrHFYi8VrlS2D5sAt8bl7+r1dlyVBf1/B/SqtQA3eX2JYB9KH1Q7ApZlsCmcy1XFlc3nneudXNOwOkeOP94uS947bDaXjzPZy7k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709030927; c=relaxed/simple;
	bh=EYIe5/X7AtvHrf3pLKW+NA23QYJj00oCnJM7U3sgxPE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZEzjjX8gWDLRSbZNsbPHVb1XiBwtWv5fTzpRH6J/34T8k3IfxJRORrkdy22TH82RQl7uGRxqj90Pha5WjybvHKZ/krDCoLipmYW/s5SA5GIzZ2pDmUef8GRXf7ghKdSlZlmU0fTDPlvovcogcuuCsIk1cXLWv485tYtGFCa+VqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ1CR00t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ1CR00t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709030925; x=1740566925;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EYIe5/X7AtvHrf3pLKW+NA23QYJj00oCnJM7U3sgxPE=;
  b=jZ1CR00t69UIa4eKQH+C6XDhtiqmIV9GrwQIDWxXfzJYgyjx0/W9pzGO
   BAI+F1JDiTFOorJyY1XR5zX+E40mL/jLgBRIsGiBOztZxMwqYHbgmQFZ6
   rWgKGLZX2ELcu/2McaIv02vZldrQfmSeXk8KACoPko4WwNfxEBlCZmScj
   n4UB5xCADyj1hCyVOjz7ckRB9pYoG9beTjAAnEVdK212VcDKhGM20oypL
   6ET+x2ez/E46+8NJYcUOLRx6yEaE68BkxHA9tVgLvR2fgdKWUlAVx3LpJ
   qg1ymreMVg09ZWAKrupjBJ7S5rMTPoAc5NwJRBHBTZ2e+kvp4jCh4Enau
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="13915750"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="13915750"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 02:48:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="11767610"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.34.61])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 02:48:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 27 Feb 2024 12:48:19 +0200 (EET)
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: Shyam-sundar.S-k@amd.com, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add AMD MP2 STB functionality
In-Reply-To: <20240226151309.2147799-1-Basavaraj.Natikar@amd.com>
Message-ID: <2294f1e9-2da3-aa07-dac1-02ffc402a424@linux.intel.com>
References: <20240226151309.2147799-1-Basavaraj.Natikar@amd.com>
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

Thanks for the update.

This needs to be just 500.

> +#define TIMEOUT_US (1600 * USEC_PER_MSEC)

Please be more specific in naming what these are. Perhaps
MP2_RESP_TIMEOUT_US & MP2_RESP_SLEEP_US ?

Add #include <linux/time.h> for USEC_PER_MSEC

> +#define LEN_2KB_BIT 1
> +#define LEN_16KB_BIT 4

These are way too generic names. I expected something like:

#define MP2_STB_DATA_LEN_2KB ...

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

So 'da' is assigned to .dma_addr, why is the parameter only obfuscatingly 
as 'da' ?

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

Please add the #include for writeq() and writel() like I already told you.

> +}
> +
> +static int amd_mp2_stb_region(int len)

size_t or unsigned int?

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

I'd just use single variable for return values, after all, status and rc 
are both ints.

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


-- 
 i.

