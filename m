Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013050.outbound.protection.outlook.com [40.93.196.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2309819EED3;
	Tue, 10 Mar 2026 04:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115630; cv=fail; b=QxSsRIrJyVa4IsvOIU3b7+nCK/FqpDXAEEeJJN56NRvuBPi+VHFJ5hnQGIJuVzgBKmNXdDLhEWbjjlIQtsQZVObRGrFbgfay9NpGvR1eicQnaHCSSidevBrZTsLnIYANx0Th6fweZZW5vs4JYtF+pKvFQPZbp+iCDi0fbRzDO8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115630; c=relaxed/simple;
	bh=73MquNmPoVbjOJtoROxlGexaM9alknrGL0rEdMYdBXA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tY8DcOZNOfeBtK0pF8nZl+Sy86lw/e3Knz0snlcrOKmErbFYDE4GMIYqGb509s+oOSc2Vf5KYwCiF9G7PbN1KK4BLClv6iNR/eleUk61aLHkvCSGFF1jiAbKfFpVibr70/YShmclL7FTbDZJPSijtw6wX6n0itVrN8lL+XjfglI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X6bH8pHQ; arc=fail smtp.client-ip=40.93.196.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X6bH8pHQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAOlrPe8Hb5g4m6CrCgD9Q/MbKvF28uCY0+vEWMAum42KIbI9gYotlJDN81wb+yDR7CTPU6NqaNJgowBvEigDFLb8EmNVjY1KhtdBDhYBldv+/4zgayTUQzOx6bHLXtrCsXlTVSxlp0qd+DDfxJPV0ZcUnKQdwsUM6JdxFdxFYqFHx5MBKjQByUZNhiLuopHeutLCbVTgmLT1omrPOOzIn42cbkXl4qbLwqb2/On902VRqzIcab6yeY/2kcuPy5+vdrXKpxSURYGGKd3IBETRYUjLVnIY+eHtVnm5Lxj2wqnWAbI8c3K4CDOAdGbDtXx6WF/iIUbxUwbrapZcWbmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl7vwe6GgtN8cc2TlX4iec7pEnWHdCLQphgIFZVoPvs=;
 b=js+Bb/e8l8Zd759d+IjClf+ftzTQ5Hm0Kn3PxlQ5v83LCPUwx0oXPPfVM7nzny7xFlkYLLorz1puJ+1qq2NKFcXrDb0R8/MwwGCz7uyLeWu5NLZQqMyPHSh87YG/QE14e5m5gdW4i9IV/YYr7nQN67Oqw9aaJ1Uj1hbstm6XlThDXYT14/qFfmAtP7nLhDW1Eeb9XvBPr1DD7qK7fsY7YPU6GuoWdcEr2aBMyMoQDZ69UojoHo2acsSDtVyA3WAM08axfjPuI0PrC2cUGJFC3cpjMGBgjN/0A7T/RMMNkANmSCHx+IyPEhnqKyaap3yGp6EL29tE1vdl31OcCWNFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl7vwe6GgtN8cc2TlX4iec7pEnWHdCLQphgIFZVoPvs=;
 b=X6bH8pHQGU6w/hZWH0yltyFbLwmQLNkQqqCvU4ocz8qnF7jX6hIwQ1RtfbtuvaHUxKUVFQuGi+xeD11Srl/frUMKdUEllHzYXd2Me96asnhYrBm8vTYx+k7Z02DsW5JH5/Dq9yCxBbAWoPphMpcHd1LmClOLoC04ycFQe1Ywjzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by PH7PR12MB6586.namprd12.prod.outlook.com (2603:10b6:510:212::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 04:07:04 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 04:07:04 +0000
Message-ID: <b4f81b6f-8bc6-440d-a9ea-244afe4a3fb8@amd.com>
Date: Mon, 9 Mar 2026 23:07:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 3/4] platform/x86/amd: dptc: Add platform profile support
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
 derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260309205125.293148-1-lkml@antheas.dev>
 <20260309205125.293148-4-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260309205125.293148-4-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR14CA0026.namprd14.prod.outlook.com
 (2603:10b6:610:60::36) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|PH7PR12MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f12761a-abb3-4853-91a7-08de7e5a7d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	fSFMo6sQsEPom42S8zYaOGcZZHgk0cvI+AP5+AB4odQqQ/s5JI9OAmR6McCffG8HLs0mlqDyF5PiQ9ZLOHBbeLj1H/O+E5lpHrdckmjaM5zGqe1Jv1yA8E6Zmv5xFKHtxiStwWdCjXrRTzCAtXbdNjVXDRQGJuzZuTs6Prl1BF5s+x4xkgcIaMaBC54UsGpD54xbPDBe/Qitex6NquhlWSaUkdBaeI6OqRvV3/Bo2mbq/pEPSAEH0hCdPbsQHM9oFjUIB7dnJBUdForxD0cUQYrdueKyoC+RaI9D5p6cXpISM2VrbxZPH85a8a6JBtUycjbKLecExeQ0pcYQL6zoHY4qTHWVzzyHEyMVsM9Qh2PtDepvthN4RNMBKyAO5VTVLRYaaLNgICwhKe7BjzlLvoT41C9C/5M8IcsqnNcub6XywlXRLguz/2AeuNYKFL4Qh5WONvvDqfLO08GINDenUehQmfZQpNLsFMsuc6opgFX5AHI/Pi1oTZ8SwOfFffXCevNSURBKTZEOvdSnN5ihQLW7n9w7/hCOXq8ozWnySHSG2VSYyikaNINTxTonGlDN3YvHwsKizOu46xmR5k7XqJgCg1P3Uyn3aUHshLJDMZWg10Y9vD7stqqUI5gFugQHF4CPBGwH5sUTOB5rzu1TAOrD9Ifj2b/Q7b8DIdD6aKrtq3gBDhTQOQ5brBOEbb/sBaEo5Ji6sHV+RIkOh4IkXbpiKj8QIuzNcwt1o2FwSgY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlVrNmV5VHNOZk9JejZXM0hXTUsrV3o5MUdGUG9HN2xOMFliQVBNVFFZN0t0?=
 =?utf-8?B?dlgyQ1Uwc2RhcFdWUXB2UFdHMXZZc1dPeVVOZkdTR0dMQVZoeVQ4aHhZazZ5?=
 =?utf-8?B?Q1Y5d0M2RWxlODY0aEZYYmFabEVjSC9XZmFDRVYrUUhjR041MU1icXA1OFNs?=
 =?utf-8?B?Y1BkMGN0K3A0cytGOStYSFp2WmpqaVFGYmhUTEt2azhBaUx2ZzQwVlhoTHZF?=
 =?utf-8?B?UGFYYWRtNWJFczVIQ2Y1L1MxWW1iY01HcGhCa3FrZUFReTJzbUdvRjVDNXBU?=
 =?utf-8?B?NTZFcWpsQU1LT0lyWFNsd1lyMWxWNVB4MDNzSUVKMzh2MngyakVoTlcyc3hl?=
 =?utf-8?B?anovUjNya3lWb2FtRmx2ZjlIUjMwUzhGQ3lHK3ZXb2gvL1VGc1huNGcrMnd6?=
 =?utf-8?B?a1RvOGZWZlFBcDJWNlNkSUlTTkRRTUN2UVllZC9qWDRQTml6SXFuWi9sUWp2?=
 =?utf-8?B?NnZyUjNyNllvWGFnMjFWdUN3bm5uWDM3OVhrK21Lclg3YXY0ejVsRGVwWEUr?=
 =?utf-8?B?MGo4RmY1QmVWQm5OYTV4Q09JY3dIUWdJd1hxRzltVjA1U01ZcURXK2lVMHIx?=
 =?utf-8?B?MEJxeUw1dDdqWU1UL2tCS3EyVjcvTTlzL2JFbHcrMzRNNk1DcWhoT0ttdjJD?=
 =?utf-8?B?VUo4NzZ6N1hiOWVGNHh6UkNaTy9jQjZXOVVCZm5FQ1U0NThEeU5kRlRYRlBO?=
 =?utf-8?B?Z0xOek16VWYvOEpNN20wWTN1b0Uwd2R4eGhSR2pFNTNScVJOZ0pqY05ESzY1?=
 =?utf-8?B?K0YzcFFGSlBFaU51RzlKd0t0WGZFS3VlQ1EzajVHaTlBVWp2R3VwNkQ1SFcv?=
 =?utf-8?B?bTJlOUs2SkhRd2VibWVGYUJubitRbFZmZ1JTVCtxcTl2dGEwVXhnZXpFbmsx?=
 =?utf-8?B?MnVqM1NuTStnbDc4YWZNWURoeFFKbDRib2tLK0ZQN3RVUFZFd0U3UTRjWXdX?=
 =?utf-8?B?d0VJWWJZNnhmMjBxNGd6d0grY0xOWWNlNFdTbCtKR051UHZldG5HVjBETWZt?=
 =?utf-8?B?eXh2NzUyRUhiM2lXbTdxd1hMYWFLMy9PRVBuN29tTStlNFlUMkU4QndXWmxX?=
 =?utf-8?B?cVBaSGN5QWFhWkt2WEhxTGE3c0N3S2pmNGtLbUp5ZjNLclBjVzNKRVFMMC9K?=
 =?utf-8?B?NmRMcmVPZzcxUE5hN1hNWDlFR1JtUEVyK0hTU1JUVGNJZTFkbEtVNG84cTdl?=
 =?utf-8?B?WHdNUGNKQzBndisrYWNMdHlIS0NqaERORjRad01tbHlXYjdpN1hKWXZBU3dG?=
 =?utf-8?B?V1RhdksyRi95QnZqY1dsbSt4WkZ2RHp1TXN3Rkh5ZHlrUlBkM1BBekFyVldt?=
 =?utf-8?B?a2p5RTNSMUpmbTZRNW5DS3doOGVubUExeUQ0ZVU3UEM0V0JwbHdjYkptbWh1?=
 =?utf-8?B?YkhHc3ZtMUdpNDVvaHZlV1JxMGQwUTNOL1BWUWRlNUU0Uks0ZUVXTnBuTUR0?=
 =?utf-8?B?ZG5RcEtLWGJqLzlFaGNwSWlNN25HTlVEUGZLeHpla1VBSldrVDVUakdiVG91?=
 =?utf-8?B?akpvR2cxNU9DVUYvRENyZDM2RFR1TGsva2xTTTV1UzZXRHBYRDVxeHVwMmJr?=
 =?utf-8?B?emZXTjdkbDZyNWtNUVpHWTR6U0Z1NDZyOGpLcG1maWVVSWFiOEhGalFRK2o4?=
 =?utf-8?B?UDZqSDJIemF3MStsSVRQK3o1M3d3VjQvY1hXQWpVbzdLNTRsS0NIcU9JL3lD?=
 =?utf-8?B?VUVFbjdQTkhObTMraG1QQ2ZGbWRGWVVlbG04TW96WHdrU1ZhcXVEaGQzVDZI?=
 =?utf-8?B?aTErTmVtRHk5ZG90K1ppbGRRL3RqRDNhYVdlMkpxM050S2hjMkZpOVlhUi9p?=
 =?utf-8?B?NHUxZFpLTkg2bUwwVE5ENzZSclFYVEhjdmdNcngvbVMxYjYrZDlpQkVQVkF6?=
 =?utf-8?B?QThCdGVpWFhjUU1HQmx5ZThGV0k5UTYrYUdCbUZjMHpXVXVLM0JWWGs1NFJ6?=
 =?utf-8?B?b0ovbkJ2akdjNFRmR2JrU3NMWTU5TDhML05QcXZUSXlhT3ZFTVRyb2xnd3h2?=
 =?utf-8?B?UGFja0k3M01lMWc1N0podkYrdUpYZzJaL2JtZERBMjJrQWxwOC9nbS9TMUc0?=
 =?utf-8?B?QkdCUGFCQkFmMFBORnozVDY3a3FwMWZpU1RBOCtzOERqdnZtdGlIS3JtdzRa?=
 =?utf-8?B?ZHRKdERLQ1VXb3J0emhNNVVGRVdYa2taYk8rajJ3bXh3VWtZWVhHeDNEeDQ1?=
 =?utf-8?B?dVNVby9Vd3ZjZVI0UER1b1R6cHRoZEpJOUxvZ2R0TGV6V3h1T3dkYTFHeVVW?=
 =?utf-8?B?WS8rZVh0MlJMNUpxclBjbm9BVmpJYjhYak5taDJmb2JuMTJiVlhKdjVYQnho?=
 =?utf-8?B?S3o1VkptRzl0Z0xJbVdvVEVheWk4ZTlPYkVYMElSazN6amlBYW1Rdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f12761a-abb3-4853-91a7-08de7e5a7d34
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 04:07:04.6916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9d/SgbKSRpeUschrod1Djf9ENWAtxUBBCDijoLPX/Bq30g+1BDMyycA9f23lmfRv+dueDlgmOVeoSKcguD7ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6586



On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
> Register a platform_profile handler so the driver exposes standard
> power profiles (low-power, balanced, performance) alongside the manual
> tunable interface.
> 
> When a non-custom profile is active, parameter writes are blocked
> (-EBUSY) and current_value reflects the profile's preset values.
> Selecting the "custom" profile returns control to the user for manual
> staging and committing. On resume, the active profile is automatically
> re-applied.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/amd/Kconfig |   1 +
>   drivers/platform/x86/amd/dptc.c  | 109 ++++++++++++++++++++++++++++++-
>   2 files changed, 108 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index d610092467fc..41ffbd722524 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -48,6 +48,7 @@ config AMD_ISP_PLATFORM
>   config AMD_DPTC
>   	tristate "AMD Dynamic Power and Thermal Configuration Interface (DPTCi)"
>   	depends on X86_64 && ACPI && DMI
> +	select ACPI_PLATFORM_PROFILE
>   	select FIRMWARE_ATTRIBUTES_CLASS
>   	help
>   	  Driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and

Your description doesn't talk about platform profile (which I expect is 
what the default should be for 99% of people).

> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
> index b884cdfa3f82..f4db95affb1b 100644
> --- a/drivers/platform/x86/amd/dptc.c
> +++ b/drivers/platform/x86/amd/dptc.c
> @@ -23,6 +23,7 @@
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
>   #include <linux/processor.h>
>   #include <linux/sysfs.h>
>   #include <linux/unaligned.h>
> @@ -56,8 +57,13 @@ struct dptc_param_limits {
>   	u32 expanded_max;
>   };
>   
> +struct dptc_profile {
> +	u32 vals[DPTC_NUM_PARAMS];	/* 0 = don't set / unstage this param */
> +};
> +
>   struct dptc_device_limits {
>   	struct dptc_param_limits params[DPTC_NUM_PARAMS];
> +	struct dptc_profile profiles[PLATFORM_PROFILE_LAST];
>   };
>   
>   struct dptc_param_desc {
> @@ -88,6 +94,11 @@ static const struct dptc_device_limits limits_maxhh = {
>   		[DPTC_PPT_PL3_FPPT] = {  1,  4, 40,  85, 100 },
>   		[DPTC_CPU_TEMP]     = { 60, 70, 95,  95, 100 },
>   	},
> +	.profiles = {
> +		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = { 15, 15, 25, 0 } },
> +		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 25, 27, 40, 0 } },
> +		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 60, 63, 85, 0 } },
> +	},
>   };
>   
>   /* Substring matches against boot_cpu_data.x86_model_id; order matters. */
> @@ -139,11 +150,14 @@ struct dptc_priv {
>   
>   	bool expanded;
>   
> +	enum platform_profile_option profile;
> +	struct device *ppdev;
> +
>   	enum dptc_save_mode save_mode;
>   
>   	u32 staged[DPTC_NUM_PARAMS];
>   
> -	/* Protects staged, expanded, and save_mode */
> +	/* Protects staged, expanded, save_mode, and profile */
>   	struct mutex lock;
>   
>   	struct dptc_attr_sysfs params[DPTC_NUM_PARAMS];
> @@ -271,6 +285,14 @@ static ssize_t dptc_current_value_show(struct kobject *kobj,
>   
>   	guard(mutex)(&dptc->lock);
>   
> +	if (dptc->profile != PLATFORM_PROFILE_CUSTOM) {
> +		u32 val = dptc->dev_limits->profiles[dptc->profile].vals[ps->idx];
> +
> +		if (!val)
> +			return sysfs_emit(buf, "\n");
> +		return sysfs_emit(buf, "%u\n", val);
> +	}
> +
>   	if (!dptc->staged[ps->idx])
>   		return sysfs_emit(buf, "\n");
>   	return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
> @@ -288,6 +310,9 @@ static ssize_t dptc_current_value_store(struct kobject *kobj,
>   
>   	guard(mutex)(&dptc->lock);
>   
> +	if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> +		return -EBUSY;
> +
>   	if (count == 1 && buf[0] == '\n') {
>   		dptc->staged[ps->idx] = 0;
>   		return count;
> @@ -425,6 +450,9 @@ static ssize_t dptc_expanded_current_value_store(struct kobject *kobj,
>   
>   	guard(mutex)(&dptc->lock);
>   
> +	if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> +		return -EBUSY;
> +
>   	dptc->expanded = val;
>   	/* Clear staged values: limits changed, old values may be out of range */
>   	memset(dptc->staged, 0, sizeof(dptc->staged));
> @@ -593,6 +621,75 @@ static void dptc_kset_unregister(void *data)
>   	kset_unregister(data);
>   }
>   
> +/* Platform profile */
> +
> +static int dptc_apply_profile(struct dptc_priv *dptc,
> +			      enum platform_profile_option profile)
> +{
> +	const struct dptc_profile *pp;
> +	int i;
> +
> +	memset(dptc->staged, 0, sizeof(dptc->staged));
> +
> +	if (profile == PLATFORM_PROFILE_CUSTOM)
> +		return 0;
> +
> +	pp = &dptc->dev_limits->profiles[profile];
> +	for (i = 0; i < DPTC_NUM_PARAMS; i++) {
> +		if (!pp->vals[i])
> +			continue;
> +		dptc->staged[i] = pp->vals[i];
> +	}
> +
> +	return dptc_alib_save(dptc);
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
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	dptc->profile = profile;
> +
> +	return dptc_apply_profile(dptc, profile);
> +}
> +
> +static const struct platform_profile_ops dptc_pp_ops = {
> +	.probe       = dptc_pp_probe,
> +	.profile_get = dptc_pp_get,
> +	.profile_set = dptc_pp_set,
> +};
> +
>   static int dptc_resume(struct device *dev)
>   {
>   	struct dptc_priv *dptc = dev_get_drvdata(dev);
> @@ -601,7 +698,9 @@ static int dptc_resume(struct device *dev)
>   	guard(mutex)(&dptc->lock);
>   
>   	/* In bulk mode, do not use pm ops for userspace flexibility. */
> -	if (dptc->save_mode == SAVE_SINGLE)
> +	if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> +		ret = dptc_apply_profile(dptc, dptc->profile);
> +	else if (dptc->save_mode == SAVE_SINGLE)
>   		ret = dptc_alib_save(dptc);
>   	else
>   		ret = 0;
> @@ -679,6 +778,12 @@ static int dptc_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> +	dptc->profile = PLATFORM_PROFILE_CUSTOM;
> +	dptc->ppdev = devm_platform_profile_register(dev, "amd-dptc", dptc,
> +						     &dptc_pp_ops);
> +	if (IS_ERR(dptc->ppdev))
> +		return PTR_ERR(dptc->ppdev);
> +
>   	return 0;
>   }
>   

