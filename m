Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010055.outbound.protection.outlook.com [40.93.198.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608DA2F1FE4;
	Thu,  5 Mar 2026 20:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772744288; cv=fail; b=fzKzQ/bQLkNks0w4SY7E8PhSnZXzQYnbEk/+6u2rwkLOJR1yiKObfmMi18qsAfH6wjoTbFo/uHCxGNQ1CeWifgzp6Bi2o2Qr3g8PD8Xqj3SYyT6+euIzZrQ14GWXSIwsSSF+0uSNu91/HVdj68Ux0Fihtz1jLxG5xg4ZsV2Kvn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772744288; c=relaxed/simple;
	bh=zcZL6XOr/QLcSx3H7F7fQVjYtrRh8K+nmIbKqmv14kE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rxaYLjWPcPq+pTpenYvhgcIewex2Dv2Bsk/e5TheD3UTKuaC+2RSZu3ZYnYRLdC0xikhrK9Ct7p2iW+FRQW005suNdIt+HyxY108Qjcs3HQ8alZ0DoaxzMu2ek+DGw0zoeaLPUVFL4s7AFKv8IRpRbIidZ8v9pFTQyWM22FfsoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=II+QDWhl; arc=fail smtp.client-ip=40.93.198.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="II+QDWhl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EA7ZSvrws0JynxeiQH2KmmAQZIDOW3KAqXwS7o9P0wkfi7hh1Nx3THydGloLrg0aeFVA3CUk4LOv3LnYcjQ6vrs2KSZQcbFZy6tdrdyllzj9CNSsRgLS4/l7sEamAS9qH3PPq4hcx9ZOR1yveh+NvehTqc/vo7gBaCIJCHYyysmXispTmZ6X8vPumni6xPs6QJLaVHeLa67+1VGCy8LdZSXH4y0B0Ox4jWG8CHL+A89J0TbsNHOb4on7eh3Pm5MvahxlLzIlvisZAvzRaG7G8iqmIq6gNFb862mCamdjNjjuizNOSyCdbViAlmEzysBq6i41dbZXAxcK/fzibHqXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtlkQ9w6AHlmcwobFtm12JBfbxyvoRiFpUdd4X9T/bc=;
 b=UCbtx5bbm1IHtHTHwp3djB842XPxymrzl0keoUfd7kWhCkHVdyOGi3gRU+IdSJw3xBUMlFwsFAR0LCkuGJSlbel1+kLao1XdbXnuquMRmgBHwS39xOedP7qFCo5Smg21uaK5a1ToAd7soOY/lmQvEMoXetdrspGnSPLLpAHnfA2S9IxozAOmXejAb7XBHB0hk1okAYkbsgvZYjIXcpDX3ErpxlDgF2plMp0s3oyPl4xAPs/49Bqk/9ExRn0dUuiV+8r27e8On8WTu1fo0pFv7g6oYXlnYOZbh2p+kCPOVK4OtxooNRNAqEAIR8+kFOpHSeYExkDGbN9z01f1MD/5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtlkQ9w6AHlmcwobFtm12JBfbxyvoRiFpUdd4X9T/bc=;
 b=II+QDWhlKvgglbJT9iBvJzKWHU08X69WLkW9n1olZmbcvU5oc3zb44+Rl2dJA/TnmWgEhRf9gy64S74zqGwkS83BW3jNi6inx23PjYmTy8tJtNO+CVjYYWN/HAgq4SBWB1iXhaIr86sBGMvOdmSmiHjIxS5f0SMQAwu+cXUdFc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:58:02 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 20:58:02 +0000
Message-ID: <54ca62dc-d590-44a3-8310-f7da59c2a42e@amd.com>
Date: Thu, 5 Mar 2026 14:57:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/2] platform/x86/amd: Add AMD DPTCi driver
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
 derekjohn.clark@gmail.com, denis.benato@linux.dev,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260305181751.3642846-1-lkml@antheas.dev>
 <20260305181751.3642846-3-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260305181751.3642846-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::18) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bf4a94-c86f-4a79-480e-08de7af9e395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	iKEB64Er43UhTYqnkcnncPzqn3QTePIe9Z8NoBdvWb7q1LVsPXVThwRADnfvYq3elvnSzkA7ZdhrsBFbSx7ikwZxU+a/GoTc/R2vb5vlAwDbWWL/zPBwEvIkZmMOVaYrcwARxl59ONU9iLMWyC1uMDb8x5bgCh+FiC+69m1UVBRsjxFM261+RLo9ZI0G1laEtbAkHsg9q5A6emAhuxWA+Qipc6f6I/X+ip5PnMyaCScKgbC9vRxjqj0ltjdVAmV06GlfbSH/Lja3LbooY5N6ScSE+Nao93zTkiRy5rXKpNMGTCcjazn86t4ncAFkxluKcUdkf5Dr5y/QEAt1BeL82/R6pCC//OPJEJuAnNtD1XiPALEQwGfzEbkL0d8OxcclDzah4Yws7OH6NM9hQnBqlYjbZGCFyUu+Ozb12YhIAFy4+dkXLyq+nr2T2ufL8wdDbDkGedwBSss30sUmY9fE00tGT8ZhEdGd/aQBkD1zo8FozFB5VfnyZ1KZRByLGArnGdDw/3tj6AYTu2Bm7CGkhR/F4hczgZ6Nlx11LAEwVyxxNHI+SuQFAH4BHW24k8Z5cEkVjHJ34MEZW35gCGeMv3xphTYvSIfnQlAQzY1UOqLVZbIDxJ9se8V/gyCAP0IlVcAuwrgza1eHTSrCIRZexAzLHBr0pFS7E+L4rfNoJ5x+F2hWuSt5742DSimnTye6IUl7i489YP5RvaeOFePTNL1C6RnEDNLg7TYMyIaBDCM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnVpWG1zZndMQjB1S01ndG5yc1o4V0lDYUVrSStZZFgvcE8xQWoyS2RpSVBZ?=
 =?utf-8?B?RER0WTZ2dWt0eURiYUxvNWxtRkZhSnZPZUg1WXd0eTlQUG40UFVqVFVFRVBQ?=
 =?utf-8?B?d01ES0VFTjErUytyTGowVUNsQjU2cDE0NGRxc1dIR0hYY1hueEhlNEJLWkNh?=
 =?utf-8?B?bjFDcEdSSmRRb1cybEFSZ2NoZ0MxeDRjd0xuZmxrU0FxTHc5Y2dsU3hySjNF?=
 =?utf-8?B?WG1jaDM0TUpwNmFQOWZxcHk3Rk1uMG1uMHRFVGRIbi81R25qcGo5TXAya2ZO?=
 =?utf-8?B?aWU5d05idEpvZEVETnlDVmwzTTdwTkE2TUNrVEVsQzlSTG9Tb2pZTnhFeVRV?=
 =?utf-8?B?SHYxbVVmUjErY2NHdDBFM2ozQmJ4SDFIeVNFQTZzZkY3RjJncGpxV2lzS0dI?=
 =?utf-8?B?Qzg5OHNhb21IMk5jTzR6dDVOVHA2WFd1TFQ0ZmFpNG9DQ2gwSGRRU1Y5RVRZ?=
 =?utf-8?B?L1AyMU1waGtSdWhBbGNkS091aHRLYURLRGhNbGFSSFBjVWFVR2RvbGJTRGZW?=
 =?utf-8?B?eElFbFZRc0RUTEJ4cFlyTlRENmJLNEk0NWptSFE2OUxMVFlmaEdCTlJkeGNH?=
 =?utf-8?B?aTNtYmJJK0ZVcEN0bXVBRlRtKzk1dTVkakMxZ29EUGJJdmZic3Vmc0RwY0sr?=
 =?utf-8?B?LytjSVg3ZDF4Z245NmdyVVN6ZkcvUlV3TjlKVE1RR1orS1kzL0M3Ynd4Uzd5?=
 =?utf-8?B?T0pBRzBDdEt4OVprdUJrYXpZa1A5K25ERU05NFlYWmVSQmhiY29VUGlsTnpR?=
 =?utf-8?B?M0hUcmhNb1dqQ2srRnRDS3pYMytwTmJBa2grMG9Tdm12ZGRBRkdQc3FPMTg1?=
 =?utf-8?B?bzZ0cHFvR3RncC8yNHNQTUhjWU5vTnlsMEVXSGRwc09EMjNPUjZBaTVwSUIx?=
 =?utf-8?B?WkVZQ2U3VmVtbG1rRUtSaUhtWmFVSElodDRIdHNuZHczd3d3bGdNQWxOTTUz?=
 =?utf-8?B?UENuYkJpcWgxb2c3VnJCMzUzRHdCcFNSTnQ3ZFVYc2NsNXdQS1FQOXd4SzBs?=
 =?utf-8?B?VXRlVXJaYllNUTRMbDRQa2RxRkV1MkZOQ1FwWFFuK0U2NDdOSXNyY0Izd0F1?=
 =?utf-8?B?ajdkVTJwMjFUYXE1TEs1dGdKcnNaQjBzY21tN29VRG5sVXRUeW51RzE4a3ll?=
 =?utf-8?B?YVprT0QxdE9KOUhpMkJidHlGeWhIeWZSZWU0QmRVVysvRzVvZzFvNTkxM1dH?=
 =?utf-8?B?enM4UlJOdTJMZ090NUU3VnlhWFFqZGFYd3I4TU05THhVS3V4ZXZGZWF3VzNI?=
 =?utf-8?B?TnlRemZ6T2pjWTFzU3EybXZ5eUlJandxTkhlTGt3MlRJbkE4UjlNTWxJTEk0?=
 =?utf-8?B?OXhETm1OSnVRY3Vrc2hBbk5wY3pzbWRyQ3ptK3FvWWdIdllSbks2aVUyNUdP?=
 =?utf-8?B?SGhtVEJTRC9Zb3d3bHhEWmNGVTFicGZ1N3l2SEZrNEFDRVFEdnFROG1vc2ZS?=
 =?utf-8?B?TmhrMURvSjFRNy9xaGh5SnlJTUF0K2hvckxWNDFDWmFuZTdNS3BTbmxmL3JM?=
 =?utf-8?B?dmNVanUzZ2Uxc0taMTFGNVBrRnFVZzllOU13aHBhM1ZIYnRrdWRPeFVMTWxK?=
 =?utf-8?B?eXhhV24rb0FIajZHVStjV2xVVzlrQmZFcWtId2dVY0JFWEJ1WEwzeVV0cHBU?=
 =?utf-8?B?bTh1OWd6RzZtQVJJbWtSZEszaUtWZ0Y5RlYrUThUWUpqbkZsZjRNTEhGTzJZ?=
 =?utf-8?B?UHI2d0dOemxBVkVUY3NSQXE3blFySDhNZFduU2VwTG1ENHdpSy85K1pQRlk1?=
 =?utf-8?B?eDd6eXB3M2g5TEY0WE9IdWl4SkVwOG8wd1M4OTVZdDk1SHdsQUFxMGFLYkpy?=
 =?utf-8?B?eEdGRTB1OE9jWHErTURlQ2FERDRaK2VSeThNQnk5bEZRWThBMTZOQ0tKMUN5?=
 =?utf-8?B?dlFNWWNhNHllYzl1ZEk5dkhrejk2MkFuaEFFblFaNHFkM1NVM3RrLzFrb1pT?=
 =?utf-8?B?b3NjbnAwazg4ZExHMUdQVU5sZTJzNjJUSHBPU2lqMkNWR09WZ3NTQS9Kc1ox?=
 =?utf-8?B?Sm1Ea3hoTktkNVd3Q0NXdGZIT2wxYXdRQUlYRGx2TVZKTEFET25Zc3o4M28z?=
 =?utf-8?B?eVlTWmNremZWQmUwY1U2dURBWmowaWFzVnVrU3RGc0lrcjEvajM2Rkw5SUU5?=
 =?utf-8?B?UmpRK2hZUEVWNysrM1ZXSlNQMzU3Rkp2K1AraDdiTW52SzVNZ002NWJ1OXpw?=
 =?utf-8?B?cDlDdUppeHAwM1ZiczlDdkpCTDN6ZGRNaDNxMW1XOERvVG1kSEZKbk5wYWxz?=
 =?utf-8?B?aWFJUnEyb0RaeVBIMkNETW5KMGhreDVYUXRQeldhNGFZL2xMTTFiS0VBNzFq?=
 =?utf-8?B?TmFYTmc5RCtiNmZ3WW4waHZ1bXVOV253bkkzQll2Tmd0TjcrZmNjQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bf4a94-c86f-4a79-480e-08de7af9e395
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:58:01.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfFGczybTL1BAKN9l4cpLyxo5G0VhZiZnzXMLNEMTyyCpXL2mmGi443TC0OPxwv0g1+UNROk0wmtD/5e836SCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111



On 3/5/2026 12:17 PM, Antheas Kapenekakis wrote:
> Implement a driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power
> and Thermal Configuration Interface (DPTCi). This function allows
> userspace to configure APU power and thermal parameters at runtime by
> calling the \_SB.ALIB ACPI method with a packed parameter buffer.
> 
> Unlike mainstream AMD laptops, the handheld devices targeted by this
> driver do not implement vendor-specific WMI or EC hooks for TDP control.
> The ones that do, use DPTCi under the hood. For these devices, exposing
> the ALIB interface is the only viable mechanism for the OS to adjust
> power limits, making a dedicated kernel driver the correct approach
> rather than relying on unrestricted access to /dev/mem or ACPI method
> invocation from userspace.
> 
> The driver matches the ABI of asus-armoury, by exposing a platform
> profile with reasonable tunings for devices depending on their max
> thermal envelope, and {ppt_pl1_spl,ppt_pl2_sppt,ppt_pl3_fppt,cpu_temp}
> tunables which only become writable when the profile is custom,
> otherwise they are read-only and reflect the current profile.
> 
> The default profile is custom so that we do not write to the device
> until userspace explicitly selects a profile, remaining at firmware
> defaults.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

As a general comment that will make this easier to review (than a ~1.3k 
LoC file) could you split into logical patches that add functionality?

Likewise could you split some of the code into a few source files?  A 
logical split tha I see would be to put the quirks and associated limits 
into a single file and do a lookup of values.


> ---
>   MAINTAINERS                       |    6 +
>   drivers/platform/x86/amd/Kconfig  |   16 +
>   drivers/platform/x86/amd/Makefile |    2 +
>   drivers/platform/x86/amd/dptc.c   | 1255 +++++++++++++++++++++++++++++
>   4 files changed, 1279 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/dptc.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e08767323763..915293594641 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1096,6 +1096,12 @@ S:	Supported
>   F:	drivers/gpu/drm/amd/display/dc/dml/
>   F:	drivers/gpu/drm/amd/display/dc/dml2_0/
>   
> +AMD DPTC DRIVER
> +M:	Antheas Kapenekakis <lkml@antheas.dev>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/amd/dptc.c
> +
>   AMD FAM15H PROCESSOR POWER MONITORING DRIVER
>   M:	Huang Rui <ray.huang@amd.com>
>   L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index b813f9265368..ee79a2c084a8 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -44,3 +44,19 @@ config AMD_ISP_PLATFORM
>   
>   	  This driver can also be built as a module. If so, the module
>   	  will be called amd_isp4.
> +
> +config AMD_DPTC
> +	tristate "AMD Dynamic Power and Thermal Configuration Interface (DPTCi)"
> +	depends on X86_64 && ACPI && DMI
> +	select ACPI_PLATFORM_PROFILE
> +	select FIRMWARE_ATTRIBUTES_CLASS
> +	help
> +	  Driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
> +	  Thermal Configuration Interface (DPTCi). Exposes TDP and thermal
> +	  parameters for AMD APU-based handheld devices via the
> +	  firmware-attributes sysfs ABI, allowing userspace tools to stage
> +	  and atomically commit power limit settings. Requires a DMI match
> +	  for the device and a recognized AMD SoC.
> +
> +	  If built as a module, the module will be called amd_dptc.
> +
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index f6ff0c837f34..862a609bfe38 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -12,3 +12,5 @@ obj-$(CONFIG_AMD_PMF)		+= pmf/
>   obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
>   obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
>   obj-$(CONFIG_AMD_HFI)		+= hfi/
> +obj-$(CONFIG_AMD_DPTC)		+= amd_dptc.o
> +amd_dptc-y			:= dptc.o
> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
> new file mode 100644
> index 000000000000..68d9d3b85cb6
> --- /dev/null
> +++ b/drivers/platform/x86/amd/dptc.c
> @@ -0,0 +1,1255 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * AMD Dynamic Power and Thermal Configuration Interface (DPTCi) driver
> + *
> + * Exposes AMD APU power and thermal parameters via the firmware-attributes
> + * sysfs ABI. Parameters are staged and atomically committed through the
> + * AGESA ALIB Function 0x0C (Dynamic Power and Thermal Configuration
> + * interface).
> + *
> + * Reference: AMD AGESA Publication #44065, Appendix E.5
> + *            https://docs.amd.com/v/u/en-US/44065_Arch2008
> + *
> + * Copyright (C) 2026 Antheas Kapenekakis <lkml@antheas.dev>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/dmi.h>
> +#include <linux/init.h>
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
> +#include <linux/processor.h>
> +#include <linux/sysfs.h>
> +#include <linux/unaligned.h>
> +
> +#include "../firmware_attributes_class.h"
> +
> +#define DRIVER_NAME		"amd_dptc"
> +
> +#define ALIB_FUNC_DPTC		0x0C
> +#define ALIB_PATH		"\\_SB.ALIB"
> +
> +/* ALIB parameter IDs (AGESA spec Appendix E.5, Table E-52) */
> +#define ALIB_ID_TEMP_TARGET	0x03
> +#define ALIB_ID_STAPM_LIMIT	0x05
> +#define ALIB_ID_FAST_LIMIT	0x06
> +#define ALIB_ID_SLOW_LIMIT	0x07
> +#define ALIB_ID_SKIN_LIMIT	0x2E
> +
> +enum dptc_param_idx {
> +	DPTC_PPT_PL1_SPL,	/* STAPM + skin limit (set together) */
> +	DPTC_PPT_PL2_SPPT,	/* slow PPT limit */
> +	DPTC_PPT_PL3_FPPT,	/* fast PPT limit */
> +	DPTC_CPU_TEMP,		/* thermal control target */
> +	DPTC_NUM_PARAMS,
> +};
> +
> +struct dptc_param_limits {
> +	u32 min;	/* expanded floor:   widest safe hardware minimum */
> +	u32 smin;	/* device floor:     safe operating minimum */
> +	u32 def;	/* default hint for userspace */
> +	u32 smax;	/* device ceiling:   safe operating maximum */
> +	u32 max;	/* expanded ceiling: widest safe hardware maximum */

These variable names leave a little bit to be desired.  I am generally 
of the feeling "if you NEED to explain all the the variables in the 
struct are you named them wrong".


> +};
> +
> +struct dptc_profile {
> +	u32 vals[DPTC_NUM_PARAMS];	/* 0 = don't set / unstage this param */
> +};
> +
> +struct dptc_device_limits {
> +	struct dptc_param_limits params[DPTC_NUM_PARAMS];
> +	struct dptc_profile profiles[PLATFORM_PROFILE_LAST];
> +};
> +
> +struct dptc_param_desc {
> +	const char *name;
> +	const char *display_name;
> +	u8 param_id;
> +	u8 param_id2;	/* secondary ALIB ID, 0 if none */
> +};
> +
> +static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] = {
> +	[DPTC_PPT_PL1_SPL]  = { "ppt_pl1_spl",  "Sustained power limit (mW)",
> +		ALIB_ID_STAPM_LIMIT, ALIB_ID_SKIN_LIMIT },
> +	[DPTC_PPT_PL2_SPPT] = { "ppt_pl2_sppt", "Slow PPT limit (mW)",
> +		ALIB_ID_SLOW_LIMIT },
> +	[DPTC_PPT_PL3_FPPT] = { "ppt_pl3_fppt", "Fast PPT limit (mW)",
> +		ALIB_ID_FAST_LIMIT },
> +	[DPTC_CPU_TEMP]     = { "cpu_temp",     "Thermal control limit (C)",
> +		ALIB_ID_TEMP_TARGET },
> +};
> +
> +/* 18W class: AYANEO AIR Plus (Ryzen 5 5560U) */
> +static const struct dptc_device_limits limits_18w = { .params = {
> +	[DPTC_PPT_PL1_SPL]  = {     0,  5000, 15000, 18000, 22000 },
> +	[DPTC_PPT_PL2_SPPT] = {     0,  5000, 15000, 18000, 22000 },
> +	[DPTC_PPT_PL3_FPPT] = {     0,  5000, 15000, 20000, 25000 },
> +	[DPTC_CPU_TEMP]     = {    60,    70,    85,    90,   100 },
> +}, .profiles = {
> +	[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5000,  5000,  8000, 0 } },
> +	[PLATFORM_PROFILE_BALANCED]    = { .vals = { 12000, 14000, 15000, 0 } },
> +	[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 18000, 18000, 20000, 0 } },
> +}};
> +
> +/* 25W class: Ryzen 5000 handhelds (AYANEO NEXT, KUN) */
> +static const struct dptc_device_limits limits_25w = { .params = {
> +	[DPTC_PPT_PL1_SPL]  = {     0,  4000, 15000, 25000, 32000 },
> +	[DPTC_PPT_PL2_SPPT] = {     0,  4000, 20000, 27000, 35000 },
> +	[DPTC_PPT_PL3_FPPT] = {     0,  4000, 25000, 30000, 37000 },
> +	[DPTC_CPU_TEMP]     = {    60,    70,    85,    90,   100 },
> +}, .profiles = {
> +	[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8000,  8000, 12000, 0 } },
> +	[PLATFORM_PROFILE_BALANCED]    = { .vals = { 15000, 17000, 20000, 0 } },
> +	[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25000, 27000, 30000, 0 } },
> +}};
> +
> +/* 28W class: GPD Win series, AYANEO 2, OrangePi NEO-01 */
> +static const struct dptc_device_limits limits_28w = { .params = {
> +	[DPTC_PPT_PL1_SPL]  = {     0,  4000, 15000, 28000, 32000 },
> +	[DPTC_PPT_PL2_SPPT] = {     0,  4000, 20000, 30000, 35000 },
> +	[DPTC_PPT_PL3_FPPT] = {     0,  4000, 25000, 32000, 37000 },
> +	[DPTC_CPU_TEMP]     = {    60,    70,    85,    90,   100 },
> +}, .profiles = {
> +	[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8000,  8000, 12000, 0 } },
> +	[PLATFORM_PROFILE_BALANCED]    = { .vals = { 15000, 17000, 22000, 0 } },
> +	[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25000, 28000, 32000, 0 } },
> +	[PLATFORM_PROFILE_MAX_POWER]   = { .vals = { 28000, 30000, 32000, 0 } },
> +}};
> +
> +/* 30W class: OneXPlayer, AYANEO AIR/FLIP/GEEK/SLIDE/3, AOKZOE */
> +static const struct dptc_device_limits limits_30w = { .params = {
> +	[DPTC_PPT_PL1_SPL]  = {     0,  4000, 15000, 30000, 40000 },
> +	[DPTC_PPT_PL2_SPPT] = {     0,  4000, 20000, 32000, 43000 },
> +	[DPTC_PPT_PL3_FPPT] = {     0,  4000, 25000, 41000, 50000 },
> +	[DPTC_CPU_TEMP]     = {    60,    70,    85,    90,   100 },
> +}, .profiles = {
> +	[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8000,  8000, 12000, 0 } },
> +	[PLATFORM_PROFILE_BALANCED]    = { .vals = { 15000, 17000, 25000, 0 } },
> +	[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25000, 28000, 41000, 0 } },
> +	[PLATFORM_PROFILE_MAX_POWER]   = { .vals = { 30000, 32000, 41000, 0 } },
> +}};
> +
> +/* AI MAX Handheld class: GPD Win 5 */
> +static const struct dptc_device_limits limits_maxhh = { .params = {
> +	[DPTC_PPT_PL1_SPL]  = {      0,  4000, 25000,  80000, 100000 },
> +	[DPTC_PPT_PL2_SPPT] = {      0,  4000, 27000,  82000, 100000 },
> +	[DPTC_PPT_PL3_FPPT] = {      0,  4000, 40000,  85000, 100000 },
> +	[DPTC_CPU_TEMP]     = {     60,    70,    95,     95,    100 },
> +}, .profiles = {
> +	[PLATFORM_PROFILE_LOW_POWER]   = { .vals = { 15000, 15000, 25000, 0 } },
> +	[PLATFORM_PROFILE_BALANCED]    = { .vals = { 25000, 27000, 40000, 0 } },
> +	[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 60000, 63000, 85000, 0 } },
> +	[PLATFORM_PROFILE_MAX_POWER]   = { .vals = { 80000, 82000, 85000, 0 } },
> +}};
> +
> +/* Substring matches against boot_cpu_data.x86_model_id; order matters. */
> +static const char * const dptc_soc_table[] = {
> +	/* AI MAX */
> +	"AMD RYZEN AI MAX+ 395",
> +	"AMD RYZEN AI MAX+ 385",
> +	"AMD RYZEN AI MAX 380",
> +	/* Ryzen AI */
> +	"AMD Ryzen AI 9 HX 370",
> +	"AMD Ryzen AI HX 360",
> +	/* Z1 - Extreme before plain Z1 */
> +	"AMD Ryzen Z1 Extreme",
> +	"AMD Ryzen Z1",
> +	/* Ryzen 8000 */
> +	"AMD Ryzen 7 8840U",
> +	/* Ryzen 7040 */
> +	"AMD Ryzen 7 7840U",
> +	/* Ryzen 6000 */
> +	"AMD Ryzen 7 6800U",
> +	"AMD Ryzen 7 6600U",
> +	/* Ryzen 5000 */
> +	"AMD Ryzen 7 5800U",
> +	"AMD Ryzen 7 5700U",
> +	"AMD Ryzen 5 5560U",
> +	NULL,
> +};
> +

I think this table can go.  See my comments elsewhere.

> +static const struct dmi_system_id dptc_dmi_table[] = {
> +	/* GPD */
> +	{
> +		.ident = "GPD Win Mini",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-01"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Win Mini 2024",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Win Mini 2024",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02-L"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Win 4",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Win 5",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1618-05"),
> +		},
> +		.driver_data = (void *)&limits_maxhh,
> +	},
> +	{
> +		.ident = "GPD Win Max 2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1619-04"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Win Max 2 2024",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1619-05"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Duo",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Duo",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01-L"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Pocket 4",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Pocket 4",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04-L"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	/* OrangePi */
> +	{
> +		.ident = "OrangePi NEO-01",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEO-01"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	/* AYN */
> +	{
> +		.ident = "AYN Loki Max",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	/* Tectoy (Zeenix Pro = Loki Max) */
> +	{
> +		.ident = "Zeenix Pro",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Pro"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	/* AOKZOE */
> +	{
> +		.ident = "AOKZOE A1 AR07",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AOKZOE A1 Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 Pro"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AOKZOE A1X",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1X"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AOKZOE A2 Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	/* OneXPlayer (Intel variants filtered by SoC table) */
> +	{
> +		.ident = "ONEXPLAYER F1Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1Pro"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER F1 EVA-02",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1 EVA-02"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER 2",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 2"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER X1 A",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 A"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER X1z",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1z"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER X1Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Pro"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER G1 A",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 A"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	/* AYANEO - 18W */
> +	{
> +		.ident = "AYANEO AIR Plus",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Plus"),
> +		},
> +		.driver_data = (void *)&limits_18w,
> +	},
> +	/* AYANEO - 25W */
> +	{
> +		.ident = "AYANEO NEXT Advance",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	{
> +		.ident = "AYANEO NEXT Lite",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Lite"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	{
> +		.ident = "AYANEO NEXT Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	{
> +		.ident = "AYANEO NEXT",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	{
> +		.ident = "AYANEO KUN",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	{
> +		.ident = "AYANEO KUN",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO KUN"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	/* AYANEO - 28W */
> +	{
> +		.ident = "AYANEO 2",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "SuiPlay0X1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	/* AYANEO - 30W */
> +	{
> +		/* Must come before the shorter "AIR" match */
> +		.ident = "AYANEO AIR 1S",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "AIR 1S"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AYANEO AIR Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AYANEO AIR",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		/* DMI_MATCH catches all FLIP variants (DS, KB, 1S DS, 1S KB) */
> +		.ident = "AYANEO FLIP",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		/* DMI_MATCH catches GEEK and GEEK 1S */
> +		.ident = "AYANEO GEEK",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AYANEO SLIDE",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "SLIDE"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AYANEO 3",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
> +
> +struct dptc_priv;
> +
> +struct dptc_attr_sysfs {
> +	struct dptc_priv *priv;
> +	struct kobj_attribute current_value;
> +	struct kobj_attribute default_value;
> +	struct kobj_attribute min_value;
> +	struct kobj_attribute max_value;
> +	struct kobj_attribute scalar_increment;
> +	struct kobj_attribute display_name;
> +	struct kobj_attribute type;
> +	struct attribute *attrs[8];
> +	struct attribute_group group;
> +	int idx;
> +};
> +
> +struct dptc_priv {
> +	struct device *fw_attr_dev;
> +	struct kset *fw_attr_kset;
> +
> +	const struct dptc_device_limits *dev_limits;
> +
> +	bool expanded;
> +
> +	enum platform_profile_option profile;
> +	struct device *ppdev;
> +
> +	enum dptc_save_mode { SAVE_SINGLE, SAVE_BULK } save_mode;
> +
> +	u32 staged[DPTC_NUM_PARAMS];
> +	bool has_staged[DPTC_NUM_PARAMS];
> +
> +	/* Protects mutable driver state */
> +	struct mutex lock;
> +
> +	struct dptc_attr_sysfs params[DPTC_NUM_PARAMS];
> +	struct dptc_attr_sysfs expanded_attr;
> +	struct kobj_attribute save_settings_attr;
> +};
> +
> +static struct platform_device *dptc_pdev;
> +
> +static u32 dptc_get_min(struct dptc_priv *dptc, int idx)
> +{
> +	return dptc->expanded ? dptc->dev_limits->params[idx].min
> +			      : dptc->dev_limits->params[idx].smin;
> +}
> +
> +static u32 dptc_get_max(struct dptc_priv *dptc, int idx)
> +{
> +	return dptc->expanded ? dptc->dev_limits->params[idx].max
> +			      : dptc->dev_limits->params[idx].smax;
> +}
> +
> +static u32 dptc_get_default(struct dptc_priv *dptc, int idx)
> +{
> +	return dptc->dev_limits->params[idx].def;
> +}
> +
> +static int dptc_alib_call(const u8 *ids, const u32 *vals, int count)
> +{
> +	union acpi_object in_params[2];
> +	struct acpi_object_list input;
> +	acpi_status status;
> +	u32 buf_size;
> +	int i, off;
> +	u8 *buf;
> +
> +	if (count == 0)
> +		return -EINVAL;
> +
> +	/* Buffer layout: WORD total_size + count * (BYTE id + DWORD value) */
> +	buf_size = 2 + count * 5;
> +	buf = kzalloc(buf_size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	put_unaligned_le16(buf_size, buf);
> +
> +	for (i = 0; i < count; i++) {
> +		off  = 2 + i * 5;
> +		buf[off] = ids[i];
> +		put_unaligned_le32(vals[i], buf + off + 1);
> +	}
> +
> +	in_params[0].type          = ACPI_TYPE_INTEGER;
> +	in_params[0].integer.value = ALIB_FUNC_DPTC;
> +	in_params[1].type          = ACPI_TYPE_BUFFER;
> +	in_params[1].buffer.length  = buf_size;
> +	in_params[1].buffer.pointer = buf;
> +
> +	input.count   = 2;
> +	input.pointer = in_params;
> +
> +	status = acpi_evaluate_object(NULL, ALIB_PATH, &input, NULL);
> +	kfree(buf);
> +
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("ALIB call failed: %s\n",
> +		       acpi_format_exception(status));
> +		return -EIO;
> +	}
> +
> +	pr_debug("sent %d ALIB parameter(s)\n", count);
> +	return 0;
> +}
> +
> +static int dptc_alib_send_one(int idx, u32 val)
> +{
> +	u32 vals[2];
> +	u8 ids[2];
> +	int count = 0;
> +
> +	ids[count]  = dptc_params[idx].param_id;
> +	vals[count] = val;
> +	count++;
> +	if (dptc_params[idx].param_id2) {
> +		ids[count]  = dptc_params[idx].param_id2;
> +		vals[count] = val;
> +		count++;
> +	}
> +
> +	return dptc_alib_call(ids, vals, count);
> +}
> +
> +static int dptc_alib_save(struct dptc_priv *dptc)
> +{
> +	u32 vals[DPTC_NUM_PARAMS * 2];
> +	u8 ids[DPTC_NUM_PARAMS * 2];
> +	int i, count = 0;
> +
> +	for (i = 0; i < DPTC_NUM_PARAMS; i++) {
> +		if (!dptc->has_staged[i])
> +			continue;
> +		ids[count]  = dptc_params[i].param_id;
> +		vals[count] = dptc->staged[i];
> +		count++;
> +		if (dptc_params[i].param_id2) {
> +			ids[count]  = dptc_params[i].param_id2;
> +			vals[count] = dptc->staged[i];
> +			count++;
> +		}
> +	}
> +
> +	if (!count)
> +		return 0;
> +
> +	return dptc_alib_call(ids, vals, count);
> +}
> +
> +/* Sysfs callbacks */
> +
> +static ssize_t dptc_current_value_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =
> +		container_of(attr, struct dptc_attr_sysfs, current_value);
> +	struct dptc_priv *dptc = ps->priv;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	if (dptc->profile != PLATFORM_PROFILE_CUSTOM) {
> +		u32 val = dptc->dev_limits->profiles[dptc->profile].vals[ps->idx];
> +
> +		if (!val)
> +			return sysfs_emit(buf, "\n");
> +		return sysfs_emit(buf, "%u\n", val);
> +	}
> +
> +	if (!dptc->has_staged[ps->idx])
> +		return sysfs_emit(buf, "\n");
> +	return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
> +}
> +
> +static ssize_t dptc_current_value_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct dptc_attr_sysfs *ps =
> +		container_of(attr, struct dptc_attr_sysfs, current_value);
> +	struct dptc_priv *dptc = ps->priv;
> +	u32 val, min, max;
> +	int ret;
> +
> +	if (count == 1 && buf[0] == '\n') {
> +		guard(mutex)(&dptc->lock);
> +
> +		if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> +			return -EPERM;
> +		dptc->has_staged[ps->idx] = false;
> +		return count;
> +	}
> +
> +	ret = kstrtou32(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> +		return -EPERM;
> +	min = dptc_get_min(dptc, ps->idx);
> +	max = dptc_get_max(dptc, ps->idx);
> +	if (val < min || (max && val > max))
> +		return -EINVAL;
> +	dptc->staged[ps->idx]    = val;
> +	dptc->has_staged[ps->idx] = true;
> +	if (dptc->save_mode == SAVE_SINGLE)
> +		ret = dptc_alib_send_one(ps->idx, val);
> +
> +	return ret ? ret : count;
> +}
> +
> +static ssize_t dptc_default_value_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =
> +		container_of(attr, struct dptc_attr_sysfs, default_value);
> +
> +	return sysfs_emit(buf, "%u\n", dptc_get_default(ps->priv, ps->idx));
> +}
> +
> +static ssize_t dptc_min_value_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =
> +		container_of(attr, struct dptc_attr_sysfs, min_value);
> +	struct dptc_priv *dptc = ps->priv;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	return sysfs_emit(buf, "%u\n", dptc_get_min(dptc, ps->idx));
> +}
> +
> +static ssize_t dptc_max_value_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =
> +		container_of(attr, struct dptc_attr_sysfs, max_value);
> +	struct dptc_priv *dptc = ps->priv;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	return sysfs_emit(buf, "%u\n", dptc_get_max(dptc, ps->idx));
> +}
> +
> +static ssize_t dptc_scalar_increment_show(struct kobject *kobj,
> +					  struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +
> +static ssize_t dptc_display_name_show(struct kobject *kobj,
> +				      struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =
> +		container_of(attr, struct dptc_attr_sysfs, display_name);
> +	return sysfs_emit(buf, "%s\n", dptc_params[ps->idx].display_name);
> +}
> +
> +static ssize_t dptc_type_show(struct kobject *kobj,
> +			      struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "integer\n");
> +}
> +
> +static ssize_t dptc_save_settings_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct dptc_priv *dptc =
> +		container_of(attr, struct dptc_priv, save_settings_attr);
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	if (dptc->save_mode == SAVE_SINGLE)
> +		return sysfs_emit(buf, "single\n");
> +	return sysfs_emit(buf, "bulk\n");
> +}
> +
> +static ssize_t dptc_save_settings_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct dptc_priv *dptc =
> +		container_of(attr, struct dptc_priv, save_settings_attr);
> +	int ret = 0;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	if (sysfs_streq(buf, "save"))
> +		ret = dptc_alib_save(dptc);
> +	else if (sysfs_streq(buf, "single"))
> +		dptc->save_mode = SAVE_SINGLE;
> +	else if (sysfs_streq(buf, "bulk"))
> +		dptc->save_mode = SAVE_BULK;
> +	else
> +		return -EINVAL;
> +
> +	return ret ? ret : count;
> +}
> +
> +static ssize_t dptc_expanded_current_value_show(struct kobject *kobj,
> +						struct kobj_attribute *attr,
> +						char *buf)
> +{
> +	struct dptc_attr_sysfs *ps =
> +		container_of(attr, struct dptc_attr_sysfs, current_value);
> +	struct dptc_priv *dptc = ps->priv;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	return sysfs_emit(buf, "%d\n", dptc->expanded);
> +}
> +
> +static ssize_t dptc_expanded_current_value_store(struct kobject *kobj,
> +						 struct kobj_attribute *attr,
> +						 const char *buf, size_t count)
> +{
> +	struct dptc_attr_sysfs *ps =
> +		container_of(attr, struct dptc_attr_sysfs, current_value);
> +	struct dptc_priv *dptc = ps->priv;
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &val);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> +		return -EPERM;
> +	dptc->expanded = val;
> +	/* Clear staged values: limits changed, old values may be out of range */
> +	memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
> +
> +	return count;
> +}
> +
> +static ssize_t dptc_expanded_default_value_show(struct kobject *kobj,
> +						struct kobj_attribute *attr,
> +						char *buf)
> +{
> +	return sysfs_emit(buf, "0\n");
> +}
> +
> +static ssize_t dptc_expanded_min_value_show(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    char *buf)
> +{
> +	return sysfs_emit(buf, "0\n");
> +}
> +
> +static ssize_t dptc_expanded_max_value_show(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +
> +static ssize_t dptc_expanded_scalar_increment_show(struct kobject *kobj,
> +						   struct kobj_attribute *attr,
> +						   char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +
> +static ssize_t dptc_expanded_display_name_show(struct kobject *kobj,
> +					       struct kobj_attribute *attr,
> +					       char *buf)
> +{
> +	return sysfs_emit(buf, "Expanded Limits\n");
> +}
> +
> +static ssize_t dptc_expanded_type_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "integer\n");
> +}
> +
> +/* Sysfs setup */
> +
> +static void dptc_setup_param_sysfs(struct dptc_priv *dptc,
> +				   struct dptc_attr_sysfs *ps, int idx)
> +{
> +	ps->priv = dptc;
> +	ps->idx = idx;
> +
> +	sysfs_attr_init(&ps->current_value.attr);
> +	ps->current_value.attr.name  = "current_value";
> +	ps->current_value.attr.mode  = 0644;
> +	ps->current_value.show       = dptc_current_value_show;
> +	ps->current_value.store      = dptc_current_value_store;
> +
> +	sysfs_attr_init(&ps->default_value.attr);
> +	ps->default_value.attr.name  = "default_value";
> +	ps->default_value.attr.mode  = 0444;
> +	ps->default_value.show       = dptc_default_value_show;
> +
> +	sysfs_attr_init(&ps->min_value.attr);
> +	ps->min_value.attr.name      = "min_value";
> +	ps->min_value.attr.mode      = 0444;
> +	ps->min_value.show           = dptc_min_value_show;
> +
> +	sysfs_attr_init(&ps->max_value.attr);
> +	ps->max_value.attr.name      = "max_value";
> +	ps->max_value.attr.mode      = 0444;
> +	ps->max_value.show           = dptc_max_value_show;
> +
> +	sysfs_attr_init(&ps->scalar_increment.attr);
> +	ps->scalar_increment.attr.name = "scalar_increment";
> +	ps->scalar_increment.attr.mode = 0444;
> +	ps->scalar_increment.show      = dptc_scalar_increment_show;
> +
> +	sysfs_attr_init(&ps->display_name.attr);
> +	ps->display_name.attr.name   = "display_name";
> +	ps->display_name.attr.mode   = 0444;
> +	ps->display_name.show        = dptc_display_name_show;
> +
> +	sysfs_attr_init(&ps->type.attr);
> +	ps->type.attr.name           = "type";
> +	ps->type.attr.mode           = 0444;
> +	ps->type.show                = dptc_type_show;
> +
> +	ps->attrs[0] = &ps->current_value.attr;
> +	ps->attrs[1] = &ps->default_value.attr;
> +	ps->attrs[2] = &ps->min_value.attr;
> +	ps->attrs[3] = &ps->max_value.attr;
> +	ps->attrs[4] = &ps->scalar_increment.attr;
> +	ps->attrs[5] = &ps->display_name.attr;
> +	ps->attrs[6] = &ps->type.attr;
> +	ps->attrs[7] = NULL;
> +
> +	ps->group.name  = dptc_params[idx].name;
> +	ps->group.attrs = ps->attrs;
> +}
> +
> +static void dptc_setup_expanded_sysfs(struct dptc_priv *dptc,
> +				      struct dptc_attr_sysfs *ps)
> +{
> +	ps->priv = dptc;
> +	sysfs_attr_init(&ps->current_value.attr);
> +	ps->current_value.attr.name  = "current_value";
> +	ps->current_value.attr.mode  = 0644;
> +	ps->current_value.show       = dptc_expanded_current_value_show;
> +	ps->current_value.store      = dptc_expanded_current_value_store;
> +
> +	sysfs_attr_init(&ps->default_value.attr);
> +	ps->default_value.attr.name  = "default_value";
> +	ps->default_value.attr.mode  = 0444;
> +	ps->default_value.show       = dptc_expanded_default_value_show;
> +
> +	sysfs_attr_init(&ps->min_value.attr);
> +	ps->min_value.attr.name      = "min_value";
> +	ps->min_value.attr.mode      = 0444;
> +	ps->min_value.show           = dptc_expanded_min_value_show;
> +
> +	sysfs_attr_init(&ps->max_value.attr);
> +	ps->max_value.attr.name      = "max_value";
> +	ps->max_value.attr.mode      = 0444;
> +	ps->max_value.show           = dptc_expanded_max_value_show;
> +
> +	sysfs_attr_init(&ps->scalar_increment.attr);
> +	ps->scalar_increment.attr.name = "scalar_increment";
> +	ps->scalar_increment.attr.mode = 0444;
> +	ps->scalar_increment.show      = dptc_expanded_scalar_increment_show;
> +
> +	sysfs_attr_init(&ps->display_name.attr);
> +	ps->display_name.attr.name   = "display_name";
> +	ps->display_name.attr.mode   = 0444;
> +	ps->display_name.show        = dptc_expanded_display_name_show;
> +
> +	sysfs_attr_init(&ps->type.attr);
> +	ps->type.attr.name           = "type";
> +	ps->type.attr.mode           = 0444;
> +	ps->type.show                = dptc_expanded_type_show;
> +
> +	ps->attrs[0] = &ps->current_value.attr;
> +	ps->attrs[1] = &ps->default_value.attr;
> +	ps->attrs[2] = &ps->min_value.attr;
> +	ps->attrs[3] = &ps->max_value.attr;
> +	ps->attrs[4] = &ps->scalar_increment.attr;
> +	ps->attrs[5] = &ps->display_name.attr;
> +	ps->attrs[6] = &ps->type.attr;
> +	ps->attrs[7] = NULL;
> +
> +	ps->group.name  = "expanded_limits";
> +	ps->group.attrs = ps->attrs;
> +}
> +
> +static void dptc_fw_dev_unregister(void *data)
> +{
> +	device_unregister(data);
> +}
> +
> +static void dptc_kset_unregister(void *data)
> +{
> +	kset_unregister(data);
> +}
> +
> +/* Platform profile */
> +
> +static void dptc_apply_profile(struct dptc_priv *dptc,
> +			       enum platform_profile_option profile)
> +{
> +	const struct dptc_profile *pp;
> +	int i;
> +
> +	memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
> +
> +	if (profile == PLATFORM_PROFILE_CUSTOM)
> +		return;
> +
> +	pp = &dptc->dev_limits->profiles[profile];
> +	for (i = 0; i < DPTC_NUM_PARAMS; i++) {
> +		if (!pp->vals[i])
> +			continue;
> +		dptc->staged[i] = pp->vals[i];
> +		dptc->has_staged[i] = true;
> +	}
> +}
> +
> +static int dptc_pp_probe(void *drvdata, unsigned long *choices)
> +{
> +	struct dptc_priv *dptc = drvdata;
> +	int i, j;
> +
> +	set_bit(PLATFORM_PROFILE_CUSTOM, choices);
> +	for (i = 0; i < PLATFORM_PROFILE_LAST; i++) {
> +		for (j = 0; j < DPTC_NUM_PARAMS; j++) {
> +			if (dptc->dev_limits->profiles[i].vals[j]) {
> +				set_bit(i, choices);
> +				break;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int dptc_pp_get(struct device *dev,
> +		       enum platform_profile_option *profile)
> +{
> +	struct dptc_priv *dptc = dev_get_drvdata(dev);
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	*profile = dptc->profile;
> +	return 0;
> +}
> +
> +static int dptc_pp_set(struct device *dev,
> +		       enum platform_profile_option profile)
> +{
> +	struct dptc_priv *dptc = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	dptc->profile = profile;
> +	dptc_apply_profile(dptc, profile);
> +	if (profile != PLATFORM_PROFILE_CUSTOM)
> +		ret = dptc_alib_save(dptc);
> +
> +	return ret;
> +}
> +
> +static const struct platform_profile_ops dptc_pp_ops = {
> +	.probe       = dptc_pp_probe,
> +	.profile_get = dptc_pp_get,
> +	.profile_set = dptc_pp_set,
> +};
> +
> +static int dptc_resume(struct device *dev)
> +{
> +	struct dptc_priv *dptc = dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	if (dptc->profile != PLATFORM_PROFILE_CUSTOM) {
> +		dptc_apply_profile(dptc, dptc->profile);
> +		ret = dptc_alib_save(dptc);
> +	} else if (dptc->save_mode == SAVE_SINGLE) {
> +		ret = dptc_alib_save(dptc);
> +	} else {
> +		ret = 0;
> +	}
> +
> +	if (ret)
> +		dev_warn(dev, "failed to restore settings on resume: %d\n", ret);
> +
> +	return 0;

return ret?

> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(dptc_pm_ops, NULL, dptc_resume);
> +
> +static int dptc_probe(struct platform_device *pdev)
> +{
> +	const struct dmi_system_id *dmi_match = dev_get_platdata(&pdev->dev);
> +	struct dptc_priv *dptc;
> +	struct device *dev = &pdev->dev;
> +	int i, ret;

reverse xmas tree here

> +
> +	dptc = devm_kzalloc(dev, sizeof(*dptc), GFP_KERNEL);
> +	if (!dptc)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, dptc);
> +
> +	ret = devm_mutex_init(dev, &dptc->lock);
> +	if (ret)
> +		return ret;
> +
> +	dptc->dev_limits = dmi_match->driver_data;
> +	dev_info(dev, "%s (%s)\n", dmi_match->ident,
> +		 boot_cpu_data.x86_model_id);
> +
> +	dptc->fw_attr_dev = device_create(&firmware_attributes_class,
> +					  NULL, MKDEV(0, 0), NULL,
> +					  DRIVER_NAME);
> +	if (IS_ERR(dptc->fw_attr_dev))
> +		return PTR_ERR(dptc->fw_attr_dev);
> +
> +	ret = devm_add_action_or_reset(dev, dptc_fw_dev_unregister,
> +				       dptc->fw_attr_dev);
> +	if (ret)
> +		return ret;
> +
> +	dptc->fw_attr_kset = kset_create_and_add("attributes", NULL,
> +						 &dptc->fw_attr_dev->kobj);
> +	if (!dptc->fw_attr_kset)
> +		return -ENOMEM;
> +
> +	ret = devm_add_action_or_reset(dev, dptc_kset_unregister,
> +				       dptc->fw_attr_kset);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < DPTC_NUM_PARAMS; i++) {
> +		dptc_setup_param_sysfs(dptc, &dptc->params[i], i);
> +		ret = sysfs_create_group(&dptc->fw_attr_kset->kobj,
> +					 &dptc->params[i].group);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	dptc_setup_expanded_sysfs(dptc, &dptc->expanded_attr);
> +	ret = sysfs_create_group(&dptc->fw_attr_kset->kobj,
> +				 &dptc->expanded_attr.group);
> +	if (ret)
> +		return ret;
> +
> +	sysfs_attr_init(&dptc->save_settings_attr.attr);
> +	dptc->save_settings_attr.attr.name  = "save_settings";
> +	dptc->save_settings_attr.attr.mode  = 0644;
> +	dptc->save_settings_attr.show       = dptc_save_settings_show;
> +	dptc->save_settings_attr.store      = dptc_save_settings_store;
> +	ret = sysfs_create_file(&dptc->fw_attr_kset->kobj,
> +				&dptc->save_settings_attr.attr);
> +	if (ret)
> +		return ret;

Given multiple drivers have a save_settings feature now, maybe it's 
worth creating a helper as part of this series.

> +
> +	dptc->profile = PLATFORM_PROFILE_CUSTOM;

So it starts in custom?  Wouldn't it make more sense to start in balanced?

> +	dptc->ppdev = devm_platform_profile_register(dev, "amd-dptc", dptc,
> +						     &dptc_pp_ops);
> +	if (IS_ERR(dptc->ppdev))
> +		return PTR_ERR(dptc->ppdev);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver dptc_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.pm   = pm_sleep_ptr(&dptc_pm_ops),
> +	},
> +	.probe  = dptc_probe,
> +};
> +
> +static int __init dptc_init(void)
> +{
> +	const struct dmi_system_id *match;
> +	bool soc_found = false;
> +	int i, ret;
> +
> +	if (!acpi_has_method(NULL, ALIB_PATH)) {
> +		pr_debug("ALIB method not present\n");

To avoid an extra debug statement on every machine not quirked - how 
about you start with the quirk check?

If not that, could you do any checks that ALIB_FUNC_DPTC is supported? 
Not sure if there was a method for that.


> +		return -ENODEV;
> +	}

I will admit I didn't look at the spec, but is there a version lookup 
for this method that can be used?

> +
> +	match = dmi_first_match(dptc_dmi_table);
> +	if (!match)
> +		return -ENODEV;
> +
> +	for (i = 0; dptc_soc_table[i]; i++) {
> +		if (strstr(boot_cpu_data.x86_model_id,
> +			   dptc_soc_table[i])) {
> +			soc_found = true;
> +			break;
> +		}
> +	}
> +	if (!soc_found) {
> +		pr_warn("unrecognized SoC '%s'\n",
> +			boot_cpu_data.x86_model_id);
> +		return -ENODEV;
> +	}

Is this SOC lookup still going to be needed if you're 100% quirks table?
I would think no.

> +
> +	dptc_pdev = platform_device_register_data(NULL, DRIVER_NAME, -1,
> +						  match, sizeof(*match));
> +	if (IS_ERR(dptc_pdev))
> +		return PTR_ERR(dptc_pdev);
> +
> +	ret = platform_driver_register(&dptc_driver);
> +	if (ret) {
> +		platform_device_unregister(dptc_pdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit dptc_exit(void)
> +{
> +	platform_driver_unregister(&dptc_driver);
> +	platform_device_unregister(dptc_pdev);
> +}
> +
> +module_init(dptc_init);
> +module_exit(dptc_exit);
> +
> +MODULE_AUTHOR("Antheas Kapenekakis <lkml@antheas.dev>");
> +MODULE_DESCRIPTION("AMD DPTCi ACPI Driver");
> +MODULE_LICENSE("GPL");

