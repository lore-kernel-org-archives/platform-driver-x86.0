Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B43CA491
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 12:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872753; cv=fail; b=BMvnhGt/bHbWux5SZ3w2Jr62mqP9SS8l5+2UI3CvnYIPrYYp8aQy62fCHFc90UP/XY1+dNQVFhikANl9ka7fB3cXY/wbluJx5qbOCIy18CE76Zcz+IM/4QtuhMd9SwgLlZXyE3yjG05eMaMitriDdYHWJXDdlt63C8A7okLZVxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872753; c=relaxed/simple;
	bh=b7KbXWLxzH+Q+5UN9Bj3xAI23jp0Yk9oJb3AYgDElrU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CqV0AALWLLwLYaHdKLzzhezoJSJJsHZfBYmUdGdBwNjBFFTYGM0Q0AH0J48Iav4XEjoOUGT0DnpkjThwqK23BuxEZaW+9j8TJDvXK6jpje/ROUE595lpmmvFdkvMdUaJgJIXLVxz3vHJlUKJ8ZPYT2qiIJ4XiC2WxwZwE/WaPaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=axxqhOKF; arc=fail smtp.client-ip=52.101.53.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="axxqhOKF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgwcctHFTLnu4DPAs0qM+xipXskXtAuJOWO6O0E87EXi/o3+iNv4Q/udBEJDzVdU+HfsSA3Id0XXQzbKoSbqaq3ZlA3LTkdDK1FUCspEHCAfOnD70Fm8Cqsqaf9BZKYZR+Q9CtVPYpWivtKuIp4drog8xiL4FryTzr8O+i+DrioTigJjQmiIh2xfsDoswUIIDBgJlCc9CoOgEcb2B/0rk2SZW5ScQ8wgLbKc3uSCXZKXsEMJfNOjQBLJ5PErtC5snd7vgssD3DnCWDgQpd84pvPeKniVEa5nRCwgr++TJrbDC5clDTC3Gto1JJNLHdqVNf6NaGC3FxHblYIFhB9ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHl2mqMLrIGqk1LD3qgdtCCf75gbgE7EBP4G6ki2qwQ=;
 b=rpQe7A29EuT+IXe4HVm0y3AZwxkRU6msUZQ/t9n73+FBISLXxwekx0ZiMtuA8hTZUTLLnY8KESqZ7QJeYtVT5w5DlxN/I1M8wj3YL4LoP8Jli4yKbi+rWRGhDMQFWF1s5dZ9a6GhR//HWTLs+V/zL65QzxYnQvyQGcH8Cn3vr4ui/bqlP44vhQowHsD2EWjpyuWhDu6SKqFi/8EK48R5zfm6a8HCkcAjdLGfSYsEpvvTVfKp2F1MvJL09HhBovoA12xQmVI4TN2fO1h6qnfZCBr7yzvQp8Nx/Fy8GbgwUwMznIE7uCWOtzDr5uyjOVkgnwI66WZPwckwyqKTRi3PvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHl2mqMLrIGqk1LD3qgdtCCf75gbgE7EBP4G6ki2qwQ=;
 b=axxqhOKFwEYqyhJKTt37hXQ0Dy5CAFMbjHM64aKA1HyBMZRQ2z510g3VEAeadpdWioCZ/XMJm0ybElIMj0V9iefiVzcRdYuissTw9dC2wsOZzGxtj2Y53jOi11fwKnlce5yMz1mmqYnodqE/yPWRyTXXXSISAz6wPfZKBsaxDo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH0PR12MB8149.namprd12.prod.outlook.com (2603:10b6:510:297::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 12:12:28 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%3]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 12:12:28 +0000
Message-ID: <21d9dd9b-0ab1-4c36-af3a-77f94afa02da@amd.com>
Date: Mon, 30 Mar 2026 17:42:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] platform/x86/amd/pmf: Add util layer and userspace
 misc device interface
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 mario.limonciello@amd.com, Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
 <20260301131124.1370565-2-Shyam-sundar.S-k@amd.com>
 <86b8f4be-dfe7-afeb-7390-17b75bf438e7@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <86b8f4be-dfe7-afeb-7390-17b75bf438e7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0219.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH0PR12MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bab255b-55c6-4212-46e8-08de8e559c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hJxCB8s02uQhFKIAsZ3FQY766F0uEJpaS699mkuyOzuPtZf9XVIv2Q/1dIPrH06u7XpVuGYWAYA6IPTcH8zf9sidmhH540e5f7It38VXsYRHaiEstRlteSDVGpvYqapRrPIahEfYDi2xfkXcRjIbxI6NwmSHTsuUgzggkDAlJI7tS9hqDD889TvU53AJ6r6F+e9ygDQy5vaTjLBhlzEwm1+tjAH+iY6oU51Yd7R0/O7SMuDV8cYiE1qiPHGbzI92iPrL/SdjYh+nZzDPpB0kw4ugmjnfxus38VBps3aev4+2bk1bZfs1ZckXTdwuwjDDuwVDFdSXMlinGFmC+UDbOZziUPZhS/m9zBIpl3e9k4T8vCayXHkhpObN/5vCwmM7C9weIWZmuoLAZT5SVNrtLxPjJtFbArGsS1GUPZHnZAvK/0UM2Uw4QI62skh54FM78gixcUHV89pwRhxKZgzXrzJBpDQZ11+c/g+E5Al7zfUDXoUoceSODHtHFl65jLcabHPKBZ9kbJOrfRQ3zWd5WuovOuArFcHuNe31pbYLxltKDL7pFbORvTjH6pXmFHEZuuZ03Xu7BjC/cYjmFe87KPr+gaWcj3TTd0kaCyDhsJl7PZhHZw0sNmmQl4grreNIGgRIbmKi6kZqvGlpLGuI2Za171MbEUNChZgtwNTfIbnhE5ygK993MF8bcr7sU9TjHX3KojfjIJ4B/UBbcUMLqUs7Y79B0bepdEUQxtgIgmo/DhPZCtiXe4lTvHFZ/TXO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVVxd3RNdG52OEovMHRacDNOdzdLVEV0UUdXMG9kRXdSQWtRNk4yM09ZaUtv?=
 =?utf-8?B?VStuWGJBSEhFN2NxOVF5S1pXbFRMQTk1YmpoQjd0c3ZxWTVlbnV1bnB0VUFK?=
 =?utf-8?B?S0xUYjd0TFU0NUFuVEovOWJZN1NhcXl1MENTMG5GWUdEQ0tlL2FJZDNoRzVY?=
 =?utf-8?B?OURWKzhCcU5aOHN3UDAzdHhKS3Z5YWRubnJCTE44UjBXWWtqRnBVQkJNcXlo?=
 =?utf-8?B?dTl2WXhjVDlISVRZUkliZUVDTGg3aC8vbysxejd1SnUySzlSSkprdUpEVm5z?=
 =?utf-8?B?QWdZUFJ0TEtLcEljZVlDSTN2eFBHNzdRNUcvdHhTM0pOMjdaeVMxYUQ4R1FQ?=
 =?utf-8?B?TkIyOXJHWlNKc0crRUtaUjlxcFJjcjFCeHNhQmhWb1JzS21CN2Z5MFJITGx2?=
 =?utf-8?B?ZXRHem4xTjhGdmFnWUtLeUwzcCtseU5lZEU4Q2d5VkRvQmF6bEprQ2lwRUlq?=
 =?utf-8?B?aW5XZ0IwWVgxUENabnBvczNQTk1ZNGpvSlh1cVBZeS81bFVHOC9LSUFacjJJ?=
 =?utf-8?B?cmwyQWNWOTgwWGhhZXJtT1dPWUc2aHR2eWZsTDRndURrNXUvR1Y4VzRKMC9J?=
 =?utf-8?B?cG9URXpGWnZCdjRlbytyMWxIbW4xc1VuMlIyL1lUaExVTFlmWTV6bVZnZFp5?=
 =?utf-8?B?Nm5ZUVN3T2ptRG5VSUN5cXdTZVRQSmQwVk1lZWNvTEdtZHBSbGEzVU1zaXlz?=
 =?utf-8?B?WkpNd2hyUUR0bWJxVkNSU2pyZElXdWVMU1VMN09Kbm1wV3lJaHlsN1RtUEY5?=
 =?utf-8?B?amhHL0NQTFpqS293QnFEWTM0WUdyTGRsalk1MTVCK05udGFXK2xsZXVCZFBx?=
 =?utf-8?B?ZjVKKzNteTZKSXJXOHo1TjdsdHpvN1Jnb2xGSzU2VjhObHNuWHl6UFlNa1pO?=
 =?utf-8?B?MmxlVVlGVm5oTFhmQkZVeWJuQW5abGZDcGZJSW82RWp6d21MM2tZZTFHVG5t?=
 =?utf-8?B?N24yb2xDdXIyQXJaOTlKd3ZJT2kzWGNGaDAyaVJNb1NPQ3orODJ6K3cyY2ZE?=
 =?utf-8?B?U0JhSWUvTmMzZHh2dlBGMVpISU80dmE1dHJGNTVmb2lRWWZ3WFFiYWxNcnFY?=
 =?utf-8?B?bmpFS0kvUkRxZk4vS1IyWGVhaDY5MTl6WUV0ZDc5MG5tRHo2OU1GV0ZlSnZX?=
 =?utf-8?B?Wm83TnlTT2V6b1ludU13c2ZwLzl2RDBCMkJrOGw2L0xOYklSMWpEQkdMZ2s0?=
 =?utf-8?B?Ymx6NnkvaUM0Kzh5V05salRUQTNqVTA4eG5jMzF0eXY0ejlBOUZ6QXdwN1Fx?=
 =?utf-8?B?OVhXQVFqTUpnZys4ZEVSNEpSLzZZUUVLK1NVRklnbFgzaGxOaG92RmdBais5?=
 =?utf-8?B?M1pLMVBCNno4MUI3cVZvZ3dmSDJ4bndJUE9pcnFwVGI0MW50cUJoS2FSbjZB?=
 =?utf-8?B?aTdwY0FnbDdpS3lNQURzTGM1STduRzdUeEtibkJYYXdEUWFaamlENEovWkdE?=
 =?utf-8?B?TUlLZ1R5Q0hTL0pTS21QL09EaFZvNWNHc1o4N0x1WkU3RC9GcXRpZER3QkVv?=
 =?utf-8?B?cFpGOWZsQ29oRDE2NzBQOXhmMHBjWlIxdkNuWWd5aXduMHVWME1qM2ttMnJQ?=
 =?utf-8?B?Q2tuWXhWN3ZVQlkzYnBVM05KbFVMbk8xVzhSeC95eHZvMm5wTTlBRDJjS3lV?=
 =?utf-8?B?TlRabWVieXJodW9BblE4ZW4yVWhsUXJ1Si84RUxNVHRDMHlqNzNSNEFhRnpZ?=
 =?utf-8?B?emVqSFlycDRBdVZlYUFyUzdPWW9PQlI4QUFVRnhPbk01NW9qNUJxaHBjbmNV?=
 =?utf-8?B?eG9WL2QwQVl3djc5TkZJeTBYU0tzbExvVytZMWZsMUczQ21MUkdWb1E1UFJz?=
 =?utf-8?B?ekdKa0wxd2tOUlpnMWNOUVQxL2V0UUtlMHVsdVh3dVlKZjdXRkNEUUxvclhm?=
 =?utf-8?B?a1J0RzQ1K1AzWUxhYk85OHEwdHYzOUZZL20vMXlNU2FydmJib1laRzBTZWpj?=
 =?utf-8?B?ZGE3S3F5N3hxeVQ5THhUUlFjVjdxams2aXdmTXViMzBHdU5MZzVYeXh0Und6?=
 =?utf-8?B?aEFxSU9zUmI1Vk4zQllNMXRYdjlxQy9mcTBuSTZTU1YwLzArYzVRTjJKdGlj?=
 =?utf-8?B?Vm4rdTJXb0NET3puYUJucXpSOWZjeS9QNFJOQVpBd2RNMWpUanBDQlErNWZr?=
 =?utf-8?B?UW9iT2M4YXBCK3dZN25GbG9iWVJhdG5NN2drZUpRMlB2S0NCSlUrS0kvRDhI?=
 =?utf-8?B?dk1xZmVXNm4xd3IzRlQyM1RmQ3BqRVZMVnlvWUZWcmphdVY4ZXkxM2JXdkcz?=
 =?utf-8?B?NWUrZmFnRndBU0IvRU1FK2R6bkE0bjdkV0ZPS1BBMmRsTG1EcjJ0M2pVRnoz?=
 =?utf-8?B?RXBhU3NQTVgvWDBvUHhaZkY0aTVaSGRZTHNvUnVuVlFURG85cmdpZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bab255b-55c6-4212-46e8-08de8e559c69
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 12:12:28.5376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3DsKK4Kvful1YmFezdaOVNGc1ogcypfm2+JULEiuq+jWD/tBDRChDCZog1imnVw5g52NbRs9/fK2nCGtlA2/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8149

Hi Ilpo,

Ack to all the comments in the series.

On 3/25/2026 19:35, Ilpo Järvinen wrote:
> On Sun, 1 Mar 2026, Shyam Sundar S K wrote:
> 
>> Add a util layer to AMD PMF that exposes a minimal userspace interface
>> via a misc character device for metrics monitoring and feature discovery.
>>
>> This creates /dev/amdpmf_interface with basic ioctl support to retrieve
>> PMF metrics such as:
>> *Power source and power slider position
>> *Platform type, lid state, and user presence
>> *Skin temperature and ambient light
>> *BIOS input parameters (1-10)
>> *Graphics workload metrics
>> *CPU C-state residency (average and maximum)
>> *Socket power consumption
>>
>> The interface enables smoother integration with userspace tools such as
>> AMD SystemDeck [1], which is widely used for monitoring and controlling
>> power and thermal behavior on AMD platforms. These tools help designers
>> keep major components within thermal limits to ensure proper operation
>> and enhance overall system stability and reliability.
>>
>> The feature is gated behind the CONFIG_AMD_PMF_UTIL_SUPPORT Kconfig
>> option, allowing it to be disabled if not needed. The implementation
>> uses existing PMF infrastructure to populate data from the TA (Trusted
>> Application) shared memory buffer.
>>
>> Link: https://docs.amd.com/v/u/en-US/68773_0.50 [1]
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/Kconfig  |  10 ++
>>  drivers/platform/x86/amd/pmf/Makefile |   2 +
>>  drivers/platform/x86/amd/pmf/core.c   |   5 +
>>  drivers/platform/x86/amd/pmf/pmf.h    |   9 ++
>>  drivers/platform/x86/amd/pmf/util.c   | 174 ++++++++++++++++++++++++++
>>  include/uapi/linux/amd-pmf.h          | 115 +++++++++++++++++
>>  6 files changed, 315 insertions(+)
>>  create mode 100644 drivers/platform/x86/amd/pmf/util.c
>>  create mode 100644 include/uapi/linux/amd-pmf.h
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
>> index 25b8f7ae3abd..ad21f679b8ab 100644
>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>> @@ -30,3 +30,13 @@ config AMD_PMF_DEBUG
>>  	 in the PMF config store.
>>  
>>  	 Say Y here to enable more debug logs and Say N here if you are not sure.
>> +
>> +config AMD_PMF_UTIL_SUPPORT
>> +	bool "AMD PMF Util layer support"
>> +	depends on AMD_PMF
>> +	help
>> +	Enabling this option provides a character device for userspace to capture
>> +	PMF features (Smart PC Builder, Auto Mode, Static Power Slider, Dynamic
>> +	Power Slider AC/DC) along with PMF metrics from the AMD PMF driver.
>> +
>> +	Say Y here to enable it and Say N here if you are not sure.
>> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
>> index 5978464e0eb7..bf7aad80b9e9 100644
>> --- a/drivers/platform/x86/amd/pmf/Makefile
>> +++ b/drivers/platform/x86/amd/pmf/Makefile
>> @@ -8,3 +8,5 @@ obj-$(CONFIG_AMD_PMF)		+= amd-pmf.o
>>  amd-pmf-y 			:= core.o acpi.o sps.o \
>>  				   auto-mode.o cnqf.o \
>>  				   tee-if.o spc.o
>> +# Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
>> +amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) += util.o
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index b9e5a2cf3aae..919d02f30aae 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -634,6 +634,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>  
>>  	pmf_device = dev->dev;
>>  
>> +	err = amd_pmf_cdev_register(dev);
>> +	if (err)
>> +		dev_warn(dev->dev, "failed to register util interface: %d\n", err);
>> +
>>  	dev_info(dev->dev, "registered PMF device successfully\n");
>>  
>>  	return 0;
>> @@ -646,6 +650,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
>>  	amd_pmf_deinit_features(dev);
>>  	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>>  		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
>> +	amd_pmf_cdev_unregister();
>>  	apmf_acpi_deinit(dev);
>>  	amd_pmf_dbgfs_unregister(dev);
>>  }
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 69fef7448744..6f61076a9386 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -928,4 +928,13 @@ int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
>>  void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
>>  int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev);
>>  
>> +/* Util Layer */
>> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
>> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev);
>> +void amd_pmf_cdev_unregister(void);
>> +#else
>> +static inline int amd_pmf_cdev_register(struct amd_pmf_dev *dev) { return 0; }
>> +static inline void amd_pmf_cdev_unregister(void) {}
>> +#endif
>> +
>>  #endif /* PMF_H */
>> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
>> new file mode 100644
>> index 000000000000..c6837caa44e0
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmf/util.c
>> @@ -0,0 +1,174 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * AMD Platform Management Framework Util Layer
>> + *
>> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + *			 Sanket Goswami <Sanket.Goswami@amd.com>
>> + */
>> +
>> +#include <linux/amd-pmf.h>
>> +#include <linux/miscdevice.h>
>> +#include <linux/mutex.h>
>> +#include <linux/uaccess.h>
>> +
>> +#include "pmf.h"
>> +
>> +/* Convert BIOS input control code to array index (0-9) */
>> +static int amd_pmf_get_bios_idx(u32 control_code)
>> +{
>> +	if (control_code >= IOCTL_BIOS_INPUT_1 && control_code <= IOCTL_BIOS_INPUT_10)
>> +		return control_code - IOCTL_BIOS_INPUT_1;
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static long long amd_pmf_populate_bios_input(struct ta_pmf_enact_table *in, u32 control_code)
>> +{
>> +	u32 idx;
>> +
>> +	idx = amd_pmf_get_bios_idx(control_code);
>> +
>> +	return (idx < 2) ? in->ev_info.bios_input_1[idx] : in->ev_info.bios_input_2[idx - 2];
>> +}
>> +
>> +static long long amd_pmf_device_state(struct ta_pmf_enact_table *in, u32 control_code)
>> +{
>> +	switch (control_code) {
>> +	case IOCTL_PLATFORM_TYPE:
>> +		return in->ev_info.platform_type;
>> +	case IOCTL_LAPTOP_PLACEMENT:
>> +		return in->ev_info.device_state;
>> +	case IOCTL_LID_STATE:
>> +		return in->ev_info.lid_state;
>> +	case IOCTL_USER_PRESENCE:
>> +		return in->ev_info.user_present;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static int amd_pmf_populate_data(struct device *dev, void __user *argp)
>> +{
>> +	struct amd_pmf_ioctl_info output = {0};
>> +	struct ta_pmf_shared_memory *ta_sm = NULL;
>> +	struct ta_pmf_enact_table *in = NULL;
>> +	struct amd_pmf_dev *pdev;
>> +
>> +	pdev = dev_get_drvdata(dev);
>> +	if (!pdev)
>> +		return -EINVAL;
>> +
>> +	memset(pdev->shbuf, 0, pdev->policy_sz);
>> +	ta_sm = pdev->shbuf;
>> +	in = &ta_sm->pmf_input.enact_table;
>> +
>> +	if (copy_from_user(&output, argp, sizeof(output)))
>> +		return -EFAULT;
>> +
>> +	switch (output.control_code) {
>> +	case IOCTL_POWER_SOURCE:
>> +		output.val = in->ev_info.power_source;
>> +		break;
>> +	case IOCTL_POWER_SLIDER_POSITION:
>> +		output.val = in->ev_info.power_slider;
>> +		break;
>> +	case IOCTL_SKIN_TEMP:
>> +		/* Convert from centi-degrees to degrees Celsius */
>> +		output.val = in->ev_info.skin_temperature / 100;
>> +		break;
>> +	case IOCTL_PLATFORM_TYPE ... IOCTL_LID_STATE:
>> +	case IOCTL_USER_PRESENCE:
>> +		output.val = amd_pmf_device_state(in, output.control_code);
>> +		break;
>> +	case IOCTL_BIOS_INPUT_1 ... IOCTL_BIOS_INPUT_10:
>> +		output.val = amd_pmf_populate_bios_input(in, output.control_code);
>> +		break;
>> +	case IOCTL_GFX_WORKLOAD:
>> +		output.val = in->ev_info.gfx_busy;
>> +		break;
>> +	case IOCTL_AMBIENT_LIGHT:
>> +		output.val = in->ev_info.ambient_light;
>> +		break;
>> +	case IOCTL_AVG_C0_RES:
>> +		output.val = in->ev_info.avg_c0residency;
>> +		break;
>> +	case IOCTL_MAX_C0_RES:
>> +		output.val = in->ev_info.max_c0residency;
>> +		break;
>> +	case IOCTL_SOCKET_POWER:
>> +		output.val = in->ev_info.socket_power;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (copy_to_user(argp, &output, sizeof(output)))
>> +		return -EFAULT;
>> +
>> +	return 0;
>> +}
>> +
>> +#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
>> +static struct amd_pmf_dev *pmf_dev_handle;
>> +static DEFINE_MUTEX(pmf_util_lock);
>> +
>> +static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>> +{
>> +	struct amd_pmf_dev *pdev = filp->private_data;
>> +	void __user *argp = (void __user *)arg;
>> +
>> +	if (cmd != IOCTL_PMF_POPULATE_DATA)
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&pmf_util_lock);
>> +	return amd_pmf_populate_data(pdev->dev, argp);
>> +}
>> +
>> +static int amd_pmf_open(struct inode *inode, struct file *filp)
>> +{
>> +	guard(mutex)(&pmf_util_lock);
>> +	if (!pmf_dev_handle)
>> +		return -ENODEV;
>> +
>> +	filp->private_data = pmf_dev_handle;
>> +	return 0;
>> +}
>> +
>> +static const struct file_operations pmf_if_ops = {
>> +	.owner          = THIS_MODULE,
>> +	.open           = amd_pmf_open,
>> +	.unlocked_ioctl = amd_pmf_set_ioctl,
>> +};
>> +
>> +static struct miscdevice amd_pmf_util_if = {
>> +	.minor		= MISC_DYNAMIC_MINOR,
>> +	.name		= "amdpmf_interface",
>> +	.fops		= &pmf_if_ops,
>> +};
>> +
>> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev)
>> +{
>> +	int ret;
>> +
>> +	guard(mutex)(&pmf_util_lock);
>> +	pmf_dev_handle = dev;
>> +	ret = misc_register(&amd_pmf_util_if);
>> +	if (ret)
>> +		pmf_dev_handle = NULL;
>> +
>> +	return ret;
>> +}
>> +
>> +void amd_pmf_cdev_unregister(void)
>> +{
>> +	guard(mutex)(&pmf_util_lock);
>> +	pmf_dev_handle = NULL;
>> +	misc_deregister(&amd_pmf_util_if);
>> +}
>> +#else
>> +int amd_pmf_cdev_register(struct amd_pmf_dev *dev) { return 0; }
>> +void amd_pmf_cdev_unregister(void) {}
>> +#endif
>> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
>> new file mode 100644
>> index 000000000000..d29431c67eaa
>> --- /dev/null
>> +++ b/include/uapi/linux/amd-pmf.h
>> @@ -0,0 +1,115 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
>> +/*
>> + * AMD Platform Management Framework (PMF) UAPI Header
>> + *
>> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * This file defines the user-space API for interacting with the AMD PMF
>> + * driver. It provides ioctl interfaces to query platform-specific metrics
>> + * such as power source, slider position, platform type, laptop placement,
>> + * and various BIOS input/output parameters.
>> + */
>> +
>> +#ifndef _UAPI_LINUX_AMD_PMF_H
>> +#define _UAPI_LINUX_AMD_PMF_H
>> +
>> +#include <linux/ioctl.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * AMD_PMF_IOC_MAGIC - Magic number for AMD PMF ioctl commands
>> + *
>> + * This magic number uniquely identifies AMD PMF ioctl operations.
>> + */
>> +#define AMD_PMF_IOC_MAGIC	'p'
>> +
>> +/**
>> + * IOCTL_PMF_POPULATE_DATA - ioctl command to retrieve PMF metrics data
>> + *
>> + * This ioctl command is used to populate the amd_pmf_ioctl_info structure
>> + * with the requested metrics data based on the control_code provided.
>> + */
>> +#define IOCTL_PMF_POPULATE_DATA		_IOWR(AMD_PMF_IOC_MAGIC, 0x00, struct amd_pmf_ioctl_info)
>> +
>> +/**
>> + * enum pmf_ioctl_id - Control codes for PMF ioctl operations
>> + * @IOCTL_POWER_SOURCE: Query current power source (AC/DC)
>> + * @IOCTL_POWER_SLIDER_POSITION: Query current power slider position
>> + * @IOCTL_PLATFORM_TYPE: Query current platform/form factor type
>> + * @IOCTL_LAPTOP_PLACEMENT: Query laptop physical placement state
>> + * @IOCTL_LID_STATE: Query laptop lid open/close state
>> + * @IOCTL_HETERO_STATE: Query heterogeneous computing state
>> + * @IOCTL_SKIN_TEMP: Query skin temperature sensor reading
>> + * @IOCTL_USER_PRESENCE: Query user presence detection state
>> + * @IOCTL_DISPLAY_NUM: Query number of active displays
>> + * @IOCTL_USER_ENGAGED: Query user engagement state
>> + * @IOCTL_BIOS_INPUT_1: Query BIOS input parameter 1
>> + * @IOCTL_BIOS_INPUT_2: Query BIOS input parameter 2
>> + * @IOCTL_BIOS_INPUT_3: Query BIOS input parameter 3
>> + * @IOCTL_BIOS_INPUT_4: Query BIOS input parameter 4
>> + * @IOCTL_BIOS_INPUT_5: Query BIOS input parameter 5
>> + * @IOCTL_BIOS_INPUT_6: Query BIOS input parameter 6
>> + * @IOCTL_BIOS_INPUT_7: Query BIOS input parameter 7
>> + * @IOCTL_BIOS_INPUT_8: Query BIOS input parameter 8
>> + * @IOCTL_BIOS_INPUT_9: Query BIOS input parameter 9
>> + * @IOCTL_BIOS_INPUT_10: Query BIOS input parameter 10
>> + * @IOCTL_GFX_WORKLOAD: Query current graphics workload type
>> + * @IOCTL_AMBIENT_LIGHT: Query ambient light sensor reading
>> + * @IOCTL_AVG_C0_RES: Query average C0 residency
>> + * @IOCTL_MAX_C0_RES: Query maximum C0 residency
>> + * @IOCTL_SOCKET_POWER: Query current socket power consumption
>> + * @IOCTL_TA_BIN_VER: Query Trusted Application binary version
>> + *
>> + * These control codes are used with the IOCTL_PMF_POPULATE_DATA ioctl
>> + * to specify which metrics data to retrieve from the AMD PMF driver.
>> + */
>> +enum pmf_ioctl_id {
>> +	IOCTL_POWER_SOURCE,
>> +	IOCTL_POWER_SLIDER_POSITION,
>> +	IOCTL_PLATFORM_TYPE,
>> +	IOCTL_LAPTOP_PLACEMENT,
>> +	IOCTL_LID_STATE,
>> +	IOCTL_HETERO_STATE,
>> +	IOCTL_SKIN_TEMP,
>> +	IOCTL_USER_PRESENCE,
>> +	IOCTL_DISPLAY_NUM,
>> +	IOCTL_USER_ENGAGED,
>> +	IOCTL_BIOS_INPUT_1,
>> +	IOCTL_BIOS_INPUT_2,
>> +	IOCTL_BIOS_INPUT_3,
>> +	IOCTL_BIOS_INPUT_4,
>> +	IOCTL_BIOS_INPUT_5,
>> +	IOCTL_BIOS_INPUT_6,
>> +	IOCTL_BIOS_INPUT_7,
>> +	IOCTL_BIOS_INPUT_8,
>> +	IOCTL_BIOS_INPUT_9,
>> +	IOCTL_BIOS_INPUT_10,
>> +	IOCTL_GFX_WORKLOAD,
>> +	IOCTL_AMBIENT_LIGHT = 29,
>> +	IOCTL_AVG_C0_RES = 36,
>> +	IOCTL_MAX_C0_RES,
>> +	IOCTL_SOCKET_POWER = 50,
>> +	IOCTL_TA_BIN_VER
>> +};
>> +
>> +/**
>> + * struct amd_pmf_ioctl_info - Structure for PMF ioctl data exchange
>> + * @control_code: Input parameter specifying which data to query (enum pmf_ioctl_id)
>> + * @feature_supported: Output flag indicating if the queried feature is supported
>> + * @feature_version: Output field containing the feature version number
>> + * @val: Output field containing the queried value
>> + *
>> + * This structure is used with the IOCTL_PMF_POPULATE_DATA ioctl command
>> + * to exchange data between user space and the AMD PMF kernel driver.
>> + * The user provides the control_code to specify the query type, and the
>> + * driver populates the remaining fields with the response data.
>> + */
>> +struct amd_pmf_ioctl_info {
>> +	int control_code; /* In */
>> +	bool feature_supported; /* Out */
>> +	unsigned long feature_version; /* Out */
>> +	long long val; /* Out */
> 
> I somehow seem to now recall that Hans suggested that the interface should 
> be a struct which encodes many/all values...
> 
> Yes, it seems so. This is what he said:
> 
> https://lore.kernel.org/all/6104959e-0214-492d-8ceb-c7376d3b1121@kernel.org/
> 
> 

Double chekcing - You mean to say, I should move the enum members into
the amd_pmf_ioctl_info struct? i.e.

struct amd_pmf_ioctl_info {
    /* Size field for versioning - must be first */
    u64 size;

    /* Version and feature info */
    __u32 version;
    __u32 features_supported;
    __u32 features_enabled;
    __u32 platform_type;

    /* Power and state info */
    __u32 power_source;
    __u32 laptop_placement;
    __u32 lid_state;
    __u32 user_presence;
    __u32 slider_position;

    /* Thermal and power metrics */
    __s32 skin_temp;
    __u32 gfx_busy;
    __s32 ambient_light;
    __u32 avg_c0_residency;
    __u32 max_c0_residency;
    __u32 socket_power;

...

    /* BIOS parameters */
    __s64 bios_input[10];
    __s64 bios_output[10];

...

    /* Reserved for future expansion */
    __u64 reserved[8];
};

Thanks,
Shyam
