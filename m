Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBB7382367
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779361672; cv=none; b=NevDK0cehUcOL61IdMZ8JkdifP4+bRFiAt84LQMFCC/R8OaO681Q8q0JLNxN9DDst5wx2SiNSRvCiDsd53OuwDEc2zioThe0hAKgSjJ2L+5m92i0ywXGPsrM4BWS4OEB2AS5QRgA2iZ2ZODEr2gjN0w1KhA29Jsi43Fhv6btDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779361672; c=relaxed/simple;
	bh=hdpVjztXzPt/5ryhUaN0sdsOX+pq40XvZRhiVcmVK4Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H4DA6Dsr1XwKPWm2aXeNBilrN705TY7lb1opv4SqH2FfvFNzB565e8RiV4a61IQfpFvCO+750qXQ4TMibxSikU7edb30G7hGzm9JCU3roYorA4Ovw/uPFTgmC/JP88ih9HZuFgkINYju2lxrBo6jJAFim4o3gGt10dKzt/L92JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b41BtUaH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b41BtUaH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779361671; x=1810897671;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hdpVjztXzPt/5ryhUaN0sdsOX+pq40XvZRhiVcmVK4Y=;
  b=b41BtUaHZKaEH2fk188ZQ2sjtPmj1WLw2cbGL1tGB8QAIREHxxeASs6O
   CJ/ao71M0HUazncHXs7J0f+2xAnzrrVU29IJ4t/Tlh4aZpXIWCLtQS9fV
   q4vKMsloGslEJINnHgOigwukZn8qnlaTLtKREbRuy+6w7DTOM+nQxfv1e
   ep31Jaz0MEEUHyxehkYbGGK43pci0+UgitQiAnQKdoEbSgGz3YGlphb4B
   lgGEJHdFL0BO6eBh8enkawoDwIWvH1SBp5yf8ibn5k8VkYEAKKvwaswYK
   V8+BMcLDqMHkBAxRpBFaMBHngk57cyQtUsP7m9ah9hCR7h725MQxZb7MM
   A==;
X-CSE-ConnectionGUID: +9TLS3MoQbaBxB45Zpvh9Q==
X-CSE-MsgGUID: tVTv215xQkiWErJIVscijQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80242641"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80242641"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:07:50 -0700
X-CSE-ConnectionGUID: wHgMRGHoQRSPG4t9Oxo2vA==
X-CSE-MsgGUID: AYVLlYtdRKWP/AxP9kGSoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="264020703"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.98])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:07:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 21 May 2026 14:07:44 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v5 8/8] Documentation/ABI: add testing entry for AMD PMF
 character device interface
In-Reply-To: <20260520185424.770772-9-Shyam-sundar.S-k@amd.com>
Message-ID: <ae0ebb59-cd50-73fd-db35-6797117e8d1d@linux.intel.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com> <20260520185424.770772-9-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, Shyam Sundar S K wrote:

> Add a Documentation/ABI/testing entry describing the AMD PMF util layer
> character device (/dev/amdpmf_interface) and the initial ioctls used to
> query feature support and metrics data information. This interface is
> available when CONFIG_AMD_PMF_UTIL_SUPPORT=y.
> 
> Also update the MAINTAINERS record with the new UAPI header.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  Documentation/ABI/testing/amdpmf-interface | 74 ++++++++++++++++++++++
>  MAINTAINERS                                |  1 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 Documentation/ABI/testing/amdpmf-interface
> 
> diff --git a/Documentation/ABI/testing/amdpmf-interface b/Documentation/ABI/testing/amdpmf-interface
> new file mode 100644
> index 000000000000..45606907f7e6
> --- /dev/null
> +++ b/Documentation/ABI/testing/amdpmf-interface
> @@ -0,0 +1,74 @@
> +What:		/dev/amdpmf_interface
> +Date:		June 2026
> +KernelVersion:	7.2
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:
> +		The AMD Platform Management Framework (PMF) util layer exposes a
> +		minimal user-space interface via a character device for feature
> +		discovery and metrics monitoring.
> +
> +		When CONFIG_AMD_PMF_UTIL_SUPPORT is enabled, the driver creates
> +		a character device:
> +
> +		======================
> +		/dev/amdpmf_interface
> +		======================
> +
> +		The interface supports a single ioctl:
> +
> +		============================ =======================================
> +		IOCTL			     Usage
> +		IOCTL_AMD_PMF_POPULATE_DATA  User passes a struct amd_pmf_info with
> +					     the size field set to sizeof(struct
> +					     amd_pmf_info). The driver returns all
> +					     available metrics and feature status
> +					     in the structure.
> +		============================ =======================================
> +
> +		struct amd_pmf_info layout:
> +
> +		======================= ========== ================================
> +		Field			Type	   Description
> +		size			__u64	   Structure size for versioning
> +		features_version	__u32	   IOCTL interface version

Where does this come from?

> +		features_supported	__u32	   Bitmask of supported features
> +		platform_type		__u32	   Platform form factor orientation
> +		power_source		__u32	   AC/DC power source
> +		laptop_placement	__u32	   Device placement state
> +		lid_state		__u32	   Lid open/closed status
> +		user_presence		__u32	   User presence detection
> +		slider_position		__u32	   Current power slider position
> +		skin_temp		__s32	   Skin temperature (centidegrees)
> +		gfx_busy		__u32	   Graphics workload percentage
> +		ambient_light		__s32	   Ambient light sensor reading
> +		avg_c0_residency	__u32	   Average C0 state residency
> +		max_c0_residency	__u32	   Maximum C0 state residency
> +		socket_power		__u32	   Socket power consumption
> +		bios_input[10]		__u32	   Custom BIOS input parameters
> +		bios_output[10]		__u32	   Custom BIOS output parameters
> +		======================= ========== ================================
> +
> +		Feature Support Flags (features_supported bitmask):
> +
> +		=====================================    ====  =============================
> +		Flag				         Bit   Description
> +		AMD_PMF_FEAT_AUTO_MODE		         0     Auto Mode feature support
> +		AMD_PMF_FEAT_STATIC_POWER_SLIDER         1     Static Power Slider support
> +		AMD_PMF_FEAT_POLICY_BUILDER	         2     Policy Builder (Smart PC)
> +		AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC     3     Dynamic slider on AC
> +		AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC     4     Dynamic slider on DC
> +		=====================================    ====  =============================
> +
> +		Return codes:
> +
> +		============= ============================================================
> +		Return code   Description
> +		0	      Success
> +		EINVAL	      Invalid size or parameter
> +		EFAULT	      copy_to_user/copy_from_user failures
> +		ENODEV	      PMF device not available
> +		ENOTTY	      Unknown ioctl command
> +		============= ============================================================
> +
> +		User-space tools integrating with AMD PMF to discover capabilities and
> +		monitor real-time metrics for thermal and power management validation.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 839e39825455..ec061cd127b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1216,6 +1216,7 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Supported
>  F:	Documentation/ABI/testing/sysfs-amd-pmf
>  F:	drivers/platform/x86/amd/pmf/
> +F:	include/uapi/linux/amd-pmf.h
>  
>  AMD POWERPLAY AND SWSMU
>  M:	Kenneth Feng <kenneth.feng@amd.com>
> 

-- 
 i.

