Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C5633F8C4;
	Tue, 12 May 2026 06:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566889; cv=fail; b=ZzFRl05nRwyn+YrO1OklE9WhQFG6HFtu09CBd02MXeMiCvwhjA7FHzmgVbtusBMgvUmKIPJ3gYXASOCWGQlLDA5phd5LrjGGN8pgDGzmPwluq/k+objv7WwUH8smBdMbIKuCJji5MsO4nAiYyPyGrSQQHLFc08P/YLWZqK2cFZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566889; c=relaxed/simple;
	bh=w62BG8/vpTAIYKg332Y5SViJBEtr/8azFOcNyXQlEfo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fnbmCkE8lsA1MmOKSJOl3QN8qWjZSPjAHUvAhKdrc9Xjm/3r0rQ3Fw1JklG2TT4DvopBOpTw8bqGB3ceerLGcPsyJWhkv8fHxsLeU1fuB5cdGQg02UuXXlvmDf3lNZAGElYQr03KZxrRZj00T6yY2FvNxjIb6yO1oSUvjx6hKAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LsB9USWC; arc=fail smtp.client-ip=52.101.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LsB9USWC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSywjD5aGGBIyPqZhJSGdRU2k6cLcOqLBcscGEKI4wDw3wFLp6+/yC5VpYloTxmTFgt8VOWdPg5WIYUszgBuRFoE2tCV6TBBVhEiO0MJC4788y3sJDjsYMWZUaNsAr0ie462O6791WK5pW3iW9325D7O963lwE5eykDxtIfnzukTHET9eW3n2O7ih+9PJ6zAzObKMJm1P+I2gbjTICdKwKAUrnEfTlUvVS7P+/ua8Ex1bsIQLyPvhY4vS/OKAAHmtXthR18NEIpMIl3nZt7OI9aUvcnbMY1OsAk2ndVprguNfxH5rDbS+6v5+/AQsF7/U8umJJE+W44SBRluXBEFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4s4gqBmtMj6aQxDEKHO8saQ9TLVhmhh9NoqWGCWbIDE=;
 b=DD/1aK7QXUCPaWyGdBSIT/vau0dNsLpv+KiBnVOn3Fy9AShb1kQIsVJdtA4PUrKGPt4DH6FJXspbutt0/pVchIq4cL7c3TkYHSxUj6mQK6kRwb+kU/HKCGMef3xMptMTGpn237KtuiG+HNXEMjqu0VLrAqsRzVW7IYe3110Lueh+tBiNQyMPgCd1O2xHoh/tfpC+7ajjxwUZss7iiMA8jxyU7X8Orddf4LrhKap3Z//hjORP7ZB6MNYbi8dCJH207yDD8Fccgi9ZkaRBU0N87xdR99D2G0GYAyyzRrr27oAjR5R0zHnj1q0G0GD4scub+u82OauNFZl32NIjlPJ65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4s4gqBmtMj6aQxDEKHO8saQ9TLVhmhh9NoqWGCWbIDE=;
 b=LsB9USWCjnkhF2rJSLhk3JI1IM3F6Q3xs7cnYQBmqKxTvso4vOihutS3+j7jvnWlIez4tqZocy+wz9m3u7UJ7EP2TVBz3I97By71wp8qpuzkqZ03LB1ksn79W8b0v6iFeibakCpovfamlJACXEK2iXuKasYRqkV3OCH3AWv5vtw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Tue, 12 May
 2026 06:21:09 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 06:21:09 +0000
Message-ID: <ce775231-4804-41c7-9308-ba434d74b181@amd.com>
Date: Tue, 12 May 2026 11:51:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] platform/x86/amd/hsmp: Add new HSMP messages for
 Family 1Ah, Model 50h-5Fh
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 driver-core@lists.linux.dev, Suma Hegde <suma.hegde@amd.com>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-2-muralidhara.mk@amd.com>
 <0dc34f1f-ec77-9950-b1c9-c4a256ae0477@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <0dc34f1f-ec77-9950-b1c9-c4a256ae0477@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|MN0PR12MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 465b6a17-d247-45f3-5182-08deafeea7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	DehbPxibS9+GxmyGqAF+mbnOjNSn31PEqm+nsddw3sllJDqaPh/P9tJ+1BVp6di2tkCmjQCzDbI56+dLrhHq8bpR4hdK8w3rTv1mTzyJOkNL2cw8BMvfNZB67tF5K7b86VpJoMbwTMGffL17eRNux4JPs2kPpXWLyB4AeG02N7hnFjrOVVulrUvEev+NgcE9f2q41T678gSJnnVhw+UcbwvHisGybsHKreySoa52mWaEbwHgk6ZgyFOwg2d0xdtrYWQIbIPISapZAS82Cxo3P1GJDlYfDKhTq03u/cEROlH8f+/qsWq4LtFLhTx3DgXjn2/qLXvdJIAT06tl3vzySg49z5qwrNmPoFRQG1ETlqoBW16Z33vFV33AlVWZaYX8ShPqSDXUScj5UkDOQZdmXB8mPs5u+OGxSboSzTHRGSi2SnKy6RYjmG/Plm5aZN6f56IGmqZjQmetq5RmKDCFjgXlZITZW+NpTQDb2n36abJ2ChRn3tqomN6W3zwJd9/0P7y41tBjBsMT1zUYLyUZyMfQT0GS6rpPOfF5AzceaxkEh6VXsuX7TOjKbzzXDiC0VxZFu3WVgudf8kf+bMmw5KuulQPnHz7ZYgvAOB1GV/e8BCrT35L4/mdLCQJ95DQu5zlqJzj3MrCA+84Is2+T5Mmv3+rKGxpYmAdb9KvPbjRFehxljmPHrUntok9Ozu/9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTdoTkZMVFlSa3V3OEV0dkZBMUdZVys2VHpDV212K29WMjR0Q0dNdll0bFp4?=
 =?utf-8?B?UHNqS0Y5ZkduRHlmNU5udUVOTzg5ZG9GN2doQ2NEOWpNTXhJckZzT0lJNjFr?=
 =?utf-8?B?eUZlQ3FEZ3JOL2F0NHRXNG9zMXJsYjNHMjU2RFdycFd4dVJGY3NvSld3OVU0?=
 =?utf-8?B?RjBOVWRhODhBdTc2dkp4a0lsTmc2dTAzTDNKNlhvUm5Yd1VyY3VURHlhdkVp?=
 =?utf-8?B?NDlNZk1CQVdvVG1BeDdPWXNhSXRxaHNmZ1FVWlZWVEhNQXlSZEhCQWJTeXJr?=
 =?utf-8?B?c1o4L3Fpb0FPajdubjIxRGN4R05Hd0ZHYWQ2blNadXdvdGJyamJNZHdFeHFq?=
 =?utf-8?B?aWFTVGFmM0RtVVBvd3poUTJ1bTI4eXFhTnNTTlNZZWZGNVh1UUttUkhJd2J2?=
 =?utf-8?B?NmNqWTE3Z1UvVGR6UlBrbGc3bThYTkpqT24zUXdjZ3ZnNGZhemZFbFBjVXl3?=
 =?utf-8?B?WEZtSTRyaTMvMTV6cDVTajNkdVIrSkt5VkFJY1kzMHFOUG5nMURVcWpyZjMx?=
 =?utf-8?B?S0ovYmhIQ3lvT2xrUGJ2a1NibXdRV1lLdEJYT0FnOTdJdzQwNVpZOFpPSUJy?=
 =?utf-8?B?N2ZBb1dZRHNPb3N1ZlRwZkJWZUN3MmlQbjFEeUpqMkFLQVN6cWk3c2hNQXpn?=
 =?utf-8?B?L25LVktpYUdTdGRDS3RoWkJyWGg3OWszQ094OUIrTnA1U1FUQTU4YUs1SmFr?=
 =?utf-8?B?TWE0SUEyd2xvelRiZGJwY0Nkc1QxcUNMeGZBMnYwNmwxRUtvUk02Z3c1UFN1?=
 =?utf-8?B?ck43TURZWjIrc2J3SDNjWnJjeXFkSEtPWU1DM3ArcnNQOWFleFFmazZwVFI3?=
 =?utf-8?B?RXBNUnZMWTFiRUkzemRrMkMxY21OU3pnYXZzU0cwWnNlSlFpUXZLSlBhbkU0?=
 =?utf-8?B?SFZKQUl1UVhDamtRZFA1OS9JeEt3NXVrMHJhOElhQ3NtRk85azI4MjBnYTFt?=
 =?utf-8?B?Zm51SFoybk14OTFIcTFvV0g2bk53dHQzZTRxZ3R4ZG9TZzJOV0Y3MFJJY2dX?=
 =?utf-8?B?am94eDZJRk1MUVlBalEvWFkxRjJXRFArZDlTbXdsTXlybmllUXlhSjN5MVhz?=
 =?utf-8?B?SFdjYTQrNVpUanVLc2RjZnV1b2NpS0swYW00OHRCT243MHFBdUtGYUJmd1pJ?=
 =?utf-8?B?M2VqQk1GYjBQbFZFNm1rT1BIWDF6OWZRV3ovbGlrRlMvRUZxNjRYTzVpOVdv?=
 =?utf-8?B?ZVdaQ09BRXNjVDZpZmtZQ2czSkhkdzNISE9Ra0prQUJCRERDdzlXNElHV2Nr?=
 =?utf-8?B?aFB4NHF0ZGhGb0FtNm93b1NzMm85ZXhYckVuc080MWkyMkpIWkpyTHQ5U2hM?=
 =?utf-8?B?V2pEVW95TjQzeEw2QmlmbjN1WWUrUkt0ell4MURZOEFRVGdxcmVBRTJDbEpB?=
 =?utf-8?B?QytrZ2VmL3ZIZ1VTQXBwU1Q2WVgxME0wZy93RWd5aVZjaTdVemlyNmFTOXcw?=
 =?utf-8?B?MmRUYmdFUEpZbnUxckRJcWwrRmprb3hYSHdaTlFYQlpvMGEwNTRTeWRWVEVD?=
 =?utf-8?B?UDhtMEFISEtpMHVDYTUwaUNjMzEzRWJwZTh4bGtLemUxbGNCQ0V2RGYwaUlK?=
 =?utf-8?B?R203c0QrSGZ4d3liSXBpVUhzSEpnaGxXa3ZsY0pMU1RZb3ZvM3BDd0Y2NVV0?=
 =?utf-8?B?a0ozMTNqVnpPL0ZBU3NuYXRoalRrcEd3UzRpbGpIbjFVSWhpdVJNYnhpTVox?=
 =?utf-8?B?MThqa0hhTERNUzlpaTRmZmEyTFFnak1YcjBIa1ZsMUQ2R05XYW9HTEFwdzdV?=
 =?utf-8?B?MVBXM21jZUpkTmQ2YU9hMW8xNExiNFU4dmRWWHNvdG9uZjZVZ0h5cUJBNWdS?=
 =?utf-8?B?S0ZJU2o2ZGpPOEdJMkxpeDVJQzZFZGEzZU9zbnVSVHo5RGVMK29RYlp6ZFV0?=
 =?utf-8?B?cytPaWlKK3dsYWVHakVQRjBudk12OTNYa252RkR1d0hlemJUODNlVVErcWhY?=
 =?utf-8?B?Wk0zUGlOdHRJemJxV0o5cUVwN2pOQ2J4Q09rbC9CdEdxVlFUT25HKzNzUk95?=
 =?utf-8?B?aHBrN09rcHNCNjRRcU1VcE85WnhoTWIrd3dLV2JJdzBrWUlBb204N0cyYmF6?=
 =?utf-8?B?cXdETFJFQXRBeWdqRUQ1OTVxMml0OGtYUUhnbUFBTWJ0YWpmaWJQc0JaaktT?=
 =?utf-8?B?cVRyVDNQK09VVVFSc1BqUE1mNDVzNVhpczNJRFpSZTFGMnBOWG9vNEw2SDFr?=
 =?utf-8?B?SnhzUUlEYkg2R25VYU9McTU3OEFEL3VON0E5T2crMkRsSEtEcFlDcVZ2K01U?=
 =?utf-8?B?bmlPVkFDbEJiU3JaOEVzdDFlNmJJYWZ2Z2dBZGFXZFZRbytEZUF0L0FPQ2Qx?=
 =?utf-8?B?UWh3WGNKZzJjb2VaaFlRT3ZvZFJRSDFtdHZUZWNRdk04S1VjYjFqdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465b6a17-d247-45f3-5182-08deafeea7f5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:21:08.9453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OK/ahIW+a4vGls7+BBwGJdvsBrWj1cDGj25CmQ53Uwv1bKnpw61f45JILCocw9VaKNu/sQciLZRjJypnI/NSrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079



On 5/11/2026 11:05 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 27 Apr 2026, Muralidhara M K wrote:
> 
>> From: Suma Hegde <suma.hegde@amd.com>
>>
>> The new messages extend the HSMP interface to provide finer control over
>> power states and system monitoring capabilities.
>>
>> Power state control:
>> - Get/Set PC6 and CC6 enable/disable control (0x29, 0x2A)
>>
>> Power and thermal monitoring:
>> - Get CCD power consumption reading (0x34)
>> - Get Thermal delta (Tdelta) reading (0x35)
>> - Get SVI3 VR controller temperature (0x36)
>>
>> DIMM sideband operations:
>> - Get/Set DIMM sideband data(0x33, 0x39)
>>
>> Power management:
>> - Get/Set Floor limit control (0x38)
>> - Get/Set SDPS limit control (0x3A)
>>
>> System capabilities:
>> - Get enabled HSMP commands (0x37)
>>
>> Bump driver version to 2.6.
>>
>> Reviewed-by: Muralidhara M K <muralidhara.mk@amd.com>
>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> ---
>> Changes v1->v2: None
>>
>>   arch/x86/include/uapi/asm/amd_hsmp.h | 142 +++++++++++++++++++++++----
>>   drivers/platform/x86/amd/hsmp/hsmp.h |   2 +-
>>   2 files changed, 126 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index 92d8f256d096..603d62f8d4da 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -53,9 +53,19 @@ enum hsmp_message_ids {
>>        HSMP_SET_XGMI_PSTATE_RANGE,     /* 26h Set xGMI P-state range */
>>        HSMP_CPU_RAIL_ISO_FREQ_POLICY,  /* 27h Get/Set Cpu Iso frequency policy */
>>        HSMP_DFC_ENABLE_CTRL,           /* 28h Enable/Disable DF C-state */
>> +     HSMP_PC6_ENABLE,                /* 29h Get/Set PC6 enable/disable status */
>> +     HSMP_CC6_ENABLE,                /* 2Ah Get/Set CC6 enable/disable status */
>>        HSMP_GET_RAPL_UNITS = 0x30,     /* 30h Get scaling factor for energy */
>>        HSMP_GET_RAPL_CORE_COUNTER,     /* 31h Get core energy counter value */
>>        HSMP_GET_RAPL_PACKAGE_COUNTER,  /* 32h Get package energy counter value */
>> +     HSMP_DIMM_SB_RD,                /* 33h Get data from a specified device on the DIMM */
>> +     HSMP_READ_CCD_POWER,            /* 34h Get the average power consumed by CCD */
>> +     HSMP_READ_TDELTA,               /* 35h Get thermal solution behaviour */
>> +     HSMP_GET_SVI3_VR_CTRL_TEMP,     /* 36h Get temperature of SVI3 VR controller rails */
>> +     HSMP_GET_ENABLED_HSMP_CMDS,     /* 37h Get/Set supported HSMP commands */
>> +     HSMP_SET_GET_FLOOR_LIMIT,       /* 38h Get/Set supported Floor limit commands */
>> +     HSMP_DIMM_SB_WR,                /* 39h Set data to a specified device on the DIMM */
>> +     HSMP_SDPS_LIMIT,                /* 3Ah Get/Set SDPS limit */
>>        HSMP_MSG_ID_MAX,
>>   };
>>
>> @@ -170,16 +180,18 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>>        {0, 1, HSMP_GET},
>>
>>        /*
>> -      * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0
>> -      * input: args[0] = min link width[15:8] + max link width[7:0]
>> +      * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get XGMI Link width[31] + min link width[15:8] + max link width[7:0]
>> +      * output: args[0] = current min link width[15:8] + current max link width[7:0]
>>         */
>> -     {1, 0, HSMP_SET},
>> +     {1, 1, HSMP_SET_GET},
>>
>>        /*
>> -      * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0
>> -      * input: args[0] = df pstate[7:0]
>> +      * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get df pstate[31] + df pstate[7:0]
>> +      * output: args[0] = APB enabled/disabled[8] + current df pstate[7:0]
>>         */
>> -     {1, 0, HSMP_SET},
>> +     {1, 1, HSMP_SET_GET},
>>
>>        /* HSMP_SET_AUTO_DF_PSTATE, num_args = 0, response_sz = 0 */
>>        {0, 0, HSMP_SET},
>> @@ -305,16 +317,18 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>>        {1, 1, HSMP_SET},
>>
>>        /*
>> -      * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0
>> -      * input: args[0] = power efficiency mode[2:0]
>> +      * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get power mode[31] + power efficiency mode[2:0]
> 
> Now this seems interesting, as it's only a comment change. Are here some
> plain clarifications combined with new feature work?
> 
> (Admittedly it seemed to be the only case which didn't change the code.)
>
The SMU has consolidated Get and Set operations into a single
command. Code changes were previously implemented by modifying the
command definition from {1, 0, HSMP_SET_GET} to {1, 1, HSMP_SET_GET}.

This update adds comments to inform users of the dual-purpose functionality.

>> +      * output: args[0] = current power efficiency mode[2:0]
>>         */
>>        {1, 1, HSMP_SET_GET},
>>
>>        /*
>> -      * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0
>> -      * input: args[0] = min df pstate[15:8] + max df pstate[7:0]
>> +      * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get DF P-state range[31] + min df pstate[15:8] + max df pstate[7:0]
>> +      * output: args[0] = min df pstate[15:8] + max df pstate[7:0]
>>         */
>> -     {1, 0, HSMP_SET},
>> +     {1, 1, HSMP_SET_GET},
>>
>>        /*
>>         * HSMP_GET_METRIC_TABLE_VER, num_args = 0, response_sz = 1
>> @@ -335,10 +349,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>>        {0, 2, HSMP_GET},
>>
>>        /*
>> -      * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
>> -      * input: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
>> +      * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get XGMI pstate range[31] + min xGMI p-state[15:8] +
>> +      *                  max xGMI p-state[7:0]
>> +      * output: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
>>         */
>> -     {1, 0, HSMP_SET},
>> +     {1, 1, HSMP_SET_GET},
>>
>>        /*
>>         * HSMP_CPU_RAIL_ISO_FREQ_POLICY, num_args = 1, response_sz = 1
>> @@ -355,9 +371,21 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>>         */
>>        {1, 1, HSMP_SET_GET},
>>
>> -     /* RESERVED(0x29-0x2f) */
>> -     {0, 0, HSMP_RSVD},
>> -     {0, 0, HSMP_RSVD},
>> +     /*
>> +      * HSMP_PC6_ENABLE, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get PC6 control[31] + disable/enable PC6[0]
>> +      * output: args[0] = current PC6 control status[0]
>> +      */
>> +     {1, 1, HSMP_SET_GET},
>> +
>> +     /*
>> +      * HSMP_CC6_ENABLE, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get CC6 control[31] + disable/enable CC6[0]
>> +      * output: args[0] = current CC6 control status[0]
>> +      */
>> +     {1, 1, HSMP_SET_GET},
>> +
>> +     /* RESERVED(0x2B-0x2F) */
>>        {0, 0, HSMP_RSVD},
>>        {0, 0, HSMP_RSVD},
>>        {0, 0, HSMP_RSVD},
>> @@ -385,6 +413,86 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>>         */
>>        {0, 2, HSMP_GET},
>>
>> +     /*
>> +      * HSMP_DIMM_SB_RD, num_args = 1, response_sz = 1
>> +      * input: args[0] =
>> +      *      Register space[23]
>> +      *      Register offset in given reg space[22:12]
>> +      *      LID of device[11:8]
>> +      *      DIMM address[7:0]
>> +      * output: args[0] = [3:0] Read data byte
>> +      */
>> +     {1, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_READ_CCD_POWER, num_args = 1, response_sz = 1
>> +      * input: args[0]  = apic id of core[15:0]
>> +      * output: args[0] = CCD power(mWatts)[31:0]
>> +      */
>> +     {1, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_READ_TDELTA, num_args = 0, response_sz = 1
>> +      * input: None
>> +      * output: args[0] = thermal behaviour[31:0]
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_SVI3_VR_CTRL_TEMP, num_args = 1, response_sz = 1
>> +      * input: args[0] = SVI3 rail index[3:1] + Read SVI3 temperature data[0]
>> +      * output: args[0] = SVI3 rail index[30:28] + SVI3 rail temperature(degree C)[27:0]
>> +      */
>> +     {1, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_ENABLED_HSMP_CMDS, num_args = 1, response_sz = 3
>> +      * input: args[0] = HSMP command mask[0]
>> +      * output: status of HSMP command = args[0], args[1], args[2]
>> +      */
>> +     {1, 3, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_SET_GET_FLOOR_LIMIT, num_args = 1, response_sz = 1
>> +      * input: args[0] =
>> +      *      Set or Get[31:30]
>> +      *              Set the Floor frequency per core = 00
>> +      *              Set the Floor frequency for all cores = 01
>> +      *              Get the Floor frequency of a core = 10
>> +      *              Get the Effective Floor frequency per core = 11
>> +      *      Reserved[29:28]
>> +      *      Apic id / Reserved[27:16]
>> +      *              args[27:16] is reserved if args[31:30] = 01
>> +      *      Floor frequency limit / Reserved[15:0]
>> +      *              if args[31] = 0, Floor frequency limit, else reserved
>> +      *
>> +      * output: args[0] =
>> +      *      Effective Floor frequency limit(MHz) / None / Floor frequency limit[15:0]
>> +      *              Effective Floor frequency if input args[31:30] = 11
>> +      *              None if input args[31] = 0
>> +      *              Floor frequency limit (MHz)[15:0] if args[31:30] = 10
>> +      */
>> +     {1, 1, HSMP_SET_GET},
>> +
>> +     /*
>> +      * HSMP_DIMM_SB_WR, num_args = 1, response_sz = 0
>> +      * input: args[0] =
>> +      *      Write Data[31:24]
>> +      *      Register space[23]
>> +      *      Register offset in given reg space[22:12]
>> +      *      LID of device[11:8]
>> +      *      DIMM address[7:0]
>> +      * output: None
>> +      */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /*
>> +      * HSMP_SDPS_LIMIT, num_args = 1, response_sz = 1
>> +      * input: args[0] = Set/Get[31] + SDPS Limit[30:0]
>> +      * output: args[0] = SDPS Limit[30:0]
>> +      */
>> +     {1, 1, HSMP_SET_GET},
>> +
>>   };
>>
>>   /* Metrics table (supported only with proto version 6) */
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 0509a442eaae..b153527e0a0d 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -27,7 +27,7 @@
>>   #define HSMP_DEVNODE_NAME    "hsmp"
>>   #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
>>
>> -#define DRIVER_VERSION               "2.5"
>> +#define DRIVER_VERSION               "2.6"
>>
>>   struct hsmp_mbaddr_info {
>>        u32 base_addr;
>>
> 
> --
>   i.
> 

