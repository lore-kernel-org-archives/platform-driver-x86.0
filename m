Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E905DEE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235136AbjHVLpA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbjHVLo7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:44:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F9ACF2
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692704677; x=1724240677;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/weR64ufUtEjJa8G4QdEgdt1tOPso1Yz5dBXHpCyQFk=;
  b=YaziY7ViMy5Y24XWuWTdOdybwthyZbnZvV+wSUFNu5T5IGnBJv4ctqAH
   M4CRo/MZyM1/9fpyrsAIq8Z7+kT2G1kFhm/Sa7zLOSJp60P5tIoJSKhgV
   e6Vhs4qw+EPVIQBcuSkr7trT1VHNMdj9vYiNQkbpjMvKuAJvRKh7L7JKO
   BIIO4LvvN2536NH4C3Rp/sXRAVyaOT4R/+hlY2JfBic4T4nJO90NANiA9
   QXjWYNnMIp7rHjXCCnGyIGDG8zaapsvI9ob6FyR4dZdpEQ5f+GjWA8nTs
   VNv+4qxfsOpcs/k1AmNbkzQvyFCrcdET4vHTnGdXGycvXP47L/x9X4CWg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="358846816"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="358846816"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 04:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1067030812"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="1067030812"
Received: from refaase-mobl.ger.corp.intel.com ([10.252.53.244])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 04:43:56 -0700
Date:   Tue, 22 Aug 2023 14:43:54 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Vadim Pasternak <vadimp@nvidia.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v4 16/16] Documentation/ABI: Add new
 attribute for mlxreg-io sysfs interfaces
In-Reply-To: <20230822113451.13785-17-vadimp@nvidia.com>
Message-ID: <7e70744f-70dc-43d6-54d0-fcc6c23d912a@linux.intel.com>
References: <20230822113451.13785-1-vadimp@nvidia.com> <20230822113451.13785-17-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1430813759-1692704637=:10949"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1430813759-1692704637=:10949
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Tue, 22 Aug 2023, Vadim Pasternak wrote:

> Add documentation for the new attributes:
> - CPLD versioning: "cpld5_pn", "cpld5_version", "cpld5_version_min".
> - JTAG capability: "jtag_cap", indicating the available method of
>   CPLD/FPGA devices field update.
> - System lid status: "lid_open".
> - Reset caused by long press of power button: "reset_long_pwr_pb".
> - Reset caused by switch board DC-DC converter device failure:
>   "reset_swb_dc_dc_pwr_fail".
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v3->v4:
>  Comments provided by Ilpo:
>  - Modify desription for "reset_swb_dc_dc_pwr_fail".
> v2->v3:
>  Comments provided by Hans:
>  - Document new attribute "reset_swb_dc_dc_pwr_fail".
> ---
>  .../ABI/stable/sysfs-driver-mlxreg-io         | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> index 60953903d007..115302236627 100644
> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> @@ -662,3 +662,55 @@ Description:	This file shows the system reset cause due to AC power failure.
>  		Value 1 in file means this is reset cause, 0 - otherwise.
>  
>  		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_pn
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_version
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_version_min
> +Date:		August 2023
> +KernelVersion:	6.6
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	These files show with which CPLD part numbers, version and minor
> +		versions have been burned the 5-th CPLD device equipped on a
> +		system.
> +
> +		The files are read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag_cap
> +Date:		August 2023
> +KernelVersion:	6.6
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:    This file indicates the available method of CPLD/FPGA devices
> +		field update through the JTAG chain:
> +		 b00 - field update through LPC bus register memory space.
> +		 b01 - Reserved.
> +		 b10 - Reserved.
> +		 b11 - field update through CPU GPIOs bit-banging.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lid_open
> +Date:		August 2023
> +KernelVersion:	6.6
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	1 - indicates that system lid is opened, otherwise 0.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_long_pwr_pb
> +Date:		August 2023
> +KernelVersion:	6.6
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file if set 1 indicates that system has been reset by
> +		long press of power button.
> +
> +		The file is read only.
> +
> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_swb_dc_dc_pwr_fail
> +Date:		August 2023
> +KernelVersion:	6.6
> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> +Description:	This file shows 1 in case the system reset happened due to the
> +		failure of any DC-DC power converter devices equipped on the
> +		switch board.
> +
> +		The file is read only.

Thanks a lot, much clearer wording now.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1430813759-1692704637=:10949--
