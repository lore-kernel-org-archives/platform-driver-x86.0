Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011010.outbound.protection.outlook.com [52.101.62.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7617A343D72
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783967872; cv=fail; b=DXIIDL3gBonsn6TPCFRTsgW9piMwlzWXFSsd5LWB5RQzq9LQ0oOnrHpCOOJiHcX9kiQRUh/LPWEdeUfPLSBjtDagHRbklIzAA7izm//W+dk4+/IAR7SUlBQATrMEU5o4xCcX3aDfAD4kWqKGKKFDczcQzmMHUgpQaPcCo1Jq/PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783967872; c=relaxed/simple;
	bh=09pB/7BRPR5mKJj9WD8kdzTHm3/m9x8kcFZmnhloVTs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FB7oZeRsZiwpGvpPM2DUTcMIyfsaKIAd3j+xFP8RqhXlf8ReoPxe+gjfb/YDGwaka2l6d2XUSwa+8tcWbEB/AxMoN2ZxuRWDh/JyF9i4PTc3dUtC7ghxdBWJOK4V10IDy3ynTyjSmntZ4UWnRlcnbykHCwCzPPzpLxJsnFVAywM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oB5SaRdz; arc=fail smtp.client-ip=52.101.62.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oB5SaRdz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIYhFwXbGsi5f1DcRbphCWvcGzpfqruX64hLhd4M5oY5Js93/KzOyHoM/7b7o8RekoGBbGExx647TyWQsC2FpVz4/GdBa80PU79V94oeNGzdXCIZ9EvN12gqACGeBWZkUYrm6FoJy5W7MU82RlMmS3benvWvVr6cERUfm60/SqOxrcEgeperG4Iz1R5ZKPfMc63naZkOn6cU5/jDl0EWnIahNievn9DrktyhNWhrYNvS7KHzK9q2GduWGi6X/NeqWj41DVvGyMh+am+k25iOlPAy+TB6BUUcvtaVn26fNLX/FCt2YDTk/0jQ31N6uTxKQ+qb0ZHrik49oh1vvyXy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfFfNxK9BFKJQBvDxD1NFb7a5XXNRpie7xUyxeAbolw=;
 b=nZASTzBQ09Q3pNxOJMRsy5rfQiFuZmnLKv5aG8UdtLqtfuFBQ8GqAvxWnJPgVVBlcQSD8Da6561MF5bUyupSpZen1XuYm/UbvHy9LpVUbax2+SoNnyYH7ZBbyEz2llrgwXwJBGIWgyinY3lnIzYCkRPKaDCKMD5PKlOAPAzv9bYwSQqsBMCQpNPXkw97jqtyY/REyj7nRa8aOzcgPvweOGYx03jcm3yTnoxxFrySzObvvDBuri+GCpHk+yaXrB72weTpQ6WiPhjF/X9h9wbnOYmmvW4+tT137xch8p5DZNJmCRLuCNlTOtlVzNxPliDKC161faLsc446g479Lazitg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfFfNxK9BFKJQBvDxD1NFb7a5XXNRpie7xUyxeAbolw=;
 b=oB5SaRdz4xYXL9KKEi4piMc85Exyle9NCEye2AQpaExwex5+/PbxJ5AM8QY6RNljPmqJom/TVJztXDZIkXP/Nmkxc7gu19YgkEdjU5bQ34hsXn/7fD4f9cYmFO68GNSKTh8aaySjRuHdwQt7vszZy3KgVlMM99Au8gilRsG7gTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21)
 by DS2PR12MB9710.namprd12.prod.outlook.com (2603:10b6:8:276::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 18:37:37 +0000
Received: from CH3PR12MB8284.namprd12.prod.outlook.com
 ([fe80::1bc1:88b1:7cf7:87aa]) by CH3PR12MB8284.namprd12.prod.outlook.com
 ([fe80::1bc1:88b1:7cf7:87aa%4]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 18:37:36 +0000
Message-ID: <ac6d740a-9a8f-478d-848b-9ff58af05e24@amd.com>
Date: Tue, 14 Jul 2026 00:07:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] platform/x86/amd/pmf: Add 1AH_M80H device IDs and
 extended SMU mailbox registers
To: Mario Limonciello <mario.limonciello@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
 <20260710174219.2522269-3-Shyam-sundar.S-k@amd.com>
 <52b7b438-8b09-4845-82ca-064da4027da8@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <52b7b438-8b09-4845-82ca-064da4027da8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::21) To CH3PR12MB8284.namprd12.prod.outlook.com
 (2603:10b6:610:12e::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8284:EE_|DS2PR12MB9710:EE_
X-MS-Office365-Filtering-Correlation-Id: 4150de0e-0591-4a53-4b88-08dee10dcf71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|4143699003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ghwsh/JrajgrCHN0VjqVEgXfvdbIb3tPtLBUkTuAk0etKYFcyS+Hv9JmjSkFDPakCTbSybNKT/3R8fFtnS1pnSWvHGieFCiUv+yn9WJMw0H/jB4hKkc++ZZe3LJOyCxxbCzbcZgfYkURWL6Ntefoo6Pd8Q/LIwtYPoJ/IWHg7/7/bLmJkdqSf1HlSKriuqkE2+wSalUSyBZ+Oi2on4ILT2PtAHA7zlDmttPtqcbvcsd7Rw7dfbKvQg0SOmeC1zG8aZT9n5NuYup9/EIXqwl2VNlKFur8oOkKa7HMxBpbYzJy5GmKKOpH3FSt1X6vDUS2D1uvYGHcH4UVIcZ07SVZprtFtG5EwD2vpXbKZvTC5NkUfVTuUDNBm6td9HkGdnkV8zNrL64oktNHpg74PugkztaRXpMGA8QJHTFKzANezNYR/uRFf5EhdQotJLHiketgcQ/eUXramYAUBtO/JvYwSv/WkzKI7+Xh6XtOWzXXtOgXkDwP3J9LQz53R+N9v+OpnUFxTHV4g9BGM7h9/E2a8bfN4FkTaxv0ztI0VTZqkyMwGkYsrimzB/Zrothe41s2JOpJUX/7yye6gm2LCK4MpD/7HDiIHbaTZ7re+Cfg/fGxB/uiAMX4tyJDI9QdnyBgHXNFH00Vak0TDucjuSJNr7si1WnhV8UsK6wjDpTuQmQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8284.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWpOLzBoNEJYTGpPa3gxSXFQaEpoVE1YdWlqOVdodUEwUzY5SUxxV0FEaGlv?=
 =?utf-8?B?UVFNTTRzbkhhMWRzaFYxL3NCc0R0ODZZSnRZMWQvVUpwdTlrcy93UmFwZHRM?=
 =?utf-8?B?bXhIektMSEl4S05SVGw5M2doeERXMDNPekxuRlBZWWFzV1kzOXQzSUpqeVp1?=
 =?utf-8?B?cEkrL2VLV1NWRTNnVXhDQXpwZU02dHJiSmdBdERhNURKZmVMS1krbTJTQVVK?=
 =?utf-8?B?OTBMZkpEdUhMalNldHdrUlBCZHc0ZXNjTFdLcEhpcGlRblowbWVUQmloVytS?=
 =?utf-8?B?VkF4NDhOQ0RsM1ZIWG9XenRLajlyNS9JcGdGcWJ6cHE5MzhNaE5UeEVmMXFp?=
 =?utf-8?B?cXdEaHdTQ2hvSXAxanlsZkhnamd0RzJDOGo0R0hUZWlNQlBzcTdGU0VYOXgw?=
 =?utf-8?B?WWlmN1U2RjdWNU9XamhQZTlnMFpZUG5WU1VsbWsyZmxUL2VDU1E1a3ZBN0t4?=
 =?utf-8?B?UHZNcmtSaVlyRWdDWDVqbXdIUmd2dUdNKzRtaU5aNXpVbkNJeXBGdHdEcG1G?=
 =?utf-8?B?NUttR29yK0xtY1hMczd3WG9OR2JJTjZ5N3VSb3pmakZxMU0rcUJVRWduT2c1?=
 =?utf-8?B?SWNGcVRvb3JWN2UrUGRxdC90QjQ4VnhsT1FDUnhSK3JmTTF2VWtxMkxNRm5Y?=
 =?utf-8?B?cEJpMTZtNFgrU093U3VUQ0xlYitSVHV3VDQzSnVYWkNNT3BZZFZKS1BscmR3?=
 =?utf-8?B?dG8wT0xkcWM0dUZROTVxZkhPWXVQSFlmcHllWTQ5aXZZS281Yk1HaHZQeGl3?=
 =?utf-8?B?TzBKMFNxSFdycy8rSGVCK01VL3NBQ1lsbW05TnZ3UG5ncUN2M3lMcUN5MGE2?=
 =?utf-8?B?SUlwRjhGRExUQ0doVTdBd1FyaTFEVVhuY2lLeEluZ24yQXJiNDdiTE1kdUNB?=
 =?utf-8?B?dlR3cUMrRDh4d1RzdTRPY2psQ2txUlYyWjdXaVlIN05IRlhyZjN4cEhlNFNV?=
 =?utf-8?B?c290UHpRR1hzTHBDMDNCTmZveFhaWUxCMkIzSTVaNXNaWjZpWmpMYTJyeXM2?=
 =?utf-8?B?R0FrS2sxMXV5K0o3MlU1ekovcXh4K1h4dEt6UkhOelFZQXozRkUvTlpDMVdh?=
 =?utf-8?B?TWhqM1lvSFhsM1VnLzBJbmQwZEprVVdOc1J3Tk0wWVBmNDhBUHBwNUtSRVlB?=
 =?utf-8?B?bEJMMFI1c3MxL3grRjhQQWV6WHNaL3dnL1hCUkF6TWhOQ3dsWUVRM2hoOWJm?=
 =?utf-8?B?MklNbEl0Z0J6NjlGajdBMDVIV0YrYWxIaHpjTHpjQVpvTWlPRjJkWXJDVWpO?=
 =?utf-8?B?ODczMnNsdkJycGdPdnphUTZDc0JDSHBrOEJTcjdTMjJmSEpWb0xnQU5YWjJo?=
 =?utf-8?B?Y09oRHRkalJET0tHU1QrNVBNMkpZTjdmUzlrV0Q0MjZwQUNWZUIzcHlOVXRj?=
 =?utf-8?B?RDJZLzFma2MxRjAydmc4VU9LOC8wWVJnVEp4VkFqTG9MMmNvOGMyeHpKWDlE?=
 =?utf-8?B?TE1sMkYwWDBrVG1oV3lOYjA5SFIzNVNVMnRMbUU3RENvOTd3Sjh3U3BFQjAx?=
 =?utf-8?B?K2dwZWZ4WHZZREFvU0xZSG80azkxZ09HK3NiamFKbEZRS0xFRUFWZk5XdktX?=
 =?utf-8?B?ZHM3TWNzdW0xTFBseU15S05PUXlkWDdWN3dZN2pwZlZuMGcxZ0xPdkw5RWVl?=
 =?utf-8?B?TmxwVU9JVzdraXY3MnZLMVN4MnBRc01vWFdPZko4cEIzS3ppMnlZcEhoOEhh?=
 =?utf-8?B?RHRQQVZJY3dXWlVKNkZaMkw4KzYyVU5RNUl0ZVEyQ0IyZWN2ekpIV1RycnZD?=
 =?utf-8?B?YmlneEljWVdpdnZMZkZ5bWZHczdEWXgzamMxZ0hZUU1HR1JWaUhwMU1kRUhy?=
 =?utf-8?B?K0QwcUZIaUt1Z1BYZnNoYThVUWJTcUZTMlhZZUFIYytQLy91WmtmL2dTNXBL?=
 =?utf-8?B?NFBwSUgxYURvUFNVVWRDb3FzN2o0U2xvQk9DREd2Lytia2MwU2VmYmRyWU1W?=
 =?utf-8?B?WFNDblZrL3QwRWovWjR5MXk1M0dmOThhV2p2UzFBc2F3dzR2Wml3WEY2b1NO?=
 =?utf-8?B?cDNaeTlKRkFsNzNCc2VVTllkYmtZR2NUT002dHhNeGp1ZERXcTlObDVqSEhC?=
 =?utf-8?B?S3Y0TTRxVE0yYXdZb1RXam0vWlFXSkpzVUEwM0IxWmpmN05TVXllcTJrTGE0?=
 =?utf-8?B?UFpvUzFJYmo0eUkxTlNxaURDUGxkM3FpL05tUXQ3MWo1dHRFMlRTS21nek95?=
 =?utf-8?B?SGRNM1VJRyttc3NWWk5yY25jeHFFSDVYaXRmbGF0N0tudUZtWEVpZnNqNWZt?=
 =?utf-8?B?RTFoOUpaV1FKRnd2UVluWEpFbWZXcFVFNFNhanZ6bnJubEJPeU1xbWhuUW1H?=
 =?utf-8?B?M3AxRWd0dlJjSG9lamRWQTFxa0NINXFZcXhyQXhjMlRqYzBvSUR1Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4150de0e-0591-4a53-4b88-08dee10dcf71
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:37:36.6534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmWwUsoVjNnFf0TJllwHT4/ki9tpLgq8ys4vque9OtbzrGd3NqkFz6Rx0GaLALAMfVOKQrNoAc2Ef6ivHUIwzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9710



On 7/11/2026 00:40, Mario Limonciello wrote:
> 
> 
> On 7/10/26 12:42, Shyam Sundar S K wrote:
>> Add PCI device ID (0x115b) and ACPI ID (AMDI0109) to enable PMF driver
>> support for the AMD 1AH_M80H (Family 1AH Model 80H).
>>
>> The 1AH_M80H platform introduces an extended SMU mailbox interface that
>> uses three argument registers instead of the single register used by
>> earlier platforms. Define five new register offsets for the 1AH_M80H
>> mailbox: message, response and three argument registers. The extended
>> argument registers are required because 1AH_M80H exposes metrics
>> through
>> a firmware managed DRAM region. The GET_METRICS_TABLE_DRAM_ADDR command
>> returns a 64-bit physical address split across arg_reg[0] (low 32-bit)
>> and arg_reg[1] (high 32-bit), with the metrics table size in
>> arg_reg[2].
>>
>> Define amd_pmf_1ah_m80h_smu_regs to capture this extended register
>> layout
>> and register it in pmf_pci_ids[] via PCI_DEVICE_DATA(), keeping the
>> existing amd_pmf_legacy_smu_regs shared instance for all prior
>> platforms
>> unchanged.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/core.c | 29 ++++++++++++++++++++++++
>> +----
>>   drivers/platform/x86/amd/pmf/pmf.h  |  3 ++-
>>   2 files changed, 27 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/
>> x86/amd/pmf/core.c
>> index 1826fc64bf56..7c5a1ec3d7fc 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -26,6 +26,13 @@
>>   #define AMD_PMF_REGISTER_RESPONSE    0xA78
>>   #define AMD_PMF_REGISTER_ARGUMENT    0xA58
>>   +/* PMF-SMU communication registers for 1AH_M80H */
>> +#define AMD_PMF_REG_MESSAGE_1AH_M80H    0xA04
>> +#define AMD_PMF_REG_RESPONSE_1AH_M80H    0xA08
>> +#define AMD_PMF_REG_ARGUMENT0_1AH_M80H    0xA0C
>> +#define AMD_PMF_REG_ARGUMENT1_1AH_M80H    0xAAC
>> +#define AMD_PMF_REG_ARGUMENT2_1AH_M80H    0xAB0
>> +
>>   /* Base address of SMU for mapping physical address to virtual
>> address */
>>   #define AMD_PMF_MAPPING_SIZE        0x01000
>>   #define AMD_PMF_BASE_ADDR_OFFSET    0x10000
>> @@ -179,7 +186,7 @@ static void __maybe_unused
>> amd_pmf_dump_registers(struct amd_pmf_dev *dev)
>>       value = amd_pmf_reg_read(dev, dev->smu_regs->resp_reg);
>>       dev_dbg(dev->dev, "AMD_PMF_REGISTER_RESPONSE:%x\n", value);
>>   -    value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
>> +    value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
>>       dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
>>         value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
>> @@ -220,7 +227,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8
>> message, bool get, u32 arg, u32
>>       amd_pmf_reg_write(dev, dev->smu_regs->resp_reg, 0);
>>         /* Write argument into argument register */
>> -    amd_pmf_reg_write(dev, dev->smu_regs->arg_reg, arg);
>> +    amd_pmf_reg_write(dev, dev->smu_regs->arg_reg[0], arg);
>>         /* Write message ID to message ID register */
>>       amd_pmf_reg_write(dev, dev->smu_regs->msg_reg, message);
>> @@ -239,7 +246,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8
>> message, bool get, u32 arg, u32
>>           if (get) {
>>               /* PMFW may take longer time to return back the data */
>>               usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
>> -            *data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
>> +            *data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
>>           }
>>           break;
>>       case AMD_PMF_RESULT_CMD_REJECT_BUSY:
>> @@ -266,7 +273,19 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev,
>> u8 message, bool get, u32 arg, u32
>>   static const struct amd_pmf_smu_regs amd_pmf_legacy_smu_regs = {
>>       .msg_reg    = AMD_PMF_REGISTER_MESSAGE,
>>       .resp_reg    = AMD_PMF_REGISTER_RESPONSE,
>> -    .arg_reg    = AMD_PMF_REGISTER_ARGUMENT,
>> +    .arg_reg    = { AMD_PMF_REGISTER_ARGUMENT, 0, 0 },
>> +};
>> +
>> +/* 1AH_M80H uses an extended mailbox with three argument registers */
>> +static const struct amd_pmf_smu_regs amd_pmf_1ah_m80h_smu_regs = {
>> +    .msg_reg    = AMD_PMF_REG_MESSAGE_1AH_M80H,
>> +    .resp_reg    = AMD_PMF_REG_RESPONSE_1AH_M80H,
>> +    /* arg_reg[0], arg_reg[1] and arg_reg[2] carry low, hi address
>> and size for DRAM metrics */
>> +    .arg_reg    = {
> 
> Rather than overloading arg_reg how about if you just have a define in
> "struct amd_pmf_smu_regs" for low, hi, size?
> 
> So f1ahm80h wouldn't have arg_reg defined, it would have low_reg,
> high_reg, size_reg.

Ack to other comments and I have pulled the tags.

Specific to this comment, I spoke to PMFW folks and understand that
they would have the ARG0/ARG1/ARG2 combinations going forward and it
would not be mapped to low/high/size (as happened in this
family/model). So, to make the code generic, I have retained the
variable names to reflect the PMFW behavior.

I have adapted to some of your comments, that gets mostly reflected in
6/6.

Thanks,
Shyam

> 
>> +        AMD_PMF_REG_ARGUMENT0_1AH_M80H,
>> +        AMD_PMF_REG_ARGUMENT1_1AH_M80H,
>> +        AMD_PMF_REG_ARGUMENT2_1AH_M80H,
>> +    },
>>   };
>>     static const struct pci_device_id pmf_pci_ids[] = {
>> @@ -274,6 +293,7 @@ static const struct pci_device_id pmf_pci_ids[] = {
>>       { PCI_DEVICE_DATA(AMD, CPU_ID_PS,    
>> &amd_pmf_legacy_smu_regs) },
>>       { PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT,
>> &amd_pmf_legacy_smu_regs) },
>>       { PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT,
>> &amd_pmf_legacy_smu_regs) },
>> +    { PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT,
>> &amd_pmf_1ah_m80h_smu_regs) },
>>       { }
>>   };
>>   @@ -563,6 +583,7 @@ static const struct acpi_device_id
>> amd_pmf_acpi_ids[] = {
>>       {"AMDI0105", 0},
>>       {"AMDI0107", 0},
>>       {"AMDI0108", 0},
>> +    {"AMDI0109", 0},
>>       { }
>>   };
>>   MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/
>> x86/amd/pmf/pmf.h
>> index 7a8fd9d399de..088edfab08f0 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -28,6 +28,7 @@
>>   #define AMD_CPU_ID_PS                   0x14e8
>>   #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
>>   #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
>> +#define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT    0x115b
>>     /* Aliases required by PCI_DEVICE_DATA() macro naming convention */
>>   #define PCI_DEVICE_ID_AMD_CPU_ID_RMB    AMD_CPU_ID_RMB
>> @@ -400,7 +401,7 @@ struct pmf_cbi_ring_buffer {
>>   struct amd_pmf_smu_regs {
>>       u32 msg_reg;
>>       u32 resp_reg;
>> -    u32 arg_reg;
>> +    u32 arg_reg[3];
> 
> See above comment.
> 
>>   };
>>     struct amd_pmf_dev {
> 

