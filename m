Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40D513B7AE
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709041024; cv=none; b=orXKwEnpZBTfct8/40CBhwJidqAcidzzuew1Nr0vLuyhS0lgmDc7ALyihVH6O7yGhPAnr+Mzrdbr+x4hqHTDKH3oPjwjgIa2R+wRGlV5ZpviNqskzvNFR83EGpcdc+8L6yn2nYpJe3V6MpkJnjDidgnERjgfsAZIGU4C6M/eOkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709041024; c=relaxed/simple;
	bh=T7MQxaimhhEX1Snb+Y3xmpbxEILJtqjGJ31gmLh7eLI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cQl8xm/VPsZiCTQRQZkA/DEmCG90G9sqVOYhoFmvlEtbbHIe/P1H0ewt+dzT3hBsSQgqPGPkxrenIpHhMXnSc7keFefeHcZKG2POvP+cB30IB3EjmcSH7SUWTTD/doruMsCyi9O7UtHRinMVo1GB2RAPbyk8ylQobwlKv1pO2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UeWorr4u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UeWorr4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709041023; x=1740577023;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=T7MQxaimhhEX1Snb+Y3xmpbxEILJtqjGJ31gmLh7eLI=;
  b=UeWorr4u6JcPXZSWsSnpMP3/wUNsUUgCDw8n74ksfZw9/vZ6bUIBYx2v
   CKQsYwF6TFdlOIyIUrNQOFhDXhuznxPJEeUXKIPHioYfwkiG8f/wJS5da
   wqa1W22dc3B1p4vUk7VbDQXN2t/tEaJO7yXpNoHqopIP9DO+WdHAM6WCS
   abkHo1LfRiW/wvey6aIFvHN0BXgjbCUsP90BI1kF9HND3mMAloZAy7gu5
   iVsDauxAJjD2LKbRSr1QBbl3jaz+9a6p1z3/uucpAfQ+IJQA1Gdvvwlur
   ZIYz71EUmTIzcvNOOKLhdSanh+duXjqgjBQCSUMcs48KeqN1QIb6rx2Tf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3498143"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3498143"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 05:37:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7465536"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.34.61])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 05:37:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 27 Feb 2024 15:36:56 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 4/7] platform/x86/amd/pmf: Add support to notify sbios
 heart beat event
In-Reply-To: <20240227125520.3153140-5-Shyam-sundar.S-k@amd.com>
Message-ID: <981bbbc9-fa76-3ee3-3526-c811393801a5@linux.intel.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com> <20240227125520.3153140-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Feb 2024, Shyam Sundar S K wrote:

> Add support for newer revision of the heart beat notify events.
> This event is used to notify to the OEM BIOS on driver
> load/unload/suspend/resume scenarios.
> 
> If OEM BIOS does not receive the heart beat event from PMF driver, OEM
> BIOS shall conclude that PMF driver is no more active and BIOS will
> update to the legacy system power thermals.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 42 +++++++++++++++++++++++++++--
>  drivers/platform/x86/amd/pmf/core.c | 10 +++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 17 ++++++++++++
>  3 files changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 1b2a099c0cef..0fc8ad0ac3e9 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -140,6 +140,44 @@ static void apmf_sbios_heartbeat_notify(struct work_struct *work)
>  	kfree(info);
>  }
>  
> +int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag)
> +{
> +	struct sbios_hb_event_v2 args = { };
> +	struct acpi_buffer params;
> +	union acpi_object *info;
> +
> +	args.size = sizeof(args);
> +
> +	switch (flag) {
> +	case ON_LOAD:
> +		args.load = 1;
> +		break;
> +	case ON_UNLOAD:
> +		args.unload = 1;
> +		break;
> +	case ON_SUSPEND:
> +		args.suspend = 1;
> +		break;
> +	case ON_RESUME:
> +		args.resume = 1;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	params.length = sizeof(args);
> +	params.pointer = (void *)&args;

Casting type pointer to void pointer (and vice-versa) is not necessary as 
it's implicitly done for you by the compiler.

> +	info = apmf_if_call(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2, &params);
> +	if (!info)
> +		return -EIO;
> +
> +	dev_dbg(dev->dev, "Sending v2 heartbeat event to SBIOS\n");

Perhaps including the flag would make this more useful. It's a bit odd 
though you dev_dbg the success but not the failure case. I'd tend to think 
the failure is more useful to know than things working normally.

-- 
 i.
