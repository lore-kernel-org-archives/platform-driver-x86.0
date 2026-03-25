Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4F43CC9FE
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774447099; cv=none; b=cED7oIiJPCe2hXUg7DBYJsygJ1Akr/C8H76bt0biuI3HiU2+BHU9B/E9smc60lsI62bbb0sVaGcjhBuBj2m0fTQn5IJbLUPRCrgROXM3nkUfiZMfOwb6FYLtyz0r1zBX9kMeGqOi2qEKFckGs7vmGEA8xP0aJpdy0sdrfiPZhjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774447099; c=relaxed/simple;
	bh=14JvhbVmQSJvgTA/ahoTVk0JD8lLE9Rcut5ZrTDaDq4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WvF1EFWtEvhFpQ9kbBXolT3azhHNGQBqDYBds1PpDT0MRUHgSb6NHUUj3CbwEzLdj5mnDyhXW78IID8T5014lmNx7KSnNAnzT/2s93s0g9HxW2NY+7nOLjxre/epU7HLb9NIiJZxeL/tHTVX8gQ4qEavCn0kQSiAwb2EGign//Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hruv9duE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hruv9duE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774447098; x=1805983098;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=14JvhbVmQSJvgTA/ahoTVk0JD8lLE9Rcut5ZrTDaDq4=;
  b=Hruv9duEZ1tnw17eYW8sO/qmJQIwVEXgtCVNkWmOQbesnY/9mqG0CC9j
   Dvsw6sLTlMCm2isy/PFI7F4qriztp/ue0aO4zkHS/ngC5FeGzjy81sTWZ
   +E06CIw9zrWzYae01qg5nuZBp4py4n3lX8IVh7eElFb6XrnGKHBjFZubW
   m2m+QD4zZGUGapLiN0jHB27DxGf2agg2yckVUMQZsLqE8iqRIIkz4eF44
   JxQMVRMU0vdU5lg0CrLbYyZ+6NVdu2S3icxpCMX5UdLNU4zn8z6qyj+1t
   cbn1hFalWB3JxV2gWdIqh3oyJLNFrKBLwVibeF95vimO2ltalTg8l6hlj
   w==;
X-CSE-ConnectionGUID: XQcv8kyEQJKBrS5+6J3MIg==
X-CSE-MsgGUID: A1p7VVBzTpuAs+hsWsFoyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75365577"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75365577"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:58:17 -0700
X-CSE-ConnectionGUID: b/SJKISJQ/qcydVbo8uiFQ==
X-CSE-MsgGUID: MMu9vSweSpWSigzPzd+g3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="220283677"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:58:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 15:58:11 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 7/7] Documentation/ABI: add testing entry for AMD PMF
 misc device interface
In-Reply-To: <20260301131124.1370565-8-Shyam-sundar.S-k@amd.com>
Message-ID: <3b1fdb27-3179-ba33-3f8c-6d617b3827f3@linux.intel.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com> <20260301131124.1370565-8-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 1 Mar 2026, Shyam Sundar S K wrote:

> Add a Documentation/ABI/testing entry describing the AMD PMF util layer
> misc device (/dev/amdpmf_interface) and the initial ioctls used to query
> feature support and metrics data information. This interface is available
> when CONFIG_AMD_PMF_UTIL_SUPPORT=y.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  .../ABI/testing/misc-amdpmf_interface         | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
> 
> diff --git a/Documentation/ABI/testing/misc-amdpmf_interface b/Documentation/ABI/testing/misc-amdpmf_interface
> new file mode 100644
> index 000000000000..62b0175e1345
> --- /dev/null
> +++ b/Documentation/ABI/testing/misc-amdpmf_interface
> @@ -0,0 +1,70 @@
> +What:		/dev/amdpmf_interface
> +Date:		February 2026

As always, these get stale as we go. Please estimate the targetted kernel 
version's release date instead to fill this field in.

> +KernelVersion:	7.1
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:
> +		The AMD Platform Management Framework (PMF) util layer exposes a
> +		minimal user-space interface via a misc character device for
> +		feature discovery and metrics monitoring.
> +
> +		When CONFIG_AMD_PMF_UTIL_SUPPORT is enabled, the driver creates
> +		a character device:
> +
> +		======================
> +		/dev/amdpmf_interface
> +		======================
> +
> +		The interface currently supports following ioctls:
> +
> +		======================== =========================================
> +		IOCTL			 Usage
> +		IOCTL_PMF_POPULATE_DATA	 User passes a struct amd_pmf_ioctl_info
> +					 with control_code set to the desired
> +					 metric or feature ID. The driver returns
> +					 the requested data in val, or feature
> +					 support status in feature_supported.
> +		======================== =========================================
> +
> +		Following are the control codes supported (enum pmf_ioctl_id):
> +
> +		============== ================================================================
> +		Control Code	Description
> +		0		IOCTL_POWER_SOURCE: AC/DC power source
> +		1		IOCTL_POWER_SLIDER_POSITION: Current power slider
> +		2		IOCTL_PLATFORM_TYPE: Platform form factor
> +		3		IOCTL_LAPTOP_PLACEMENT: Device placement (on table/lap/bag)
> +		4		IOCTL_LID_STATE: Lid open/closed status
> +		6		IOCTL_SKIN_TEMP: Skin temperature (degrees Celsius)
> +		7		IOCTL_USER_PRESENCE: User presence detection
> +		10-19		IOCTL_BIOS_INPUT_1 to IOCTL_BIOS_INPUT_10: Custom BIOS inputs
> +		20		IOCTL_GFX_WORKLOAD: Graphics workload percentage
> +		29		IOCTL_AMBIENT_LIGHT: Ambient light sensor reading
> +		36		IOCTL_AVG_C0_RES: Average C0 state residency
> +		37		IOCTL_MAX_C0_RES: Maximum C0 state residency
> +		50		IOCTL_SOCKET_POWER: Socket power consumption
> +		52-61		IOCTL_BIOS_OUTPUT_1 to IOCTL_BIOS_OUTPUT_10: BIOS output values
> +		============== ================================================================
> +
> +		Feature Discovery:
> +
> +		============== =============================================================
> +		Control Code	Description
> +		62		IOCTL_FEATURE_AUTO_MODE: Auto Mode feature support
> +		63		IOCTL_FEATURE_STATIC_POWER_SLIDER: Static Power Slider
> +		64		IOCTL_FEATURE_POLICY_BUILDER: Policy Builder (Smart PC)
> +		65		IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC: Dynamic slider on AC
> +		66		IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC: Dynamic slider on DC
> +		============== =============================================================
> +
> +		Following are the return codes:
> +
> +		============= ============================================================
> +		Return code	Description
> +		0		success
> +		EINVAL		control_code is not recognized or handle is not available
> +		EFAULT		copy_to_user/copy_from_user failures
> +		ENODEV		PMF device not available
> +		============= ============================================================
> +
> +		User-space tools integrating with AMD PMF to discover capabilities and
> +		monitor real-time metrics for thermal and power management validation.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..78773373172c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1224,6 +1224,7 @@ AMD PMF DRIVER
>  M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Supported
> +F:	Documentation/ABI/testing/misc-amdpmf_interface
>  F:	Documentation/ABI/testing/sysfs-amd-pmf
>  F:	drivers/platform/x86/amd/pmf/
>  
> 

-- 
 i.

