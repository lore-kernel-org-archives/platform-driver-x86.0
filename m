Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F37620B1E5
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Feb 2025 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593612; cv=none; b=I3SKuR4IucByImLpnXeqnl4tuu6hywbYX6Xhms45YSNl/u1/j7Ralruh1bYhEnLiVMhmXJEDFZ3ZQd5qtbvv/noyK+ZCsqA/b2ypEBQegYCIJ2avVvjBLv2ze2FXoDU5yPFK813vy4vq+cJxq2JlTdlMwC3XhncoR2Lbtr3R64g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593612; c=relaxed/simple;
	bh=ODLI4O736H5A1/bK3Qc2itNCr64ObOcHPHRgbJuB1OU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g/10iybd5yqQUHICqjgTSwQhawe7vdjDdxWm+Z1zDlC/4FxzbX3XQq1OXVc8RkkYcot/vKfsJqCfrLgCju+YGok5HUkuHDA/SbwREueVLtW0iOQ1sYVJ9bLGosMJQ1AtnRLLWiPP3EXJws0PfB9obCsK9M/QyHDskFuIRw+oovU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfSXhVWr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfSXhVWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738593611; x=1770129611;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ODLI4O736H5A1/bK3Qc2itNCr64ObOcHPHRgbJuB1OU=;
  b=QfSXhVWre4oL/i5L/1FbGlmQPt9H9Hx6Oxg+WsDXNsZ3n6AhfqxqfW79
   qNoxs771uBDmGgP5bSHbl0Mp3AU/1ol8nai0a+zRaWKr5PKNcaEHtrIAR
   MY537Z1I4Jq4te2Tr+++UdbNHmJUSy+jsPS9BAc4tuYYyOCqwBP/Vp2HK
   SB1wqjjsg7zPYsM7KmzGlq5yzoYByqeBPvr5Gl2gPvfkdZxuLAKkRtKS0
   NyKrAW/QLn1YHl0UKu1K3tiU0iEFR+ECEXFYa4J46X5L8GB+jjdSwi/EV
   m3xJk45wTinSjlosVPbIHJz9noFT14AXIN/vRtm/JSJc4b4lg3NwafFDf
   g==;
X-CSE-ConnectionGUID: QfI8gmpDTAexz7xD5ZKR9A==
X-CSE-MsgGUID: vdmaOa9uRfuVXfW7NELUdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39227115"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="39227115"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:40:10 -0800
X-CSE-ConnectionGUID: QBkwXWoSRvO8jyxpdTYYHg==
X-CSE-MsgGUID: SvO4ytBuRY62mHP+gNoNXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110758503"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:40:08 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 16:40:03 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5 12/12] Documentation/ABI: Add new attribute for
 mlxreg-io sysfs interfaces
In-Reply-To: <20250124172632.22437-13-vadimp@nvidia.com>
Message-ID: <ca13e75e-3d39-61ea-7195-29fe87fc3a30@linux.intel.com>
References: <20250124172632.22437-1-vadimp@nvidia.com> <20250124172632.22437-13-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Jan 2025, Vadim Pasternak wrote:

> Add documentation for the new attributes:
> - Request and response for access to protetced flashes:
>   "global_wp_request", "global_wp_response".
>   Only for systems equipped with BMC - grant can be provided only by
>   BMC in case its security policy allows to grant access.
> - Request to unlock ASICs, which has been shutdown due-to ASIC thermal
>   event: "shutdown_unlock".
> - Data processor Units (DPU) boot progress: "boot_progress".
> - DPU reset causes: "reset_aux_pwr_or_reload", "reset_dpu_thermal",
>   "reset_from_main_board".
> - Reset control for DPU components: "perst_rst", "phy_rst", "tpm_rst",
>   "usbphy_rst".
> - DPU Unified Fabric Manager upgrade - "ufm_upgrade".
> - Hardware Id of Data Process Unit board - "dpu_id".
> 
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  .../ABI/stable/sysfs-driver-mlxreg-io         | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> index 2cdfd09123da..ef6526a6de55 100644
> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> @@ -715,3 +715,99 @@ Description:	This file shows 1 in case the system reset happened due to the
>  		switch board.
>  
>  		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/global_wp_request
> +Date:		January 2025

Please estimate the actual release date.

> +KernelVersion:	6.14

This ship has sailed.

> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file when written 1 activates request to allow access to
> +		the write protected flashes. Such request can be performed only
> +		for system equipped with BMC (Board Management Controller),
> +		which can grant access to protected flashes. In case BMC allows
> +		access - it will respond with "global_wp_response". BMC decides
> +		regarding time window of granted access. After granted window is
> +		expired, BMC will change value back to 0.
> +		Default value is 0.
> +
> +		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/global_wp_response
> +Date:		January 2025
> +KernelVersion:	6.14
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file, when set 1, indicates that access to protected
> +		flashes have been granted to host CPU by BMC.
> +		Default value is 0.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
> +Date:		January 2025
> +KernelVersion:	6.14
> +Contact:	Vadim Pasternak vadimp@nvidia.com
> +Description:	When ASICs are getting overheated, system protection
> +		hardware mechanism enforces system reboot. After system
> +		reboot ASICs come up in locked state. To unlock ASICs,
> +		this file should be written 1
> +		Default value is 0.
> +
> +		The file is read/write.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/boot_progress
> +Date:		January 2025
> +KernelVersion:	6.14
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show the Data Process Unit board boot progress
> +		state. Valid states are:
> +		- 4 : OS starting.
> +		- 5 : OS running.
> +		- 6 : Low-Power Standby.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/dpu_id
> +Date:		January 2025
> +KernelVersion:	6.14
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file shows hardware Id of Data Process Unit board.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_reload
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_dpu_thermal
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_from_main_board
> +Date:		January 2025
> +KernelVersion:	6.14
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show the Data Process Unit board reset cause, as
> +		following: reset due to power auxiliary outage or power reload, reset
> +		due to thermal shutdown, reset due to request from main board.
> +		Value 1 in file means this is reset cause, 0 - otherwise. Only one of
> +		the above causes could be 1 at the same time, representing only last
> +		reset cause.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/perst_rst
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/phy_rst
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/tpm_rst
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/usbphy_rst
> +Date:		January 2025
> +KernelVersion:	6.14
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files allow to reset hardware components of Data Process
> +		Unit board. Respectively PCI, Ethernet PHY, TPM and USB PHY
> +		resets.
> +		Default values for all the attributes is 1. Writing 0 will
> +		cause reset of the related component.
> +
> +		The files are read/write.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/ufm_upgrade
> +Date:		January 2025
> +KernelVersion:	6.14
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show status of Unified Fabric Manager upgrade.
> +		state. 0 - means upgrade is done, 1 - otherwise.
> +
> +		The file is read only.
> 

-- 
 i.

