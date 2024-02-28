Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E97213849A
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Feb 2024 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709117326; cv=fail; b=E/UrUA7p+zOjvYgpT+u6DwfgFCmQ508D5aWR94VweoZeetlMRg4FjLkAbER74OSSXoBojVrci1wJbK/TmU98DaJc1giQEpDcs4QXx00MM0Q+56lKQl5W8MHpfNkn3BbA2osA61LbR/SJQGO7+FgXaGD7CT1ONQvWkEYfyoqjWcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709117326; c=relaxed/simple;
	bh=BMs0ZA1RP7zhufpO1iUJ+UM6OGIEKSHhdQ5+c5kY/+o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dmHgVNtZnIJeErcErljbtQFil8ALtWtig4WcBjptjaqbx3vGAIPYBEb6j3Zfj30KdxtnH9Xaqa9Tl6vF6F2kLhst1uzPTQiaFVcxuoLT2VSsA9JtViHWkc7+4RuTCPupP8Z0vtnFOgiTpcMbLE/5rerVMds4Cfbs5zHk9v+ahZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PcTcirYx; arc=fail smtp.client-ip=40.107.244.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PcTcirYx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVEnBmzY61Bn6OZ9YGRxlNfvWXPCuymzDLG3UjuXT/NbtPOXhrhwMVrFvxrNMBqOSRfoVV4uVHrJI3VsHm4F44Ek9IJIMoMgEv1gaItMGHnqWO2raBBeSw4uWQq66fR8EfcRmsqPplA/J1lJBjxkB+/6ThiTgQ934MYyUeKbXlOkEalsRkLY1PfrxSNgQPqYGnRxAwJARPFK/aXUYTldXSXCscb/oDFvDNiFWAt2L61Zeo62y4kB9LR/+pXSmmBVWYZWCpca3D7/69ABBMBJj5VOeBQks0b1vjbHv+Spx1JksYbnKsUe2omprtkJEwWRjNa6gGj7isOCd75syz6mDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwF4fHXQCZY79RKXbB5WS8JoF/vGm3FCHBm7vLdU8o8=;
 b=UxfzgfeTFbFFuXTvu7piwaIkFu6UGG4ApoNnSKiq44S9m2m6Dj6xvmWAHXKrOVCQH7lum+P19CNvygMy83t6GXSIrAHFtXvVAeoLxJsp5Kyr7mqeHIXY86GTUROVmcwRCKd0ht2Mseud/SfaAZctor5Qh72JDscDGCdKfy/O+WW81ywX4kT1duZTlfq2UIkO7F698tukAo2N69ZJAKVvQ/veos3oH7+l89s8gWPS6GI2LOCQDvB7Nnuez2xRW3GCJUfb7Dr9Vm3GU6HqELj52T+VGGTrCTUGvfz4GtLcfPB5maDJQufjv3sh+JBGeah4Vk158GSdUN09R8/7W8ghmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwF4fHXQCZY79RKXbB5WS8JoF/vGm3FCHBm7vLdU8o8=;
 b=PcTcirYxkPZW1uvds9ZWefF1exefMn6amIUGbI0pwmuIbktFqTFMJoRlEGghvstkVSIB6o09Q3PXfvVUTspysFBsfQBu21mumZFAmoZDCEWOyI2IgMH3XlVw2jr0blvslSthKDVw1UHKurSBpJ/iC+9QQKSjSkQ8FO78KUEthNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by CH3PR12MB8510.namprd12.prod.outlook.com (2603:10b6:610:15b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb
 2024 10:48:41 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1%3]) with mapi id 15.20.7316.039; Wed, 28 Feb 2024
 10:48:41 +0000
Message-ID: <a17f71c1-0084-4c64-b765-2f305662dc87@amd.com>
Date: Wed, 28 Feb 2024 16:18:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add AMD MP2 STB functionality
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Shyam-sundar.S-k@amd.com, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org
References: <20240226151309.2147799-1-Basavaraj.Natikar@amd.com>
 <2294f1e9-2da3-aa07-dac1-02ffc402a424@linux.intel.com>
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <2294f1e9-2da3-aa07-dac1-02ffc402a424@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::14) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|CH3PR12MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: a514959e-6149-4cb4-5ec4-08dc384ad409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	97BtQIPsc8mhqsPik6OiY+FVirtAzq3WHiApLx6rXc3qK2xqmE874/Z8ACr6QTKQyqMBxN9s4sO1E33Gh6zVM4V5JeWWO2apWwqY/VPzNS3RK7R/RSRoLPZL4MhR2kTmnKEbckae0MjEFGBEoNt9jW9+5AW39bftkLhh9EI0zLF1oFViZz/eHnRxnpIRR6DJVYGrTpd7cCc2Xe6l0Y3OrUo/2I28l2zTi/2fQ92T5Fjs1kRYKUeXd3EypxBba0/NiRkpTakf0s2KsiY7XJhwCf2B/WNBestodP2qzum58PDlWuXI8HqYrw0vnTm41qMU4zOZ3G+ABi2HIv1uBxWzoRmQFOHwFdacrjLUJEDF3kE7DH9XJm/bDh6TCjGHahPJXLjN+/CuppyBUMHhKPoq674g1+W6XKHlDWLFBtQulshRp6cgN38Sl0xHGoYnucBt2zIbKUECLtqBB97x+jNXjrkvihhaBaFovN55QDh3ayQZZB6nX819cDrzcm/1LIJg/bbmD/cSL5RZjnsY465loUNhKC8dXQ9XrZRI5Zq0lMdbD49HIC/O59OOGr/US06CH9PudDDQ9m4I8W5BmRxjOMeDv6kHWDXcOxCkYh/pb0stDbazGSOgBgum9kuXXsW0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVpHaVUzTFU3YTlhZURQd2M1MEhRQU1XVXFpYWV1R3FSQlphUDhuaHlJMHZx?=
 =?utf-8?B?VXN4R0hXUER4d1pHYlNqbWVJOXNwYXQ0elJPRlhtVnVLSkRHMG9MWm56STFE?=
 =?utf-8?B?YTM0cmhkWVZiMHVSRWJOOFk3WmpjSEdCVjYwWFRJMThQTXR1M0lkTXNTS1pW?=
 =?utf-8?B?cWhGR25qa0J4b1YvUWhnTC93UXNjRVV1UFA2NkhqNFE4cTVEY0dLWk9tc2lr?=
 =?utf-8?B?VHdtbUhjdzBiZ2lLT3k5MVlVNEQvYS8zT0RWYVlwa2Y4WklvM0lyV2VDclJE?=
 =?utf-8?B?WGxEZU1RQUF6VFZzaW9KY0dzb1h1dm9VTWlFTnBIbGhFS2VLODZJL0hPTVlk?=
 =?utf-8?B?TE9vb2xVTEx4aVdUY3JhZDRvQS91OW1UakMyK1B2NjFUMEd2cnkwYjBML1pi?=
 =?utf-8?B?dUFoUUFnSG53YnZ2TzE3aGdpbGx1UjNFZ1F6OSt2YlJhVVM0NWZrVDBSU0lo?=
 =?utf-8?B?cjJuTGpQMGVXRGpJbmFsRzVUUXlGeDFDRmxnVXdNc0tSOXFrcEdmMW1QS1pa?=
 =?utf-8?B?eEZSeGtqRkRRN0QvcGpiWEcxSEtCcE1QTFBadWh5VFNQa3lKeHJKT2tnTWZx?=
 =?utf-8?B?SVM3cExwZWZhKy91SEt4SUhpekF2bi84TVI5akZpa1B6NDlFM1hreFY5WFRV?=
 =?utf-8?B?OEphbXUwNjBZTndHVStDSDQ3QW1DdmY3STUzb0sxZy80SS9zR3FwM3RjY2JK?=
 =?utf-8?B?WWhUeithU2drR0EvMTJOQUplaFNYWTVSSGF3REFSYTBrWVBuSHBuT3dyUGRM?=
 =?utf-8?B?N2hlV1dCTzJhUHc1ZHJCbFBELzNTb281dTREV2VaZnBsWllDSklkZzRtM3Nw?=
 =?utf-8?B?dCtYYmRtMHU3dDg0N2VWSSs1NW5BUmRSM04ra2R5REc4WGtycERZa3ZWT3ZR?=
 =?utf-8?B?S1NYSGlZaEU3Mm5Lc3N5cm9ocVZWZ1RDT0xXSHlZRXFjakV4bTNnR2Y0T2Jx?=
 =?utf-8?B?QnpNQjRHY2hNUjZVOUx6dmdGOEZ5MU4wTTEvVVFMR3gwbmM1Y1BWL0dPb1NG?=
 =?utf-8?B?dkhTaVlLRXBCZHlOZVJSaXE3RzdTWG1KdUNQdEJOdmxtdmFyWFpGZkhJeGRR?=
 =?utf-8?B?WnlyQXdCM0tya0FkWTZLRW1CU29aQjlTditFaktuVDJLTmUvRTdKL2xoUFhP?=
 =?utf-8?B?N2VmRlZGV3Nxb0hyMXR3Nkpxb3piN1lKalJDMjh6WmUrK1oyK2Y1RHVvbjgx?=
 =?utf-8?B?Z3hTcGdFK2l2dUpDNzlpd2lxa0RnOXJveTJDYmVNRVR4UFN2K0VxZUxFV1Vt?=
 =?utf-8?B?K095QW5YZnBjTUFpTFFZVE1pWXhnd2w3RmxNcWY5YlcvYzZKNnlqcHFWQlhu?=
 =?utf-8?B?Zm9nTFJYbjRHNDlZdENPUTFrVXFMOXlabnIxY2pwck1uVXZadytWa2ZHbHNz?=
 =?utf-8?B?bHlIcmNWc3hCYmxNWU5IVUFDdU1salRpYVdURWZOUGM3dFA1SEp6OG91ZE42?=
 =?utf-8?B?S01XR2J3TVpIUUdFcStzbEQ2V3RNMkt4NktVb2JzeG8xQm1lZGRwSjRsMW9u?=
 =?utf-8?B?ME04Ry9SWkFleXQ4RnRJdWZBMWlSMGNTZlZSSjZPbXc5c0lCL0dmYXN6UHNX?=
 =?utf-8?B?TXVjVFN6TTc0SmlkSlhFSEkzU1VpZjA1L0djcjlibHBsM1Q2NGhzZUxDMWxB?=
 =?utf-8?B?YzZoWWF1dTdUTGliRmlTSHpOc0lQalZZalNFQnNYcUt1NldTdjFVdkdNb0hx?=
 =?utf-8?B?TjNiZ2g0RmlFZkNTb09yZ2lEV2MrT2ZjUmZkd0FhQW0zTTRWN1BuOXI1THJP?=
 =?utf-8?B?R3lTd1A5RWlHTGNRaUJhc3NUWEIrOEQzdkxSbGZwSm96aUZCd3QrV0sydGJn?=
 =?utf-8?B?dkZTZkpSUTRmeGRjSkk2dm9hYmY4TzNyRkJobk4rZFRLWVhMdHVGb2Q3Rit6?=
 =?utf-8?B?Q0NRV2J1czFER3JuYVZpRlptTk4wK3hEZlVodUVpMVRRQU5yQXhQTG40aGV6?=
 =?utf-8?B?UHRaajI3Yk1aUDdaWDUzbmpzT2tqSjd6RzZRWGZUQUcvVWx2U1FaQ2hGb29i?=
 =?utf-8?B?K2NDdkR5NG1vcGZmcXZ4TU9tOWx6SUJ0d05nMHhDVVNGMU1lQi9FWDI2dlZI?=
 =?utf-8?B?TWhXaEQ4RWlGNE50ZzRhY3VacC8xcjl4eVVIbjNPRXZDd1ZSYkU1ZkxrYWNX?=
 =?utf-8?Q?kspVwDGcEUxjXrZcZXYH4OMCr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a514959e-6149-4cb4-5ec4-08dc384ad409
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 10:48:41.7062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OqZ/LJqVlspM/3+CHIfovzqr8q69ywLVUu04+fB+3O3Rgmx3JX7PRgDtbR62brdQU54BeGmVC2Jtji8yOVKSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8510


On 2/27/2024 4:18 PM, Ilpo Järvinen wrote:
> On Mon, 26 Feb 2024, Basavaraj Natikar wrote:
>
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
> Thanks for the update.
>
> This needs to be just 500.
>
>> +#define TIMEOUT_US (1600 * USEC_PER_MSEC)
> Please be more specific in naming what these are. Perhaps
> MP2_RESP_TIMEOUT_US & MP2_RESP_SLEEP_US ?
>
> Add #include <linux/time.h> for USEC_PER_MSEC
>
>> +#define LEN_2KB_BIT 1
>> +#define LEN_16KB_BIT 4
> These are way too generic names. I expected something like:
>
> #define MP2_STB_DATA_LEN_2KB ...
>
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
> So 'da' is assigned to .dma_addr, why is the parameter only obfuscatingly 
> as 'da' ?

Yes, I will change it to is_dma_used

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
> Please add the #include for writeq() and writel() like I already told you.

Do you mean to add #include <asm/io.h>?

>
>> +}
>> +
>> +static int amd_mp2_stb_region(int len)
> size_t or unsigned int?

Sure, I will change it to unsigned int.

>
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
> I'd just use single variable for return values, after all, status and rc 
> are both ints.

Yes, I will change it accordingly.

Thanks,
Basavaraj

>
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
>

