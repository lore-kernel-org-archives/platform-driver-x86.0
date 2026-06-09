Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013005.outbound.protection.outlook.com [40.107.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7C043D4E2
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016055; cv=fail; b=XephcCULANTt3WbINVWjO0x/4+jswdLRSTbiMCe+SfElqqwKl6DQfD6QM3v9q8urZlSHNW5Bh6Q9DPnGAaNJdsneb2Wm/lBLN2AZ/4XoqD8diec1LcXSffdOsJHr3zz6CaxSM9sg0SX6/L6nbKmfAmi3MnOUtYA03EKLP8kTq+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016055; c=relaxed/simple;
	bh=RQLd5nCMGTNxxQd1RLCDzvUgiKI8NjUg393M1ek4F4Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Cd6l+U2KaKnX4hrv1EQToeREfveD6lB2HYRiH6PQKaPhTjUmG44vB9qzy6rI+sidGAyraAFBLbV5yujvPjabFJO8vXAIfzlLBMV2mj+Q448IhkkBx9HiptpbtmQ5eQcMP236co+LxqiiXXQWuTuSTySYS2ww8IANm89NF8FkVJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C3OWskD9; arc=fail smtp.client-ip=40.107.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C3OWskD9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onF3UFuDBB3itQtVMhGcDYFtkzVThnhwTjvK3/HkW5QQ2ZxHc/ztJOrAzqkcqYz8tTQaaWWd1Fo4KYrpwjcH4szfAOpnA44sEhfK4/GAUyBD595KvEMspqepHg368XsCaVA1IbUn/R4F+WRodr3pH+OHkGIjbo4pwMpYsM6FPybvkeuondPKnybZjJdxELIPEShp+NLHv3PnGEn6A+q60q27+bymELjhWmIai4tHFHMAtiE9b6vRBVWhHQKhWAGI+2COSe9DMfIEVzwAsjOpVgnsa6bojaQdcnIYAVQv6KCfS0lxbA6Pfzhn17JDN/yIDHrolYSUKOJLNh15A+w0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbsX2w0UYy7JNymU7EKi4Y4I9BVyW4L3Nkfxb9CBdrg=;
 b=pdUMmK8fNkTp9D0EHEMu1DIhExga2Q85llnnSYMB+9bj7z7vBhEjd1uLFl98ho7HqX7jWyzPTYDh4KdSt/UUOaktgFRjigM0RV/vpBvdFL0eorPysYb1Bg9fwIBydpBjbHunHLvxTykyXjs1MwZhqDmWH9TxK5EZBhScfaOTFMqcohFFTOV1LlX3j3BqFuwKjZXWErEVjyHvy32uauUJzlCEaHpwJNj04178uTmfBmEcsyFqdWQAuLzqhagUcSX/G6BhHlvWYvQuPpCz7V+D/6OlzziJOKJ8Z1j95Aek65Nd1RJzROizZhg/OugX+Vurunqz3RYH11MkUyWn9xtk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbsX2w0UYy7JNymU7EKi4Y4I9BVyW4L3Nkfxb9CBdrg=;
 b=C3OWskD9q1IDbeTd7IR2n43pvzkHZMdYZUYu3eETwqTd9BkvNrOBY8eEwhHqXNVo/VENT9q8QAcUljiMPl7TTc7rQsD+1iT9Wno2AHD2/5I6HE6TlbRtkrx+C2BxcoqIgbuythi5KHEPU1YjBfEe9fx7tw7tUN34kDViL8/lAlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB7434.namprd12.prod.outlook.com (2603:10b6:930:52::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 14:40:47 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:40:47 +0000
Message-ID: <b2d511e3-cc90-4bac-a4be-a8f1a14da1ad@amd.com>
Date: Tue, 9 Jun 2026 20:10:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86/amd/pmc: Use per-SoC cpu_info struct
 for SMU mailbox and IP info
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 mario.limonciello@amd.com, Sanket.Goswami@amd.com
References: <20260609073543.2388987-1-Shyam-sundar.S-k@amd.com>
 <20260609073543.2388987-2-Shyam-sundar.S-k@amd.com>
 <4c372b4d-c694-6a9a-3a60-99b079be0f91@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <4c372b4d-c694-6a9a-3a60-99b079be0f91@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0231.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 9358a6e1-f260-4bf6-9a7b-08dec6351695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|11063799006|6133799003|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	JTnrrHlf8o1IQJuuOfmITsltGydOrZC7JKYfe2ZkZxT8VZo/LY7CQocmAJwUsb253W2TByYymsZsgVm/0XDZdIf8q/DNQuBtoqguVhxK/Q+30r1ut/hpViczdmGA5ftFmeM1ko7g6HVfZdgHrTxTG7mZ25+Gy3zf1LRj42kqZhkpYiIbLimsqRHYsMD4kNOC5EnCSwH3l1TqekM1wiATW949pi7gYUrnfLltZf7eNpckTmX8610EyN+N1NmdcAbN9vW/NnU4zjvnTIWmdVnVioQrKOo2IRpGu6oq+puUeA01dwZ5COJcQWa7b/ZNwELnb+I5yvfuetIboVsarzj2cZeQZOQsTVVY7tK3+jrw2d7lD+T+TY4LVFJMe0aCIbGGgB72pXirH0TGFjl6BKF/EGrctC0Yo9AzCxKq1ZnuQAOVaEY8v086FBBiBy4Ej+kNBT07R6IinVHJkNHEAWbc3odrzUJ8s/HVrfMjgbsee2V5ycbm5Szlfn6OG4J9rqJPqqd4CwWE3WMrmT/Gi8B1TIqIeGuvNyYB+VrXz85rXS66UFbEWFWhFnR0FK6S+oGRUXssROFRKhkTOrjZ6BwYyPJFTrocZ0reV91EtBH5oHqWCL7abO2dFb5ssbuFXInqpWkf3tRa9Ye/XagUR9Rmtv+/KvHZUhdTPklQfZo247BwEAnj13XCHrd3LuCf0SYb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(11063799006)(6133799003)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWxMWld5V3QzcVMzQ01uYlJxTisxZHcxNE5BZ2lIdWJ5UlJuYXNJRWNYcGg3?=
 =?utf-8?B?bnZSYjEvMExLYzh6VElDcXF2VExqV1dVclBtOW5rcTlFOFFvZjJDRGtaMFJP?=
 =?utf-8?B?RFNKR2Zjc1RTeUg0ekd3b01xdUNVRlQvSlk0dnhkNFVHNFl6c2tkcnQ0dFI2?=
 =?utf-8?B?eW5jUXR1dWlZcnRORVJ2cFpZeXMzZ3RaR205N2F4eHdGOUJoZnMwRGFCOGwx?=
 =?utf-8?B?RDRveEZ1UXM1VG1yOWRUSURxM1IxQW9TSTYyd3BuVEt4RjVKazZSb2FmRC9C?=
 =?utf-8?B?US9aaWQ2dlpKYU1iSjBRb3RxQURXTWpwallaMm13a3ZKTHdBT3Zmd2tEanFi?=
 =?utf-8?B?dzNHMjVLREN1ZVhMZTUzU0l1MFQ4UTdjV1BIbG15QlF0QTdTNUtwL3J1U1BT?=
 =?utf-8?B?cUlnTk5JdFVVaWFNY1pHU3QyeXNmWDF2RjZEN2FYek5URDl4cnVHeHgwcmhF?=
 =?utf-8?B?VEZJYW5zNHI5Zi9odDQyWDc0SGJxclpIcDFFaTV4eHY3WXhkcnU2V0VTalUr?=
 =?utf-8?B?dHdlN0xIQUdYY0xkdDJ2N2dGOU4xTzFpY05LRHdMSVFma0VMdCt1QTVRUC9q?=
 =?utf-8?B?a2ZpeFhkTmU5YjI2ZlRlVGZuNXUxY3BoRDNWOS80bk1HTUNLMmpFMlp0bWtu?=
 =?utf-8?B?bnA2bkZJVmpuaUJhSHdHL1VublNlVTFoWGxnWG9na1FOZEtYc1FieDBoMkxx?=
 =?utf-8?B?OGNkWW5PN21vejNOQXJyVmZkc0g1dFRGVnJTVFB4cmJ4R1pMWnBRL1Nsak8w?=
 =?utf-8?B?TEpmeHhvMkxuR2tQdnpOSjVIVmk0Zy9laWVSTmM2dElGdUNEOHRLTU5rVFRW?=
 =?utf-8?B?OWFCSEhYb3I1WjRBZTFrdTAzeXR5RFAzeFRFZ01lWlRuVWIyUVN5OXpuYWFG?=
 =?utf-8?B?dE5naEtIdEttVUFFMGcvY01TeUZPNzBSaVcrSmlzcU9QalZxcmtkYkFqdzNi?=
 =?utf-8?B?LzZwRUZvZlJ3ai8xZ3JaQ0prWkVDbkdhMzV4NlFHOG82d3EwdHdPcG5uQ3RU?=
 =?utf-8?B?SndPNURlemc3RHRETzQzNVovWUNFaEd5dk5jZCttcDU1UHVUTk5taTl6TU1K?=
 =?utf-8?B?RWJIQng4SWNRNzVrNEUxR0FxTmdra3N3SEVyWjE3cUFVZzhjLzNKUi9MT0E4?=
 =?utf-8?B?UHF5bDBNbDgrb0gzSzl1ZFg1L1JpWWxJVS9MVkFILyt3WEUrMDBueitkVHNx?=
 =?utf-8?B?UHlTZFBuaWRHYkgyRTJ2MnY2WWhiNUhzTFJTMTg0STVYckt3dDltVUlRME14?=
 =?utf-8?B?THhPZ0pLQkhZbEYrQS9MeXhkVjBRSVo2QTFnMEhwWk00ZTRCMlB1NjNoNEwz?=
 =?utf-8?B?bE43V1dyRzhxazFYL2l6eStWNWJvRGpJbEVjWDQzQXRiMjN3dnVoSno0dHU3?=
 =?utf-8?B?RFFHcWRoRlJMYnFZOUp0TVZUVUkzWVZqWVhRZDZsMmtrQ2NHVFNDSjZ3ZkRm?=
 =?utf-8?B?TWVRQjJ4T2R1ZmdQUWJaN0o3YzNldWo5R3pJcHduNEtobFdIa1kxM3hkZi9R?=
 =?utf-8?B?OHcyMk5EeEVRR3lIc0ZKWGx1bzlzWkNsSWpEc3p4OSszSTZUVzJER2xTd1R0?=
 =?utf-8?B?ZGhIaGdDRkZPUUU2ZzQ0L0dyR3I0bU9JWFExakhxKzVMdStRMGVDNEJKYmpV?=
 =?utf-8?B?RVlibFk5djBGRndEb1poaDZKaklSdlJsS0cyQmw5aG0rdW9CZUxxNjJXSEVw?=
 =?utf-8?B?MTF6MkxtVWhhS2N4N3dNN21VTWZKRkl6V0c0MVNsV0lPcUR5bGNqdkdYQ3B0?=
 =?utf-8?B?MHI5QUxxSGVzdGJoQnBqMngzWDEyS0ZPQ0dZOGlrZWVPU2s3U1AxV29OY3Fp?=
 =?utf-8?B?RWtqTDJuRERrMDlsWnIvMTg0NjE1dUplYm9yQ2ZqWEFTcWtZS1lOL1NTcXgy?=
 =?utf-8?B?UWg3VmN4Zm5Rc1hTM3d2OGYwTEdtN1NHZTlCQXFXTTdHYk1UTERqNENyNm5m?=
 =?utf-8?B?cWVoZ1hCd1F1aGF3bnp1NGtoa29DZUtnMklIRUJOS2hLYVczZGJKYVRLU3BD?=
 =?utf-8?B?TmE3ang0SW9IbnVLRWFVUHNwVWhFV2tMK1ZEdnltVzBjSzB5WjlmcWRmSmQ2?=
 =?utf-8?B?ZjlpeU1hZGtFd0VtcXZOVDZCSTJsZFN2NExLaGNVTTBTd1hrdVdyS0h0OEZl?=
 =?utf-8?B?STRtWW5JVkJiUUVmYXppdFJYRXZpZ1BtVk0yMjZuY2l2NE1rZjZvbDU1MnVy?=
 =?utf-8?B?RFZEOFZFeGRrNS9NTHZvTjBEM2FrK3FybEtIeWdUZXZ2cXJxZ2hmWklnbjZ4?=
 =?utf-8?B?bUJ3SThOU0xPY1lHZ1pLWTRScStyUEsxRFJOQ3h0QXBtK1NPRkNiNlltSEhJ?=
 =?utf-8?B?elFCcHhXL29zVDduL1d3dHdTNmYyeSsySHYvSUJvNXFjWVVHa1VBUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9358a6e1-f260-4bf6-9a7b-08dec6351695
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:40:47.5507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dShRRodMvQK4c5X4+J1g47mXM2QQMtN4zItGa9s0CXBAd77fMMOhIMKfkwq0Trf52NhVB+tWkFzRYshpDv7S9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7434



On 6/9/2026 13:59, Ilpo Järvinen wrote:
> On Tue, 9 Jun 2026, Shyam Sundar S K wrote:
> 
>> Replace the scattered per-field assignments in amd_pmc_get_ip_info() with
>> a single amd_pmc_cpu_info struct capturing all SoC-specific parameters
>> such as SMU offsets, IP block table, and OS hint.
>>
>> Define static const instances per SoC variant and embed them as driver_data
>> in the PCI ID table via PCI_DEVICE_DATA(). Consolidate pci_match_id() into
>> amd_pmc_set_cpu_info(), which assigns driver_data directly to cpu_info,
>> the switch falls through only for 1Ah M20H/M60H variants requiring
>> boot_cpu_data.x86_model detection to distinguish the M70 sub-variant.
>>
>> Add scratch_reg to amd_pmc_cpu_info and populate it for each SoC
>> variant, allowing amd_pmc_idlemask_read() to drop its cpu_id switch
>> in favour of a single cpu_info->scratch_reg lookup.
>>
>> Remove amd_pmc_get_os_hint() and use cpu_info->os_hint directly at call
>> sites and rename AMD_CPU_ID_* to PCI_DEVICE_ID_AMD_CPU_ID_* with backward
>> compatibility aliases.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc/pmc.c | 216 ++++++++++++++++-------------
>>  drivers/platform/x86/amd/pmc/pmc.h |  70 +++++++---
>>  2 files changed, 171 insertions(+), 115 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index cae3fcafd4d7..3ba50ebcc431 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -85,6 +85,83 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>>  	{"VPE",		BIT(21)},
>>  };
>>  
>> +/* CPU info structures for different SoC variants */
>> +static const struct amd_pmc_cpu_info amd_pco_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
>> +	.num_ips	= 12,
>> +	.scratch_reg	= 0,
> 
> There's no need to 0 init, it's the default value.
> 
>> +	.ips_ptr	= soc15_ip_blk,
>> +	.os_hint	= MSG_OS_HINT_PCO,
>> +};
>> +
>> +static const struct amd_pmc_cpu_info amd_czn_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
>> +	.num_ips	= 12,
>> +	.scratch_reg	= AMD_PMC_SCRATCH_REG_CZN,
>> +	.ips_ptr	= soc15_ip_blk,
>> +	.os_hint	= MSG_OS_HINT_RN,
>> +};
>> +
>> +static const struct amd_pmc_cpu_info amd_rn_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
>> +	.num_ips	= 12,
>> +	.scratch_reg	= AMD_PMC_SCRATCH_REG_YC,
> 
> Previously, there was no case AMD_CPU_ID_RN: in amd_pmc_idlemask_read() 
> but since the PCI IDs are overloaded, it used CZN's scratch reg.
> 
> (sashiko found this inconsistency in the change, but assuming this new 
> scratch_reg value is correct, the current code is using a wrong value.)
> 
>> +	.ips_ptr	= soc15_ip_blk,
>> +	.os_hint	= MSG_OS_HINT_RN,
>> +};
>> +
>> +static const struct amd_pmc_cpu_info amd_ps_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MESSAGE,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
>> +	.num_ips	= 21,
>> +	.scratch_reg	= AMD_PMC_SCRATCH_REG_YC,
>> +	.ips_ptr	= soc15_ip_blk,
>> +	.os_hint	= MSG_OS_HINT_RN,
>> +};
>> +
>> +static const struct amd_pmc_cpu_info amd_1ah_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
>> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
>> +	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
>> +	.ips_ptr	= soc15_ip_blk,
>> +	.os_hint	= MSG_OS_HINT_RN,
>> +};
>> +
>> +static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_20H,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARGUMENT,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RESPONSE,
>> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v2),
>> +	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
>> +	.ips_ptr	= soc15_ip_blk_v2,
>> +	.os_hint	= MSG_OS_HINT_RN,
>> +};
>> +
>> +static const struct pci_device_id pmc_pci_ids[] = {
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_PCO, &amd_pco_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_RV, &amd_pco_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_RN, &amd_rn_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_CZN, &amd_czn_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_VG, &amd_rn_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_YC, &amd_rn_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_CB, &amd_rn_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS, &amd_ps_cpu_info) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_SP, NULL) },
>> +	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
>> +	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
>> +	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
>> +	{ }
>> +};
>> +
>>  static bool disable_workarounds;
>>  module_param(disable_workarounds, bool, 0644);
>>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>> @@ -101,35 +178,34 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>>  	iowrite32(val, dev->regbase + reg_offset);
>>  }
>>  
>> -static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>> +static int amd_pmc_set_cpu_info(struct amd_pmc_dev *dev, struct pci_dev *rdev)
>>  {
>> +	const struct pci_device_id *id;
>> +
>> +	id = pci_match_id(pmc_pci_ids, rdev);
>> +	if (!id)
>> +		return -ENODEV;
>> +
>> +	if (id->driver_data) {
>> +		dev->cpu_info = (const struct amd_pmc_cpu_info *)id->driver_data;
>> +		return 0;
>> +	}
>> +
>> +	/* Special case: 1Ah M20H/M60H needs x86_model detection */
>>  	switch (dev->cpu_id) {
> 
> After the reorganization, this looks not yet initialized at this point.
> 
> I guess ->cpu_id could be initialized inside this function.
> 
>> -	case AMD_CPU_ID_PCO:
>> -	case AMD_CPU_ID_RN:
>> -	case AMD_CPU_ID_VG:
>> -	case AMD_CPU_ID_YC:
>> -	case AMD_CPU_ID_CB:
>> -		dev->num_ips = 12;
>> -		dev->ips_ptr = soc15_ip_blk;
>> -		dev->smu_msg = 0x538;
>> -		break;
>> -	case AMD_CPU_ID_PS:
>> -		dev->num_ips = 21;
>> -		dev->ips_ptr = soc15_ip_blk;
>> -		dev->smu_msg = 0x538;
>> -		break;
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
>> +		if (boot_cpu_data.x86_model == 0x70)
>> +			dev->cpu_info = &amd_1ah_m70_cpu_info;
>> +		else
>> +			dev->cpu_info = &amd_1ah_cpu_info;
>>  		break;
>> +	default:
>> +		dev_err(dev->dev, "Unknown CPU ID: 0x%x\n", dev->cpu_id);
> 
> Won't CPU_ID_SP and CPU_ID_SHP end up here now as the driver_data is NULL?
> 
>> +		return -ENODEV;
>>  	}
>> +
>> +	return 0;
>>  }
>>  
>>  static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
>> @@ -296,9 +372,9 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
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
>> @@ -347,32 +423,22 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>>  	u32 val;
>>  	int rc;
>>  
>> -	switch (pdev->cpu_id) {
>> -	case AMD_CPU_ID_CZN:
>> -		/* we haven't yet read SMU version */
>> +	/* we haven't yet read SMU version */
>> +	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
>>  		if (!pdev->major) {
>>  			rc = amd_pmc_get_smu_version(pdev);
>>  			if (rc)
>>  				return rc;
>>  		}
>> -		if (pdev->major > 56 || (pdev->major >= 55 && pdev->minor >= 37))
>> -			val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_CZN);
>> -		else
>> +		if (!(pdev->major > 56 || (pdev->major >= 55 && pdev->minor >= 37)))
>>  			return -EINVAL;
>> -		break;
>> -	case AMD_CPU_ID_YC:
>> -	case AMD_CPU_ID_CB:
>> -	case AMD_CPU_ID_PS:
>> -		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
>> -		break;
>> -	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> -	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> -		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
>> -		break;
>> -	default:
>> -		return -EINVAL;
>>  	}
>>  
>> +	if (!pdev->cpu_info->scratch_reg)
>> +		return -EINVAL;
>> +
>> +	val = amd_pmc_reg_read(pdev, pdev->cpu_info->scratch_reg);
>> +
>>  	if (dev)
>>  		pm_pr_dbg("SMU idlemask s0i3: 0x%x\n", val);
>>  
>> @@ -425,9 +491,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
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
>> @@ -452,9 +518,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
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
>> @@ -512,23 +578,6 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool r
>>  	return rc;
>>  }
>>  
>> -static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>> -{
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
>> -	}
>> -	return -EINVAL;
>> -}
>> -
>>  static int amd_pmc_wa_irq1(struct amd_pmc_dev *pdev)
>>  {
>>  	struct device *d;
>> @@ -602,7 +651,6 @@ static void amd_pmc_s2idle_prepare(void)
>>  {
>>  	struct amd_pmc_dev *pdev = &pmc;
>>  	int rc;
>> -	u8 msg;
>>  	u32 arg = 1;
>>  
>>  	/* Reset and Start SMU logging - to monitor the s0i3 stats */
>> @@ -617,8 +665,7 @@ static void amd_pmc_s2idle_prepare(void)
>>  		}
>>  	}
>>  
>> -	msg = amd_pmc_get_os_hint(pdev);
>> -	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, false);
>> +	rc = amd_pmc_send_cmd(pdev, arg, NULL, pdev->cpu_info->os_hint, false);
>>  	if (rc) {
>>  		dev_err(pdev->dev, "suspend failed: %d\n", rc);
>>  		return;
>> @@ -659,10 +706,8 @@ static void amd_pmc_s2idle_restore(void)
>>  {
>>  	struct amd_pmc_dev *pdev = &pmc;
>>  	int rc;
>> -	u8 msg;
>>  
>> -	msg = amd_pmc_get_os_hint(pdev);
>> -	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, false);
>> +	rc = amd_pmc_send_cmd(pdev, 0, NULL, pdev->cpu_info->os_hint, false);
>>  	if (rc)
>>  		dev_err(pdev->dev, "resume failed: %d\n", rc);
>>  
>> @@ -709,22 +754,6 @@ static const struct dev_pm_ops amd_pmc_pm = {
>>  	.suspend = amd_pmc_suspend_handler,
>>  };
>>  
>> -static const struct pci_device_id pmc_pci_ids[] = {
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
>> -	{ }
>> -};
>> -
>>  static int amd_pmc_probe(struct platform_device *pdev)
>>  {
>>  	struct amd_pmc_dev *dev = &pmc;
>> @@ -736,11 +765,15 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>  
>>  	dev->dev = &pdev->dev;
>>  	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>> -	if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
>> +	if (!rdev) {
>>  		err = -ENODEV;
>>  		goto err_pci_dev_put;
>>  	}
>>  
>> +	err = amd_pmc_set_cpu_info(dev, rdev);
>> +	if (err)
>> +		goto err_pci_dev_put;
>> +
>>  	dev->cpu_id = rdev->device;
>>  	if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id == AMD_CPU_ID_SHP) {
>>  		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
>> @@ -778,9 +811,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
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
>> index fe3f53eb5955..4c3a4410790e 100644
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
>> @@ -90,6 +94,22 @@ struct stb_arg {
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
>> +	u32 scratch_reg;
>> +	const struct amd_pmc_bit_map *ips_ptr;
>> +	u8 os_hint;
>> +};
>> +
>>  struct amd_pmc_dev {
>>  	void __iomem *regbase;
>>  	void __iomem *smu_virt_addr;
>> @@ -99,9 +119,6 @@ struct amd_pmc_dev {
>>  	u32 cpu_id;
>>  	u32 dram_size;
>>  	u32 active_ips;
>> -	const struct amd_pmc_bit_map *ips_ptr;
>> -	u32 num_ips;
>> -	u32 smu_msg;
>>  /* SMU version information */
>>  	u8 smu_program;
>>  	u8 major;
>> @@ -116,11 +133,7 @@ struct amd_pmc_dev {
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
>> @@ -151,20 +164,33 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
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
> 
> sashiko found an interesting issue related to these (it seems 
> pre-existing)...
> 
> If the PCI ID is same, the match can never return the second entry.

Ack. I ran sashiko on v4 now and it does not have further complaints.

Thanks,
Shyam

> 
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
> --
>  i.

