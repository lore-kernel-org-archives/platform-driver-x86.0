Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012008.outbound.protection.outlook.com [52.101.43.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B61C549F;
	Tue, 10 Mar 2026 04:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115301; cv=fail; b=Apn5erpfiLSKKslrk3G1KuJyAOH0ma8z7mOGHbAQRXjTuHaIw7dBKnXEL0+LNH/6206NLdkCs0AwflmAykSuDDMUdRHXt6gQ0ytK7x/tmliL97TevCC1o/Zxy8MJzM597wE18BCblVRr1SGlzFYkmqpbgaoLHphUULq2tkxIks8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115301; c=relaxed/simple;
	bh=6ibQnjYZZXETXcBvwBAD8TvoDNxlpV9E80abcj85wuw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gdq7DxzYuxCVqM01498Vb56GU6oic9oLLRKLBY4J9QqWaXR9x3ALCGKtJgZv7C7SrWVUFyqDCsd3oSdFQUoXFpdS4Zlo5DdhKf0tCnC4MbaeQnPSox/pVn7cXeFtBOprVEV02uhzZDd3NfnCGSDQ+KKj8wArG5qaKM6UdO6Ppp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E5RMb7oI; arc=fail smtp.client-ip=52.101.43.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E5RMb7oI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoDuNYCZDHsYcoBQTfjsOOLnv6ArRwLWicO+UxMT677xVS72Rz/aNYtxauRLTLPkAZXcy3vxzGc0LEDu8bQVjvjYcIKNofKijYVD1Ew3Z6yLyG5Jp0jLBkTGKqK/hC7Lw1hYTiJhKUPMPNQLUtYG+Nff2aX+avb+NfCQ2CEgy7LoiZuh9sm1JKW6UJTCRWESj0Ym3EE6yOHhyqt8jDSZ1JAXDX+hwvp4OOR7ZOqGCvjlSfsi3YmQ8InnUyET0vWOKQfWReHRLNM9UFpOX2nKv0gIioqqV76303dl7D4Etlz2E+ofukFPMns+nNNAEv0PFDDIVfwNWSB4RsDN0On7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Q36WnLoQ//EqHW/57nYDMZ2VPat+y3sXStfom59oCU=;
 b=BliHXgvYK57nA0rdQUxIcKt9VHNkopwbTsszaFgv7ZkioPpwOUrkzojomb434RypmebtXvjZeaefIu2E1bNjIbrFVOjixHWVqCBUshg67ribVGUTk0ROPJMZs8keHVSvTywP1TZybg//Vk/BaLy+7DQMMB7pUVoOmmBtklA/ClLyJukWpqPX3XT5joTsZnNAwA7uy60htVcJQU2tkuFJ5FAZeDx/vk9Wqpqos+jF6aJsz5tY8itMHQhZ7GK5fPjijyEI3Im58WLBFLsQiJtgwiQkgxTpZlbWXI3B4lT+1Jy4I53OW7URPNSyohiL1mKK/mWq8I06yhfhHzCkZ0X0iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Q36WnLoQ//EqHW/57nYDMZ2VPat+y3sXStfom59oCU=;
 b=E5RMb7oI67DBSokZX7YKX2nX5/GgkRB7qleyOzPLLvlHarbCZV5GPQ+o6AKyRqtt7bsUIvojv7k48HKUOXcNDRSOiM4IislySU2/Z5hNc09Fuw1Oq+e4nKd4oF1wTwBg86vkTt+jm5IBdjTwU4CJg5JPzV5Tienu18ZvC5RPAps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by PH7PR12MB6586.namprd12.prod.outlook.com (2603:10b6:510:212::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 04:01:36 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 04:01:33 +0000
Message-ID: <23ee46ed-6978-40a0-9447-e7f527ec7c11@amd.com>
Date: Mon, 9 Mar 2026 23:01:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 2/4] platform/x86/amd: dptc: Add AMD DPTCi driver
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
 derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260309205125.293148-1-lkml@antheas.dev>
 <20260309205125.293148-3-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260309205125.293148-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR14CA0018.namprd14.prod.outlook.com
 (2603:10b6:610:60::28) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|PH7PR12MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: dccb5230-3f20-4ccd-a56b-08de7e59b734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	3qDoPpec2Vl79Dg4ywDcMWx93sGlnN4a3cqOUGz190A1ohqeKIkg1vBFJFhWrkz5lJKjAu4/N9PYDfa9etugL8/b/NMelz7VRGjSJt4Ga6dcmIVvpp6+tvRlQxfgSciKy79GahvriYDf7RQXGuqohdPWf6VpMLOOeuXJb5GIlFDRNSmHkxfjWT/es1V+uA9y6IeI5jhwt0SqNjMHL9qGqaM62gsfGQBYXblizcAwgAXkg7oswUMN5YJt72HWM6EXlOzGlCxAbubtfGNyKqQm7JscLCTjAa2WlHs7THHqEKu4RLgcj2Hs/tV6h7EMSKOIAiO8GK5PyMM+MUkGNdmyEOmKEwebLiI97zK+u6cvoW9PKPVZN0EKi/NM8Jpaod1pjfs527MzlySOokJ/ebwuVwSjLWSE3GCUD0Gelv9NHlGcA0tz8Zv2jDbVB45kD57B2v7ce0uUxzvjJHneTYp9lA3bRoPQruk2NJKEHwtl5dPDeukpKGGuIdP5HzznNfyo2N7/PNCrkjtc+YFN9CfNOSdys/9uCrmIkx4lrj6QyDZ8j+W9NyCK8S6yb3Hv4En3lrbxxzEKbzfJjXZcV61CkYTIyYS3ZqlERPaq+Z5WpPXfnTl1yaPkLNh0S5uLvebRcoeOs9ag8qdTq4pWISev8mYNNG3LrWUvpmo4dy/E3P1RUEM0jv9GV3h45A+w5YlLs6sldTrCOMOGRimnIHWI9OgV5Szx2kOkGDFT9OsEvcw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGJ3V05LQTF1YjBkOFRkd1FlT1JxZGh4Q0RUckwrMHpwd2Q0Tm81bXJBMDFD?=
 =?utf-8?B?ZFAzN05acElXeW5IRzNtYUVyWklpTTg5T3cvZFpESTduVVBFREtYamJJeGZ0?=
 =?utf-8?B?TzBxRTYyTy9KeGtoQU4vbVlRTldUQlQzNHVsN01yTklvRzZmRklqcXRtNVZ4?=
 =?utf-8?B?MjlyekhTeVZpZzlWYW81Tk5ZdmFBSFM4MFJ6RG1IcE1MMmh4ZThuR2JFbE1v?=
 =?utf-8?B?NWVxWEc4aDM0Vkd2akRlTWEyRHlRR0s0YUY0V3RhcnZ0NzZzMEw3NUNXL2E5?=
 =?utf-8?B?Mm5pdGl5YVlJakYvcHdCbkdwY0QxT2lOem05SkJPZnY0UGlTYnBSaUZtWEc2?=
 =?utf-8?B?QlRBbUZvbGs5TjFKZW83ZWM4WjJDcnFYRzNSamdmZDVNTDI1T2s2MXVpMmp4?=
 =?utf-8?B?eFZDVUg3bkZkNjFVcEVXSWFmbnl5enJhb1E4dUlBL1J3RExzSmhVVDJnakZK?=
 =?utf-8?B?ZS9XNFBvcjdBSWdBVkVwUmJYYzNaQWFjSmFPYU00dFQxMUJLVGovT1RJcS9r?=
 =?utf-8?B?U0pNUXdIaXBGQ2Y1SUhkL1JObjBRcHoyRnpSajZieTZiNWtyanRGMlBOWTln?=
 =?utf-8?B?VUt1UDhOWXpQMnN2aGhWTERjaEVxTnFwQ1FNMmlGMk5ldTNnREUrRW42STh0?=
 =?utf-8?B?NFVIRGNCbWtrdDlqU0V0Z1A3bHRXU1VTNXpubTBpVXd2SWVFV2NxUWJZUjBq?=
 =?utf-8?B?bUZCSTA4WW1uMWxpdXlsaEwzMnZkejN2Skt6SStmK0RyK2Fjb2d5bFVtamxx?=
 =?utf-8?B?aWlwWVFCRVQraXMxTnRjNkF2elRZV213KzZMenVtYnNjcStEaDM2eis2d2do?=
 =?utf-8?B?K3VoN1R5WmJTbkRBL1Mvb21HYlY4TU1DTERYR2o4bGlLTnYvS1piNkxvbE9k?=
 =?utf-8?B?elJ5ZUllUlVXTmlnWkF2RzZvbFpNOFlwQzJCV3h3MXNOcEQ0SVFlUW05R01D?=
 =?utf-8?B?K3FvbTE5Mk1QcXM5SWNWOWtMSWN1RmxXWVNmZW5jOWJHbmdYckRsanhkY0Rx?=
 =?utf-8?B?eVNOQUFXZk1LdStwbG4yODR3aHZXSm4wL0V4dTk4WEJIQ0lGUzl0MzNDTncw?=
 =?utf-8?B?NTBPUFREVVkrbHprS1JnTHBPK2I2NXliaXptMGVRVk1tK2ZCcVdITjdkYXVk?=
 =?utf-8?B?TGl5Q3o0TFVLUUFzT1NqcEREYWh2K245YXNPWG5oVCtLRitMdUJMTTlBUWUx?=
 =?utf-8?B?cnVmTXpqVXdwSGg5cTE2MzFZeTMwSFY2NlkycTNWODY3RDdCTFlGa1ZvSlNx?=
 =?utf-8?B?T2hyTmdGZzFHVVZQV2tYWlhvRmpXTWplVnlFMEZEVFNITndZeW1LZC9BOE1j?=
 =?utf-8?B?M1hMZVpYTWVEWE5QZGY3VVBkZEFBZUxCT0hITFMwVUQwTU1VMG9qTkdqVjRo?=
 =?utf-8?B?eTB2aWMxcjhhWThuME04aFFzZnIvcjc1K1BQNWk4bTErRDk3ckN1YVBBTnpx?=
 =?utf-8?B?RW1mUk4rYWcrQjhOc1BqMGtNbHRxS1JheGJ5cURBYTlDRUh2ZWdrY3c5bkFZ?=
 =?utf-8?B?MkZUemswaDJJQmVVWkwwVVRvWGdubUUxOE5nTmg5SnIrbVhzYWovQXJCb0dm?=
 =?utf-8?B?R2pKejFQMEdYWGRHUXNacjRFa2ZoTit3Y0c1ejBKZ2gwdUxNbmUyOXQveS9C?=
 =?utf-8?B?SDFnVTYyeU9WSTBBc1pZczhEaDBXWjNPMW8yUkZiUW1GVDg4NHJiUklJRVBG?=
 =?utf-8?B?V0VBKzVVWDZ2ZlZKNDNhWDhJNEpGN0NXWHNMd1ZtLzFiVjZWQUZlTGJhNEtx?=
 =?utf-8?B?cEp3RC9hdCtrb2lyRURtZjVwWm1ZaDVJZHh3cVMzRHY2VFZ0WTZUR3VoTGM2?=
 =?utf-8?B?NnluMW9pWXBhc3pyZDl4bjR6MEM1d0RJOFhmSHA4cENhcTl3cDVUTEZrZVpE?=
 =?utf-8?B?eFY5M1NkVjFWYXZYRXMxcE1FWHZ0Y1pwTGp6Qys1ZWlGOUZ0aTJNY09kZkFl?=
 =?utf-8?B?bU9OMlhicldocmdXckFJenluQmUyNDdrTk81MEVCbU5PUTZocWJYdm1HbVg1?=
 =?utf-8?B?ajJKd0txS2RTUHdnK3VwZU0yc1VLQU9MNThZdElzYW5MNWQzSUtZZnk4MDJw?=
 =?utf-8?B?dWlLVXQrT1ZVOVN4WDI4eEpNYjZwclBLbER6TFJia1BHYlBGaTgzRW9rVnNr?=
 =?utf-8?B?aUJXclIzM0NRcjVhN0Q5QUNsVXJUdS9qNVZnMnYwaXZPd0ZpMTRxKzc0Unhs?=
 =?utf-8?B?Tk5aTTNKdUMvWGVqMDdjWHkydkc4R0FLNFlmbGJpdEprT1VtRE55bXVHZnJq?=
 =?utf-8?B?dmZGd3NsSVllL0JaUTFrVW5aWXhLNFF1YUdYSHhCdzUwWHlUWTV5S01JK3Bl?=
 =?utf-8?B?dlNGaFhNR203SlA0K1Y4Z2hncXZjMlVUd1gzWjEzR3hTWUJFOTJiQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dccb5230-3f20-4ccd-a56b-08de7e59b734
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 04:01:32.6082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxI15sZ+bCsBf/fAXMfNXIsSbh1SgrqQ6VyS0OLtQDZ18aI3SBS8TZd11p6eCx2Z6mvAUAuqRdgsSqrXdq8Gqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6586



On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
> Add a driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
> Thermal Configuration interface (DPTCi). This exposes TDP and thermal
> parameters for AMD APU-based handheld devices via the
> firmware-attributes sysfs ABI.
> 
> Parameters are staged and atomically committed through ALIB. The driver
> supports two save modes: "single" (apply immediately on write) and
> "bulk" (stage values, then commit with "save"). An "expanded_limits"
> toggle widens the allowed parameter ranges beyond device defaults.
> 
> Initial device support: GPD Win 5 (AMD Ryzen AI MAX).
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   MAINTAINERS                       |   6 +
>   drivers/platform/x86/amd/Kconfig  |  14 +
>   drivers/platform/x86/amd/Makefile |   2 +
>   drivers/platform/x86/amd/dptc.c   | 746 ++++++++++++++++++++++++++++++
>   4 files changed, 768 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/dptc.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 89007f9ed35e..ebda8e82bf35 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1103,6 +1103,12 @@ S:	Supported
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
> index b813f9265368..d610092467fc 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -44,3 +44,17 @@ config AMD_ISP_PLATFORM
>   
>   	  This driver can also be built as a module. If so, the module
>   	  will be called amd_isp4.
> +
> +config AMD_DPTC
> +	tristate "AMD Dynamic Power and Thermal Configuration Interface (DPTCi)"
> +	depends on X86_64 && ACPI && DMI
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
> index 000000000000..b884cdfa3f82
> --- /dev/null
> +++ b/drivers/platform/x86/amd/dptc.c
> @@ -0,0 +1,746 @@
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
> +#include <linux/processor.h>
> +#include <linux/sysfs.h>
> +#include <linux/unaligned.h>
> +
> +#include "../firmware_attributes_class.h"
> +
> +#define DRIVER_NAME		"amd-dptc"
> +
> +#define ALIB_FUNC_DPTC		0x0C
> +#define ALIB_PATH		"\\_SB.ALIB"
> +
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
> +	u32 expanded_min;
> +	u32 device_min;
> +	u32 def;
> +	u32 device_max;
> +	u32 expanded_max;
> +};
> +
> +struct dptc_device_limits {
> +	struct dptc_param_limits params[DPTC_NUM_PARAMS];
> +};
> +
> +struct dptc_param_desc {
> +	const char *name;
> +	const char *display_name;
> +	u16 scale;	/* sysfs-to-ALIB multiplier (e.g. 1000 for W->mW) */
> +	u8 param_id;
> +	u8 param_id2;	/* secondary ALIB ID, 0 if none */
> +};
> +
> +static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] = {
> +	[DPTC_PPT_PL1_SPL]  = { "ppt_pl1_spl", "Sustained power limit (W)",
> +				 1000, ALIB_ID_STAPM_LIMIT,
> +				 ALIB_ID_SKIN_LIMIT },
> +	[DPTC_PPT_PL2_SPPT] = { "ppt_pl2_sppt", "Slow PPT limit (W)",
> +				 1000, ALIB_ID_SLOW_LIMIT },
> +	[DPTC_PPT_PL3_FPPT] = { "ppt_pl3_fppt", "Fast PPT limit (W)",
> +				 1000, ALIB_ID_FAST_LIMIT },
> +	[DPTC_CPU_TEMP]     = { "cpu_temp", "Thermal control limit (C)",
> +				 1, ALIB_ID_TEMP_TARGET },
> +};
> +
> +/* AI MAX Handheld class: GPD Win 5 */
> +static const struct dptc_device_limits limits_maxhh = {
> +	.params = {
> +		[DPTC_PPT_PL1_SPL]  = {  1,  4, 25,  80, 100 },
> +		[DPTC_PPT_PL2_SPPT] = {  1,  4, 27,  82, 100 },
> +		[DPTC_PPT_PL3_FPPT] = {  1,  4, 40,  85, 100 },
> +		[DPTC_CPU_TEMP]     = { 60, 70, 95,  95, 100 },
> +	},
> +};
> +
> +/* Substring matches against boot_cpu_data.x86_model_id; order matters. */
> +static const char * const dptc_soc_table[] = {
> +	/* AI MAX */
> +	"AMD RYZEN AI MAX+ 395",
> +	"AMD RYZEN AI MAX+ 385",
> +	"AMD RYZEN AI MAX 380",
> +	NULL,
> +};

I feel like I commented this before; but I don't really understand the 
purpose of this table.

If you have a system that is quirked already, why would you need to 
cross reference this table?

> +
> +static const struct dmi_system_id dptc_dmi_table[] = {
> +	/* GPD */
> +	{
> +		.ident = "GPD Win 5",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1618-05"),
> +		},
> +		.driver_data = (void *)&limits_maxhh,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
> +
> +enum dptc_save_mode { SAVE_SINGLE, SAVE_BULK };
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
> +	enum dptc_save_mode save_mode;
> +
> +	u32 staged[DPTC_NUM_PARAMS];
> +
> +	/* Protects staged, expanded, and save_mode */
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
> +	return dptc->expanded ? dptc->dev_limits->params[idx].expanded_min
> +			      : dptc->dev_limits->params[idx].device_min;
> +}
> +
> +static u32 dptc_get_max(struct dptc_priv *dptc, int idx)
> +{
> +	return dptc->expanded ? dptc->dev_limits->params[idx].expanded_max
> +			      : dptc->dev_limits->params[idx].device_max;
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
> +		return -ENOENT;
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
> +		put_unaligned_le32(vals[i], &buf[off + 1]);
> +	}
> +
> +	in_params[0].type           = ACPI_TYPE_INTEGER;
> +	in_params[0].integer.value  = ALIB_FUNC_DPTC;
> +	in_params[1].type           = ACPI_TYPE_BUFFER;
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
> +static int dptc_alib_fill_param(u8 *ids, u32 *vals, int offset,
> +				enum dptc_param_idx param, u32 val)
> +{
> +	u32 hw_val = val * dptc_params[param].scale;
> +
> +	ids[offset]    = dptc_params[param].param_id;
> +	vals[offset++] = hw_val;
> +
> +	if (dptc_params[param].param_id2) {
> +		ids[offset]    = dptc_params[param].param_id2;
> +		vals[offset++] = hw_val;
> +	}
> +
> +	return offset;
> +}
> +
> +static int dptc_alib_send_one(int idx, u32 val)
> +{
> +	u32 vals[2];
> +	u8 ids[2];
> +
> +	return dptc_alib_call(ids, vals,
> +			      dptc_alib_fill_param(ids, vals, 0, idx, val));
> +}
> +
> +static int dptc_alib_save(struct dptc_priv *dptc)
> +{
> +	u32 vals[DPTC_NUM_PARAMS * 2];
> +	u8 ids[DPTC_NUM_PARAMS * 2];
> +	int count = 0;
> +	int i;
> +
> +	for (i = 0; i < DPTC_NUM_PARAMS; i++) {
> +		if (!dptc->staged[i])
> +			continue;
> +		count = dptc_alib_fill_param(ids, vals, count, i,
> +					     dptc->staged[i]);
> +	}
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
> +	if (!dptc->staged[ps->idx])
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
> +	guard(mutex)(&dptc->lock);
> +
> +	if (count == 1 && buf[0] == '\n') {
> +		dptc->staged[ps->idx] = 0;
> +		return count;
> +	}
> +
> +	ret = kstrtou32(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	min = dptc_get_min(dptc, ps->idx);
> +	max = dptc_get_max(dptc, ps->idx);
> +	if (val < min || (max && val > max))
> +		return -EINVAL;
> +	dptc->staged[ps->idx]    = val;
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
> +	dptc->expanded = val;
> +	/* Clear staged values: limits changed, old values may be out of range */
> +	memset(dptc->staged, 0, sizeof(dptc->staged));
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
> +static int dptc_resume(struct device *dev)
> +{
> +	struct dptc_priv *dptc = dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	/* In bulk mode, do not use pm ops for userspace flexibility. */
> +	if (dptc->save_mode == SAVE_SINGLE)
> +		ret = dptc_alib_save(dptc);
> +	else
> +		ret = 0;
> +
> +	if (ret && ret != -ENOENT)
> +		dev_warn(dev, "failed to restore settings on resume: %d\n", ret);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(dptc_pm_ops, NULL, dptc_resume);
> +
> +static int dptc_probe(struct platform_device *pdev)
> +{
> +	const struct dmi_system_id *dmi_match = dev_get_platdata(&pdev->dev);
> +	struct device *dev = &pdev->dev;
> +	struct dptc_priv *dptc;
> +	int i, ret;
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
> +					  NULL, MKDEV(0, 0), NULL, DRIVER_NAME);
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
> +	match = dmi_first_match(dptc_dmi_table);
> +	if (!match)
> +		return -ENODEV;
> +
> +	if (!acpi_has_method(NULL, ALIB_PATH)) {
> +		pr_warn("ALIB method not present\n");
> +		return -ENODEV;
> +	}
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

