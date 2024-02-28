Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0E412C535
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Feb 2024 10:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709117206; cv=fail; b=mciPdjq8FBMv9P7kXG7mdb9IJH0HofnTQPVB/kwFjkYbuxM3Ywe1mExTybWfT+urFwbe+skguRZubxUmr7lITsmKwq3s9wZP9V6ESi1T/KOkyEgBCxnUkLFlBLI5WCC7zjOQ5Zg+CvlJP5NPPHBvDV5308dEXMr9+rtfL6zCpo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709117206; c=relaxed/simple;
	bh=E2jhyyelIsiGY8cR4Lfvz73tZR17jt/GY9rsxEb+++0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UxH/wiT4PJANtR9n+sbTloG1HdR7/VlizJjAIifBiCWsU0rzsqWWiWiLybiLFxwHc3LQ8YW6hTbwtUAtOzf7UKvjfrmuD0UvQG+yd4oAAkg6+9mivPTfjKgiQFHoXBogkfou2Byf2f7vVgKFwlD3hkPiQUVx8VhT2s4RPgswAgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3ZZMWE80; arc=fail smtp.client-ip=40.107.223.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3ZZMWE80"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxBGUO8qKuY17ZLrhHnm/wG8euu3mJ67xxbPNCdeHyIjnRVx2IOGwGxcyZAWB97mvJblSSi/d6auisfoElTrhp93JDgmjpgGO/7JLMzLhsvJNOZlopP4EwqDr88t+l9PIKVz2HPX2tMkVQ+kxuAj2e4BJ1vAVHFoIjqbvPofAgt4N4bzYONwil/nbOjKnZkKX8pJ+x0PNYZYUyZ5j7FlePfONqKm2NGwa97ZXqNj9Zv+YD6h5nS4I3oPEhhFZXQlJyR9W6xfc1kp6JNlIJRCxXsZdsetdMz5njMJN0XP5NVCWscvFa0+oUjqM9F8O1UbwEEMxj7uI0/rYO2V4zpwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jB19zrKeslkADIvZN31BRK6FtMV7y7XpVuZ4jKJaod0=;
 b=SWP5i47g++pCl0Iy1eQ3Ijlmbn0KVvsgx+dSZ3kcj8uHqxoBm26CHAYfQOtuOWitV3EYEh7IQiUchcJgo3zh7gzeKLLC1ugHiVmAFgYYHWmenIce1gpdCX6n+zVsjnE7TKmKVH6JZ/GDRYnbyraJm18BQ+dYTp/LZiAVXiWeUbSTeGFSHZx/m/LPqbVrb4HnjzJv4p2FV4aGe7Av5XL2eoSlwSWwMHpTHSRTViEpTpiscjgjSSoI93sF3DDBxv3aaBE3F0fj7ujmfUZBRM1INURRpHSEcD1Y2TmYGGZBpJwEA3nfWKPczr7QkSnqaaFrnLmyL/AKXlMeapX00MXjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jB19zrKeslkADIvZN31BRK6FtMV7y7XpVuZ4jKJaod0=;
 b=3ZZMWE80rLsKAG4nJ31z1CEBrAyDF5MHfPQs8QOZ0TSYMozuZY+x6XXC2aJnh+3LZ/8qAaCpp4VYApK2EyN2YsTpG/WncduQHCCc8fvX2XXqyym30j52OlR20VXUEWDMo3gfHD3iNrnXD4XTbyaVTXRGZwNOLzEDMFK5bpp6kDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by PH8PR12MB7253.namprd12.prod.outlook.com (2603:10b6:510:226::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Wed, 28 Feb
 2024 10:46:40 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1%3]) with mapi id 15.20.7316.039; Wed, 28 Feb 2024
 10:46:40 +0000
Message-ID: <14589eac-905a-4484-8d71-082bc9b5c212@amd.com>
Date: Wed, 28 Feb 2024 16:16:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add AMD MP2 STB functionality
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam-sundar.S-k@amd.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org
References: <20240226151309.2147799-1-Basavaraj.Natikar@amd.com>
 <29b9bb82-8eb2-4030-953c-b213e1a5861a@linux.intel.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <29b9bb82-8eb2-4030-953c-b213e1a5861a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::22) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|PH8PR12MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 632d1d98-21ac-4681-4ae8-08dc384a8ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NjUNZue1YYnnroqKoo9nixtXFyZZekLwfuSltXhqsyFPfZNK2GqrTDzZQjfVNzJPIOnT5+MkBFN/UR/AocrsEdmeSe5kscglYy0bCGXodx7kYnvIv4/ruaMLttjjq8Nmxe76ImCpGDk/DeSK2U4SD+7F2clIvpdOFtGxM8CN2sD2KUQkNGh4sLiYJieMe6JzQQ09WBygX/Yttv0BFV1Sd8dEc2xV7rS79Udhg/9gNtC2lBkixbkh9lBii+t9ckkMcGkbplajCNRrwuh22YcCkkRRFWU0klcByoupjIpzarTpXDsph+1sBzwy+f7yJgXEfCay9nxCKRaymCWfXBv3SbRs7baRb+vgg0G/XQJy1yOh2ASZuJ3wO5mrLY+9hOIISHVg1nyxHed45KRInSGxloaDIebpFNbaKhKCRzt2eXVpy1omhEQjl1raNL9C0wO8vv8ISD3zwZN1vMpyK++Ho9iJ9H0GoSsj9Xr3Aypq6apztaMCFvVLymdRSOmQJ+38gDyl2w4nLLjfbVkWD47AtszcZDZ/ckRjdTQfXgAE44OQ8Ax4pg1csAlnVVy6kwn4TdH/UGvKBj77BuQybYCQrB3g88o/5rngDHkPsoUbEjCV6nw0h3mapc0x11ZrExs/FggJE0VvizcZYwTpJ8Absw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1JibGc4WEdhR043S1FPMlR3MlNWWnl5aC9ldzQwSWNBUXFPcVpDODk1K05K?=
 =?utf-8?B?c2tKNS9VL1Fjc0lZSnYrS2JSMjlhWmU5N29OOFlVNnQyL2laM0M5SzJDT0c4?=
 =?utf-8?B?bXN2S0U5TEdINTAzUmlvMEpqOU4yUHBHN3NOWU9VN3FIQ21JbjM1MGpsNVlw?=
 =?utf-8?B?LzlxbzM3WDJkb2NnVDliQ3NLeHUwOTRRV2k2bERsM2ZlNjdMOUR3alVueklr?=
 =?utf-8?B?U2ZwNisrMTNpeEdRR0ltTmhueldzSnEvRWdSUkd1Wlo3Tys2RzliVFFhWVh6?=
 =?utf-8?B?UndCRkovTmcvM0tFRktsMHJsdXNKbTlXSnBzRmtMZnlVMHdSZHBWbjVUdVNW?=
 =?utf-8?B?ZlIyeU5DbldadE5Wa0h0T3ByR2dBcHM0anlDUTdhRytqWFA5eXIxUFY2MU5u?=
 =?utf-8?B?YnBPcHVRUjlMT0NTaUg0cWUwVDFxdTBrV210blJSMDBmcm1oMzlndHMvVTNV?=
 =?utf-8?B?VnVjelFDaU0rUWVucXZJRFFxQzVqZ2tmQ0g4THdtSUROUW9pWkdiMDJFcnNF?=
 =?utf-8?B?UEZwNVM4dzhiYW5MNlgzV3V1SVljZkVsZFBQSTJWaFo3YkE2b1NTTWV2ZHVu?=
 =?utf-8?B?Njgxa2U5dnFiRWNDeXNDQm1uMTd4UUxwaldOTnlJWjgrZFlMYWQ4NWZXd2VU?=
 =?utf-8?B?S0RrU2tCWTduZkU5NHEvTk1Kc0ZKTUZ2ZVlJUkhYL25KUTJmTUY5aXVmZlM5?=
 =?utf-8?B?VWtKdHA0MGdVSGFiOXNpRFRkd2NKeFVjeCszQW1wWkFHQ1Z2S25wL2JLbEtX?=
 =?utf-8?B?U1RFN0ttcWZSRmtQVXBpUkdaL1RZYXhUMFNpcGI1RVNnZFJlOUdsb2JGbHBS?=
 =?utf-8?B?d3FvNFFUUDdoRWFKQ1ZhNlNjOTJkcHJsekF3MkxSbWRWYnVOd2lkZ0ZKV1Nu?=
 =?utf-8?B?RVcwbVg0Nzc2L2MwYnAyeHlYZk1vYTFRUkw1eXdzTUZLdVk0djdSR2RKVXVP?=
 =?utf-8?B?dG5QQTZpMklEZk8xUUw1Z0h0YmM3QUJKbitIMFZpdmYwaDhsWDBPS3RoZmNq?=
 =?utf-8?B?TVpVWU1sQUkwRTBNRWMrMUo4QjNmMEtDbWlidTA1UXFLZlhMYnhUVGVObElO?=
 =?utf-8?B?ZHRIMHk4WHphYnBXMG96MytkdUlORko0cUViYjBYdENmYVdIME04NmxiYWFo?=
 =?utf-8?B?SERNejNjT2wvVWYxalJxMDhDdWhjKzFqVmowcVJyWWY2ZHZSQzFmV1RZaGQw?=
 =?utf-8?B?SG9FT0Vta2ttckI1SW1pbEgwUGFNVmZoMFdVelNBc21LR0ljbUdRamhsUXNl?=
 =?utf-8?B?elVsRVgyUmVHaXYzcmNGRXdZaGh0UDMvbGNGZ3pYVlowUWZyUjZqNEJNd3FH?=
 =?utf-8?B?eVgzNDNIZFlncnQ5eW9zMEFUMUF2clFOVStXZkV3LzBDUURoVHIySUtVRmtk?=
 =?utf-8?B?L1VnZ256NmprbkJEcXJkdmk0TDc2NDlya0Vad3BQR0hhOHdFYmNHTzV3czdn?=
 =?utf-8?B?dlBpVVZUTnQvRGgwclpsR3c1RGVDL0lBWXFPdll3dy9QNFgzeHBnVTZvaTEr?=
 =?utf-8?B?RFFsMndYTEh6N2pZL3krRWxhcjhNRk9vOWhkMElLcjZOQmk5c3lZcUFDSlla?=
 =?utf-8?B?bTZVdmtNcjh6ekpneDVwRk5QeVlZRDR2anhVaWl6QVJ2bmk2SWU0cVM4Z3R6?=
 =?utf-8?B?VzBRWXJFbjcyb1oxSUhUYmFqL3p5Z04vdWQ3ODBxTDNybGQ2US9WZXNrZDc5?=
 =?utf-8?B?NElOZjQwd0xPL25sTHFWUmcxdjFNMGl4THFta0RudU5mNnBJeW5pTGFoc2Rq?=
 =?utf-8?B?K1FBWDZoVVBDNmh0MitwYktUT2R1L1RXQlMvcFBwcU1tWDJKMTBuN0ZoeFA5?=
 =?utf-8?B?M2gzYUhnay8vcFp4dGZFWFZ4MENjY1pMN1c5dzlyc1hkZUlubFUrb2s4NU50?=
 =?utf-8?B?NWFZTDk3dy9ESGFUTUZtWXdrbmFiYUJaZzRlTWJYWnJFNzlNWW5CNk4vTDhH?=
 =?utf-8?B?bzF5UmJaTkoydDU2Y0FDUGdDQy9Qa1liRGdWTGdlYXhRQm5UYktNemdsMkpV?=
 =?utf-8?B?NnF4YTJiTzhaNHJrT0RvY3NZYVZZQ0NGKzRnZldQRTFIbGFJb0sxczh0eTkz?=
 =?utf-8?B?SHl3ZEVDSDl5VTR6KzZ0YlRLNGw4ZjZGT0tVdUdDSkVlZjJVb1FWcVRHOG05?=
 =?utf-8?Q?vNURh6c3CYzQOZw0TRwmDLgLe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632d1d98-21ac-4681-4ae8-08dc384a8ba7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 10:46:40.2752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IG93pbCL08YHroOGAweew1VEedUQwxr5VXL05I1CcyKL9tcqK3Rgx84p3WZULTG6gbZXsa3jDaSm5hP/m6ZytA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7253


On 2/26/2024 11:48 PM, Kuppuswamy Sathyanarayanan wrote:
> On 2/26/24 7:13 AM, Basavaraj Natikar wrote:
>> AMD MP2 STB function provides a data buffer used to log debug information
>> about the system execution during S2Idle suspend/resume.
>>
>> A data buffer known as the STB (Smart Trace Buffer) is a circular buffer
>> which is a low-level log to assist in debugging by providing insights
>> into any potential hangs or stalls that may occur during the S2Idle
>> suspend/resume processes.
>>
>> The current PMC driver retrieves STB data from MP1, but there can be
>> scenarios where MP1 might hang or become unresponsive, leading to the
>> loss of critical data present in the STB buffer. This defeats the purpose
>> of the STB buffer, which was originally meant to help identify system
>> failures.
>>
>> This feature creates stb_read_previous_boot debugfs allows users to
>> retrieve the STB log from MP2 specifically from the last occurrence of
>> the S2Idle suspend/resume. A userspace daemon can access STB log of last
>> S2Idle suspend/resume which can help to troubleshoot potential issues
>> related to hangs or stalls during the S2Idle suspend/resume sequence.
>>
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>> Changes in v2:
>> 	- Used linux/sizes.h instead of defining KB.
>> 	- Defined timeout containing unit as per USEC_PER_MSEC.
>> 	- Modified macro of AMD_C2P_MSG and AMD_P2C_MSG.
>> 	- Changed string stb to STB in log messages.
>> 	- Defined literals using Macro.
>>
>>  drivers/platform/x86/amd/pmc/Kconfig   |  23 +++
>>  drivers/platform/x86/amd/pmc/Makefile  |   1 +
>>  drivers/platform/x86/amd/pmc/mp2_stb.c | 227 +++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmc/pmc.c     |   5 +
>>  drivers/platform/x86/amd/pmc/pmc.h     |  12 ++
>>  5 files changed, 268 insertions(+)
>>  create mode 100644 drivers/platform/x86/amd/pmc/mp2_stb.c
>>
>> diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
>> index 883c0a95ac0c..8177486babf9 100644
>> --- a/drivers/platform/x86/amd/pmc/Kconfig
>> +++ b/drivers/platform/x86/amd/pmc/Kconfig
>> @@ -18,3 +18,26 @@ config AMD_PMC
>>  
>>  	  If you choose to compile this driver as a module the module will be
>>  	  called amd-pmc.
>> +
>> +config AMD_MP2_STB
>> +	bool "AMD SoC MP2 STB function"
>> +	depends on AMD_PMC
>> +	help
>> +	  AMD MP2 STB function provides a data buffer used to log debug
>> +	  information about the system execution during S2Idle suspend/resume.
>> +	  A data buffer known as the STB (Smart Trace Buffer) is a circular
>> +	  buffer which is a low-level log for the SoC which is used to debug
>> +	  any hangs/stalls during S2Idle suspend/resume.
>> +
>> +	  The current PMC driver retrieves STB data from MP1, but there can be
>> +	  scenarios where MP1 might hang or become unresponsive, leading to the
>> +	  loss of critical data present in the STB buffer. This defeats the
>> +	  purpose of the STB buffer, which was originally meant to help identify
>> +	  system failures.
>> +
>> +	  Creates stb_read_previous_boot debugfs to get STB, a userspace daemon
>> +	  can access STB log of last S2Idle suspend/resume which can help to
>> +	  debug if hangs/stalls during S2Idle suspend/resume
>> +
>> +	  Say Y or N here if you have a notebook powered by AMD RYZEN CPU/APU
>> +	  and supports MP2 STB.
>> diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
>> index 4aaa29d351c9..f1d9ab19d24c 100644
>> --- a/drivers/platform/x86/amd/pmc/Makefile
>> +++ b/drivers/platform/x86/amd/pmc/Makefile
>> @@ -6,3 +6,4 @@
>>  
>>  amd-pmc-objs := pmc.o pmc-quirks.o
>>  obj-$(CONFIG_AMD_PMC) += amd-pmc.o
>> +amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
>> diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x86/amd/pmc/mp2_stb.c
>> new file mode 100644
>> index 000000000000..258de76cddce
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
>> @@ -0,0 +1,227 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD MP2 STB layer
>> + *
>> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> + */
>> +
>> +#include <linux/debugfs.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/pci.h>
>> +#include <linux/sizes.h>
>> +
>> +#include "pmc.h"
>> +
>> +#define VALID_MSG 0xA
>> +#define VALID_RESPONSE 2
>> +
>> +#define AMD_C2P_MSG0 0x10500
>> +#define AMD_C2P_MSG1 0x10504
>> +#define AMD_P2C_MSG0 0x10680
>> +#define AMD_P2C_MSG1 0x10684
>> +
>> +#define SLEEP_US (0.5 * USEC_PER_MSEC)
>> +#define TIMEOUT_US (1600 * USEC_PER_MSEC)
>> +
>> +#define LEN_2KB_BIT 1
>> +#define LEN_16KB_BIT 4
>> +
>> +static struct amd_mp2_dev *mp2;
>> +
>> +struct mp2_cmd_base {
>> +	union {
>> +		u32 ul;
>> +		struct {
>> +			u32 cmd_id : 4;
>> +			u32 intr_disable : 1;
>> +			u32 dma_addr : 1;
>> +			u32 rsvd : 26;
>> +		} cmd;
>> +	};
>> +};
>> +
>> +struct mp2_cmd_response {
>> +	union {
>> +		u32 resp;
>> +		struct {
>> +			u32 cmd_id : 4;
>> +			u32 status : 4;
>> +			u32 response : 4;
>> +			u32 rsvd2 : 20;
>> +		} response;
>> +	};
>> +};
>> +
>> +struct mp2_stb_data_valid {
>> +	union {
>> +		u32 data_valid;
>> +		struct {
>> +			u32 valid : 16;
>> +			u32 length : 16;
>> +		} val;
>> +	};
>> +};
>> +
>> +static int amd_mp2_wait_response(u8 cmd_id, u32 command_sts)
>> +{
>> +	struct mp2_cmd_response cmd_resp;
>> +
>> +	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG0, cmd_resp.resp,
>> +				(cmd_resp.response.response == 0x0 &&
>> +				 cmd_resp.response.status == command_sts &&
>> +				 cmd_resp.response.cmd_id == cmd_id), SLEEP_US, TIMEOUT_US))
>> +		return cmd_resp.response.status;
>> +
>> +	return -ETIMEDOUT;
>> +}
>> +
>> +static void amd_mp2_stb_send_cmd(u8 cmd_id, uint8_t da)
>> +{
>> +	struct mp2_cmd_base cmd_base;
>> +
>> +	cmd_base.ul = 0;
>> +	cmd_base.cmd.cmd_id = cmd_id;
>> +	cmd_base.cmd.intr_disable = 1;
>> +	cmd_base.cmd.dma_addr = da;
>> +
>> +	writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
>> +	writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
>> +}
>> +
>> +static int amd_mp2_stb_region(int len)
>> +{
>> +	struct device *dev = &mp2->pdev->dev;
>> +
>> +	len *= SZ_1K;
>> +
>> +	if (!mp2->stbdata) {
>> +		mp2->vslbase = dmam_alloc_coherent(dev, len, &mp2->dma_addr, GFP_KERNEL);
>> +		if (!mp2->vslbase)
>> +			return -ENOMEM;
>> +
> I don't see you freeing this memory. Don't you need to free it?

All memory allocated and used are resource-managed. Therefore, in the v3 patch, I will use
devres_open_group and devres_release_group to free all resources appropriately.

>
>> +		mp2->stbdata = devm_kzalloc(dev, len, GFP_KERNEL);
>> +		if (!mp2->stbdata)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_mp2_process_cmd(struct file *filp)
>> +{
>> +	struct mp2_stb_data_valid stb_dv;
>> +	int status, rc;
>> +
>> +	stb_dv.data_valid = readl(mp2->mmio + AMD_P2C_MSG1);
>> +
>> +	if (stb_dv.val.valid != VALID_MSG) {
>> +		dev_err(&mp2->pdev->dev, "Invalid STB data\n");
>> +		return -EBADMSG;
>> +	}
>> +
>> +	if (stb_dv.val.length != LEN_2KB_BIT && stb_dv.val.length != LEN_16KB_BIT) {
>> +		dev_err(&mp2->pdev->dev, "Unsupported length\n");
>> +		return -EMSGSIZE;
>> +	}
>> +
>> +	mp2->stb_len = BIT(stb_dv.val.length);
>> +
>> +	rc = amd_mp2_stb_region(mp2->stb_len);
>> +	if (rc) {
>> +		dev_err(&mp2->pdev->dev, "Failed to init STB region, rc %d\n", rc);
>> +		return rc;
>> +	}
>> +
>> +	amd_mp2_stb_send_cmd(VALID_MSG, true);
>> +	status = amd_mp2_wait_response(VALID_MSG, VALID_RESPONSE);
>> +	if (status == VALID_RESPONSE) {
>> +		memcpy_fromio(mp2->stbdata, mp2->vslbase, SZ_1K * mp2->stb_len);
>> +		filp->private_data = mp2->stbdata;
>> +		mp2->is_stb_data = true;
>> +	} else {
>> +		dev_err(&mp2->pdev->dev, "Failed to start STB dump, status %d\n", status);
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_mp2_stb_debugfs_open(struct inode *inode, struct file *filp)
>> +{
>> +	if (!mp2->is_stb_data)
>> +		return amd_mp2_process_cmd(filp);
>> +
>> +	filp->private_data = mp2->stbdata;
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t amd_mp2_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
>> +					loff_t *pos)
>> +{
>> +	if (!filp->private_data)
>> +		return -EINVAL;
>> +
>> +	return simple_read_from_buffer(buf, size, pos, filp->private_data, SZ_1K * mp2->stb_len);
>> +}
>> +
>> +static const struct file_operations amd_mp2_stb_debugfs_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = amd_mp2_stb_debugfs_open,
>> +	.read = amd_mp2_stb_debugfs_read,
>> +};
>> +
>> +static void amd_mp2_dbgfs_register(struct amd_pmc_dev *dev)
>> +{
>> +	if (!dev->dbgfs_dir)
>> +		return;
>> +
>> +	debugfs_create_file("stb_read_previous_boot", 0644, dev->dbgfs_dir, dev,
>> +			    &amd_mp2_stb_debugfs_fops);
>> +}
>> +
>> +int amd_mp2_stb_init(struct amd_pmc_dev *dev)
>> +{
>> +	struct pci_dev *pdev;
>> +	int rc;
>> +
>> +	pdev = pci_get_device(PCI_VENDOR_ID_AMD, 0x172c, NULL);
>> +	if (!pdev)
>> +		return -ENODEV;
>> +
>> +	mp2 = devm_kzalloc(dev->dev, sizeof(*mp2), GFP_KERNEL);
>> +	if (!mp2)
> missing pci_dev_put(pdev) here. I recommend doing it at the end with
> goto for error paths.

Yes, I will add a new function amd_mp2_stb_deinit which includes
pci_dev_put to be called in all error paths accordingly

>> +		return -ENOMEM;
>> +
>> +	mp2->pdev = pdev;
>> +
>> +	rc = pcim_enable_device(pdev);
>> +	if (rc) {
>> +		pci_dev_put(pdev);
>> +		return rc;
>> +	}
>> +
>> +	rc = pcim_iomap_regions(pdev, BIT(2), "mp2 stb");
>> +	if (rc) {
>> +		pci_dev_put(pdev);
> Wondering whether you need to disable pci_device?

All memory allocated and used are resource-managed. Therefore, in the v3 patch, I will use
devres_open_group and devres_release_group to free all resources appropriately.


Thanks,
--
Basavaraj

>
>> +		return rc;
>> +	}
>> +
>> +	/* MP2 MMIO is mapped to BAR2 */
>> +	mp2->mmio = pcim_iomap_table(pdev)[2];
>> +	pci_set_master(pdev);
>> +	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>> +	if (rc) {
>> +		dev_err(&pdev->dev, "failed to set DMA mask\n");
>> +		pci_dev_put(pdev);
>> +		return rc;
>> +	}
>> +
>> +	amd_mp2_dbgfs_register(dev);
>> +	dev->mp2 = mp2;
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index 108e12fd580f..8baab1c3cca9 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -1106,6 +1106,8 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	amd_pmc_dbgfs_register(dev);
>> +	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>> +		amd_mp2_stb_init(dev);
>>  	pm_report_max_hw_sleep(U64_MAX);
>>  	return 0;
>>  
>> @@ -1122,6 +1124,9 @@ static void amd_pmc_remove(struct platform_device *pdev)
>>  		acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
>>  	amd_pmc_dbgfs_unregister(dev);
>>  	pci_dev_put(dev->rdev);
>> +	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>> +		if (dev->mp2 && dev->mp2->pdev)
>> +			pci_dev_put(dev->mp2->pdev);
>>  	mutex_destroy(&dev->lock);
>>  }
>>  
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>> index 827eef65e133..be0f6b674133 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>> @@ -14,6 +14,16 @@
>>  #include <linux/types.h>
>>  #include <linux/mutex.h>
>>  
>> +struct amd_mp2_dev {
>> +	void __iomem *mmio;
>> +	void __iomem *vslbase;
>> +	void *stbdata;
>> +	struct pci_dev *pdev;
>> +	dma_addr_t dma_addr;
>> +	int stb_len;
>> +	bool is_stb_data;
>> +};
>> +
>>  struct amd_pmc_dev {
>>  	void __iomem *regbase;
>>  	void __iomem *smu_virt_addr;
>> @@ -38,10 +48,12 @@ struct amd_pmc_dev {
>>  	struct dentry *dbgfs_dir;
>>  	struct quirk_entry *quirks;
>>  	bool disable_8042_wakeup;
>> +	struct amd_mp2_dev *mp2;
>>  };
>>  
>>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
>>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>> +int amd_mp2_stb_init(struct amd_pmc_dev *dev);
>>  
>>  /* List of supported CPU ids */
>>  #define AMD_CPU_ID_RV			0x15D0

