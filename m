Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F884A843D;
	Tue, 15 Sep 2026 22:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789512529; cv=none; b=LZUIO1hCm7/nX+JpoXGBggoLY8+ReQq68oLG36BQ0aTXaoWlwhZo5xX6XoC2c/SxJuOHG2u3HUyAMge7crh1O+O9CIgsXPp1mmhWjjp/uhztcWTBsS4HPVSdjNwGebL2gOfaqce/MOkWdNVrM6Ygnqtb5gmr8aLrZAATuvL6JV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789512529; c=relaxed/simple;
	bh=iCsV6Yt3i0365LsOOymIdc9BbzAJGLoMTOgYbTHFBjo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kUXkLt5W1WoH/Tg4Hoz0qY18SUXfZuX9CRWLdv7LaqiEEskuHyWuXjqO6D5liuv0P50zzqqH8t70My5MUhbjKZfP8rlsQbMF4d6QFWKiJQwQPg25v467MaBhkDO+3p3pIjXSn173z2TCrO03Q/sosTFsCuCSpvZErETjGv1soH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKledO5g; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKledO5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789512527; x=1821048527;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iCsV6Yt3i0365LsOOymIdc9BbzAJGLoMTOgYbTHFBjo=;
  b=KKledO5giiHfeDBBbYJXjPPYJ5f8bq+l+shAy8T/rMkY9NqepW6/korP
   oOLpMMp0CiaEreV049rV1dAqZQ4OxI5PmBxnK2/377DStxnus/z8Nm1Da
   0Wy4HwqVNQgvzTwYhOIJG5+wyC2JgD+TvUf/2YLoXjKasmASSrlnIenrj
   oel50c6uIAcv8U5jEhbAz3CTx9PX3M6OsmBFPdqC8fMr5fU8iYmv4t09N
   XCz7qNUewQkkvnt/NU9ym3rYDB/5mWMLHIMqJMn/oJ3NHXbQqOtOfy+bY
   PpnjHddMiY27F17/E8TCUWkFPecPwGTjqPIzMriB5bqtZF4vVL3rEM7FX
   w==;
X-CSE-ConnectionGUID: 9IrwKqCPTOOmHOtGYQJtXg==
X-CSE-MsgGUID: clrrcC1wRri8QUDQS4ZG6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93588500"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93588500"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 15:48:45 -0700
X-CSE-ConnectionGUID: l6aLB3sHSDCVOF+13n2dww==
X-CSE-MsgGUID: N/e3gBTeQPOkIldTAQHVPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277276980"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 15:48:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Sep 2026 01:48:36 +0300 (EEST)
To: Andre Eikmeyer <dev@deq.rocks>
cc: platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
    linux-sound@vger.kernel.org, 
    Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
    =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
    David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
    Kenneth Feng <kenneth.feng@amd.com>, Jaroslav Kysela <perex@perex.cz>, 
    Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>, 
    Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
    dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] platform/x86: apple-gmux: add MacBookPro15,1 dGPU
 power sequence
In-Reply-To: <20260812144750.36797-2-dev@deq.rocks>
Message-ID: <54a9c55c-4437-1974-dc3a-106bc2488fee@linux.intel.com>
References: <20260812144221.35877-1-dev@deq.rocks> <20260812144750.36797-1-dev@deq.rocks> <20260812144750.36797-2-dev@deq.rocks>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Aug 2026, Andre Eikmeyer wrote:

> From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> 
> The discrete GPU on the MacBookPro15,1 does not return after the legacy

"return" seems wrong term in this sentence.

> GMUX power-on sequence. PCI configuration space remains inaccessible, so
> runtime PM cannot provide usable hybrid graphics with the integrated GPU
> as primary.
> 
> Evaluate the firmware PWG1 and PWG3 link methods around the GMUX
> transition and wait for PCI configuration space before completing power-on.
> Keep the sequence limited to the MacBookPro15,1 and retain the existing
> path for every other model.



> This was tested on both the 2018 and 2019 MacBookPro15,1 revisions with the
> integrated GPU as primary. The discrete GPU transitions between DynOff and
> DynPwr, and external displays work across the transitions.
> 
> Co-developed-by: Andre Eikmeyer <dev@deq.rocks>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---
>  drivers/platform/x86/apple-gmux.c | 86 ++++++++++++++++++++++++++++---
>  1 file changed, 80 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 9c728ac..ccb059a 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -22,6 +22,7 @@
>  #include <linux/pci.h>
>  #include <linux/vga_switcheroo.h>
>  #include <linux/debugfs.h>
> +#include <linux/dmi.h>
>  #include <acpi/video.h>
>  #include <asm/io.h>
>  
> @@ -74,6 +75,8 @@ struct apple_gmux_data {
>  	enum vga_switcheroo_client_id switch_state_external;
>  	enum vga_switcheroo_state power_state;
>  	struct completion powerchange_done;
> +	struct pci_dev *discrete_pdev;
> +	bool use_pwg_power_sequence;
>  
>  	/* debugfs data */
>  	u8 selected_port;
> @@ -82,6 +85,34 @@ struct apple_gmux_data {
>  
>  static struct apple_gmux_data *apple_gmux_data;
>  
> +static int gmux_call_pwg(struct apple_gmux_data *gmux_data,
> +			 const char *method)
> +{
> +	acpi_handle handle = ACPI_HANDLE(&gmux_data->discrete_pdev->dev);
> +	unsigned long long result;
> +	acpi_status status;
> +
> +	if (!handle)
> +		return -ENODEV;
> +
> +	status = acpi_evaluate_integer(handle, (acpi_string)method, NULL,
> +				       &result);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&gmux_data->discrete_pdev->dev,
> +			"failed to evaluate %s: %s\n", method,
> +			acpi_format_exception(status));

Add hinclude for dev_err().

> +		return -EIO;
> +	}
> +
> +	if (result) {
> +		dev_err(&gmux_data->discrete_pdev->dev,
> +			"%s failed: %llu\n", method, result);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>  struct apple_gmux_config {
>  	u8 (*read8)(struct apple_gmux_data *gmux_data, int port);
>  	void (*write8)(struct apple_gmux_data *gmux_data, int port, u8 val);
> @@ -510,14 +541,49 @@ static int gmux_switch_ddc(enum vga_switcheroo_client_id id)
>  static int gmux_set_discrete_state(struct apple_gmux_data *gmux_data,
>  				   enum vga_switcheroo_state state)
>  {
> +	int ret;
> +
>  	reinit_completion(&gmux_data->powerchange_done);
>  
>  	if (state == VGA_SWITCHEROO_ON) {
> -		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
> -		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 3);
> +		if (gmux_data->use_pwg_power_sequence &&
> +		    gmux_data->discrete_pdev) {
> +			u16 vendor;
> +			int i;
> +
> +			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 2);
> +			msleep(100);
> +			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 3);
> +
> +			ret = gmux_call_pwg(gmux_data, "PWG1");
> +			if (ret)
> +				return ret;
> +
> +			for (i = 0; i < 1000; i++) {
> +				pci_read_config_word(gmux_data->discrete_pdev,
> +						     PCI_VENDOR_ID, &vendor);
> +				if (vendor != 0xffff)
> +					break;
> +				usleep_range(1000, 2000);
> +			}
> +			if (vendor == 0xffff) {

Does this duplicate pci_bus_read_dev_vendor_id() ?

> +				dev_err(&gmux_data->discrete_pdev->dev,
> +					"timed out waiting for PCI config space\n");
> +				return -ETIMEDOUT;
> +			}
> +
> +			ret = gmux_call_pwg(gmux_data, "PWG3");
> +			if (ret)
> +				return ret;
> +		} else {
> +			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
> +			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 3);
> +		}
>  		pr_debug("Discrete card powered up\n");
>  	} else {
>  		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
> +		if (gmux_data->use_pwg_power_sequence)
> +			usleep_range(10000, 11000);

Where do these numbers come from?

>  		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 0);
>  		pr_debug("Discrete card powered down\n");
>  	}
> @@ -549,11 +615,16 @@ static enum vga_switcheroo_client_id gmux_get_client_id(struct pci_dev *pdev)
>  	 */
>  	if (pdev->vendor == PCI_VENDOR_ID_INTEL)
>  		return VGA_SWITCHEROO_IGD;
> -	else if (pdev->vendor == PCI_VENDOR_ID_NVIDIA &&
> -		 pdev->device == 0x0863)
> +	if (pdev->vendor == PCI_VENDOR_ID_NVIDIA && pdev->device == 0x0863)
>  		return VGA_SWITCHEROO_IGD;
> -	else
> -		return VGA_SWITCHEROO_DIS;
> +
> +	if (apple_gmux_data->use_pwg_power_sequence &&
> +	    apple_gmux_data->discrete_pdev != pdev) {
> +		pci_dev_put(apple_gmux_data->discrete_pdev);
> +		apple_gmux_data->discrete_pdev = pci_dev_get(pdev);
> +	}
> +
> +	return VGA_SWITCHEROO_DIS;
>  }
>  
>  static const struct vga_switcheroo_handler gmux_handler_no_ddc = {
> @@ -803,6 +874,8 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
>  	if (!gmux_data)
>  		return -ENOMEM;
>  	pnp_set_drvdata(pnp, gmux_data);
> +	gmux_data->use_pwg_power_sequence = type == APPLE_GMUX_TYPE_MMIO &&
> +		dmi_match(DMI_PRODUCT_NAME, "MacBookPro15,1");

This formatting is hard to read.

>  	switch (type) {
>  	case APPLE_GMUX_TYPE_MMIO:
> @@ -1009,6 +1082,7 @@ static void gmux_remove(struct pnp_dev *pnp)
>  	} else
>  		release_region(gmux_data->iostart, gmux_data->iolen);
>  	apple_gmux_data = NULL;
> +	pci_dev_put(gmux_data->discrete_pdev);
>  	kfree(gmux_data);
>  }
>  
> 

-- 
 i.

