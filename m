Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21C3EB80E;
	Fri, 22 May 2026 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450553; cv=none; b=qJFbYcFQhPXk5sv6vJSC3mT4lhIbkDBoZxlMPT4Dqq654fBZTh8naDPcjc7mmiM+4t35JOf12JNSVzYvwGNESpbYESdMrmK1uVvTkxGdOmyO1MGnR0jIRqwcK2jgWgp8qTIQ1Yu5SzpqIO1czKSCgF+dUAxbvANDyDMiXCW9lmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450553; c=relaxed/simple;
	bh=tys1USJm+YUneJsBVqpzkj1MYyFYeaBi+jJjxKumAbc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lLKBH/sjfnJfsmjNMgeTr//g0RDImYhwdjDiDzgq5Mar1aExNLE/lLq7te4pECQSjPldMScO9qNQZHZHgD8k08W6JSaMVURusJxCP1i1w+b35LkXco6nrglbjhGpx4GNDkjCXpptb6cemZVQ/jvWFyIXr1666S2Q/b2PshsiqVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzpHdHE6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzpHdHE6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779450551; x=1810986551;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tys1USJm+YUneJsBVqpzkj1MYyFYeaBi+jJjxKumAbc=;
  b=jzpHdHE65lriPCXP5vAi50mMA8OsFXQq9SNDyhg5AWn+mUxos273FGSi
   kLeg59fLrkYswnRJ3m2Sp4E1LrWLRsY0j89H0wFFGWW60UWpqvEMQNDcM
   3N7YjcdGCItU5CMu4L0IEuCPHwQ87PdHfjwMRrWWzDMmSsumaSfu97zt5
   NbspCCObB2ti+PQrRbBWp2lDRbUI1/JUWx6SiMrTMyHV8I0ypRyKqLrTW
   ZcE6m+qEJ6/SH5sD3mqGoCHno/WpJmNt3a+bXEkjEd0A+ywyLIyaHA3TG
   CS6xsTYIhm7ujnmWKDEcncxhkvct5kSHWfNU4wjdVmiRtq6mtVgyIotgJ
   A==;
X-CSE-ConnectionGUID: DFZ/FgX5Qwmt9I9ilzo73g==
X-CSE-MsgGUID: m0TJnEukROCcGGL847TG0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80499520"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80499520"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:49:11 -0700
X-CSE-ConnectionGUID: OVyxvehET3mIHmWTOFd2qA==
X-CSE-MsgGUID: JkaZeetpTMWqiK6LIKkM1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="236671343"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:49:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 14:49:04 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Suma Hegde <suma.hegde@amd.com>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v3 1/7] platform/x86/amd/hsmp: Add new HSMP messages for
 Family 1Ah, Model 50h-5Fh
In-Reply-To: <20260517151211.415627-2-muralidhara.mk@amd.com>
Message-ID: <300f46bd-0edb-5889-1845-f4d718ff77e6@linux.intel.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com> <20260517151211.415627-2-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 17 May 2026, Muralidhara M K wrote:

> From: Suma Hegde <suma.hegde@amd.com>
> 
> The new messages extend the HSMP interface to provide finer control over
> power states and system monitoring capabilities.
> 
> Power state control:
> - Get/Set PC6 and CC6 enable/disable control (0x29, 0x2A)
> 
> Power and thermal monitoring:
> - Get CCD power consumption reading (0x34)
> - Get Thermal delta (Tdelta) reading (0x35)
> - Get SVI3 VR controller temperature (0x36)
> 
> DIMM sideband operations:
> - Get/Set DIMM sideband data(0x33, 0x39)
> 
> Power management:
> - Get/Set Floor limit control (0x38)
> - Get/Set SDPS limit control (0x3A)
> 
> System capabilities:
> - Get enabled HSMP commands (0x37)

As you change the existing entries, how does the old stuff handle the 
newly allowed commands (which were previously blocked due to 
hsmp_msg_desc_table[])? It would be good to explain in the changelog why 
it's safe to do.

-- 
 i.

> Bump driver version to 2.6.
> 
> Reviewed-by: Muralidhara M K <muralidhara.mk@amd.com>
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> ---
> Changes v1->v3: None
> 
>  arch/x86/include/uapi/asm/amd_hsmp.h | 142 +++++++++++++++++++++++----
>  drivers/platform/x86/amd/hsmp/hsmp.h |   2 +-
>  2 files changed, 126 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index 92d8f256d096..603d62f8d4da 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -53,9 +53,19 @@ enum hsmp_message_ids {
>  	HSMP_SET_XGMI_PSTATE_RANGE,	/* 26h Set xGMI P-state range */
>  	HSMP_CPU_RAIL_ISO_FREQ_POLICY,	/* 27h Get/Set Cpu Iso frequency policy */
>  	HSMP_DFC_ENABLE_CTRL,		/* 28h Enable/Disable DF C-state */
> +	HSMP_PC6_ENABLE,		/* 29h Get/Set PC6 enable/disable status */
> +	HSMP_CC6_ENABLE,		/* 2Ah Get/Set CC6 enable/disable status */
>  	HSMP_GET_RAPL_UNITS = 0x30,	/* 30h Get scaling factor for energy */
>  	HSMP_GET_RAPL_CORE_COUNTER,	/* 31h Get core energy counter value */
>  	HSMP_GET_RAPL_PACKAGE_COUNTER,	/* 32h Get package energy counter value */
> +	HSMP_DIMM_SB_RD,                /* 33h Get data from a specified device on the DIMM */
> +	HSMP_READ_CCD_POWER,		/* 34h Get the average power consumed by CCD */
> +	HSMP_READ_TDELTA,		/* 35h Get thermal solution behaviour */
> +	HSMP_GET_SVI3_VR_CTRL_TEMP,	/* 36h Get temperature of SVI3 VR controller rails */
> +	HSMP_GET_ENABLED_HSMP_CMDS,	/* 37h Get/Set supported HSMP commands */
> +	HSMP_SET_GET_FLOOR_LIMIT,       /* 38h Get/Set supported Floor limit commands */
> +	HSMP_DIMM_SB_WR,                /* 39h Set data to a specified device on the DIMM */
> +	HSMP_SDPS_LIMIT,                /* 3Ah Get/Set SDPS limit */
>  	HSMP_MSG_ID_MAX,
>  };
>  
> @@ -170,16 +180,18 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>  	{0, 1, HSMP_GET},
>  
>  	/*
> -	 * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0
> -	 * input: args[0] = min link width[15:8] + max link width[7:0]
> +	 * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0/1
> +	 * input: args[0] = set/get XGMI Link width[31] + min link width[15:8] + max link width[7:0]
> +	 * output: args[0] = current min link width[15:8] + current max link width[7:0]
>  	 */
> -	{1, 0, HSMP_SET},
> +	{1, 1, HSMP_SET_GET},
>  
>  	/*
> -	 * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0
> -	 * input: args[0] = df pstate[7:0]
> +	 * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0/1
> +	 * input: args[0] = set/get df pstate[31] + df pstate[7:0]
> +	 * output: args[0] = APB enabled/disabled[8] + current df pstate[7:0]
>  	 */
> -	{1, 0, HSMP_SET},
> +	{1, 1, HSMP_SET_GET},
>  
>  	/* HSMP_SET_AUTO_DF_PSTATE, num_args = 0, response_sz = 0 */
>  	{0, 0, HSMP_SET},
> @@ -305,16 +317,18 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>  	{1, 1, HSMP_SET},
>  
>  	/*
> -	 * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0
> -	 * input: args[0] = power efficiency mode[2:0]
> +	 * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0/1
> +	 * input: args[0] = set/get power mode[31] + power efficiency mode[2:0]
> +	 * output: args[0] = current power efficiency mode[2:0]
>  	 */
>  	{1, 1, HSMP_SET_GET},
>  
>  	/*
> -	 * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0
> -	 * input: args[0] = min df pstate[15:8] + max df pstate[7:0]
> +	 * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0/1
> +	 * input: args[0] = set/get DF P-state range[31] + min df pstate[15:8] + max df pstate[7:0]
> +	 * output: args[0] = min df pstate[15:8] + max df pstate[7:0]
>  	 */
> -	{1, 0, HSMP_SET},
> +	{1, 1, HSMP_SET_GET},
>  
>  	/*
>  	 * HSMP_GET_METRIC_TABLE_VER, num_args = 0, response_sz = 1
> @@ -335,10 +349,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>  	{0, 2, HSMP_GET},
>  
>  	/*
> -	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
> -	 * input: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
> +	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0/1
> +	 * input: args[0] = set/get XGMI pstate range[31] + min xGMI p-state[15:8] +
> +	 *                  max xGMI p-state[7:0]
> +	 * output: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
>  	 */
> -	{1, 0, HSMP_SET},
> +	{1, 1, HSMP_SET_GET},
>  
>  	/*
>  	 * HSMP_CPU_RAIL_ISO_FREQ_POLICY, num_args = 1, response_sz = 1
> @@ -355,9 +371,21 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>  	 */
>  	{1, 1, HSMP_SET_GET},
>  
> -	/* RESERVED(0x29-0x2f) */
> -	{0, 0, HSMP_RSVD},
> -	{0, 0, HSMP_RSVD},
> +	/*
> +	 * HSMP_PC6_ENABLE, num_args = 1, response_sz = 0/1
> +	 * input: args[0] = set/get PC6 control[31] + disable/enable PC6[0]
> +	 * output: args[0] = current PC6 control status[0]
> +	 */
> +	{1, 1, HSMP_SET_GET},
> +
> +	/*
> +	 * HSMP_CC6_ENABLE, num_args = 1, response_sz = 0/1
> +	 * input: args[0] = set/get CC6 control[31] + disable/enable CC6[0]
> +	 * output: args[0] = current CC6 control status[0]
> +	 */
> +	{1, 1, HSMP_SET_GET},
> +
> +	/* RESERVED(0x2B-0x2F) */
>  	{0, 0, HSMP_RSVD},
>  	{0, 0, HSMP_RSVD},
>  	{0, 0, HSMP_RSVD},
> @@ -385,6 +413,86 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>  	 */
>  	{0, 2, HSMP_GET},
>  
> +	/*
> +	 * HSMP_DIMM_SB_RD, num_args = 1, response_sz = 1
> +	 * input: args[0] =
> +	 *	Register space[23]
> +	 *	Register offset in given reg space[22:12]
> +	 *	LID of device[11:8]
> +	 *	DIMM address[7:0]
> +	 * output: args[0] = [3:0] Read data byte
> +	 */
> +	{1, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_READ_CCD_POWER, num_args = 1, response_sz = 1
> +	 * input: args[0]  = apic id of core[15:0]
> +	 * output: args[0] = CCD power(mWatts)[31:0]
> +	 */
> +	{1, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_READ_TDELTA, num_args = 0, response_sz = 1
> +	 * input: None
> +	 * output: args[0] = thermal behaviour[31:0]
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_SVI3_VR_CTRL_TEMP, num_args = 1, response_sz = 1
> +	 * input: args[0] = SVI3 rail index[3:1] + Read SVI3 temperature data[0]
> +	 * output: args[0] = SVI3 rail index[30:28] + SVI3 rail temperature(degree C)[27:0]
> +	 */
> +	{1, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_ENABLED_HSMP_CMDS, num_args = 1, response_sz = 3
> +	 * input: args[0] = HSMP command mask[0]
> +	 * output: status of HSMP command = args[0], args[1], args[2]
> +	 */
> +	{1, 3, HSMP_GET},
> +
> +	/*
> +	 * HSMP_SET_GET_FLOOR_LIMIT, num_args = 1, response_sz = 1
> +	 * input: args[0] =
> +	 *	Set or Get[31:30]
> +	 *		Set the Floor frequency per core = 00
> +	 *		Set the Floor frequency for all cores = 01
> +	 *		Get the Floor frequency of a core = 10
> +	 *		Get the Effective Floor frequency per core = 11
> +	 *	Reserved[29:28]
> +	 *	Apic id / Reserved[27:16]
> +	 *		args[27:16] is reserved if args[31:30] = 01
> +	 *	Floor frequency limit / Reserved[15:0]
> +	 *		if args[31] = 0, Floor frequency limit, else reserved
> +	 *
> +	 * output: args[0] =
> +	 *	Effective Floor frequency limit(MHz) / None / Floor frequency limit[15:0]
> +	 *		Effective Floor frequency if input args[31:30] = 11
> +	 *		None if input args[31] = 0
> +	 *		Floor frequency limit (MHz)[15:0] if args[31:30] = 10
> +	 */
> +	{1, 1, HSMP_SET_GET},
> +
> +	/*
> +	 * HSMP_DIMM_SB_WR, num_args = 1, response_sz = 0
> +	 * input: args[0] =
> +	 *	Write Data[31:24]
> +	 *	Register space[23]
> +	 *	Register offset in given reg space[22:12]
> +	 *	LID of device[11:8]
> +	 *	DIMM address[7:0]
> +	 * output: None
> +	 */
> +	{1, 0, HSMP_SET},
> +
> +	/*
> +	 * HSMP_SDPS_LIMIT, num_args = 1, response_sz = 1
> +	 * input: args[0] = Set/Get[31] + SDPS Limit[30:0]
> +	 * output: args[0] = SDPS Limit[30:0]
> +	 */
> +	{1, 1, HSMP_SET_GET},
> +
>  };
>  
>  /* Metrics table (supported only with proto version 6) */
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 0509a442eaae..b153527e0a0d 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -27,7 +27,7 @@
>  #define HSMP_DEVNODE_NAME	"hsmp"
>  #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
>  
> -#define DRIVER_VERSION		"2.5"
> +#define DRIVER_VERSION		"2.6"
>  
>  struct hsmp_mbaddr_info {
>  	u32 base_addr;
> 
