Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93D4EE49A8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:56:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbjHVI4H (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbjHVI4F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:56:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8DECCD
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692694556; x=1724230556;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SENlcdCJq09/iKBO/ZwSWl8k+j0pxy08ITzTsHXvUcU=;
  b=hSsh2JrKESFqnIeL+RTyCDZ6JRrjSqV0Jk6cJc//eKNBmHYo9SLlNlTh
   3kLaZFB8gTheL2zIHO+os7kd02gj406BDj3mesuyKBiRWsKzB08t5412e
   BIDjrNSxNuPAIuE+9aSiXf93uvlYy1BKjyp1OgBrHfuE9WpXbdWCx3VFC
   Si2lhs58Nm3UfjAFNGOdLgtTMuug0xi5mknFBlzxMU1lZ4q4b+7yBy0XR
   KDnPSVxNPSTvjEkPcyqLyPuCo8Tr2QQWoreaSn2yzz9JdvDsBPLw9qtBp
   5fnKfGNcdAs+epKjfd8VSIjJ4U7tqkvaEc46d7ekPqs5zSQK/eA3+K3tp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377576297"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="377576297"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 01:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1066972575"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="1066972575"
Received: from refaase-mobl.ger.corp.intel.com ([10.252.53.244])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 01:55:43 -0700
Date:   Tue, 22 Aug 2023 11:55:40 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Vadim Pasternak <vadimp@nvidia.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v3 16/16] Documentation/ABI: Add new
 attribute for mlxreg-io sysfs interfaces
In-Reply-To: <20230822081335.64344-17-vadimp@nvidia.com>
Message-ID: <61c08737-727-b190-5caa-26d172af5b2c@linux.intel.com>
References: <20230822081335.64344-1-vadimp@nvidia.com> <20230822081335.64344-17-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-81997948-1692694544=:10949"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-81997948-1692694544=:10949
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
> Comments provided by Hans:
> v2->v3:
> - Document new attribute "reset_swb_dc_dc_pwr_fail".
> ---
>  .../ABI/stable/sysfs-driver-mlxreg-io         | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> index 60953903d007..7022c623075b 100644
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
> +Description:	This file shows the system reset cause due to the failure of
> +		DC-DC power converter devices, equipped on the switch board.
> +		Value 1 in file means this is reset cause, 0 - otherwise.

What "this" on the last line refers to. I'm unable to figure it out from 
the text.

In general, the meaning here is quite unclear. I think the "cause due to" 
put together is the main source of confusion (it's like saying "cause 
cause" or "due to due to"). Do you mean the cause for the system reset is 
the failure of the DC-DC power converter devices if this file shows 1? 


For the other patches 1-15:
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

One additional thing you want to address is the missing '\n' chars from 
the dev_*() prints but it can be handled after these patches.

> +
> +		The file is read only.
> 

-- 
 i.

--8323329-81997948-1692694544=:10949--
