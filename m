Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C32335562;
	Thu, 11 Jun 2026 16:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196252; cv=fail; b=bANRYfQXE3N7puHVhCyVcH4smf2SWn2QNqiZP8EqGx0dZdOj+CR67y2Ye2HbIoc3jeIqNq02GKoXsPhtz2GxUVG3Y0f1R+ULGS/fHrnbu97UyhORT+MgklPa3H6GBzGU6yK2I6IGn2hArVjxG3vOIr1UPJiUyEtlcCv7FNF8vmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196252; c=relaxed/simple;
	bh=/w/hH00jGs/PHAxPdnkpJUr4RX0VMtKVeTBYD4yVF8s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sgd00Zg0vnTQQ1CESesWArF8uYhCe6eD7cyD+VBY4zYmVPwaVddtgdQSRdEmTJ++shstkwWRDaEStudmSl+Sq4m/CLORjaoRCxDskJcC8tLVbTr6iNVwqYKiESsbgeDpvlAorqUfxfn3yT+7eDVABG5eq/AleyxIdTUgLs/wVFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NrW14bPG; arc=fail smtp.client-ip=40.107.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NrW14bPG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLuu5d/nCpVgye0hl4bnF5VUJ1c/mQrulMr02ISLSRZO+gl1y1XBHucQYKAd4awctWowqVMGe6+Vu14G5CPiq8i/svyS0L1PJtMG67GCDvsvG4Yb5rXWicgQOYFq6R7MbLc/mRdQk1oRR4tszV4vCZZmayObf5LuSyu0gS1/WiGICUKGTddZlIVLBpuv1Bsp7L5njPtKehS+xgwYPpCzNp5O/tp8yU/g2qIw0cgddsTHccXHOvKvmuhVHcq0oFH/Bc6uyj4mzNyUfAyVgtfBYSOd44BX7qq6Gv3yKQX42E0LTo0TbO1Vx4wOr0VSC9qDGXNcsylLy2P7Vxsapg2+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgtFCSe9B3Hk3tdhA61beMXDZenfX0co5XeOfN86EXg=;
 b=VQF7OXb+n7dlS2s4+6Bu7a/a0Jhl29roJIlMsHTT7UgmELArEiKg5IllK2UyOutpEKO2xHGKq1kDHipSZCW8W8YM5FJkpcw5NWkT2mKXBg+gNpvFhg1Q4Ky4MLJ4PkmrPsNd/i7OX53GN7oRveHa0HqzYK5IfMK2rIX4BDNVw4WXT/HjeyI9cDr3FW61DbKBkdqUgpDMvEDSLdadVprwmFAfhNnUrYZ0KlQw43K1rjqikYGbT/d1BRX+jacrPXQrS1J6iBkmshTB+vu4xjs9qOisgvFE5X5z0t0nmXwQ0T1bFwvhkoIqIQVDpVJOv+zjBC6/saqQuIQeDGDHDD+ooQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgtFCSe9B3Hk3tdhA61beMXDZenfX0co5XeOfN86EXg=;
 b=NrW14bPGy93E/pGMDVGHRUwi/LzIn1zu/W75kNVmMDuTZzWSaHniFfhdSdp3uDM3J5bx21Jo8mNRl2UMZw+tXpArAy8aI3sDJ4BS1TxWlMQcNiWq2y9J9NhV45b7m4y1MmURWmlsQxRvy1ruhoo0OVyn4mDvmC3nHOR3cBEh8zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by PH0PR12MB7080.namprd12.prod.outlook.com (2603:10b6:510:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Thu, 11 Jun
 2026 16:44:07 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:44:07 +0000
Message-ID: <6efb0313-99a1-4588-8130-bdbd5d288cfc@amd.com>
Date: Thu, 11 Jun 2026 22:14:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] platform/x86/amd/hsmp: Source metric-table size
 from firmware
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Muralidhara M K <muralidhara.mk@amd.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
 <20260528093954.2461272-5-muralidhara.mk@amd.com>
 <3ccdf8eb-861a-970a-5c05-96c1ec54b473@linux.intel.com>
 <7d496898-ecc1-42d7-bbcd-1251038f332e@amd.com>
 <210d3a07-bf77-b525-b03f-02fea5e4e833@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <210d3a07-bf77-b525-b03f-02fea5e4e833@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::13) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|PH0PR12MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: e449f1f6-ac02-4e20-e274-08dec7d8a77d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|56012099006|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	CUELXs0RMeLqEdKFt7A+bH5P4OslIfVU3oP1KeL5ft/EUY5puFxR8ZdabqRk8PbFsa70qUevcLUlc9Cxqc2MkJt2IYN4XU/Fo6E2SGiyy2QYIxJGHAJpjaqw0dqef54IQo6qdqSxWDYtCRnm/GWDhxyKM//6CGCdM3BF7RVdKywWO/P8c4B3HoSZqnmx7fpcyHat6XkZ96/jjlFe7bxq2KZZg7zcIFUVZW8X1xmi6/232GT2NSTIzsBVmctDWtAnpmGodtgsQMY1R4SspVhAocMf6ecUzJy2+lVSei7pD8CKwkzt6+6cscu6r76ebJXtkjnVI0ZAfeIwvARI0M1rmIvJc8ZZWBXbAVTF2CnEIQe+hgXMrbFA3nsuWsvY9jPibPH56ZDH2s117D6HHozFeceDU8tISrFLgkCR4yPfw7YRvGAcvhNvNwIauva1TmgQgSXPiCKOqvzPzX8ky2hwM3jBtL5bFp4MDca4mY7c9icGvVx0DtkwzNaSGj+GB7v383rfk2YUx25L+hf6Fr8hAxdjtSEq27NdSp4zLNxWmsrpjU3SamolLwv9W6uYbjEChZEPZgrEVmIBasJOWJC/QNmxAgqL8rFW8gpw1a1PEvvHL51EAMSkKqwxGSFALZoZEh3JwZkk5lIaL1WEojv6ve+j3mZybcf8ZjbXTg5rYSWXj0KnjvLpiilUg8NiO1Ds
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(56012099006)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tmo5dUhIa1IxUUN6WWhLc0lhM3pyRERVQ3ZVZDFGc3g2NnhXRjcvemFkNGdJ?=
 =?utf-8?B?d2xUeXlkTExnalIzTzZxQm1ubGZhYWtKM1ZvWmFoMmdQMW5IanNXM2lwVmdz?=
 =?utf-8?B?aXBWT0JrK0paOS9aOWxRRVQ4MmZxRlVha0lpcllveW91T2d3YkdhNGZaVWM5?=
 =?utf-8?B?SG1XWnZHZDU3MlNxUjI3RjNYRHBqK3BYNTcrNzNKYlFEYWpWK3hTVlcxK0d5?=
 =?utf-8?B?RmRucjF4RlhFR0diT0tBVXloUWp5TXZlQmxBRGlubkp4d3FnSzBEM3ZsNW5u?=
 =?utf-8?B?VDhoTGJMSG1Jc3hrTFVoK0JRcGd4aFVpQ2hyUVAvY1VKaU5SRS9lQ1hneVgz?=
 =?utf-8?B?NHBaa0VJNlo3aGhtZEtMWGFGZXByMGhINFFKendHWnBmTVdDN0FwY0Ricm9z?=
 =?utf-8?B?Q3dUcW9BQVZyZ1Rqa3NXRG13ZHpMWFRNQTFadHlYN2swRklkMEFIWjdCTnVW?=
 =?utf-8?B?OTEvSlo0b0dUakI5YkJ0S1RIK1orMy96M2E0UGxWTTRaWWxaWkV0S0FpdDBo?=
 =?utf-8?B?dmJialIzWVNnU2ZjZHRWVENJY0Q3UWd4WDc4QWNlbjc0R3BJa3NDNWFnUzB5?=
 =?utf-8?B?UlQ2Mk40WHBtc0tJQlhWWllzdzRDWUZ5L2IyMnE3R0FqN2theElxdGtLK3RK?=
 =?utf-8?B?SjJVZ01nVmlscWdmeE9LdXpiYld0ZkhKSWtPY3FQUEV0T2ZiMG52QncyZm1a?=
 =?utf-8?B?ZEtuL2l2Q2VZUU5yVW9nOUFzS1M5ak85UmRWRWtHeEphaC9JNFppbVdELzlU?=
 =?utf-8?B?Tk9XZVpGUkUxMFRUcHgyczFnOG1zYVVuYU1YMDFzcXVXczU2WXF3UWNyRkdG?=
 =?utf-8?B?Rm9xbGUyUGJrRmJ4ZDFmMGVoV2FsQzkvQ3JPRmlNOGg3eStOSVljZGR1dUtt?=
 =?utf-8?B?VGVZcEczTXM1U1hLa09EVm55NWhlQkJIZ1kxQks5eGk3Zm5iSVdYOHFwQ3Fo?=
 =?utf-8?B?T0dwUURGTy9QcVAramhsNGRvdXM3YWVVVnRoSWp0T1VFd2MrQ1pUUkhMUXFY?=
 =?utf-8?B?TUlvcFQ2ZmZUS1VpZTNoN1lIYjRFYmN0VlExdDBBUysxa2NTR1prQnFWSldH?=
 =?utf-8?B?UUZSTTk0Z2FCOXZmSHphMm5jYjNWUlh2Z1dFRzFWa3BJbHl6MFg2S0lLVVJx?=
 =?utf-8?B?SmMzTE5DaDNiRVNvcWU1cEcwUjV6azlRcFZDS1haL0JIK0Z6bjBQYWRJWjRX?=
 =?utf-8?B?eS9OVHczSUVkWDI3dEtvYzVYendGOHV6cWJSNDVZMVp2YitIK09TSmwyNU8r?=
 =?utf-8?B?Z2xlbDBmV3RnOVBra1VyY2ZRWmd5Tk5UZTFPVWJ2aSt5dVhvcHNTVG9STFlm?=
 =?utf-8?B?V2d5R1NHdE01K25sSVpvb1I1Z2ZnMDhweUZWMXFwdHVkSG96ME0zK003Mjhi?=
 =?utf-8?B?MURUWmhzRWxtaWMwMEQwUEM3ckljNCtYL0toSjZPRlNGb2JNUzRaZndxb0N0?=
 =?utf-8?B?Y09yYkNkSWczUzB6cUpnUGpaMmloYXBnSi9GbExFd1A1eTBuRVpya0IvUUFR?=
 =?utf-8?B?aVlkcnRKWm5GYXFvQk9LS3ljdEhUUEVsKzFqUFhiRStxekhDZG1rVHNmOWJi?=
 =?utf-8?B?THpJclVmMTRnbzRKU3paRkpPV1l2WVdzNFVqNEY4eTJSQllLN0xWSDVNeERz?=
 =?utf-8?B?UkNPQU1hemk3RFRlbExUekJIS3BHWXFPRzdjUDJtbTFGVklmVlJ2Qzg5QzZO?=
 =?utf-8?B?R2ZYVEoxK1djNytzWjY2ZTNlMk9YVkFjVEpqWU9FRFFlUlBzd2FTdnRqcmJs?=
 =?utf-8?B?NnZGeGlESXFwT3BvTE5zWElSTDBUT1lTM0cxcnF5d1dIMWJWdERWYk9scDhM?=
 =?utf-8?B?VjBLb2gvQ3dmRTJ2ajhobWIxR2FPM1gxMFVXaEJXYytVQmNJTk5KM1dsMC9G?=
 =?utf-8?B?WVhjT2M4SEdibHg3dHg0dUNGaTBiaTZhYmRBbitJMkpSSzgycmhhamJBdFBp?=
 =?utf-8?B?OExwTmllNWhPM3dWWjFVZ1hYOS9VWkRRdHdOeEhXUTVxZGtQaUQ3WVlmNm82?=
 =?utf-8?B?Z3JoK0JqSHBNNW9QaVBSV0lJRU1tSmxoZEszdEM5SHNLb0FCYnBMTkVhRkJR?=
 =?utf-8?B?eUlHOFdhMWw1Mml4MFV4T1ZwK0xSa0RmVUtEMUJjVDhDQ0J1REJ0SFNkQUVC?=
 =?utf-8?B?YXFuZDNCd3VualJ3Ykd6a1FhdTJlRk02M2dwN2JMeSt2WFBuT3VSZmMvUmVD?=
 =?utf-8?B?ZkdDK2gwWmg1dW11b1hnMEN1VjFTRVBtMkxFZUNacE5vTGYyNnNqa0pCaW1m?=
 =?utf-8?B?N1p1UUxoK0puNmlkYzF2RXRvRXlDVytzcUpXeGlPZWY0bjkxSS94b2NlbVVn?=
 =?utf-8?B?MkRNYXQxc3JsRVlrY3E3SjVFZWcyMUVFblcvS28vSmhOelEreXgyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e449f1f6-ac02-4e20-e274-08dec7d8a77d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:44:07.2052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SlSKxaq3wYbU8xihkNE+mgQLz17IQsmchEqHP+siztFLw0E95L7K5JmjW3qiTMiTfZGXSb0t0S8+VviBZ+OhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7080



On 6/11/2026 1:50 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, 11 Jun 2026, M K, Muralidhara wrote:
>> On 6/10/2026 4:35 PM, Ilpo Järvinen wrote:
>>> Caution: This message originated from an External Source. Use proper caution
>>> when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Thu, 28 May 2026, Muralidhara M K wrote:
>>>
>>>> The driver hard-codes the metric-table region size to
>>>> sizeof(struct hsmp_metric_table). That is correct for HSMP protocol
>>>> version 6 but mis-sizes the ioremap of the SMU DRAM region on newer
>>>> platforms: Family 1Ah Model 50h-5Fh exposes a ~13 KB
>>>> hsmp_metric_table_zen6, and the table is expected to keep growing
>>>> on future firmware. The same hard-coded value also forces
>>>> hsmp_metric_tbl_read() to reject any read that follows the actual
>>>> firmware layout.
>>>>
>>>> Pick up the table size from firmware instead. SMU on Family 1Ah
>>>> Model 50h and later populates HSMP_GET_METRIC_TABLE_DRAM_ADDR's
>>>> args[2] with the DRAM region size in bytes; older firmware leaves
>>>> it 0. Bump the descriptor's response_sz to 3 so the field is read,
>>>> store the value in hsmp_pdev.hsmp_table_size at probe time, and
>>>> fall back to sizeof(struct hsmp_metric_table) when firmware reports
>>>> 0. Use hsmp_table_size both for the devm_ioremap() of the region
>>>> and as the upper bound for hsmp_metric_tbl_read().
>>>>
>>>> Behaviour on existing protocol-version-6 hardware is unchanged:
>>>> firmware returns 0, the fallback yields the same value as the
>>>> previous hard-coded one, and both the ioremap and the size check
>>>> produce the same result as before.
>>>>
>>>> The ioctl interface added later in this series uses the same
>>>> hsmp_table_size to validate the userspace request and to copy out
>>>> the full firmware-reported region.
>>>>
>>>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>>>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>>>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>>>> ---
>>>>    arch/x86/include/uapi/asm/amd_hsmp.h |  5 +++--
>>>>    drivers/platform/x86/amd/hsmp/hsmp.c | 11 ++++++++---
>>>>    drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
>>>>    3 files changed, 12 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h
>>>> b/arch/x86/include/uapi/asm/amd_hsmp.h
>>>> index fce271282348..438ac38d0dc8 100644
>>>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>>>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>>>> @@ -365,11 +365,12 @@ static const struct hsmp_msg_desc
>>>> hsmp_msg_desc_table[]
>>>>         {0, 0, HSMP_GET},
>>>>
>>>>         /*
>>>> -      * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 2
>>>> +      * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 3
>>>>          * output: args[0] = lower 32 bits of the address
>>>>          * output: args[1] = upper 32 bits of the address
>>>> +      * output: args[2] = DRAM region size in bytes
>>>>          */
>>>> -     {0, 2, HSMP_GET},
>>>> +     {0, 3, HSMP_GET},
>>>>
>>>>         /*
>>>>          * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
>>>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c
>>>> b/drivers/platform/x86/amd/hsmp/hsmp.c
>>>> index 9bad58fef304..cf9392f99298 100644
>>>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>>>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>>>> @@ -356,8 +356,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock,
>>>> char *buf, size_t size)
>>>>                 return -ENOMEM;
>>>>         }
>>>>
>>>> -     /* Do not support lseek(), also don't allow more than the size of
>>>> metric table */
>>>> -     if (size != sizeof(struct hsmp_metric_table)) {
>>>> +     if (size != hsmp_pdev.hsmp_table_size) {
>>>>                 dev_err(sock->dev, "Wrong buffer size\n");
>>>>                 return -EINVAL;
>>>>         }
>>>> @@ -398,8 +397,14 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>>>                 dev_err(sock->dev, "Invalid DRAM address for metric
>>>> table\n");
>>>>                 return -ENOMEM;
>>>>         }
>>>> +     /* SMU returns table size from Family 1Ah Model 50h and forward */
>>>> +     if (msg.args[2])
>>>> +             hsmp_pdev.hsmp_table_size = msg.args[2];
>>>> +     else
>>>> +             hsmp_pdev.hsmp_table_size = sizeof(struct
>>>> hsmp_metric_table);
>>>> +
>>>>         sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
>>>> -                                          sizeof(struct
>>>> hsmp_metric_table));
>>>> +                                          hsmp_pdev.hsmp_table_size);
>>>>         if (!sock->metric_tbl_addr) {
>>>>                 dev_err(sock->dev, "Failed to ioremap metric table
>>>> addr\n");
>>>>                 return -ENOMEM;
>>>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h
>>>> b/drivers/platform/x86/amd/hsmp/hsmp.h
>>>> index b153527e0a0d..e7f051475728 100644
>>>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>>>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>>>> @@ -55,6 +55,7 @@ struct hsmp_plat_device {
>>>>         u32 proto_ver;
>>>>         u16 num_sockets;
>>>>         bool is_probed;
>>>> +     size_t hsmp_table_size;
>>>
>>> Please add types.h include.
>>>
>> In hsmp.h, size_t becomes visible without adding anything new, because the
>> file already includes linux/device.h, and that pulls in linux/types.h
> 
> Please don't rely on indirect include paths. The rule for includes is
> Include What You Use.
> 
> There are some exceptions to the general rule such as linux/xx.h
> including asm/xx.h, in such case you only need to add linux/xx.h.
> 
Understood. I will add <include/types.h>
> --
>   i.

