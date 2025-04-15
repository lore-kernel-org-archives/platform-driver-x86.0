Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4919D136349
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Apr 2025 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729365; cv=none; b=VQV94MRm/KJCUGm1JgfW+s+eq3ejewz6B+V+f4j779deMMbzXdl4m3laVOwacIASLgtwCP/SwjoWB49KkOx3y/xeyis6BzjSYOl8MK69xudo3gzbAgF0zsBClzp6sxL5yp1RZzXDfdgYLFBn/oFEzFun0dX23NwhyecJkF5RaKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729365; c=relaxed/simple;
	bh=GvUwK03zFTBqyUgpxF1kw7gHyjizLputrp+Hg8GMsow=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nxsW3IHAfhCLAg8sgrC5DtcumJPKfPZER7EmDcbKOPB37RA8AncNAGOIfC5uPhGCE6M/cb211YcssXLzaYhutORjISSIJD5kDVJwuyMsDEvdRBYGc9Qn7rxIT9FjnVjvV8w+Ie0UTYIyp/+lEppqqXiIaN5nsO+rhsWi/rmiHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ptcc0JfF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ptcc0JfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744729363; x=1776265363;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GvUwK03zFTBqyUgpxF1kw7gHyjizLputrp+Hg8GMsow=;
  b=Ptcc0JfF14+ZsXEEbOav6AghSXB06qHeCK8kfVh+xbsUUrUfhFpKqAOL
   K470sIhZnE5+QnpwblYbZCFAhDrEl8YJpdPgF1YfXt/+pT2imnmGligMo
   QowzrI7U6cdmloKY4Dkc+b4Omju/b6FI5UDc3a6mAB5ApLSCHwlDZ7ozv
   icUfEF/K6m3pnVFwwtrarOIKc+JYE6jMLMq/9XbDwU8Sv8ZpllEJOb97E
   WXFagDQjaMgIblYWn0HoH3fErw0rfOa244NUqWu84NqUSDMsPxzqq53sO
   HPNK5ZMVt0rcoIelmVrbPq2MH6URnhpPpo7XTxIpcTBAOrDZYiN27chii
   A==;
X-CSE-ConnectionGUID: v/StZvLUTeO8iPhn15lT2g==
X-CSE-MsgGUID: b9S1gPK4QP6MK5pnHCSQEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="33860638"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="33860638"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 08:02:42 -0700
X-CSE-ConnectionGUID: uLml/KFHQK6UmGW6yaVHZA==
X-CSE-MsgGUID: jsniAd4nQsyOnCaJevzz4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="134249541"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 08:02:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Apr 2025 18:02:36 +0300 (EEST)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v8 7/7] Documentation/ABI: Add new attribute
 for mlxreg-io sysfs interfaces
In-Reply-To: <20250412091843.33943-8-vadimp@nvidia.com>
Message-ID: <08d67714-9657-bd4f-1fdf-58fe69483f72@linux.intel.com>
References: <20250412091843.33943-1-vadimp@nvidia.com> <20250412091843.33943-8-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 12 Apr 2025, Vadim Pasternak wrote:

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
> v7->v8
> Added by Vadim:
> - Fix dates.
> v5->v6
> Comments pointed out by Ilpo:
> - Fix dates.
> ---
>  .../ABI/stable/sysfs-driver-mlxreg-io         | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> index 2cdfd09123da..acc0c9a9ac29 100644
> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> @@ -715,3 +715,99 @@ Description:	This file shows 1 in case the system reset happened due to the
>  		switch board.
>  
>  		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/global_wp_request
> +Date:		April 2025
> +KernelVersion:	6.15

I really wish we wouldn't need to do this... Once again, these are 
outdated.

-- 
 i.

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
> +Date:		April 2025
> +KernelVersion:	6.15
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file, when set 1, indicates that access to protected
> +		flashes have been granted to host CPU by BMC.
> +		Default value is 0.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
> +Date:		April 2025
> +KernelVersion:	6.15
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
> +Date:		April 2025
> +KernelVersion:	6.15
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
> +Date:		April 2025
> +KernelVersion:	6.15
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file shows hardware Id of Data Process Unit board.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_reload
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_dpu_thermal
> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/reset_from_main_board
> +Date:		April 2025
> +KernelVersion:	6.15
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
> +Date:		April 2025
> +KernelVersion:	6.15
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
> +Date:		April 2025
> +KernelVersion:	6.15
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show status of Unified Fabric Manager upgrade.
> +		state. 0 - means upgrade is done, 1 - otherwise.
> +
> +		The file is read only.
> 
