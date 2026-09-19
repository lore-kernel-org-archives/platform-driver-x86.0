Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446127466A;
	Sat, 19 Sep 2026 05:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795975; cv=fail; b=CqqirJd2BaX0sWsKxRkuejRy0WgN/heqV+Y69D/84q8k4wek2vl0gTk/t0VK9RelR+BjfunYVd7/tNO2yjjRK1iqQ1Zlg3sbUqU5kzUvmURhGX3ToGc7RBeZZxL6th+3FcLuyZI9pK1yHDB7iaLvh5xt7xPpvPrDLdPFsZu/QiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795975; c=relaxed/simple;
	bh=laPXdNz49ViXaDucp3qcGiBExVrqMCyzAw+wQ55uRlA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tt0tsWps02smX0o8ThNvbNq73DEtEFjIPcdjV5vdeEfgculX4LRW2i/f2uUevtF1QfE7CvlpTjMLdHG9uMbGSottgIjuyl5to+X3YcKsiJsPYn8l9Obd5r5Xef5WVTGGzXS1Cyf4qy31tEuf8QromsR9/dtCadGzHxWdFVOS3ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EowaOBL/; arc=fail smtp.client-ip=52.101.56.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EowaOBL/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDf63Lr54/wtop4imcT6gaI1tAT+Z/LaUxIoZzPt7PclCxy0mqnlSzrHBvCYNfrI4THVaso6LnpZtTItwILS3DRSHC/QA3IMec1N/sJCSHK7fqNwd4EJxJPoFALroPHvyyUVLjCTJZbRb8uA8kcTgX7mkJPo/alDAj2HEgTCfwQAoIwCjanRp24Dwz8MrboZSz1Y46wmN+3/MpL9MOE7321bigLjm90U2IPrLbTINHLU+BOIIT4/84kaJ6rnwuO/t2r5H3Xe0LqQAaSN9IxgvPOr62pwIF5HSWVOCI+pBcskUPGCoXSZHY5/vFW9BrH1Fm7+lrdhsEeron05kdYA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL3EXUL5WFUFFn4wwQMs/kZqYdU6LedGEGT7HpkgI4E=;
 b=rt1JNgnwEYjupig0R5QXfu+msB0xhmeqHX9V20JhoOz4MkVXQFjfM/KlRFbpvgZWjOjF1ZnU4tXQB7HpkkNfRP/OlEfUHwvSlZM6YZ+Ce/li7k+wyRR3T198dbKXs7Y4wXZDLhPSkoZa3qscsqDLuA2GBAbJdm32MV6mvA5O3237bN3PGgvrzqXYqzCLQyRGMnfgW8lOmwuTV/ut+i90vs4shTjZ0A80Mj666ixKqFq+2cfLAW2Fx1tirmsMPhw50TTk9LGOHo5xyyQsb0fptZZGFTXLSKZLVVH9IzjW/B63nUpYKAWNpbqHTHLyO7JsL8OumF/t5cVQOKg1Z/yrgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZL3EXUL5WFUFFn4wwQMs/kZqYdU6LedGEGT7HpkgI4E=;
 b=EowaOBL/dLC5tj4zds/XhHt8Ly6kLs0RSB2dya30jFj14+xctIdtn6evjeaGQgwxaXdsFqQ2OeXKtWJ4SEr3A2TJJYzZDNn1uTETxTiJd4rt5b0mkph1rexbYEPrQ2/Tr4gLbTTCuKojM7h7XZcBT4iyl/o+Hrei01wJNnlASio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Sat, 19 Sep
 2026 05:32:50 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%5]) with mapi id 15.21.0406.007; Sat, 19 Sep 2026
 05:32:50 +0000
Message-ID: <d3e9e152-07b0-4672-aa97-018c7da236f3@amd.com>
Date: Sat, 19 Sep 2026 11:02:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] platform/x86/amd/hsmp: Add HSMP client support for
 Family 1Ah
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: Mario.Limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Mario Limonciello <superm1@kernel.org>
References: <20260901045134.2833282-1-muralidhara.mk@amd.com>
 <20260901045134.2833282-2-muralidhara.mk@amd.com>
 <f700dbe0-707b-c43d-b7c2-2962662340f2@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <f700dbe0-707b-c43d-b7c2-2962662340f2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYP287CA0092.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b8::6) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 491a32cf-abe9-49f5-4ad5-08df160f71da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|4143699003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ECz/gXlDD7h0Ud1nlkWnO0r6DqLktkZMMjbjIZL0bVH/udERu7Ti6IZ/GrTeVy4qizZBfTAcgWRN2A0zmS4L8OZiC7r0s/EzWG3UHW0IjQWAGd8FVYeu7lM7gehWxLXuAtFLgMHFS4gyOmGe/j4O3BHDWaUC36s9+dlMEDy8wMo0zkxtcbBtwzf5KHqkhQ3ys580JcOyj+EOsG1+GcjRQSmodKXpHEdV8dO1COCBAe0+y3c/GJILJLCi4kHLMKlPzW0xWSxJpcgNL/Fsxx27a2V28OVKuahbPmO3PwVDMGKODgSbjX+LUETXzUoCBNyNRfdNn36CC/7Hrq/eT6BF9W1tp4I/MItZR0XgySUqINdmZfHbqVipDcSzLOfgVs4NLWscTTbQmGjAdDn48vFgTMgPO+yZLWEpVDPnw6CdE/PImDWyGBoL7CYuE281DlAPOvGAyegqmN8AccRWoijFDRN54bAAfo5bVXfI9EpwhZ/m7Vhp87xcSIRe1/FASMiSoatn2VoCNBjaWe1SA77JmaqFjoucnGHGJulX80YrL9C+c/jQ1UyMqdvkX31x1UUgaIvcqo8uclgrP38dAGSGcUaBBh/ks3FsE1CTcb8BfLuHzZuM7tHpDsPgR1FTk8FUWHAMoMOQ+V21ESuWWGPQfQRGNMQI43VHd0bRxxJPtPc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enhvZzE1SURPaitGTDNiMjJMZ1BIalpuYzNJZG9lZDNMUUcwK0tyY05zeGJN?=
 =?utf-8?B?VC8vMXUwTzRrNHQ0aHZWY21Fa3lsTEZZT29YN1U0TEdZcXJIZFV0OStwQXFL?=
 =?utf-8?B?U0wyUFJ5N0Zod2RWZTA1VXVlWWNWaFdLdEF6dGF6MWloZHhqVWZqTS9uRXVa?=
 =?utf-8?B?MEcvZkJWVGEyWCt0TXVxamdVRElrYm41dXdzVkRKUE0yTi8ySUxyR1JjWnAy?=
 =?utf-8?B?QVF2U3FFRlFLelpRZ2IwTFJlQ2M4RFk3SndURUJjRjJwSVdKT1JvNUJWVjY4?=
 =?utf-8?B?Tkx5YTdZRDhQNlptVjh1UFFNYmRKSm4rSW93QzJ3eENkR1g0QVRteVJIbkNM?=
 =?utf-8?B?MDVkZnFiU0xXekFKMG9PVC91YzdYSHdYVW8xWG1ORHJ0OVVDdGdxRWNQUVQz?=
 =?utf-8?B?THBEOC8wRVd3SFFhenBmSkM5WUpWQ1hBWlhCTUt0Z0JmbEtDNkxDYmVPTmQx?=
 =?utf-8?B?ZGpKNUtsL05iZzRZVDE2eFRGWE13UjZ2SCtuWjl5SUl2a1h0RzIwVko2MWN5?=
 =?utf-8?B?dUpZME9Vank4eU1lWHVkelFpWS9HbllLSzJhNVJSSTdzNG93Kzl5UEJ4b01u?=
 =?utf-8?B?Ny9qeUJxQlI4aUJLZHlLa1VLU1g1cUxQN2N4OGRHMERjNmd1RHpNL0o4ZlRN?=
 =?utf-8?B?S1N2aVduU0hjZVVJUk5yZnFPQURzUlA4Ky8vd2E4NDNia1FmWWVlbzdza0ZE?=
 =?utf-8?B?cGRhVG96SmNaSjlVNXVtWGxEeXRxVEZQaVl2SW5hcGdHYm5XRDJ1Y3lkdHF2?=
 =?utf-8?B?c1Rld3QxcC8xb2ZlRTlPM1lYMTI2cWQ0U0ZSS21SNVNYa1lpbUJXdERQdnJa?=
 =?utf-8?B?b05Vck0vaU5wMGN2eGJ0bVdwZ2xzdnhtL0VVSGpHZVM4dUJwVHcram96a2w1?=
 =?utf-8?B?aXdmZG5sNmk5NWJMcSt4SytiV3J6RzlPcm1RRWlhZ1NEdExqREx2Yzdyemxs?=
 =?utf-8?B?aFFMd2VSYUFGZ29YU2tRRWg4S2s0SHk1anBSVUhWL2hnSC9xWjNUaUlsTWpJ?=
 =?utf-8?B?SUk3VEVKWEZmTmRZM3ZKZzJNd0tTZFNJU0FLUWRucWN4OFAzTFliQlRPeUtL?=
 =?utf-8?B?SUlvSUxLdWpQR01NSEwyQnRtbkl0M3FSSXM2T0xyZW8vR3IwbTNnUHNiSXhM?=
 =?utf-8?B?NnJwVEpWZythQUV2RG9xelhrNWJDRzlTaUFVNEE1Rzlydm1saWJtM3BLNVp1?=
 =?utf-8?B?WUhrM04vTFE3Q3dtY1ozNFZvTzR5MGIvRk1NZkxhTVNVajVtaVpFTHloSm5P?=
 =?utf-8?B?Yi9pRGhheHZLbTFUZzF2WmI1aDBOMlJRMC9sMnhKaEJKS3JZWldFbFh3d0tl?=
 =?utf-8?B?eFVkQkJONjl0cm9FNFRpREdvblZoTWdDczkvU08xRHZSeVE5ZkN6RUNxL3d0?=
 =?utf-8?B?a25iL3hFZXNkZHFiRUdNSGVuRWxHZjAvNW5mVk1iSkE1RHRWWVoraDJrVzhp?=
 =?utf-8?B?bXY4dW9YUDV6eXpiZFg3Q0hHR29oTnpCYStldFNvMDg3bkxWZFBxamhHMHk2?=
 =?utf-8?B?U3NYV2o2MjVOUG5heWdQR1pRdUEySzRFaWxHdS84UGJyQWFEcy82QVh4QUkw?=
 =?utf-8?B?b3phQWxHQTNIY3pReE1qRnZ4VnYrY2dySitpcVJMdllLTlBEVFQ5WmYvajlP?=
 =?utf-8?B?THdmLzV4eGd0S3A0ZXhvSzh0cWlSVlFJdFZtSndIYVBZQXFSMFBrN0ZGWE5Q?=
 =?utf-8?B?THEzQXFQSm1qNUcwUnk5cUVaTGlaT3I4SnJjMnZTYXhXb3djNHYxSmpEY3Av?=
 =?utf-8?B?TmtOT0piWU1WbDdmcVpSUnF6Tm9icXc5N0RFSytwZWVRbnVCUHplOEJiVWVh?=
 =?utf-8?B?ZkpEaDlQajFsRGNRYW9GREV1R1VieC9jL0ZoSzF3dDJ0QkdFRzZ2bnNRUjNH?=
 =?utf-8?B?VlJ3UVZuQnQrdGo1cmNoaE1EalI1cUlJT29uaDB5ZWdocnJTRHVJWnVJTGxB?=
 =?utf-8?B?UTQ5ZnFGS0xzaGEyS0t2blUyZk1SRWE1YVBtSVdMeHhxWUUxdzRMNTFydko2?=
 =?utf-8?B?MmRmT0RxdTZHVEw5SHpWWWowaUtNWUc2WDlKaVdFa0E4eE41MTVQbGZuOEU2?=
 =?utf-8?B?NHJWRHhMeHQxMEpyczhVbVM3ZnJ4b2ptM2NGK2FoL0U5UC9lWHR6dS9yWW1C?=
 =?utf-8?B?TzhJa2JFSkc3SW5PVm9oL1U5NXpXVkNhY1lHZDd5MXRmRkp0SjFuUEVkTGJD?=
 =?utf-8?B?eW5OM1FsYmJuaHRUVHZOdkwwWW1sU2VzZnpIdTlJajlvRUZ2R3hRRWRrZkVq?=
 =?utf-8?B?cEFBVUVlYXRQdm42VTZxdS94TDZrbzBEbmxKV0NBNDkvdkVteitiRm5XSkpi?=
 =?utf-8?Q?ASB5mXBB1AE8Co45Z/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 491a32cf-abe9-49f5-4ad5-08df160f71da
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 05:32:50.3893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ir6Ofj0asm2zEnJLFbrS2ggscgDZbid2Z8JkCXd3xhPm9zcN1IZBiDzrgoi088UUk2LdoaIwCjJ5gMFzndrgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359



On 9/18/2026 5:04 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, 1 Sep 2026, Muralidhara M K wrote:
> 
>> Enable the HSMP driver on the Family 1Ah client platforms, Models
>> 80h-8Fh and E0h-E3h. These parts speak the Ryzen Master SMC (RMSMC)
>> message set instead of the server HSMP messages, but describe their
>> mailbox via ACPI _CRS/_DSD the same way a server socket does, so only
>> the ACPI driver needs to probe them.
>>
>> Add the client message set to the UAPI header and its descriptor
>> table to the driver. struct hsmp_plat_desc picks the right table and
>> driver-issued message IDs once per boot based on the ACPI-reported PM
>> profile, which tells client and server apart without pinning the
>> driver to a fixed set of family/model ranges. Document the client
>> models in amd_hsmp.rst.
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   Documentation/arch/x86/amd_hsmp.rst  |  10 +-
>>   arch/x86/include/uapi/asm/amd_hsmp.h | 135 ++++++++++++++
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 255 ++++++++++++++++++++++++---
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  27 +++
>>   4 files changed, 398 insertions(+), 29 deletions(-)
>>
>> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
>> index fa1fc240e212..b95f09945193 100644
>> --- a/Documentation/arch/x86/amd_hsmp.rst
>> +++ b/Documentation/arch/x86/amd_hsmp.rst
>> @@ -8,6 +8,13 @@ Newer Fam19h(model 0x00-0x1f, 0x30-0x3f, 0x90-0x9f, 0xa0-0xaf),
>>   Fam1Ah(model 0x00-0x1f) EPYC server line of processors from AMD support
>>   system management functionality via HSMP (Host System Management Port).
>>
>> +The Fam1Ah(model 0x80-0x8f, 0xe0-0xe3) client line of processors is
>> +supported as well. Those models share one mailbox and speak the Ryzen
>> +Master SMC message set instead of the server HSMP message set, so the
>> +message IDs accepted on them are the HSMP_CLIENT_* ones listed in
>> +arch/x86/include/uapi/asm/amd_hsmp.h. The character device and ioctl
>> +interface described below are the same.
>> +
>>   The Host System Management Port (HSMP) is an interface to provide
>>   OS-level software with access to system management functions via a
>>   set of mailbox registers.
>> @@ -17,7 +24,8 @@ More details on the interface can be found in chapter
>>   Eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
>>
>>
>> -HSMP interface is supported on EPYC line of server CPUs and MI300A (APU).
>> +HSMP interface is supported on EPYC line of server CPUs, MI300A (APU) and
>> +the Fam1Ah client models listed above.
>>
>>
>>   HSMP device
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index eda336bfd3e9..00ca7855ca00 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -664,4 +664,139 @@ struct hsmp_telemetry_data {
>>   #define HSMP_IOCTL_GET_TELEMETRY_DATA \
>>        _IOW(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
>>
>> +/**
>> + * enum hsmp_client_message_ids - Ryzen Master SMC (RMSMC) message IDs
>> + * @HSMP_CLIENT_TEST: 01h. Test message. input: args[0] = xx. output:
>> + *   args[0] = xx + 1.
>> + * @HSMP_CLIENT_GET_SMU_VER: 02h. Get MP1 firmware version. output:
>> + *   args[0] = MP1 firmware version.
>> + * @HSMP_CLIENT_GET_INTERFACE_VER: 03h. Get interface version. output:
>> + *   args[0] = interface version.
>> + * @HSMP_CLIENT_GET_METRICS_TABLE_VER: 04h. Get metrics table version.
>> + *   output: args[0] = metrics table version.
>> + * @HSMP_CLIENT_GET_METRICS_TABLE: 05h. Get metrics table. No arguments.
>> + *   Success means firmware has written the metrics table to the DRAM
>> + *   address reported by @HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR.
>> + * @HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR: 06h. Get metrics table DRAM
>> + *   address. output: args[0] = address[31:0], args[1] = address[63:32],
>> + *   args[2] = table size in bytes.
>> + * @HSMP_CLIENT_SET_CORE_PSM_MARGIN: 07h. Set core voltage margin. input:
>> + *   args[0] = ApicId[31:16] + margin in mV[15:0].
>> + * @HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN: 08h. Set voltage margin for all
>> + *   cores. input: args[0] = margin in mV[15:0].
>> + * @HSMP_CLIENT_SET_FAST_PPT_LIMIT: 09h. Set APU fast PPT limit. input:
>> + *   args[0] = limit in mW.
>> + * @HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT: 0Ah. Set VDDCR_VDD TDC. input:
>> + *   args[0] = limit in mA.
>> + * @HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT: 0Bh. Set VDDCR_VDD EDC.
>> + *   input: args[0] = limit in mA.
>> + * @HSMP_CLIENT_SET_TJ_MAX: 0Ch. Set maximum junction temperature. input:
>> + *   args[0] = temperature in degrees C.
>> + * @HSMP_CLIENT_SET_FIT_LIMIT_SCALAR: 0Dh. Set failures-in-time limit
>> + *   scalar. input: args[0] = scalar (0 to 100).
>> + * @HSMP_CLIENT_ENABLE_OVERCLOCKING: 0Eh. Enable overclocking. No
>> + *   arguments.
>> + * @HSMP_CLIENT_DISABLE_OVERCLOCKING: 0Fh. Disable overclocking. No
>> + *   arguments.
>> + * @HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES: 10h. Set all-core overclock
>> + *   frequency. input: args[0] = frequency in MHz[15:0].
>> + * @HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE: 11h. Set per-core overclock
>> + *   frequency. input: args[0] = ApicId[31:16] + frequency in MHz[15:0].
>> + * @HSMP_CLIENT_SET_OVERCLOCK_VID: 12h. Set overclock VID. input:
>> + *   args[0] = voltage in mV[15:0].
>> + * @HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY: 13h. Set FCLK overclock on
>> + *   the fly. input: args[0] = FCLK in MHz[15:0].
>> + * @HSMP_CLIENT_GET_CORE_PERF_ORDER: 14h. Get core performance order.
>> + *   input: args[0] = ApicId[15:0]. output: args[0] = frequency in
>> + *   MHz[15:0].
>> + * @HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT: 15h. Set SOC sustained power
>> + *   limit. input: args[0] = limit in mW.
>> + * @HSMP_CLIENT_SET_SLOW_PPT_LIMIT: 16h. Set APU slow PPT limit. input:
>> + *   args[0] = limit in mW.
>> + * @HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT: 17h. Set VDDCR_GFX EDC.
>> + *   input: args[0] = limit in mA.
>> + * @HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT: 18h. Set VDDCR_SOC TDC. input:
>> + *   args[0] = limit in mA.
>> + * @HSMP_CLIENT_SET_FAST_SPM_LIMIT: 19h. Set fast SPM limit. input:
>> + *   args[0] = limit in mW.
>> + * @HSMP_CLIENT_SET_SLOW_SPM_LIMIT: 1Ah. Set slow SPM limit. input:
>> + *   args[0] = limit in mW.
>> + * @HSMP_CLIENT_GET_CORE_PSM_MARGIN: 1Bh. Get core voltage margin. input:
>> + *   args[0] = ApicId[15:0]. output: args[0] = margin in mV[15:0].
>> + * @HSMP_CLIENT_GET_GFX_PSM_MARGIN: 1Ch. Get graphics voltage margin.
>> + *   output: args[0] = margin in mV[15:0].
>> + * @HSMP_CLIENT_SPARE_0X1D: 1Dh. Reserved.
>> + * @HSMP_CLIENT_SPARE_0X1E: 1Eh. Reserved.
>> + * @HSMP_CLIENT_SPARE_0X1F: 1Fh. Reserved.
>> + * @HSMP_CLIENT_SPARE_0X20: 20h. Reserved.
>> + * @HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID: 21h. Set GfxClk
>> + *   overdrive by frequency/VID. input: args[0] = frequency in
>> + *   MHz[31:16] + voltage in mV[15:0].
>> + * @HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE: 22h. Disable GfxClk overdrive.
>> + *   No arguments.
>> + * @HSMP_CLIENT_SET_GFX_PSM_MARGIN: 23h. Set graphics voltage margin.
>> + *   input: args[0] = margin in mV[15:0].
>> + * @HSMP_CLIENT_SET_CCLK_FMAX_OFFSET: 24h. Set CCLK Fmax offset. input:
>> + *   args[0] = maximum frequency in MHz[15:0].
>> + * @HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET: 25h. Set core power limit
>> + *   offset. input: args[0] = limit in mW.
>> + * @HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND: 26h. Add extra core PSM
>> + *   guardband. input: args[0] = voltage in mV[15:0].
>> + * @HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX: 27h. Add extra graphics PSM
>> + *   guardband. input: args[0] = voltage in mV[15:0].
>> + * @HSMP_CLIENT_SET_GFXCLK_FMAX: 28h. Set GfxClk Fmax. input: args[0] =
>> + *   maximum frequency in MHz[15:0].
>> + * @HSMP_CLIENT_MSG_ID_MAX: Number of message IDs, not a valid ID itself.
>> + *
>> + * Message IDs accepted on the Family 1Ah client platforms, Models 80h-8Fh
>> + * and E0h-E3h. These parts drive one mailbox and speak the Ryzen Master
>> + * SMC message set instead of the server HSMP message set enumerated in
>> + * &enum hsmp_message_ids. Not all platforms support all messages; consult
>> + * the supported list of messages in the HSMP chapter of the respective
>> + * family/model PPR. Unsupported messages return -ENOMSG.
>> + */
>> +enum hsmp_client_message_ids {
>> +     HSMP_CLIENT_TEST = 1,
>> +     HSMP_CLIENT_GET_SMU_VER,
>> +     HSMP_CLIENT_GET_INTERFACE_VER,
>> +     HSMP_CLIENT_GET_METRICS_TABLE_VER,
>> +     HSMP_CLIENT_GET_METRICS_TABLE,
>> +     HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
>> +     HSMP_CLIENT_SET_CORE_PSM_MARGIN,
>> +     HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN,
>> +     HSMP_CLIENT_SET_FAST_PPT_LIMIT,
>> +     HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT,
>> +     HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT,
>> +     HSMP_CLIENT_SET_TJ_MAX,
>> +     HSMP_CLIENT_SET_FIT_LIMIT_SCALAR,
>> +     HSMP_CLIENT_ENABLE_OVERCLOCKING,
>> +     HSMP_CLIENT_DISABLE_OVERCLOCKING,
>> +     HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES,
>> +     HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE,
>> +     HSMP_CLIENT_SET_OVERCLOCK_VID,
>> +     HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY,
>> +     HSMP_CLIENT_GET_CORE_PERF_ORDER,
>> +     HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT,
>> +     HSMP_CLIENT_SET_SLOW_PPT_LIMIT,
>> +     HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT,
>> +     HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT,
>> +     HSMP_CLIENT_SET_FAST_SPM_LIMIT,
>> +     HSMP_CLIENT_SET_SLOW_SPM_LIMIT,
>> +     HSMP_CLIENT_GET_CORE_PSM_MARGIN,
>> +     HSMP_CLIENT_GET_GFX_PSM_MARGIN,
>> +     HSMP_CLIENT_SPARE_0X1D,
>> +     HSMP_CLIENT_SPARE_0X1E,
>> +     HSMP_CLIENT_SPARE_0X1F,
>> +     HSMP_CLIENT_SPARE_0X20,
>> +     HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID,
>> +     HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE,
>> +     HSMP_CLIENT_SET_GFX_PSM_MARGIN,
>> +     HSMP_CLIENT_SET_CCLK_FMAX_OFFSET,
>> +     HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET,
>> +     HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND,
>> +     HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX,
>> +     HSMP_CLIENT_SET_GFXCLK_FMAX,
>> +     HSMP_CLIENT_MSG_ID_MAX,
>> +};
>> +
>>   #endif /*_ASM_X86_AMD_HSMP_H_*/
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 5e123a4ecea9..e8fac2d299f3 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -10,6 +10,8 @@
>>   #include <asm/amd/hsmp.h>
>>
>>   #include <linux/acpi.h>
>> +#include <linux/array_size.h>
>> +#include <linux/build_bug.h>
>>   #include <linux/cleanup.h>
>>   #include <linux/delay.h>
>>   #include <linux/device.h>
>> @@ -45,8 +47,197 @@
>>    */
>>   #define CHECK_GET_BIT                BIT(31)
>>
>> +/* Indexed by enum hsmp_client_message_ids; see there for per-message details */
>> +static const struct hsmp_msg_desc hsmp_client_msg_desc_table[] = {
>> +     /* RESERVED */
>> +     {0, 0, HSMP_RSVD},
>> +
>> +     /* HSMP_CLIENT_TEST */
>> +     {1, 1, HSMP_GET},
>> +
>> +     /* HSMP_CLIENT_GET_SMU_VER */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /* HSMP_CLIENT_GET_INTERFACE_VER */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /* HSMP_CLIENT_GET_METRICS_TABLE_VER */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /* HSMP_CLIENT_GET_METRICS_TABLE */
>> +     {0, 0, HSMP_GET},
>> +
>> +     /* HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR */
>> +     {0, 3, HSMP_GET},
>> +
>> +     /* HSMP_CLIENT_SET_CORE_PSM_MARGIN */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_FAST_PPT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_TJ_MAX */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_FIT_LIMIT_SCALAR */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_ENABLE_OVERCLOCKING */
>> +     {0, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_DISABLE_OVERCLOCKING */
>> +     {0, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_OVERCLOCK_VID */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_GET_CORE_PERF_ORDER */
>> +     {1, 1, HSMP_GET},
>> +
>> +     /* HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_SLOW_PPT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_FAST_SPM_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_SLOW_SPM_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_GET_CORE_PSM_MARGIN */
>> +     {1, 1, HSMP_GET},
>> +
>> +     /* HSMP_CLIENT_GET_GFX_PSM_MARGIN */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /* HSMP_CLIENT_SPARE_0X1D */
>> +     {0, 0, HSMP_RSVD},
>> +
>> +     /* HSMP_CLIENT_SPARE_0X1E */
>> +     {0, 0, HSMP_RSVD},
>> +
>> +     /* HSMP_CLIENT_SPARE_0X1F */
>> +     {0, 0, HSMP_RSVD},
>> +
>> +     /* HSMP_CLIENT_SPARE_0X20 */
>> +     {0, 0, HSMP_RSVD},
>> +
>> +     /* HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE */
>> +     {0, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_GFX_PSM_MARGIN */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_CCLK_FMAX_OFFSET */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_CLIENT_SET_GFXCLK_FMAX */
>> +     {1, 0, HSMP_SET},
>> +};
>> +
>> +/* Catch a table left out of sync with its enum at build time */
>> +static_assert(ARRAY_SIZE(hsmp_msg_desc_table) == HSMP_MSG_ID_MAX);
>> +static_assert(ARRAY_SIZE(hsmp_client_msg_desc_table) == HSMP_CLIENT_MSG_ID_MAX);
>> +
>> +/* Per-platform message set: which table to use, and driver-issued msg IDs */
>> +struct hsmp_plat_desc {
>> +     const struct hsmp_msg_desc      *msg_desc;
>> +     u32                             num_msgs;
>> +     u32                             test_msg;
>> +     u32                             proto_ver_msg;
>> +};
>> +
>> +static const struct hsmp_plat_desc hsmp_desc_server = {
>> +     .msg_desc               = hsmp_msg_desc_table,
>> +     .num_msgs               = HSMP_MSG_ID_MAX,
>> +     .test_msg               = HSMP_TEST,
>> +     .proto_ver_msg          = HSMP_GET_PROTO_VER,
>> +};
>> +
>> +/* The client drives a different mailbox with the Ryzen Master SMC message set */
>> +static const struct hsmp_plat_desc hsmp_desc_client = {
>> +     .msg_desc               = hsmp_client_msg_desc_table,
>> +     .num_msgs               = HSMP_CLIENT_MSG_ID_MAX,
>> +     .test_msg               = HSMP_CLIENT_TEST,
>> +     .proto_ver_msg          = HSMP_CLIENT_GET_INTERFACE_VER,
>> +};
>> +
>>   static struct hsmp_plat_device hsmp_pdev;
>>
>> +/*
>> + * Resolved on first use and cached, since is_client_platform() always
>> + * settles on the same descriptor once booted. Concurrent first callers are
>> + * benign: every one of them computes and stores that same pointer, so
>> + * READ_ONCE()/WRITE_ONCE() only need to keep the access from being torn or
>> + * reordered by the compiler, not order it against anything else.
>> + */
>> +static const struct hsmp_plat_desc *hsmp_desc_cache;
>> +
>> +static inline const struct hsmp_plat_desc *hsmp_desc(void)
> 
> In C files, please drop inline from anything non-trivial and let the
> compiler decide if it inlines or not.
> 
Thanks. Will drop this.
>> +{
>> +     const struct hsmp_plat_desc *desc = READ_ONCE(hsmp_desc_cache);
>> +
>> +     if (likely(desc))
> 
> Add include.
> 
>> +             return desc;
>> +
>> +     desc = is_client_platform() ? &hsmp_desc_client : &hsmp_desc_server;
>> +     WRITE_ONCE(hsmp_desc_cache, desc);
> 
> Add include.
> 
Sure will add #include <linux/compiler.h> which is needed explicitly for 
likely()/READ_ONCE()/WRITE_ONCE()
>> +
>> +     return desc;
>> +}
>> +
>> +/* Returns NULL if msg_id is out of range or reserved for this platform */
>> +static inline const struct hsmp_msg_desc *get_msg_desc(u32 msg_id)
>> +{
>> +     const struct hsmp_plat_desc *desc = hsmp_desc();
>> +
>> +     if (msg_id >= desc->num_msgs)
>> +             return NULL;
>> +
>> +     if (desc->msg_desc[msg_id].type == HSMP_RSVD)
>> +             return NULL;
>> +
>> +     return &desc->msg_desc[msg_id];
>> +}
>> +
>>   /*
>>    * Gates the AMD HSMP data plane against socket bring-up and teardown.
>>    *
>> @@ -184,30 +375,29 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>>
>>   static int validate_message(struct hsmp_message *msg)
>>   {
>> -     /* msg_id against valid range of message IDs */
>> -     if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
>> -             return -ENOMSG;
>> +     const struct hsmp_msg_desc *desc;
>>
>> -     /* msg_id is a reserved message ID */
>> -     if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
>> +     /* Unknown or reserved message ID for this platform */
>> +     desc = get_msg_desc(msg->msg_id);
>> +     if (!desc)
>>                return -ENOMSG;
>>
>>        /*
>>         * num_args passed by user should match the num_args specified in
>>         * message description table.
>>         */
>> -     if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args)
>> +     if (msg->num_args != desc->num_args)
>>                return -EINVAL;
>>
>>        /*
>>         * As the HSMP protocol evolves, newer platforms may define more
>>         * response arguments for existing messages.  Use an upper-bound
>>         * check so that older userspace callers requesting fewer response
>> -      * words than what the current hsmp_msg_desc_table[] defines are
>> -      * still accepted, while rejecting requests that exceed the
>> -      * hardware capability.
>> +      * words than what the current descriptor table defines are still
>> +      * accepted, while rejecting requests that exceed the hardware
>> +      * capability.
>>         */
>> -     if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
>> +     if (msg->response_sz > desc->response_sz)
>>                return -EINVAL;
>>
>>        return 0;
>> @@ -316,7 +506,7 @@ int hsmp_test(u16 sock_ind, u32 value)
>>         * Test the hsmp port by performing TEST command. The test message
>>         * takes one argument and returns the value of that argument + 1.
>>         */
>> -     msg.msg_id      = HSMP_TEST;
>> +     msg.msg_id      = hsmp_desc()->test_msg;
>>        msg.num_args    = 1;
>>        msg.response_sz = 1;
>>        msg.args[0]     = value;
>> @@ -338,12 +528,12 @@ int hsmp_test(u16 sock_ind, u32 value)
>>   }
>>   EXPORT_SYMBOL_NS_GPL(hsmp_test, "AMD_HSMP");
>>
>> -static bool is_get_msg(struct hsmp_message *msg)
>> +static bool is_get_msg(const struct hsmp_msg_desc *desc, struct hsmp_message *msg)
>>   {
>> -     if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_GET)
>> +     if (desc->type == HSMP_GET)
>>                return true;
>>
>> -     if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET &&
>> +     if (desc->type == HSMP_SET_GET &&
>>            (msg->args[0] & CHECK_GET_BIT))
> 
> Should fit to one line now?
> 
> (Heh, I was going to say this is open-coding coding is_get_msg() before
> realizing it's the very thing :-)).
> 
>>                return true;
>>
>> @@ -354,6 +544,8 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>>   {
>>        int __user *arguser = (int  __user *)arg;
>>        struct hsmp_message msg = { 0 };
>> +     const struct hsmp_plat_desc *plat_desc = hsmp_desc();
>> +     const struct hsmp_msg_desc *desc;
>>        int ret;
>>
>>        if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
>> @@ -361,23 +553,25 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>>
>>        /*
>>         * Check msg_id is within the range of supported msg ids
>> -      * i.e within the array bounds of hsmp_msg_desc_table
>> +      * i.e within the array bounds of the platform's descriptor table
>>         */
>> -     if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
>> +     if (msg.msg_id < plat_desc->test_msg || msg.msg_id >= plat_desc->num_msgs)
>>                return -ENOMSG;
>>
>>        /*
>>         * Sanitize the user-controlled msg_id against speculative
>>         * execution.  The bounds check above retires the out-of-range
>>         * case with -ENOMSG, but a mispredicted branch can still let the
>> -      * CPU speculatively use msg_id as an index into
>> -      * hsmp_msg_desc_table[] (here and in validate_message() /
>> -      * is_get_msg() called downstream via hsmp_send_message()), and
>> -      * pull arbitrary kernel memory into the cache (Spectre v1,
>> -      * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
>> -      * dereference sees the sanitized value.
>> +      * CPU speculatively use msg_id as an index into the message
>> +      * descriptor table, here and again in validate_message() called
>> +      * downstream via hsmp_send_message().
>>         */
>> -     msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
>> +     msg.msg_id = array_index_nospec(msg.msg_id, plat_desc->num_msgs);
>> +
>> +     /* Rejects the reserved IDs the table describes as such */
>> +     desc = get_msg_desc(msg.msg_id);
>> +     if (!desc)
>> +             return -ENOMSG;
>>
>>        switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
>>        case FMODE_WRITE:
>> @@ -385,7 +579,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>>                 * Device is opened in O_WRONLY mode
>>                 * Execute only set/configure commands
>>                 */
>> -             if (is_get_msg(&msg))
>> +             if (is_get_msg(desc, &msg))
>>                        return -EPERM;
>>                break;
>>        case FMODE_READ:
>> @@ -393,7 +587,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>>                 * Device is opened in O_RDONLY mode
>>                 * Execute only get/monitor commands
>>                 */
>> -             if (!is_get_msg(&msg))
>> +             if (!is_get_msg(desc, &msg))
>>                        return -EPERM;
>>                break;
>>        case FMODE_READ | FMODE_WRITE:
>> @@ -410,7 +604,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>>        if (ret)
>>                return ret;
>>
>> -     if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
>> +     if (desc->response_sz > 0) {
>>                /* Copy results back to user for get/monitor commands */
>>                if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
>>                        return -EFAULT;
>> @@ -685,11 +879,16 @@ EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
>>   int hsmp_cache_proto_ver(u16 sock_ind)
>>   {
>>        struct hsmp_message msg = { 0 };
>> +     const struct hsmp_msg_desc *desc;
>>        int ret;
>>
>> -     msg.msg_id      = HSMP_GET_PROTO_VER;
>> +     msg.msg_id      = hsmp_desc()->proto_ver_msg;
>> +     desc = get_msg_desc(msg.msg_id);
>> +     if (WARN_ON(!desc))
>> +             return -ENOMSG;
>> +
>>        msg.sock_ind    = sock_ind;
>> -     msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
>> +     msg.response_sz = desc->response_sz;
>>
>>        ret = hsmp_send_message_locked(&msg);
>>        if (!ret)
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 8dbff16a87b1..890cfb664829 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -10,6 +10,9 @@
>>   #ifndef HSMP_H
>>   #define HSMP_H
>>
>> +#include <asm/amd/hsmp.h>
>> +
>> +#include <linux/acpi.h>
>>   #include <linux/compiler_types.h>
>>   #include <linux/device.h>
>>   #include <linux/hwmon.h>
>> @@ -17,6 +20,7 @@
>>   #include <linux/miscdevice.h>
>>   #include <linux/mutex.h>
>>   #include <linux/pci.h>
>> +#include <linux/processor.h>
>>   #include <linux/rwsem.h>
>>   #include <linux/semaphore.h>
>>   #include <linux/sysfs.h>
>> @@ -32,6 +36,29 @@
>>
>>   #define DRIVER_VERSION               "2.6"
>>
>> +/*
>> + * Family/model ranges need a driver update every generation and miss new
>> + * client parts until then. The ACPI-reported PM profile does not: it says
>> + * what kind of system this is regardless of which CPU is in it.
>> + */
>> +static inline bool is_client_platform(void)
>> +{
>> +     if (!IS_ENABLED(CONFIG_ACPI))
>> +             return false;
>> +
>> +     if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
>> +             return false;
>> +
>> +     switch (acpi_gbl_FADT.preferred_profile) {
>> +     case PM_DESKTOP:
>> +     case PM_MOBILE:
>> +     case PM_TABLET:
>> +             return true;
>> +     default:
>> +             return false;
>> +     }
>> +}
>> +
>>   struct hsmp_mbaddr_info {
>>        u32 base_addr;
>>        u32 msg_id_off;
>>
> 
> --
>   i.
> 

