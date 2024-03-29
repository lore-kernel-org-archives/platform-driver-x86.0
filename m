Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE1225A8
	for <platform-driver-x86@vger.kernel.org>; Fri, 29 Mar 2024 18:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711738221; cv=none; b=h4G4pJ6K1KuFTt+nY5LwEnrbFHcNQLz6QLFmXPnQb30oDs/IgueuumtyMUEIAprKgNEPXnT4PU0tumKQHJqr1/ihsQyMCGMZhhSAkFK48P/4L1FaGmb9Sih9Q08jwFTSaP/Jgat4TTkiPVmKmMZnHl/uJnJTqLedaHfNQ0FSX8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711738221; c=relaxed/simple;
	bh=2O5c5afhM3O6hFnuieFy2qc37a56PSX0Q0YYTma0dgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsl4xOStM2cAFvfEpKbaamn9f/W6ICr3W6SZVYKSPZtDX6RPT4PvjoSwkzRPcTP07phKp4Zb9hDrWqsL6/JhdHAtqd64S1IWwul2Evoef1Fc8++paj1Mzj6O00rlbH11E2yKhjQY+8O3T+viendZKcSLr0JXKIhZGnI3G39qrX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVhv5qMn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVhv5qMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711738220; x=1743274220;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2O5c5afhM3O6hFnuieFy2qc37a56PSX0Q0YYTma0dgw=;
  b=AVhv5qMn0ZFrbjyVKewi1xw5oUZx6b1Nx2WDKsF9hUAOI0IufIJVXBUr
   8V5N50BFVpbt69I0tqxrxWTF5IlZrjFIiMqfm9pqpD1TbterAxg5lImWB
   F4f5FKEvJg90rM71OPGsfwvr0MFgPTRox1WscuP7BozCLMR6l2EjRlOsy
   j/i/JwrG5QPsi9B7S1vGFhE+nL4VUv4JgeBF8DtRvCdjIwGhqQgDeGlWf
   g6f+jqYS7BzCg78fMtYiq2IoG82r++G83cIBCJdYUliYpFDiVcDdr1QkP
   F0yMiQHPhNtDR07ZZxjfi0/Bru0CAH81c7bMEZR6kHSvK0ka66d2uyEld
   g==;
X-CSE-ConnectionGUID: gH6c5hdfRByUT2qFJAtZ8g==
X-CSE-MsgGUID: 2EB5Hnj5RRSSzOOViDcgqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="6790025"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="6790025"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 11:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="21507777"
Received: from hkannan-mobl.amr.corp.intel.com (HELO [10.209.48.27]) ([10.209.48.27])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 11:50:19 -0700
Message-ID: <c26ca604-a812-4030-bdae-79e6e2b7b17b@linux.intel.com>
Date: Fri, 29 Mar 2024 11:50:18 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: intel-vbtn: Update tablet mode switch
 at end of probe
To: Gwendal Grignou <gwendal@chromium.org>, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
References: <20240329143206.2977734-1-gwendal@chromium.org>
 <20240329143206.2977734-3-gwendal@chromium.org>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240329143206.2977734-3-gwendal@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 3/29/24 7:32 AM, Gwendal Grignou wrote:
> ACER Vivobook Flip (TP401NAS) virtual intel switch is implemented as
> follow:
>
>    Device (VGBI)
>    {
>        Name (_HID, EisaId ("INT33D6") ...
>        Name (VBDS, Zero)
>        Method (_STA, 0, Serialized)  // _STA: Status ...
>        Method (VBDL, 0, Serialized)
>        {
>            PB1E |= 0x20
>            VBDS |= 0x40
>        }
>        Method (VGBS, 0, Serialized)
>        {
>            Return (VBDS) /* \_SB_.PCI0.SBRG.EC0_.VGBI.VBDS */
>        }
>        ...
>     }
>
> By default VBDS is set to 0. At boot it is set to clamshell (bit 6 set)
> only after method VBDL is executed.
>
> Since VBDL is now evaluated in the probe routine later, after the device
> is registered, the retrieved value of VBDS was still 0 ("tablet mode")
> when setting up the virtual switch.
>
> Make sure to evaluate VGBS after VBDL, to ensure the
> convertible boots in clamshell mode, the expected default.
>
> Fixes: 26173179fae1 ("platform/x86: intel-vbtn: Eval VBDL after registering our notifier")
> Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>  drivers/platform/x86/intel/vbtn.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
> index 48f0ac19d6ddf..79bb2c801daa9 100644
> --- a/drivers/platform/x86/intel/vbtn.c
> +++ b/drivers/platform/x86/intel/vbtn.c
> @@ -136,8 +136,6 @@ static int intel_vbtn_input_setup(struct platform_device *device)
>  	priv->switches_dev->id.bustype = BUS_HOST;
>  
>  	if (priv->has_switches) {
> -		detect_tablet_mode(&device->dev);
> -
>  		ret = input_register_device(priv->switches_dev);
>  		if (ret)
>  			return ret;
> @@ -312,6 +310,9 @@ static int intel_vbtn_probe(struct platform_device *device)
>  		if (ACPI_FAILURE(status))
>  			dev_err(&device->dev, "Error VBDL failed with ACPI status %d\n", status);
>  	}
> +	// Check switches after buttons since VBDL may have side effects.
> +	if (has_switches)
> +		detect_tablet_mode(&device->dev);
>  
>  	device_init_wakeup(&device->dev, true);
>  	/*

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

