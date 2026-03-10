Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010039.outbound.protection.outlook.com [52.101.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6155A3C2798;
	Tue, 10 Mar 2026 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773159999; cv=fail; b=fpdodhHrqP06IClgD5tGCIGKCnwUZEEL3HH+jrhxRI+ZUf7f0snU/fvW9VPmiaPgg7iUVHLYFRVDhOhHq0NOWtIa95ooCSPRVS1+syvF1FZgeP50+Nv5acp74iUufgXXyXkFnemh0UP1erMBEO2saSG7aFVNpMptXrRvJYEF3Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773159999; c=relaxed/simple;
	bh=amWonFaxAALtxk1bc5axKHPce38IMNhpVhEmtBmFs58=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QUb/lQULfQMkzAt8D82YdGZLgidJb6/6HKwEup89iu7f0BBDUC6sfvYkYk//FuCdGJkFyIeKRGhL3W3ykh4+q4oiN+FWQhgryfwYLnww93ZCVQo3+YqIeuLc6V2wZRNrRRQVfCLKaWCUV9/cLO2jAL+auRqE6KII9XRKQ3KBqvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0pA658TP; arc=fail smtp.client-ip=52.101.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0pA658TP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQBD2JWWtFWemjmqCmlhsx7o3Xhc85FIWAl1THRkqh+u+bPdrWK8gc+D7KBCe+n5zpXNeD4Tm/XvIQqtjqq3lMiOZylOg/YWOBMdKKRMbS5MPGK6gvHbNcvfGj3EAjjoqiSgBD9UgidSu0YyjVdmoAGluonKVMd6XczJpadz+80hR/dnVNUZz9aUSb0Du1pqoNbocz9NOGmBcqB3rzHycSZFaC+3bcVMx4wsZ0VEM/8XktsjiD1ucAsrCXhlZyuWBj3TRRM9jHA3PM5BTfDJ+QvVNAgBiVkN6tG9raWDW4+Onv1c2+iMiMGQye6oKyw7lqj99M/JAhftglCalTaFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSntSgwBTZSHA+QRhoSIpvxJCBLH95X/kHeZ2yIkb1A=;
 b=V/0TI0BKT206n3YMbOckPMgZeBzXia0yqcIaw/CUYboGJdOfUXr9ypD7Ho4YY3zLQ6Src3fWeEVgwxZLi/l1nLrsCFz7/biKbty5vjhOX6KxM/+eROb+DsTTNIBVQclQZCTLGFVlRev3D0v0NAV3RYcfWrpaFSzw79JO5BL4rehLI3P2at9VGLVaqIG5D5XLDwj3M60hOa4gXmBhztjhSqIrurDrexAU7eCKDxJ0ECpHBNqOm2Rq6LeMfybUGkRq2tEkDAgL2PSKdDTPWhGskIlAt24eOA4IywCFb5r4aECSzWCuPqrA9Tgr1VEzRzJ3b6XAOVx4x9NbjMl6WN9swg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSntSgwBTZSHA+QRhoSIpvxJCBLH95X/kHeZ2yIkb1A=;
 b=0pA658TPi7dozvsnf98XFW28xL3D4kqMBBuxis6RnKfl6EklmX5e9gj4KJsFW2Tull/gzojsnn9vu43fiaBaf9DL83kMKFmt0SYAV967AJScS3Q9gM/GDF1xuvWkiVv1T9AlLIKNRWLNd2617d160vNaamt9+UhxidAvRe2BpI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by MN6PR12MB8541.namprd12.prod.outlook.com (2603:10b6:208:47a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 16:26:28 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 16:26:24 +0000
Message-ID: <9a9e441c-850a-44fb-b659-f4bc135beabe@amd.com>
Date: Tue, 10 Mar 2026 11:26:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 2/4] platform/x86/amd: dptc: Add AMD DPTCi driver
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
 derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260309205125.293148-1-lkml@antheas.dev>
 <20260309205125.293148-3-lkml@antheas.dev>
 <23ee46ed-6978-40a0-9447-e7f527ec7c11@amd.com>
 <CAGwozwFn0nUHWrF6nmba1N9-jbDx7ZpLRe8GcYJAZsQ1MO0y1w@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwFn0nUHWrF6nmba1N9-jbDx7ZpLRe8GcYJAZsQ1MO0y1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0031.namprd11.prod.outlook.com
 (2603:10b6:806:d0::6) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|MN6PR12MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 86052d01-fddb-46b9-1b6e-08de7ec1c59f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FqKFrxJI5a4enC9FxX8cotkI/20iRTcaznd1WyZ4fSKaeX2ujL1pIsze/SzsWx0OiCDIwM8q/dGKQgWKIi7sP/m/SRBfaQOBHzEZb+Taxblo4ZYikt3q5Btt3ug3e77TE5Z4Sy/btQ1a6x9OT1/CbKNm+muLLhYK47FvYJgqNbZruEdtOZaSZ69vlgOs+o7llXimxykEtN/PxBhxFG8gf1otOd9DZrWAbCwPGNPFF2bc79qvHkjYPQl+FM9jyQ1mN6H84N7OiCEqjifW1RMNSFmT6V7z/R4e7bFFP8Y6pSj5mGHtUtVdFOWH7r6x+aXAgrlil86EhSgIObht1VkaRSpQJeEjFuGXC+GB7xwupoQTR9/FoqdzYkNp0cIEPOfCgy4iGMTq/rW8mrM9vayKKTGx1V4qUDVf9KDV0G9fNcEsh48hLv12NBuEB6BsHYGZ5bfqmIqcUb8cljmEL9/p8DE+LiFh+m7IbN5kO5Py21npyOAl6pKqul/EA4sHwAYeOzEpWm5Z9SGmGd8Lo1VyWqUvT3AxHORtigVN7rlbCu82s1+G+jOAtx6EDhYewuJwwW2RUkiewYGTEf5eLYtUNP4aBWur8Rdr3js4kZ7JA5MisRtPKUl+RhyCwnlHCjX+StYx1WyS+zzR6U9g9f8psKo+r7pwu5BC28hU8RaHsixEdwj2Z8xW5A7zF2fqEVS4Mg4ZZB1GftH9LdaEKyuZiCYCYSnvbDdm/3v4GAIXlXk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmJKQlFOZ0F6S3JFOGFGQ1NXTHc0WFVOT0NEL3dZMGhhNWhrWlN1UE1Fdzlr?=
 =?utf-8?B?S1h3aDY1eVNUZ3dUSUh6bjNYZ05GL0J4Sk9zeFdpbUgzSUcvc2ZMRU9HY1My?=
 =?utf-8?B?RnN6aHdFVnBzZW5tcEY5bFB2ZWdNa2FQRjhjdndyc2NFcEduM0VzM2UyNWpx?=
 =?utf-8?B?NE50M0M5dzM3MG56UHZJbVVJdWZ1TEhEUDdlV0l4bzdRMlAvc0NYVjZaUHVO?=
 =?utf-8?B?Tzc0OENobTA2RDgweXc2TUVTRVBnL1FhNzcxU2kwem1ib3RWNXpLaUlNKy9O?=
 =?utf-8?B?SHJXSVp3M3NZQlZ6M3NKczZkMUlGSWUraTFabkZQTTJDaURVWGxRTkJrME5H?=
 =?utf-8?B?SzNqUHBFREI3ZU9Ea2g1MnVFOERxdE5ENE96MWNUdlRRbksveXNTdU12VG1m?=
 =?utf-8?B?b0Y3RjRXQUppemhKbURic2hvaEYySU9GVWY2UnlXb0dja1NZVitSQ3JOdUgy?=
 =?utf-8?B?TU1UZWF0M1FKUGpGTDJaMTFLY3QybDBWUU15UUlwQWlCUFdEams2NnBWV0Rp?=
 =?utf-8?B?bERWR1FUQUdFSU84V2tGR2x6ZWFSY1FtVyt3ZWl4N0NzZTNnTDVkckhBeURM?=
 =?utf-8?B?RlF1NklBM1hMa1JSeXRzWUZUV3g4UkxoZXBlOEJJMGlBbVc5aVZLQWVRMUtX?=
 =?utf-8?B?N0puU0tpbDFKK1dDczE1QkRMUVBwbHVTQmUwcy9DZ1QzdkJhd213Y05XNi84?=
 =?utf-8?B?STA0SEVtMnowV0tnZ2NaUGhKYzNhVm91Rmd1ME00MjQ2ZXc3LytJYTd3NzAz?=
 =?utf-8?B?TXFONjdVa0lIZ0lmTWVRaEF5VFpkeXM0Q3JXSHRYTG9PRjB5OUdNa29vbHVo?=
 =?utf-8?B?UGtuZTZ6REhwNmV1OERqT0RrZ05uSGFFNFV1azBaOUFObUxEajdLT0pKemc5?=
 =?utf-8?B?eU1PQ1AyTE5XR0xsK2JtRTQ5bkdUaWZiMnBVWGxpUkx6L01iM0NBOXNha1dw?=
 =?utf-8?B?T1MxK3hCLzBYdldlWHlXY3JORlByTitoMm5kWVZjMTB3RUxqUGM0R2h5V3ZY?=
 =?utf-8?B?a2pwUGpQT3BST1h2YWN6cXRWdUtXVXdrc2dmTFlZRDZHSnQwbFY2TlRGM1k2?=
 =?utf-8?B?YkZLeUN5OXlCL25UMXdrVzF0eVJla3RldDBoM1JkRjErd2ZNc2JNNXQzV281?=
 =?utf-8?B?VFJUY2g2NGZ5Mm90bUoxTWlLWGxuVU1YMW1jR3VjU0dpWVlBajFwRVI4NXNS?=
 =?utf-8?B?VkJ6V3UyUktseVhYckY2YlFWNWh6M2paRDFvaC9ycG80T3EvU0pNYklvNDlw?=
 =?utf-8?B?dVJ2UzVCZForazdkcUU3Ujk1QkxwMjZMNjZOb1BHdytxRjJYYlh2OUNFM2xC?=
 =?utf-8?B?NDlhaFRBK2tJZHM4N3htdE9oRkpvaE9mZEtNY1Z6ZUxENXk2UGZneEdYSnFa?=
 =?utf-8?B?QzN5aEpNcEpkRjJYUm1Gb2k1VER4SjR1c0liU2FqRFpzVnJRTVZJWDhubGdS?=
 =?utf-8?B?eFdWZWNhTUpGWFFENGJqbEJtN25Ra2pFQVpzM0M1ekpSTVBYMHJteFBkaTJh?=
 =?utf-8?B?Nmd6TTNwQWpkaEhuc1RGMmhRcUdrYkNIdnVscTVMT3E4R3BsU2ZmbU85aTZX?=
 =?utf-8?B?VHplOHpUK3dUNEpvU3cyMFREdURoaFhoajlvTFhvVTk3R2ZKa3BUSHFJM2Vm?=
 =?utf-8?B?M3Zrcml0NVp1RW1uelZVWUQvNnZ1M0t0bTU0UHhXa2pocnRycnhkYldyNGVa?=
 =?utf-8?B?NlJEaFhsUXhnb1IyQzlHdGprMHF5MVNEekFWVmlvUXR3bzBsTnJMak5mbXp2?=
 =?utf-8?B?VU44V1IvVk5TRXprcnVOTlljbzlRcVpSTTRCc1lPUTluLzBTMlF5WTBqNGU5?=
 =?utf-8?B?Y2RnN2F5NW5pYTdmTnUzRysvMjNHUmQyWGp1UHI1bmpWOWQvY1pZR0xqdk9J?=
 =?utf-8?B?V0ZiRnU5ZFY2ZTVWUFJTaGk5c1ZodWFUUWRqd2ZvaWpJMGVtRURnb0FKR2R2?=
 =?utf-8?B?MHVQdnJDWkNaSytMYkYwUW92NmtrcWk0L2xxamtlRnArMitZSXJGZ0daSjIw?=
 =?utf-8?B?M0xNL3RDSjlRWWptQzc3Uks3ZXhVaFVPQ0JUM21idmgxNmFERGhEL0toVUJs?=
 =?utf-8?B?bGpzZ3RPTmtOZlRHNW5VSE81T2JiTHBPNVFVbmpySVpIcjRRQXJYemFXZVlG?=
 =?utf-8?B?Zk5lYkJKdjNGZ1hoSC8waVhqVEFxdlFMUkxua01wWENmblVoR0ZkNWJ5T1BB?=
 =?utf-8?B?VVBva2ZDWGF5SUVJL2JsWExJL002NmhVOXZaTzF2WWVPajU2RmtGd2xCd2p5?=
 =?utf-8?B?bUs5NU9HZEE1aEZGbTVKWThmaTBrQUFhNDM3Z29mQ3czdHAyNVVGSXhxdTd5?=
 =?utf-8?B?Nis4Vk14SWo0U1p5RlpNNUZSS1FLblgyUDVseHFKbTJoNCtrYnRxQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86052d01-fddb-46b9-1b6e-08de7ec1c59f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 16:26:24.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: df2lh5RYDNBjtZ3Q4vc7EFDanHGvCWKNonVLvcdiR2sQwidpfS8Ik9NYPHlH5WOWuNX/EJP5riRrRhZ1nNp0OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8541

On 3/10/26 3:02 AM, Antheas Kapenekakis wrote:
> On Tue, 10 Mar 2026 at 05:01, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>>
>>
>> On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
>>> Add a driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
>>> Thermal Configuration interface (DPTCi). This exposes TDP and thermal
>>> parameters for AMD APU-based handheld devices via the
>>> firmware-attributes sysfs ABI.
>>>
>>> Parameters are staged and atomically committed through ALIB. The driver
>>> supports two save modes: "single" (apply immediately on write) and
>>> "bulk" (stage values, then commit with "save"). An "expanded_limits"
>>> toggle widens the allowed parameter ranges beyond device defaults.
>>>
>>> Initial device support: GPD Win 5 (AMD Ryzen AI MAX).
>>>
>>> Assisted-by: Claude:claude-opus-4-6
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    MAINTAINERS                       |   6 +
>>>    drivers/platform/x86/amd/Kconfig  |  14 +
>>>    drivers/platform/x86/amd/Makefile |   2 +
>>>    drivers/platform/x86/amd/dptc.c   | 746 ++++++++++++++++++++++++++++++
>>>    4 files changed, 768 insertions(+)
>>>    create mode 100644 drivers/platform/x86/amd/dptc.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 89007f9ed35e..ebda8e82bf35 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1103,6 +1103,12 @@ S:     Supported
>>>    F:  drivers/gpu/drm/amd/display/dc/dml/
>>>    F:  drivers/gpu/drm/amd/display/dc/dml2_0/
>>>
>>> +AMD DPTC DRIVER
>>> +M:   Antheas Kapenekakis <lkml@antheas.dev>
>>> +L:   platform-driver-x86@vger.kernel.org
>>> +S:   Maintained
>>> +F:   drivers/platform/x86/amd/dptc.c
>>> +
>>>    AMD FAM15H PROCESSOR POWER MONITORING DRIVER
>>>    M:  Huang Rui <ray.huang@amd.com>
>>>    L:  linux-hwmon@vger.kernel.org
>>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>>> index b813f9265368..d610092467fc 100644
>>> --- a/drivers/platform/x86/amd/Kconfig
>>> +++ b/drivers/platform/x86/amd/Kconfig
>>> @@ -44,3 +44,17 @@ config AMD_ISP_PLATFORM
>>>
>>>          This driver can also be built as a module. If so, the module
>>>          will be called amd_isp4.
>>> +
>>> +config AMD_DPTC
>>> +     tristate "AMD Dynamic Power and Thermal Configuration Interface (DPTCi)"
>>> +     depends on X86_64 && ACPI && DMI
>>> +     select FIRMWARE_ATTRIBUTES_CLASS
>>> +     help
>>> +       Driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
>>> +       Thermal Configuration Interface (DPTCi). Exposes TDP and thermal
>>> +       parameters for AMD APU-based handheld devices via the
>>> +       firmware-attributes sysfs ABI, allowing userspace tools to stage
>>> +       and atomically commit power limit settings. Requires a DMI match
>>> +       for the device and a recognized AMD SoC.
>>> +
>>> +       If built as a module, the module will be called amd_dptc.
>>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
>>> index f6ff0c837f34..862a609bfe38 100644
>>> --- a/drivers/platform/x86/amd/Makefile
>>> +++ b/drivers/platform/x86/amd/Makefile
>>> @@ -12,3 +12,5 @@ obj-$(CONFIG_AMD_PMF)               += pmf/
>>>    obj-$(CONFIG_AMD_WBRF)              += wbrf.o
>>>    obj-$(CONFIG_AMD_ISP_PLATFORM)      += amd_isp4.o
>>>    obj-$(CONFIG_AMD_HFI)               += hfi/
>>> +obj-$(CONFIG_AMD_DPTC)               += amd_dptc.o
>>> +amd_dptc-y                   := dptc.o
>>> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
>>> new file mode 100644
>>> index 000000000000..b884cdfa3f82
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/amd/dptc.c
>>> @@ -0,0 +1,746 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * AMD Dynamic Power and Thermal Configuration Interface (DPTCi) driver
>>> + *
>>> + * Exposes AMD APU power and thermal parameters via the firmware-attributes
>>> + * sysfs ABI. Parameters are staged and atomically committed through the
>>> + * AGESA ALIB Function 0x0C (Dynamic Power and Thermal Configuration
>>> + * interface).
>>> + *
>>> + * Reference: AMD AGESA Publication #44065, Appendix E.5
>>> + *            https://docs.amd.com/v/u/en-US/44065_Arch2008
>>> + *
>>> + * Copyright (C) 2026 Antheas Kapenekakis <lkml@antheas.dev>
>>> + */
>>> +
>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/cleanup.h>
>>> +#include <linux/dmi.h>
>>> +#include <linux/init.h>
>>> +#include <linux/kobject.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/processor.h>
>>> +#include <linux/sysfs.h>
>>> +#include <linux/unaligned.h>
>>> +
>>> +#include "../firmware_attributes_class.h"
>>> +
>>> +#define DRIVER_NAME          "amd-dptc"
>>> +
>>> +#define ALIB_FUNC_DPTC               0x0C
>>> +#define ALIB_PATH            "\\_SB.ALIB"
>>> +
>>> +#define ALIB_ID_TEMP_TARGET  0x03
>>> +#define ALIB_ID_STAPM_LIMIT  0x05
>>> +#define ALIB_ID_FAST_LIMIT   0x06
>>> +#define ALIB_ID_SLOW_LIMIT   0x07
>>> +#define ALIB_ID_SKIN_LIMIT   0x2E
>>> +
>>> +enum dptc_param_idx {
>>> +     DPTC_PPT_PL1_SPL,       /* STAPM + skin limit (set together) */
>>> +     DPTC_PPT_PL2_SPPT,      /* slow PPT limit */
>>> +     DPTC_PPT_PL3_FPPT,      /* fast PPT limit */
>>> +     DPTC_CPU_TEMP,          /* thermal control target */
>>> +     DPTC_NUM_PARAMS,
>>> +};
>>> +
>>> +struct dptc_param_limits {
>>> +     u32 expanded_min;
>>> +     u32 device_min;
>>> +     u32 def;
>>> +     u32 device_max;
>>> +     u32 expanded_max;
>>> +};
>>> +
>>> +struct dptc_device_limits {
>>> +     struct dptc_param_limits params[DPTC_NUM_PARAMS];
>>> +};
>>> +
>>> +struct dptc_param_desc {
>>> +     const char *name;
>>> +     const char *display_name;
>>> +     u16 scale;      /* sysfs-to-ALIB multiplier (e.g. 1000 for W->mW) */
>>> +     u8 param_id;
>>> +     u8 param_id2;   /* secondary ALIB ID, 0 if none */
>>> +};
>>> +
>>> +static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] = {
>>> +     [DPTC_PPT_PL1_SPL]  = { "ppt_pl1_spl", "Sustained power limit (W)",
>>> +                              1000, ALIB_ID_STAPM_LIMIT,
>>> +                              ALIB_ID_SKIN_LIMIT },
>>> +     [DPTC_PPT_PL2_SPPT] = { "ppt_pl2_sppt", "Slow PPT limit (W)",
>>> +                              1000, ALIB_ID_SLOW_LIMIT },
>>> +     [DPTC_PPT_PL3_FPPT] = { "ppt_pl3_fppt", "Fast PPT limit (W)",
>>> +                              1000, ALIB_ID_FAST_LIMIT },
>>> +     [DPTC_CPU_TEMP]     = { "cpu_temp", "Thermal control limit (C)",
>>> +                              1, ALIB_ID_TEMP_TARGET },
>>> +};
>>> +
>>> +/* AI MAX Handheld class: GPD Win 5 */
>>> +static const struct dptc_device_limits limits_maxhh = {
>>> +     .params = {
>>> +             [DPTC_PPT_PL1_SPL]  = {  1,  4, 25,  80, 100 },
>>> +             [DPTC_PPT_PL2_SPPT] = {  1,  4, 27,  82, 100 },
>>> +             [DPTC_PPT_PL3_FPPT] = {  1,  4, 40,  85, 100 },
>>> +             [DPTC_CPU_TEMP]     = { 60, 70, 95,  95, 100 },
>>> +     },
>>> +};
>>> +
>>> +/* Substring matches against boot_cpu_data.x86_model_id; order matters. */
>>> +static const char * const dptc_soc_table[] = {
>>> +     /* AI MAX */
>>> +     "AMD RYZEN AI MAX+ 395",
>>> +     "AMD RYZEN AI MAX+ 385",
>>> +     "AMD RYZEN AI MAX 380",
>>> +     NULL,
>>> +};
>>
>> I feel like I commented this before; but I don't really understand the
>> purpose of this table.
>>
>> If you have a system that is quirked already, why would you need to
>> cross reference this table?
> 
> Yes, and I addressed it on a reply.
> 
> It is an additional safety feature. A lot of these devices ship
> different SoC SKUs with the same DMI. Most of them actually. But it is
> not needed beyond that, it can be removed. I will defer to you.
> 

Exact same SMBIOS?  There are a lot of fields that can be keyed off. 
Can you share a dmidecode from two such systems?

> 
>>> +
>>> +static const struct dmi_system_id dptc_dmi_table[] = {
>>> +     /* GPD */
>>> +     {
>>> +             .ident = "GPD Win 5",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1618-05"),
>>> +             },
>>> +             .driver_data = (void *)&limits_maxhh,
>>> +     },
>>> +     { }
>>> +};
>>> +MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
>>> +
>>> +enum dptc_save_mode { SAVE_SINGLE, SAVE_BULK };
>>> +
>>> +struct dptc_priv;
>>> +
>>> +struct dptc_attr_sysfs {
>>> +     struct dptc_priv *priv;
>>> +     struct kobj_attribute current_value;
>>> +     struct kobj_attribute default_value;
>>> +     struct kobj_attribute min_value;
>>> +     struct kobj_attribute max_value;
>>> +     struct kobj_attribute scalar_increment;
>>> +     struct kobj_attribute display_name;
>>> +     struct kobj_attribute type;
>>> +     struct attribute *attrs[8];
>>> +     struct attribute_group group;
>>> +     int idx;
>>> +};
>>> +
>>> +struct dptc_priv {
>>> +     struct device *fw_attr_dev;
>>> +     struct kset *fw_attr_kset;
>>> +
>>> +     const struct dptc_device_limits *dev_limits;
>>> +
>>> +     bool expanded;
>>> +
>>> +     enum dptc_save_mode save_mode;
>>> +
>>> +     u32 staged[DPTC_NUM_PARAMS];
>>> +
>>> +     /* Protects staged, expanded, and save_mode */
>>> +     struct mutex lock;
>>> +
>>> +     struct dptc_attr_sysfs params[DPTC_NUM_PARAMS];
>>> +     struct dptc_attr_sysfs expanded_attr;
>>> +     struct kobj_attribute save_settings_attr;
>>> +};
>>> +
>>> +static struct platform_device *dptc_pdev;
>>> +
>>> +static u32 dptc_get_min(struct dptc_priv *dptc, int idx)
>>> +{
>>> +     return dptc->expanded ? dptc->dev_limits->params[idx].expanded_min
>>> +                           : dptc->dev_limits->params[idx].device_min;
>>> +}
>>> +
>>> +static u32 dptc_get_max(struct dptc_priv *dptc, int idx)
>>> +{
>>> +     return dptc->expanded ? dptc->dev_limits->params[idx].expanded_max
>>> +                           : dptc->dev_limits->params[idx].device_max;
>>> +}
>>> +
>>> +static u32 dptc_get_default(struct dptc_priv *dptc, int idx)
>>> +{
>>> +     return dptc->dev_limits->params[idx].def;
>>> +}
>>> +
>>> +static int dptc_alib_call(const u8 *ids, const u32 *vals, int count)
>>> +{
>>> +     union acpi_object in_params[2];
>>> +     struct acpi_object_list input;
>>> +     acpi_status status;
>>> +     u32 buf_size;
>>> +     int i, off;
>>> +     u8 *buf;
>>> +
>>> +     if (count == 0)
>>> +             return -ENOENT;
>>> +
>>> +     /* Buffer layout: WORD total_size + count * (BYTE id + DWORD value) */
>>> +     buf_size = 2 + count * 5;
>>> +     buf = kzalloc(buf_size, GFP_KERNEL);
>>> +     if (!buf)
>>> +             return -ENOMEM;
>>> +
>>> +     put_unaligned_le16(buf_size, buf);
>>> +
>>> +     for (i = 0; i < count; i++) {
>>> +             off  = 2 + i * 5;
>>> +             buf[off] = ids[i];
>>> +             put_unaligned_le32(vals[i], &buf[off + 1]);
>>> +     }
>>> +
>>> +     in_params[0].type           = ACPI_TYPE_INTEGER;
>>> +     in_params[0].integer.value  = ALIB_FUNC_DPTC;
>>> +     in_params[1].type           = ACPI_TYPE_BUFFER;
>>> +     in_params[1].buffer.length  = buf_size;
>>> +     in_params[1].buffer.pointer = buf;
>>> +
>>> +     input.count   = 2;
>>> +     input.pointer = in_params;
>>> +
>>> +     status = acpi_evaluate_object(NULL, ALIB_PATH, &input, NULL);
>>> +     kfree(buf);
>>> +
>>> +     if (ACPI_FAILURE(status)) {
>>> +             pr_err("ALIB call failed: %s\n",
>>> +                    acpi_format_exception(status));
>>> +             return -EIO;
>>> +     }
>>> +
>>> +     pr_debug("sent %d ALIB parameter(s)\n", count);
>>> +     return 0;
>>> +}
>>> +
>>> +static int dptc_alib_fill_param(u8 *ids, u32 *vals, int offset,
>>> +                             enum dptc_param_idx param, u32 val)
>>> +{
>>> +     u32 hw_val = val * dptc_params[param].scale;
>>> +
>>> +     ids[offset]    = dptc_params[param].param_id;
>>> +     vals[offset++] = hw_val;
>>> +
>>> +     if (dptc_params[param].param_id2) {
>>> +             ids[offset]    = dptc_params[param].param_id2;
>>> +             vals[offset++] = hw_val;
>>> +     }
>>> +
>>> +     return offset;
>>> +}
>>> +
>>> +static int dptc_alib_send_one(int idx, u32 val)
>>> +{
>>> +     u32 vals[2];
>>> +     u8 ids[2];
>>> +
>>> +     return dptc_alib_call(ids, vals,
>>> +                           dptc_alib_fill_param(ids, vals, 0, idx, val));
>>> +}
>>> +
>>> +static int dptc_alib_save(struct dptc_priv *dptc)
>>> +{
>>> +     u32 vals[DPTC_NUM_PARAMS * 2];
>>> +     u8 ids[DPTC_NUM_PARAMS * 2];
>>> +     int count = 0;
>>> +     int i;
>>> +
>>> +     for (i = 0; i < DPTC_NUM_PARAMS; i++) {
>>> +             if (!dptc->staged[i])
>>> +                     continue;
>>> +             count = dptc_alib_fill_param(ids, vals, count, i,
>>> +                                          dptc->staged[i]);
>>> +     }
>>> +
>>> +     return dptc_alib_call(ids, vals, count);
>>> +}
>>> +
>>> +/* Sysfs callbacks */
>>> +
>>> +static ssize_t dptc_current_value_show(struct kobject *kobj,
>>> +                                    struct kobj_attribute *attr, char *buf)
>>> +{
>>> +     struct dptc_attr_sysfs *ps =
>>> +             container_of(attr, struct dptc_attr_sysfs, current_value);
>>> +     struct dptc_priv *dptc = ps->priv;
>>> +
>>> +     guard(mutex)(&dptc->lock);
>>> +
>>> +     if (!dptc->staged[ps->idx])
>>> +             return sysfs_emit(buf, "\n");
>>> +     return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
>>> +}
>>> +
>>> +static ssize_t dptc_current_value_store(struct kobject *kobj,
>>> +                                     struct kobj_attribute *attr,
>>> +                                     const char *buf, size_t count)
>>> +{
>>> +     struct dptc_attr_sysfs *ps =
>>> +             container_of(attr, struct dptc_attr_sysfs, current_value);
>>> +     struct dptc_priv *dptc = ps->priv;
>>> +     u32 val, min, max;
>>> +     int ret;
>>> +
>>> +     guard(mutex)(&dptc->lock);
>>> +
>>> +     if (count == 1 && buf[0] == '\n') {
>>> +             dptc->staged[ps->idx] = 0;
>>> +             return count;
>>> +     }
>>> +
>>> +     ret = kstrtou32(buf, 10, &val);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     min = dptc_get_min(dptc, ps->idx);
>>> +     max = dptc_get_max(dptc, ps->idx);
>>> +     if (val < min || (max && val > max))
>>> +             return -EINVAL;
>>> +     dptc->staged[ps->idx]    = val;
>>> +     if (dptc->save_mode == SAVE_SINGLE)
>>> +             ret = dptc_alib_send_one(ps->idx, val);
>>> +
>>> +     return ret ? ret : count;
>>> +}
>>> +
>>> +static ssize_t dptc_default_value_show(struct kobject *kobj,
>>> +                                    struct kobj_attribute *attr, char *buf)
>>> +{
>>> +     struct dptc_attr_sysfs *ps =
>>> +             container_of(attr, struct dptc_attr_sysfs, default_value);
>>> +
>>> +     return sysfs_emit(buf, "%u\n", dptc_get_default(ps->priv, ps->idx));
>>> +}
>>> +
>>> +static ssize_t dptc_min_value_show(struct kobject *kobj,
>>> +                                struct kobj_attribute *attr, char *buf)
>>> +{
>>> +     struct dptc_attr_sysfs *ps =
>>> +             container_of(attr, struct dptc_attr_sysfs, min_value);
>>> +     struct dptc_priv *dptc = ps->priv;
>>> +
>>> +     guard(mutex)(&dptc->lock);
>>> +
>>> +     return sysfs_emit(buf, "%u\n", dptc_get_min(dptc, ps->idx));
>>> +}
>>> +
>>> +static ssize_t dptc_max_value_show(struct kobject *kobj,
>>> +                                struct kobj_attribute *attr, char *buf)
>>> +{
>>> +     struct dptc_attr_sysfs *ps =
>>> +             container_of(attr, struct dptc_attr_sysfs, max_value);
>>> +     struct dptc_priv *dptc = ps->priv;
>>> +
>>> +     guard(mutex)(&dptc->lock);
>>> +
>>> +     return sysfs_emit(buf, "%u\n", dptc_get_max(dptc, ps->idx));
>>> +}
>>> +
>>> +static ssize_t dptc_scalar_increment_show(struct kobject *kobj,
>>> +                                       struct kobj_attribute *attr, char *buf)
>>> +{
>>> +     return sysfs_emit(buf, "1\n");
>>> +}
>>> +
>>> +static ssize_t dptc_display_name_show(struct kobject *kobj,
>>> +                                   struct kobj_attribute *attr, char *buf)
>>> +{
>>> +     struct dptc_attr_sysfs *ps =
>>> +             container_of(attr, struct dptc_attr_sysfs, display_name);
>>> +     return sysfs_emit(buf, "%s\n", dptc_params[ps->idx].display_name);
>>> +}
>>> +
>>> +static ssize_t dptc_type_show(struct kobject *kobj,
>>> +                           struct kobj_attribute *attr, char *buf)
>>> +{
>>> +     return sysfs_emit(buf, "integer\n");
>>> +}
>>> +
>>> +static ssize_t dptc_save_settings_show(struct kobject *kobj,
>>> +                                    struct kobj_attribute *attr, char *buf)
>>> +{
>>> +     struct dptc_priv *dptc =
>>> +             container_of(attr, struct dptc_priv, save_settings_attr);
>>> +
>>> +     guard(mutex)(&dptc->lock);
>>> +
>>> +     if (dptc->save_mode == SAVE_SINGLE)
>>> +             return sysfs_emit(buf, "single\n");
>>> +     return sysfs_emit(buf, "bulk\n");
>>> +}
>>> +
>>> +static ssize_t dptc_save_settings_store(struct kobject *kobj,
>>> +                                     struct kobj_attribute *attr,
>>> +                                     const char *buf, size_t count)
>>> +{
>>> +     struct dptc_priv *dptc =
>>> +             container_of(attr, struct dptc_priv, save_settings_attr);
>>> +     int ret = 0;
>>> +
>>> +     guard(mutex)(&dptc->lock);
>>> +
>>> +     if (sysfs_streq(buf, "save"))
>>> +             ret = dptc_alib_save(dptc);
>>> +     else if (sysfs_streq(buf, "single"))
>>> +             dptc->save_mode = SAVE_SINGLE;
>>> +     else if (sysfs_streq(buf, "bulk"))
>>> +             dptc->save_mode = SAVE_BULK;
>>> +     else
>>> +             return -EINVAL;
>>> +
>>> +     return ret ? ret : count;
>>> +}
>>> +
>>> +static ssize_t dptc_expanded_current_value_show(struct kobject *kobj,
>>> +                                             struct kobj_attribute *attr,
>>> +                                             char *buf)
>>> +{
>>> +     struct dptc_attr_sysfs *ps =
>>> +             container_of(attr, struct dptc_attr_sysfs, current_value);
>>> +     struct dptc_priv *dptc = ps->priv;
>>> +
>>> +     guard(mutex)(&dptc->lock);
>>> +
>>> +     return sysfs_emit(buf, "%d\n", dptc->expanded);
>>> +}
>>> +
>>> +static ssize_t dptc_expanded_current_value_store(struct kobject *kobj,
>>> +                                              struct kobj_attribute *attr,
>>> +                                              const char *buf, size_t count)
>>> +{
>>> +     struct dptc_attr_sysfs *ps =
>>> +             container_of(attr, struct dptc_attr_sysfs, current_value);
>>> +     struct dptc_priv *dptc = ps->priv;
>>> +     bool val;
>>> +     int ret;
>>> +
>>> +     ret = kstrtobool(buf, &val);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     guard(mutex)(&dptc->lock);
>>> +
>>> +     dptc->expanded = val;
>>> +     /* Clear staged values: limits changed, old values may be out of range */
>>> +     memset(dptc->staged, 0, sizeof(dptc->staged));
>>> +
>>> +     return count;
>>> +}
>>> +
>>> +static ssize_t dptc_expanded_default_value_show(struct kobject *kobj,
>>> +                                             struct kobj_attribute *attr,
>>> +                                             char *buf)
>>> +{
>>> +     return sysfs_emit(buf, "0\n");
>>> +}
>>> +
>>> +static ssize_t dptc_expanded_min_value_show(struct kobject *kobj,
>>> +                                         struct kobj_attribute *attr,
>>> +                                         char *buf)
>>> +{
>>> +     return sysfs_emit(buf, "0\n");
>>> +}
>>> +
>>> +static ssize_t dptc_expanded_max_value_show(struct kobject *kobj,
>>> +                                         struct kobj_attribute *attr,
>>> +                                         char *buf)
>>> +{
>>> +     return sysfs_emit(buf, "1\n");
>>> +}
>>> +
>>> +static ssize_t dptc_expanded_scalar_increment_show(struct kobject *kobj,
>>> +                                                struct kobj_attribute *attr,
>>> +                                                char *buf)
>>> +{
>>> +     return sysfs_emit(buf, "1\n");
>>> +}
>>> +
>>> +static ssize_t dptc_expanded_display_name_show(struct kobject *kobj,
>>> +                                            struct kobj_attribute *attr,
>>> +                                            char *buf)
>>> +{
>>> +     return sysfs_emit(buf, "Expanded Limits\n");
>>> +}
>>> +
>>> +static ssize_t dptc_expanded_type_show(struct kobject *kobj,
>>> +                                    struct kobj_attribute *attr, char *buf)
>>> +{
>>> +     return sysfs_emit(buf, "integer\n");
>>> +}
>>> +
>>> +/* Sysfs setup */
>>> +
>>> +static void dptc_setup_param_sysfs(struct dptc_priv *dptc,
>>> +                                struct dptc_attr_sysfs *ps, int idx)
>>> +{
>>> +     ps->priv = dptc;
>>> +     ps->idx = idx;
>>> +
>>> +     sysfs_attr_init(&ps->current_value.attr);
>>> +     ps->current_value.attr.name  = "current_value";
>>> +     ps->current_value.attr.mode  = 0644;
>>> +     ps->current_value.show       = dptc_current_value_show;
>>> +     ps->current_value.store      = dptc_current_value_store;
>>> +
>>> +     sysfs_attr_init(&ps->default_value.attr);
>>> +     ps->default_value.attr.name  = "default_value";
>>> +     ps->default_value.attr.mode  = 0444;
>>> +     ps->default_value.show       = dptc_default_value_show;
>>> +
>>> +     sysfs_attr_init(&ps->min_value.attr);
>>> +     ps->min_value.attr.name      = "min_value";
>>> +     ps->min_value.attr.mode      = 0444;
>>> +     ps->min_value.show           = dptc_min_value_show;
>>> +
>>> +     sysfs_attr_init(&ps->max_value.attr);
>>> +     ps->max_value.attr.name      = "max_value";
>>> +     ps->max_value.attr.mode      = 0444;
>>> +     ps->max_value.show           = dptc_max_value_show;
>>> +
>>> +     sysfs_attr_init(&ps->scalar_increment.attr);
>>> +     ps->scalar_increment.attr.name = "scalar_increment";
>>> +     ps->scalar_increment.attr.mode = 0444;
>>> +     ps->scalar_increment.show      = dptc_scalar_increment_show;
>>> +
>>> +     sysfs_attr_init(&ps->display_name.attr);
>>> +     ps->display_name.attr.name   = "display_name";
>>> +     ps->display_name.attr.mode   = 0444;
>>> +     ps->display_name.show        = dptc_display_name_show;
>>> +
>>> +     sysfs_attr_init(&ps->type.attr);
>>> +     ps->type.attr.name           = "type";
>>> +     ps->type.attr.mode           = 0444;
>>> +     ps->type.show                = dptc_type_show;
>>> +
>>> +     ps->attrs[0] = &ps->current_value.attr;
>>> +     ps->attrs[1] = &ps->default_value.attr;
>>> +     ps->attrs[2] = &ps->min_value.attr;
>>> +     ps->attrs[3] = &ps->max_value.attr;
>>> +     ps->attrs[4] = &ps->scalar_increment.attr;
>>> +     ps->attrs[5] = &ps->display_name.attr;
>>> +     ps->attrs[6] = &ps->type.attr;
>>> +     ps->attrs[7] = NULL;
>>> +
>>> +     ps->group.name  = dptc_params[idx].name;
>>> +     ps->group.attrs = ps->attrs;
>>> +}
>>> +
>>> +static void dptc_setup_expanded_sysfs(struct dptc_priv *dptc,
>>> +                                   struct dptc_attr_sysfs *ps)
>>> +{
>>> +     ps->priv = dptc;
>>> +     sysfs_attr_init(&ps->current_value.attr);
>>> +     ps->current_value.attr.name  = "current_value";
>>> +     ps->current_value.attr.mode  = 0644;
>>> +     ps->current_value.show       = dptc_expanded_current_value_show;
>>> +     ps->current_value.store      = dptc_expanded_current_value_store;
>>> +
>>> +     sysfs_attr_init(&ps->default_value.attr);
>>> +     ps->default_value.attr.name  = "default_value";
>>> +     ps->default_value.attr.mode  = 0444;
>>> +     ps->default_value.show       = dptc_expanded_default_value_show;
>>> +
>>> +     sysfs_attr_init(&ps->min_value.attr);
>>> +     ps->min_value.attr.name      = "min_value";
>>> +     ps->min_value.attr.mode      = 0444;
>>> +     ps->min_value.show           = dptc_expanded_min_value_show;
>>> +
>>> +     sysfs_attr_init(&ps->max_value.attr);
>>> +     ps->max_value.attr.name      = "max_value";
>>> +     ps->max_value.attr.mode      = 0444;
>>> +     ps->max_value.show           = dptc_expanded_max_value_show;
>>> +
>>> +     sysfs_attr_init(&ps->scalar_increment.attr);
>>> +     ps->scalar_increment.attr.name = "scalar_increment";
>>> +     ps->scalar_increment.attr.mode = 0444;
>>> +     ps->scalar_increment.show      = dptc_expanded_scalar_increment_show;
>>> +
>>> +     sysfs_attr_init(&ps->display_name.attr);
>>> +     ps->display_name.attr.name   = "display_name";
>>> +     ps->display_name.attr.mode   = 0444;
>>> +     ps->display_name.show        = dptc_expanded_display_name_show;
>>> +
>>> +     sysfs_attr_init(&ps->type.attr);
>>> +     ps->type.attr.name           = "type";
>>> +     ps->type.attr.mode           = 0444;
>>> +     ps->type.show                = dptc_expanded_type_show;
>>> +
>>> +     ps->attrs[0] = &ps->current_value.attr;
>>> +     ps->attrs[1] = &ps->default_value.attr;
>>> +     ps->attrs[2] = &ps->min_value.attr;
>>> +     ps->attrs[3] = &ps->max_value.attr;
>>> +     ps->attrs[4] = &ps->scalar_increment.attr;
>>> +     ps->attrs[5] = &ps->display_name.attr;
>>> +     ps->attrs[6] = &ps->type.attr;
>>> +     ps->attrs[7] = NULL;
>>> +
>>> +     ps->group.name  = "expanded_limits";
>>> +     ps->group.attrs = ps->attrs;
>>> +}
>>> +
>>> +static void dptc_fw_dev_unregister(void *data)
>>> +{
>>> +     device_unregister(data);
>>> +}
>>> +
>>> +static void dptc_kset_unregister(void *data)
>>> +{
>>> +     kset_unregister(data);
>>> +}
>>> +
>>> +static int dptc_resume(struct device *dev)
>>> +{
>>> +     struct dptc_priv *dptc = dev_get_drvdata(dev);
>>> +     int ret;
>>> +
>>> +     guard(mutex)(&dptc->lock);
>>> +
>>> +     /* In bulk mode, do not use pm ops for userspace flexibility. */
>>> +     if (dptc->save_mode == SAVE_SINGLE)
>>> +             ret = dptc_alib_save(dptc);
>>> +     else
>>> +             ret = 0;
>>> +
>>> +     if (ret && ret != -ENOENT)
>>> +             dev_warn(dev, "failed to restore settings on resume: %d\n", ret);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static DEFINE_SIMPLE_DEV_PM_OPS(dptc_pm_ops, NULL, dptc_resume);
>>> +
>>> +static int dptc_probe(struct platform_device *pdev)
>>> +{
>>> +     const struct dmi_system_id *dmi_match = dev_get_platdata(&pdev->dev);
>>> +     struct device *dev = &pdev->dev;
>>> +     struct dptc_priv *dptc;
>>> +     int i, ret;
>>> +
>>> +     dptc = devm_kzalloc(dev, sizeof(*dptc), GFP_KERNEL);
>>> +     if (!dptc)
>>> +             return -ENOMEM;
>>> +
>>> +     platform_set_drvdata(pdev, dptc);
>>> +
>>> +     ret = devm_mutex_init(dev, &dptc->lock);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     dptc->dev_limits = dmi_match->driver_data;
>>> +     dev_info(dev, "%s (%s)\n", dmi_match->ident,
>>> +              boot_cpu_data.x86_model_id);
>>> +
>>> +     dptc->fw_attr_dev = device_create(&firmware_attributes_class,
>>> +                                       NULL, MKDEV(0, 0), NULL, DRIVER_NAME);
>>> +     if (IS_ERR(dptc->fw_attr_dev))
>>> +             return PTR_ERR(dptc->fw_attr_dev);
>>> +
>>> +     ret = devm_add_action_or_reset(dev, dptc_fw_dev_unregister,
>>> +                                    dptc->fw_attr_dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     dptc->fw_attr_kset = kset_create_and_add("attributes", NULL,
>>> +                                              &dptc->fw_attr_dev->kobj);
>>> +     if (!dptc->fw_attr_kset)
>>> +             return -ENOMEM;
>>> +
>>> +     ret = devm_add_action_or_reset(dev, dptc_kset_unregister,
>>> +                                    dptc->fw_attr_kset);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     for (i = 0; i < DPTC_NUM_PARAMS; i++) {
>>> +             dptc_setup_param_sysfs(dptc, &dptc->params[i], i);
>>> +             ret = sysfs_create_group(&dptc->fw_attr_kset->kobj,
>>> +                                      &dptc->params[i].group);
>>> +             if (ret)
>>> +                     return ret;
>>> +     }
>>> +
>>> +     dptc_setup_expanded_sysfs(dptc, &dptc->expanded_attr);
>>> +     ret = sysfs_create_group(&dptc->fw_attr_kset->kobj,
>>> +                              &dptc->expanded_attr.group);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     sysfs_attr_init(&dptc->save_settings_attr.attr);
>>> +     dptc->save_settings_attr.attr.name  = "save_settings";
>>> +     dptc->save_settings_attr.attr.mode  = 0644;
>>> +     dptc->save_settings_attr.show       = dptc_save_settings_show;
>>> +     dptc->save_settings_attr.store      = dptc_save_settings_store;
>>> +     ret = sysfs_create_file(&dptc->fw_attr_kset->kobj,
>>> +                             &dptc->save_settings_attr.attr);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static struct platform_driver dptc_driver = {
>>> +     .driver = {
>>> +             .name = DRIVER_NAME,
>>> +             .pm   = pm_sleep_ptr(&dptc_pm_ops),
>>> +     },
>>> +     .probe  = dptc_probe,
>>> +};
>>> +
>>> +static int __init dptc_init(void)
>>> +{
>>> +     const struct dmi_system_id *match;
>>> +     bool soc_found = false;
>>> +     int i, ret;
>>> +
>>> +     match = dmi_first_match(dptc_dmi_table);
>>> +     if (!match)
>>> +             return -ENODEV;
>>> +
>>> +     if (!acpi_has_method(NULL, ALIB_PATH)) {
>>> +             pr_warn("ALIB method not present\n");
>>> +             return -ENODEV;
>>> +     }
>>> +
>>> +     for (i = 0; dptc_soc_table[i]; i++) {
>>> +             if (strstr(boot_cpu_data.x86_model_id,
>>> +                        dptc_soc_table[i])) {
>>> +                     soc_found = true;
>>> +                     break;
>>> +             }
>>> +     }
>>> +     if (!soc_found) {
>>> +             pr_warn("unrecognized SoC '%s'\n",
>>> +                     boot_cpu_data.x86_model_id);
>>> +             return -ENODEV;
>>> +     }
>>> +
>>> +     dptc_pdev = platform_device_register_data(NULL, DRIVER_NAME, -1,
>>> +                                               match, sizeof(*match));
>>> +     if (IS_ERR(dptc_pdev))
>>> +             return PTR_ERR(dptc_pdev);
>>> +
>>> +     ret = platform_driver_register(&dptc_driver);
>>> +     if (ret) {
>>> +             platform_device_unregister(dptc_pdev);
>>> +             return ret;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void __exit dptc_exit(void)
>>> +{
>>> +     platform_driver_unregister(&dptc_driver);
>>> +     platform_device_unregister(dptc_pdev);
>>> +}
>>> +
>>> +module_init(dptc_init);
>>> +module_exit(dptc_exit);
>>> +
>>> +MODULE_AUTHOR("Antheas Kapenekakis <lkml@antheas.dev>");
>>> +MODULE_DESCRIPTION("AMD DPTCi ACPI Driver");
>>> +MODULE_LICENSE("GPL");
>>
>>
> 

