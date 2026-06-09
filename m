Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BBA1A6823
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 05:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984490; cv=fail; b=L3/ChT5ottCYZfn6yg0nDDsjXF24eodwbnzlmxH4+yF32HZctDY3Tln8J1nIeJUJB8L6psQKsCusc2r4P45WhibmjaEWStOvTwQP9HL6P/a/EHBnYWI33xKFbIibMdpFJAr0oakHIdiGwFeDhx23Mig8oZjt0zt3liJlvih2SGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984490; c=relaxed/simple;
	bh=kyBoTf/xtXPnf8RUX4QCQ9pyBxhRqtmbsWnLP/Uls6U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mes3ma719qwkqIImX8GEIJVGTLauNOScwDguiV2g2OUDxudrx+UIFhYaxt6efYX0CqGgtefwp29FjZv2gKDieuMtqsDwf21czdUW+X9vsYBmM4exc5JlMtg2CED5fPTpnLOiNXxuLTZLES+2b3gd/csz916eWh09vEUVHLukJ4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ClrH5gr9; arc=fail smtp.client-ip=40.93.196.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ClrH5gr9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOekgFTImEOIvyxAfpswD28G2qaHUwTRQUnww7W+DuHhENu2rrGNKcpzx7HY8LPhV4UfJMxC7Cd5j/PupRr62GdbHLn1YpMGBVkdEM9AgGRUFqOMOHImFP0xPApm8eiSweOPoPIUwpNCs/SLtP3Xl74x6g1U4vpQsej9c2E/DBtyLjwkt9DsKny/MIUIKSZP4CbdUnahJY72mqMSv+E329nDq3KgU22QYcXW9033G84WTRwCCfoFx01QODXHVEbHjrtFL54jcgs6AG/0FWB/QEpVL75c7cBSWpSBuJMA0plPdeg5qKoa9/wLTDVeLu0fDWLx7Y1K8xBMPUE6gbFEkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrdLDiRAl+rw/X19PExeADks3DBcUA2tFUBxzUOJ0oY=;
 b=GvMk7ljdy3y0PwAXdkZihQSH7NqHxkhHX0nnjmYuG7+I3W9kHZu14Nwybdb3a6iIW+xI4gYcUUb8rlz6Fx/6Xg8vxfULHBMr09eN63ce2yfD95oBbZQVNPZ3uNl6cTrauxTOIZxiaFAHyKrXoBzTgsz1WUYKaudd+J4ZsS1XeJJ90fFfk+oKr9gKDiwHtqvJt/WVeo/buuCDJEctOETQBZ5M4XchNGKvTQd4fLPSaTcN2eioCYKhldPvADYM4oDgt+R9anHaEgXgZCkAIuGqluLumAM44jF+RQggY/Q7q9+7AK9gCxKQfAfrFHw0GRtYjHgWRXKel4c+Qd2n+SL8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrdLDiRAl+rw/X19PExeADks3DBcUA2tFUBxzUOJ0oY=;
 b=ClrH5gr98jj+Rek7rSUl6adesLFhI2rdveiN0NPnKxeNtdC8YKD3o7nnyUbcXDsIC7xmUYSgLdiAwxIrFZJjuWG5GVR2g6WtJGgB3I/yQZj7Vagk2Q1DoVjbPi+53rfZTDXOEcW4ql9AEqaFT5H772sr51Pf0AqyV/GNc3DqSEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by LV2PR12MB5749.namprd12.prod.outlook.com (2603:10b6:408:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 05:54:44 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 05:54:44 +0000
Message-ID: <382cf3ea-1142-4044-a0ce-53a7cf56f313@amd.com>
Date: Tue, 9 Jun 2026 11:24:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmc: Use per-SoC cpu_info struct
 for SMU mailbox and IP info
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 mario.limonciello@amd.com, Sanket.Goswami@amd.com
References: <20260601112103.1690951-1-Shyam-sundar.S-k@amd.com>
 <20260601112103.1690951-2-Shyam-sundar.S-k@amd.com>
 <d18cbafc-fd11-c3f9-db5f-4976ba26e711@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <d18cbafc-fd11-c3f9-db5f-4976ba26e711@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|LV2PR12MB5749:EE_
X-MS-Office365-Filtering-Correlation-Id: d8242348-435c-421c-8ad6-08dec5eb9aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	k3hp08+3uRHnzEYDTaEYi8IDQdVt2DCe9QJs+zlxTdk/UTVjIKvAD6vc+CJ1UsNoJHIzdQHGEa/CQLzVAbm1hnXc4ozhVTJ/mQgR2+8YVUURpnxIDqQp1ZLwlsViQK5deY8ht9dgktTDC/w4Aqg0wwLzuVnC3paAm1wyOShR/EL+NH/SCF3QRIj1HWYV+tLYt03VRWOZYcmMVAPz/CCS0Td2RZSZNHVi5vW3kbLNGceP2eXWpCLFT9jyESB+TQJ78tPMVbjUsggMF79jFj+bIGULK1NqTkjSlMy/MvP+XzthqpdWfmfrcnnHI2eapYrCppG9ZPbvgKeBqne5+UV+JTd9OJRnrD1DFj9STl302FdY0I8697wjaACCAa/X9j5/cxl1Yq6AyP3q0RGmwNgCs6YD+ToExyf4c16bDqn/Kvps++J/rAGmkEzty01tgPXpqtdCDMybgIMk7aSagDkQhFxprjuEahwl5Q6NrFN7ve0CtsWz0KJOagtAUfaqbqELbEgB0etj9frmRMEeYY/Gq45dmyBmeIDUbh3GhvwFNX8V6xsUZc4vrd3dE1ExQWgBjFxZLxca6GN9/XAoO2oe+QB4uqxBVvXAkVgybGvYTIARyN+xdP1Y90pm9IO+NjvMh9T3ukAef1+Aq2nSwpOwpNqo2CNtf04X9ayvpaBtVbTaCe5PrAb6jUNZmdXArPt5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2ZWUStNekVWWTIwK0VqM24wcmhXQkxWeDV6eW93Z0pHUTdRSmNHY29tcG1B?=
 =?utf-8?B?QnM1cUhzNmhYejl1UHByS2pYaVdxOXFQK3k1eEsxcTlsVWx5WG5MNHoyM3ZT?=
 =?utf-8?B?RGU0UWZJMERoZGVhei9VQUtoL3lFZXRqYUNnaXQ1ZUtwbkt5ZFJsN090RTM5?=
 =?utf-8?B?Q3I4TlgzMmE1YkxpOGhvNGVBbktmNUdxSkU0S3JOVVFxVHAvcFBiaGg5ZkVE?=
 =?utf-8?B?WmI5UHIzN2ZWK3NkR2FFOXZ4L0VYd1JsRjM0U2hmQXpLWDBDMkpGeEd4MHhn?=
 =?utf-8?B?bndrMXZWUFduZGJRWDZKcEE2TDd2RmMwMWhaVkdrYXVKRTVhR2N5RThuV3Ji?=
 =?utf-8?B?Z1RUTWQwR2U5cE16eUt6dDZPTGR5UXl2REo2bGk0NnZ6Q3F6ekJZeE5mYkJC?=
 =?utf-8?B?UTRZMmpDUVMxZ0gyNkErS0pndG1pVndWdkZQemtQWGs0aGpoQlFDYkxJT2Fr?=
 =?utf-8?B?alJDUnAxeUpOMW9ieDZlWjFWQUg1eEt3UEFseW5HcTJuQU5OenFackFoUTFo?=
 =?utf-8?B?c3QvR2pZeUpEcGliSi9EUDZsKy82VEtYUWNOTlFnN2RuUkZud25SVzRBQ3JO?=
 =?utf-8?B?UFRzdFlLcXo4TUx5M3lNQmpVOGxWOTJ4Rks4Q0wyVTVvOElyTjhDV2NwT1p2?=
 =?utf-8?B?RTMrMWxIalBmMExzWVRXK3BudWxtR3diTDVGckVTaXRHdUFCM1BudkVDUUlw?=
 =?utf-8?B?M2Fva094YnVCZUt2RjQ0Q2g4TDVabGdzNnc4MUJRakorYUNFNFFaWWVOYWFn?=
 =?utf-8?B?eHBBcWEwWm43NnVIMEgwSVEvcHAzbStYbnpvL1lRcjlJLzNTblEyNzVpR1dl?=
 =?utf-8?B?OHdab0VMU0JDZDVaM3lPTFByMnprNEpxVmQ0L3o1WitiV1g1QkVqczNlcHZs?=
 =?utf-8?B?ajBld2hCM2l5VklpR0pzWXdQNS9Pc3ExTkM3WnJMSUxTRVlNcUNsaHQ3RlR6?=
 =?utf-8?B?eTJOVmJHQkZEOVJUanY0RUFZYXZVYW1sL2VLdDNXSVQvYmFWblJhQjNEay9W?=
 =?utf-8?B?dVJwaDlHZUxhVTlhd0R3aVNHNVBVMVBwTHdkVjUwK1pDSWw1OVRvS0FxSFkw?=
 =?utf-8?B?dzQ3UlVoUUF1TVNlMjE4eGd1NHVGcVVHUUZMdDluUkNGN3MxTzM5M3B0ZmVT?=
 =?utf-8?B?RnVTWFl1Y2grYWJuSmd3ZUtIRmZoazhLSVNwNmluNE9IM1g1UzVyTjZCOXVT?=
 =?utf-8?B?VVN6eUdFdExMSThNNldEbEJQS0pXU0sxRXh4cm03VktCdHdVd3lsVXQ0QVp0?=
 =?utf-8?B?TGN4Z2V6b1ZpUkVRWGJnSzZpSGlPQTNxbUxvZkpCcFQ1b2lzak42am1JYisv?=
 =?utf-8?B?WGN0R3h6UC9XNHJXTnY0SllBWnRJc0g3TmwvZytEYm5PbkhSUDJ1TmZzc3Y4?=
 =?utf-8?B?TGY3NlMzUEtGaU0xci90bjZST213TDJGd2M4dTVNMUs2TUlzazhrSW1MQWcr?=
 =?utf-8?B?UUVEeXpNb3crd3c2aGRRWWtqQ0R6ODFXQzJ6Rm5OUG1TUFlCcFBQdzdZSE5I?=
 =?utf-8?B?RG5NVmkzVVppbGJyVDJsZjd4QWZubmVOTEx4Uk9GSFl5b0JwY3ZpTmFMVTlM?=
 =?utf-8?B?cmFURGIySk41RjIySEE3Ujl5cUVkZXlpQkY4YmhXczUyRWlkNk1RaUFEYWpN?=
 =?utf-8?B?dXVsOUpMY2NTUFZEVmMwb2RVMTEyejBmMldiK0JETkZiQ29XQjlFM0VHNnFt?=
 =?utf-8?B?WU1GczRJZXRjek5FVWdxYURSWXdodmtFRFV3MXJabFN2aXczUTZtM0czandB?=
 =?utf-8?B?cDMyWGkvbFpod2QxU1Z0TSs0TGw4Tjk4RG0yTkluTTZKZFUyRDdSR3Q5U1g0?=
 =?utf-8?B?NGRUVWw5YTg1M0x1UXlWLzR4M1lpVmNwQ3lNKzMxWUFSQXVTTTl3MW5oaGYy?=
 =?utf-8?B?YmxydjNBeWtYZDJ2Mm0zZ1o2eHJFYW1HTFhDOUx3dHBpeElzL1ExOWNIa1ZQ?=
 =?utf-8?B?RDZRYjgwR3BSMVNGVGh3Q01WblNjWFNPSi85b3JlSDZMR1dxTVcvQjVOYm9G?=
 =?utf-8?B?RGt0NUtOMlJRWnYrRjdIVGFUNk9CZnlkN2drdnVETUN4dG14RG9jV0kxTnNp?=
 =?utf-8?B?QkNhY0g0aU9Qc212d3M3RXpkaHhHL1lLZmM3MkhKRDVsaWVWMGROKzRMTGY3?=
 =?utf-8?B?a0lmS3U2RmVJWVBvNjZLQzE4WUxNUG13VFpQTTd4UWxuWDhFT2YwNERaVWFP?=
 =?utf-8?B?aXBjazFvVG0vV0RQdkZWSEg4aGRsQnZBcjNMeXlHVGtpWStFdEw0UXN0SHY3?=
 =?utf-8?B?ay93aXN2YkVVVWNZSElFQmY5NDlSaWUvcU5yYTAxeDZac2ZGcG9ReXNobzYx?=
 =?utf-8?B?T1NDUXcwWFVVT05xVVovYm1hUWRFaU84Y2czZjB2b0p2RVFpL2lGQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8242348-435c-421c-8ad6-08dec5eb9aae
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 05:54:44.0399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlveO2HXrVTVyICR2gO8ZgolGM21CXxxZnJxO+jAjFTO0v+Pk8y46mjGbVELciJlEyFLL27LP0Zy5M3dLEjDWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5749



On 6/8/2026 14:38, Ilpo Järvinen wrote:
> On Mon, 1 Jun 2026, Shyam Sundar S K wrote:
> 
>> Replace the scattered per-field assignments in amd_pmc_get_ip_info() and
>> amd_pmc_get_os_hint() with a single amd_pmc_cpu_info struct capturing all
>> SoC-specific parameters such as SMU offsets, IP block table, and OS hint.
>>
>> Define static const instances per SoC variant and embed them as
>> driver_data in the PCI ID table via PCI_DEVICE_DATA(), avoiding runtime
>> switch statements. Store a pointer in amd_pmc_dev replacing the individual
>> smu_msg, num_ips, and ips_ptr fields, SMU send/receive paths and debugfs
>> iterator dereference through it. For the 1Ah M70 variant requiring
>> boot_cpu_data.x86_model detection, fallback to amd_pmc_set_cpu_info().
>>
>> Also, rename AMD_CPU_ID_* to PCI_DEVICE_ID_AMD_CPU_ID_* with compatibility
>> aliases.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc/pmc.c | 161 +++++++++++++++++++----------
>>  drivers/platform/x86/amd/pmc/pmc.h |  69 +++++++++----
>>  2 files changed, 156 insertions(+), 74 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index cae3fcafd4d7..6c7fa80c7f09 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -85,6 +85,52 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>>  	{"VPE",		BIT(21)},
>>  };
>>  
>> +/* CPU info structures for different SoC variants */
>> +static const struct amd_pmc_cpu_info amd_pco_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
>> +	.num_ips	= 12,
>> +	.ips_ptr	= soc15_ip_blk,
>> +	.os_hint	= MSG_OS_HINT_PCO,
>> +};
>> +
>> +static const struct amd_pmc_cpu_info amd_rn_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
>> +	.num_ips	= 12,
>> +	.ips_ptr	= soc15_ip_blk,
>> +	.os_hint	= MSG_OS_HINT_RN,
>> +};
>> +
>> +static const struct amd_pmc_cpu_info amd_ps_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
>> +	.num_ips	= 21,
>> +	.ips_ptr	= soc15_ip_blk,
>> +	.os_hint	= MSG_OS_HINT_RN,
>> +};
>> +
>> +static const struct amd_pmc_cpu_info amd_1ah_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
>> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
>> +	.ips_ptr	= soc15_ip_blk,
>> +	.os_hint	= MSG_OS_HINT_RN,
>> +};
>> +
>> +static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
>> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v2),
>> +	.ips_ptr	= soc15_ip_blk_v2,
>> +	.os_hint	= MSG_OS_HINT_RN,
>> +};
>> +
>>  static bool disable_workarounds;
>>  module_param(disable_workarounds, bool, 0644);
>>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>> @@ -101,35 +147,37 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>>  	iowrite32(val, dev->regbase + reg_offset);
>>  }
>>  
>> -static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>> +static void amd_pmc_set_cpu_info(struct amd_pmc_dev *dev)
>>  {
>> +	const struct amd_pmc_cpu_info *info = NULL;
>> +
>>  	switch (dev->cpu_id) {
>>  	case AMD_CPU_ID_PCO:
>> +		info = &amd_pco_cpu_info;
>> +		break;
>>  	case AMD_CPU_ID_RN:
>>  	case AMD_CPU_ID_VG:
>>  	case AMD_CPU_ID_YC:
>>  	case AMD_CPU_ID_CB:
>> -		dev->num_ips = 12;
>> -		dev->ips_ptr = soc15_ip_blk;
>> -		dev->smu_msg = 0x538;
>> +		info = &amd_rn_cpu_info;
>>  		break;
>>  	case AMD_CPU_ID_PS:
>> -		dev->num_ips = 21;
>> -		dev->ips_ptr = soc15_ip_blk;
>> -		dev->smu_msg = 0x538;
>> +		info = &amd_ps_cpu_info;
> 
> Are these actually needed, can't the code be reorganized so here we do 
> only:
> 
> 	id = pci_match_id(pmc_pci_ids, rdev);
> 	if (!id)
> 		return -ENODEV;
> 
> 	if (id->driver_data) {
> 		dev->cpu_info = id->driver_data;
> 		return 0;
> 	}
> 
> 	switch (...) {
> 
>>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> -		if (boot_cpu_data.x86_model == 0x70) {
>> -			dev->num_ips = ARRAY_SIZE(soc15_ip_blk_v2);
>> -			dev->ips_ptr = soc15_ip_blk_v2;
>> -		} else {
>> -			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
>> -			dev->ips_ptr = soc15_ip_blk;
>> -		}
>> -		dev->smu_msg = 0x938;
>> +		/* Special case: check x86_model for M70 variant */
>> +		if (boot_cpu_data.x86_model == 0x70)
>> +			info = &amd_1ah_m70_cpu_info;
>> +		else
>> +			info = &amd_1ah_cpu_info;
> 
> Just assign directly to dev->cpu_info.
> 
>>  		break;
>> +	default:
>> +		dev_err(dev->dev, "Unknown CPU ID: 0x%x\n", dev->cpu_id);
>> +		return;
>>  	}
>> +
>> +	dev->cpu_info = info;
>>  }
>>  
>>  static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
>> @@ -296,9 +344,9 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>>  		   table.timeto_resume_to_os_lastcapture);
>>  
>>  	seq_puts(s, "\n=== Active time (in us) ===\n");
>> -	for (idx = 0 ; idx < dev->num_ips ; idx++) {
>> -		if (dev->ips_ptr[idx].bit_mask & dev->active_ips)
>> -			seq_printf(s, "%-8s : %lld\n", dev->ips_ptr[idx].name,
>> +	for (idx = 0 ; idx < dev->cpu_info->num_ips ; idx++) {
>> +		if (dev->cpu_info->ips_ptr[idx].bit_mask & dev->active_ips)
>> +			seq_printf(s, "%-8s : %lld\n", dev->cpu_info->ips_ptr[idx].name,
>>  				   table.timecondition_notmet_lastcapture[idx]);
>>  	}
>>  
>> @@ -425,9 +473,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>>  		argument = dev->stb_arg.arg;
>>  		response = dev->stb_arg.resp;
>>  	} else {
>> -		message = dev->smu_msg;
>> -		argument = AMD_PMC_REGISTER_ARGUMENT;
>> -		response = AMD_PMC_REGISTER_RESPONSE;
>> +		message = dev->cpu_info->smu_msg;
>> +		argument = dev->cpu_info->smu_arg;
>> +		response = dev->cpu_info->smu_rsp;
>>  	}
>>  
>>  	value = amd_pmc_reg_read(dev, response);
>> @@ -452,9 +500,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
>>  		argument = dev->stb_arg.arg;
>>  		response = dev->stb_arg.resp;
>>  	} else {
>> -		message = dev->smu_msg;
>> -		argument = AMD_PMC_REGISTER_ARGUMENT;
>> -		response = AMD_PMC_REGISTER_RESPONSE;
>> +		message = dev->cpu_info->smu_msg;
>> +		argument = dev->cpu_info->smu_arg;
>> +		response = dev->cpu_info->smu_rsp;
>>  	}
>>  
>>  	/* Wait until we get a valid response */
>> @@ -514,19 +562,12 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
>>  
>>  static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>>  {
>> -	switch (dev->cpu_id) {
>> -	case AMD_CPU_ID_PCO:
>> -		return MSG_OS_HINT_PCO;
>> -	case AMD_CPU_ID_RN:
>> -	case AMD_CPU_ID_VG:
>> -	case AMD_CPU_ID_YC:
>> -	case AMD_CPU_ID_CB:
>> -	case AMD_CPU_ID_PS:
>> -	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> -	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> -		return MSG_OS_HINT_RN;
>> +	if (!dev->cpu_info) {
>> +		dev_err(dev->dev, "CPU info not initialized\n");
>> +		return -EINVAL;
>>  	}
>> -	return -EINVAL;
>> +
>> +	return dev->cpu_info->os_hint;
> 
> If there's always a cpu_info struct (see below), the whole function can be 
> removed and the caller just uses the ->cpu_info->os_hint directly.
> 
>>  }
>>  
>>  static int amd_pmc_wa_irq1(struct amd_pmc_dev *pdev)
>> @@ -710,18 +751,18 @@ static const struct dev_pm_ops amd_pmc_pm = {
>>  };
>>  
>>  static const struct pci_device_id pmc_pci_ids[] = {
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CB) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_PCO, &amd_pco_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_RV, &amd_pco_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_RN, &amd_rn_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_CZN, &amd_rn_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_VG, &amd_rn_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_YC, &amd_rn_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_CB, &amd_rn_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS, &amd_ps_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_SP, NULL) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
> 
> I suggest you add a dummy entry for these two as well so we'll always 
> have a valid cpu_info struct.

Ack to other comments quoted above. But, to the specific one here:

There are certain platforms where s2idle is not supported; you can
look at amd_pmc_probe()

if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id == AMD_CPU_ID_SHP) {
  dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
  ..
}

Hence I had the intent to just pass NULL to driver data field of
PCI_DEVICE_DATA().

Since CPU_ID_SP and CPU_ID_SHP do not support s2idle, not thinking to
add a dummy so that we don't add unnecessary code, something like below.


+static const struct amd_pmc_cpu_info amd_sp_cpu_info = {
+	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
+	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
+	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
+	.num_ips	= 0,
+	.ips_ptr	= NULL,
+	.os_hint	= 0,
+};

...


+	{ PCI_DEVICE_DATA(AMD, CPU_ID_SP, &amd_sp_cpu_info) },
+	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, &amd_sp_cpu_info) },

I have sent a new version without making the above change. But, if you
think it makes sense to add the above dummy struct for the platforms
that dont support also would be happy to respin again.

> 
>> +	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
>> +	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
>>  	{ }
>>  };
>>  
>> @@ -729,6 +770,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>  {
>>  	struct amd_pmc_dev *dev = &pmc;
>>  	struct pci_dev *rdev;
>> +	const struct pci_device_id *id;
>>  	u32 base_addr_lo, base_addr_hi;
>>  	u64 base_addr;
>>  	int err;
>> @@ -736,7 +778,13 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>  
>>  	dev->dev = &pdev->dev;
>>  	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>> -	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
>> +	if (!rdev) {
>> +		err = -ENODEV;
>> +		goto err_pci_dev_put;
> 
> FYI, there's also __free(pci_dev_put) but then you'll need to handle 
> no_free_ptr() on the success path which will require some reorganization 
> so my suggestion is to look at it after this series is done.

Agree. Will make this change in the follow on series after this gets
merged.

Ack to the other comments below.

Thanks,
Shyam

> 
>> +	}
>> +
>> +	id = pci_match_id(pmc_pci_ids, rdev);
>> +	if (!id) {
>>  		err = -ENODEV;
>>  		goto err_pci_dev_put;
>>  	}
>> @@ -749,6 +797,18 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	dev->rdev = rdev;
>> +
>> +	if (id->driver_data)
>> +		dev->cpu_info = (const struct amd_pmc_cpu_info *)id->driver_data;
> 
> IMO, this would be more logical to do inside amd_pmc_set_cpu_info().
> 
>> +	else
>> +		amd_pmc_set_cpu_info(dev);
> 
> Perhaps this call can be moved earlier, so that pci_match_id() has to be 
> done only once inside it?
> 
>> +	if (!dev->cpu_info) {
>> +		dev_err(dev->dev, "Failed to set CPU info\n");
>> +		err = -ENODEV;
>> +		goto err_pci_dev_put;
>> +	}
>> +
>>  	err = amd_smn_read(0, AMD_PMC_BASE_ADDR_LO, &val);
>>  	if (err) {
>>  		dev_err(dev->dev, "error reading 0x%x\n", AMD_PMC_BASE_ADDR_LO);
>> @@ -778,9 +838,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>  	if (err)
>>  		goto err_pci_dev_put;
>>  
>> -	/* Get num of IP blocks within the SoC */
>> -	amd_pmc_get_ip_info(dev);
>> -
>>  	platform_set_drvdata(pdev, dev);
>>  	if (IS_ENABLED(CONFIG_SUSPEND)) {
>>  		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>> index fe3f53eb5955..0fd0ced21831 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>> @@ -17,6 +17,10 @@
>>  /* SMU communication registers */
>>  #define AMD_PMC_REGISTER_RESPONSE	0x980
>>  #define AMD_PMC_REGISTER_ARGUMENT	0x9BC
>> +#define AMD_PMC_REGISTER_MESSAGE	0x538
>> +
>> +/* SMU communication registers for 1Ah 20h SoC */
>> +#define AMD_PMC_REGISTER_MSG_1AH_20H	0x938
>>  
>>  /* PMC Scratch Registers */
>>  #define AMD_PMC_SCRATCH_REG_CZN		0x94
>> @@ -90,6 +94,21 @@ struct stb_arg {
>>  	u32 resp;
>>  };
>>  
>> +struct amd_pmc_bit_map {
>> +	const char *name;
>> +	u32 bit_mask;
>> +};
>> +
>> +/* SoC-specific information */
>> +struct amd_pmc_cpu_info {
>> +	u32 smu_msg;
>> +	u32 smu_arg;
>> +	u32 smu_rsp;
>> +	u32 num_ips;
>> +	const struct amd_pmc_bit_map *ips_ptr;
>> +	int os_hint;
>> +};
>> +
>>  struct amd_pmc_dev {
>>  	void __iomem *regbase;
>>  	void __iomem *smu_virt_addr;
>> @@ -99,9 +118,6 @@ struct amd_pmc_dev {
>>  	u32 cpu_id;
>>  	u32 dram_size;
>>  	u32 active_ips;
>> -	const struct amd_pmc_bit_map *ips_ptr;
>> -	u32 num_ips;
>> -	u32 smu_msg;
>>  /* SMU version information */
>>  	u8 smu_program;
>>  	u8 major;
>> @@ -116,11 +132,7 @@ struct amd_pmc_dev {
>>  	bool disable_8042_wakeup;
>>  	struct amd_mp2_dev *mp2;
>>  	struct stb_arg stb_arg;
>> -};
>> -
>> -struct amd_pmc_bit_map {
>> -	const char *name;
>> -	u32 bit_mask;
>> +	const struct amd_pmc_cpu_info *cpu_info;
>>  };
>>  
>>  struct smu_metrics {
>> @@ -151,20 +163,33 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>>  void amd_mp2_stb_init(struct amd_pmc_dev *dev);
>>  void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>  
>> -/* List of supported CPU ids */
>> -#define AMD_CPU_ID_RV			0x15D0
>> -#define AMD_CPU_ID_RN			0x1630
>> -#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
>> -#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
>> -#define AMD_CPU_ID_VG			0x1645
>> -#define AMD_CPU_ID_YC			0x14B5
>> -#define AMD_CPU_ID_CB			0x14D8
>> -#define AMD_CPU_ID_PS			0x14E8
>> -#define AMD_CPU_ID_SP			0x14A4
>> -#define AMD_CPU_ID_SHP			0x153A
>> -#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
>> -#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
>> -#define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
>> +/* List of supported CPU/device IDs */
>> +#define PCI_DEVICE_ID_AMD_CPU_ID_RV	0x15D0
>> +#define PCI_DEVICE_ID_AMD_CPU_ID_RN	0x1630
>> +#define PCI_DEVICE_ID_AMD_CPU_ID_PCO	PCI_DEVICE_ID_AMD_CPU_ID_RV
>> +#define PCI_DEVICE_ID_AMD_CPU_ID_CZN	PCI_DEVICE_ID_AMD_CPU_ID_RN
>> +#define PCI_DEVICE_ID_AMD_CPU_ID_VG	0x1645
>> +#define PCI_DEVICE_ID_AMD_CPU_ID_YC	0x14B5
>> +#define PCI_DEVICE_ID_AMD_CPU_ID_CB	0x14D8
>> +#define PCI_DEVICE_ID_AMD_CPU_ID_PS	0x14E8
>> +#define PCI_DEVICE_ID_AMD_CPU_ID_SP	0x14A4
>> +#define PCI_DEVICE_ID_AMD_CPU_ID_SHP	0x153A
>> +
>> +/* Backward compatibility aliases */
>> +#define AMD_CPU_ID_RV		PCI_DEVICE_ID_AMD_CPU_ID_RV
>> +#define AMD_CPU_ID_RN		PCI_DEVICE_ID_AMD_CPU_ID_RN
>> +#define AMD_CPU_ID_PCO		PCI_DEVICE_ID_AMD_CPU_ID_PCO
>> +#define AMD_CPU_ID_CZN		PCI_DEVICE_ID_AMD_CPU_ID_CZN
>> +#define AMD_CPU_ID_VG		PCI_DEVICE_ID_AMD_CPU_ID_VG
>> +#define AMD_CPU_ID_YC		PCI_DEVICE_ID_AMD_CPU_ID_YC
>> +#define AMD_CPU_ID_CB		PCI_DEVICE_ID_AMD_CPU_ID_CB
>> +#define AMD_CPU_ID_PS		PCI_DEVICE_ID_AMD_CPU_ID_PS
>> +#define AMD_CPU_ID_SP		PCI_DEVICE_ID_AMD_CPU_ID_SP
>> +#define AMD_CPU_ID_SHP		PCI_DEVICE_ID_AMD_CPU_ID_SHP
>> +
>> +#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT		0x1507
>> +#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT		0x1122
>> +#define PCI_DEVICE_ID_AMD_MP2_STB		0x172c
>>  
>>  int amd_stb_s2d_init(struct amd_pmc_dev *dev);
>>  int amd_stb_read(struct amd_pmc_dev *dev, u32 *buf);
>>
> 

