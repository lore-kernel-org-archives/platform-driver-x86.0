Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15373DD852
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 07:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990725; cv=fail; b=FtbHjXQ2RLWGBDiUeuibg6w1ZVUh94mT6Y+jGyW5CeM5W3C0x8m8sT44hnXmgQ3TcuBJ3txIvbhmnok7/uzPazBkpXtOpGedgY4AI+D/w2ndICh7EH3osgFmlRsmeXhkF6vxIvEMzd1A1ZggCohdVkjJOnh4BLXvJmZrKmDkWKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990725; c=relaxed/simple;
	bh=go/lhjpTb2mzwXmwLvBKllVOApS234p1QQbXM+EE2R0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tyMCsVwu8zML+37jmlTfJJevGAYUeRo/94cn/Vffm8NS2id3saKdYeSeUfVVNxHxZWOb+Yhd3np2Sk9gi0M1ouUJbS314Q94knZEo/opvU0Foxo1c7lnSVgvNE7zpRC9/pklm0yCIgJBSPWGadDF/FOb7D1bVaF99AM/JKRqJOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=anFp1U7s; arc=fail smtp.client-ip=52.101.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="anFp1U7s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezbYffqw/llUWIe7O32Udqe5VogtoAAjtzoR78MAPAA/y91ywI/OkclQmnX+XXSQVYP3NZQl8R/R0rj7rucfkP3X0CKrrQ9bROCDuMdOcUOAja4y+mRGDEjflZn7jZnNcALvMzrNThto1TF3AAhi8O2gPeJXEz0M7AjJ9f/z7uuCbXuu3NsYRvrSZ3gqAwr7Y3SUcNdXxxL6YLUaBRbVhEGO7HZhiI8Npex16KwxeoWtE+QXGMGDigbrmzMe6zAR2DAA2LNBO4AKqtbXAUrGs90JhaPXT/rok4rQlH1YTSrMVxJHQv/QZaibzQfLusj2jQvy2ATEEgCXWabJmA6aBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7UGvC+x4rgyO7M8xgyaYm84jn1mPUm8yFSrRLVk94o=;
 b=rIUjSumWqMaCBrwA1Qq9uLHEEOGzVUNudHFwApEwQ4hwMJUR3yPDXqnkirHUdMn5VEyG/2yONvz4BONktXxRk8M4E8bHcXFJvTLz3yf7UUkrpCsZXAxSefl/yO80SSliLCG7WpSS3z/cwXb/d+RXznN8SUXnWIR/hD5+xgenv7+Zl0tYx54BzQiEiggRrkYnJr9VpEUhuk2IEHacssCyncw+gR5z9wfK26y3O22Zw9iPbQcs0i9X4DZwFCA04MGHlXWYXXPUACY2nN4sgy/ZK4vDs5nX1aKZQWqN6rVQdYtYEIZCob6iwGX6WcxSKrb4MthqmkTPtcBuvN/bVyViAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7UGvC+x4rgyO7M8xgyaYm84jn1mPUm8yFSrRLVk94o=;
 b=anFp1U7sRtJy3a7dIzPeNGZcSIJLnqypoaGsjw0I4Bldwx/5aRVXnOmu1DOHviRx3tBQPWcW9O1fYpnN5hwvgTZiJ2JwQmA/zBJzY+lz+LyCliZsPQZXH4ueh7CFuQjXaJ5lKtu+BMPVnJ1GxFkIuS2rJPOKK7qmysZHfsCpgWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB6857.namprd12.prod.outlook.com (2603:10b6:510:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 07:38:41 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 07:38:41 +0000
Message-ID: <d206f8fd-cc7b-456d-a4ed-7d69a341aa48@amd.com>
Date: Tue, 9 Jun 2026 13:08:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] platform/x86/amd/pmc: Add support for AMD 1Ah
 Family 80h SoC
To: Mario Limonciello <superm1@kernel.org>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Sanket.Goswami@amd.com
References: <20260601112103.1690951-1-Shyam-sundar.S-k@amd.com>
 <ec389d15-79ef-4267-b7e1-72b04bbcf84d@kernel.org>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ec389d15-79ef-4267-b7e1-72b04bbcf84d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a11101e-2454-45d0-9268-08dec5fa20a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	BLbM7uJYhdtElCo1GtXo1zpeqAs5Pjm2cS1R69OZAsE7GwjsP0iqv95OOViLbg/xzqJPL1C+hSXBhcq0ojCbfACkSjpwKVN42bOOAA7KPmr+isxle7j9DRwNzZweqPE7YYKgns9pIF25tVUh6YzIfkzcQiqtDBB33UfPlEPYkoxaoEMu8ml4yLadmtEsJG95edSqTK0HhIW0+wpJAx3t6egYgMpSi11Rx2mdLKtC84hyIgxjSjEAjStMHh05w773CXqBGqgAnaMCqCfHWCQFFfh/Wuq40QWSsHc1rNrKv71x5vRa8jgVOC9AuohFUTtcG227tAvnszgLscyKKQEfZPQq6YTVZ6JgsJ84RuaJw2wn3poXLNff4Db7e+J5D20MQ3TIabfLsTK8BPUIFc2YQXoO0UBZNm9CmIRPgG4V6yyrB4zqaC396EdbGK5XzilcjF18GAjfcdT5GxsmleKT9rMYIZqm/ldGT7ebVPSKxJ7O0KXg4t412HwmiS1H6OaPtztqgoMoI/D5ed8xE4y8mEenDwFKNSeUd6DCzcUmy5uos7yBQPrvO1XFynySAtK3vAOGRfjXfWMcF+lvv8yOmjn8mYsLNwagbIa4Ahi4PdtdXpnkM5E3vPdwI1oX5UdYOpcLxv42ndekWQqWUAi1B0dDkRGqEBE7YVCaVhemzS/YP4FHBuHHvg+Oxxcc+9vnhzDHURXBSG8QNIZ+KZjexw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b21LVlRPRFFDUnhzaXlLTDkzM05CV2dmYkV2YUQ4djQzWjg2SjNKKzNSMnBO?=
 =?utf-8?B?SmNENVhuSXlaQ3RRMlZZdVh3MzN0eXZrTWZLMkYydnFEMzFuWkc1VWgreXpS?=
 =?utf-8?B?Nkd4ZTZkQnBuYVZhb2lhMkl3SEZRTy83Umh1U2p4R0RDTHVBVGRyMVNJaGdP?=
 =?utf-8?B?NFN0bndvVFdwOFgvN2J4RkNpWUhhZzJLdStzckxjOUk1cGtDcGF2dkVGeEp3?=
 =?utf-8?B?YWNrKzh3VU8xOGRXY3dXa0Q3cGhIdml5YWRqdzdQSGx5OVJsNjNaWjAxZjIw?=
 =?utf-8?B?YUFlcC9ZeDRjSlJiSjJPVjR3M1FxN2c1RnhhcW05a04rbnhXMTNSd2EyQXd0?=
 =?utf-8?B?ZXIrTjZVMGxMTnlHNzZEeXdBOFBocDd5SFN5K3JKYWtQRHNYRlMzR1NYRC9L?=
 =?utf-8?B?TjFJZVRaKzkzRWdCNVdCVHRqZnVKOUhNTm14TkNyZlB4VE5aNTdhby9wSk12?=
 =?utf-8?B?ZzdqRERwOXRad1IxMEppWHpMY0xnbWd0ZUxya09pZ1FnMHNnUnkxbkdaZnY0?=
 =?utf-8?B?K2lQd2xudjIwN2VuQnRoUkJhWittOFpQYUhRU1pQWEJiS0FKTVlZZWZ6RW1W?=
 =?utf-8?B?b3gwVk10aFozdkdRMHRYS0I5bHNzd3RSTDZEOVo4bTU0N0cvYmJyVEtKczFu?=
 =?utf-8?B?dnE0NytVQVJ2eHozemhGZE9IN0d0MHVMTnlZWjQyRExUcnpJRC8rMHZQd1Vs?=
 =?utf-8?B?cGlVc1NEQ2gydGtnWlRsbWFOaTkyUk5xeFVUZjh1d3hudXlBajBNT0MwSTh3?=
 =?utf-8?B?UmJGQTE5OG45R2RLdGdxNnc3RDNJOUcreGhENWlhNEhiMlhEbzZ2QmNGNFhS?=
 =?utf-8?B?Z1RkREFTMFFPblMwRmtrT25YUFJGcS9oajEyOGlLRmpDWSt5SkI3L3dtWUtT?=
 =?utf-8?B?RTRVVDNFdGVEeDZ6ek5pQ3lCWGFlejRTejBsYWE5NzdmUmgyK1h6NUMwQ3BB?=
 =?utf-8?B?cXRFaTBsam1rOXdRZ1VOVStTY2tRa1YyT1BwaENHY1dQTWxvL21YN0JJRHYr?=
 =?utf-8?B?djdPZU9ibk9YUk5ROEJsZ2g4d0hxQ1pyUlpWRWF5UWFEUXZvcGZkeEpCMHN2?=
 =?utf-8?B?V21PZStBNEFPWGVlTDhUL21TM0FtUEZodnViVFEyeDRPZHR3dGZGdHlYamtj?=
 =?utf-8?B?d3VEcTlUc3JQcUY4aWdjZkhoMDVFaWI2Mk9SS1BpOExaQkp3TmplWG1yV201?=
 =?utf-8?B?bVBaY2IxTHNDamJ0QzJmN1VDSVlRZnZmSkF0YzFUT1JFMnQybERJVHNpSWZh?=
 =?utf-8?B?WWZPbktjci85dDFZY21iUUhZTXUvMFZHQ2h2YUNoUzBCTklWSFE4S2Z0bENE?=
 =?utf-8?B?TlZsOFVCbU1BNysxTFBKbHNTVVZSUFNPTlcxcnB6bVpTMUpnZ2trUkhsRFRk?=
 =?utf-8?B?VDJWZCtmcU4vVTB3cXk5aEdrdHB1M0R3R2dXMnBGWDFvbFpia2U0WmFQelVZ?=
 =?utf-8?B?S1RxYldLYitjcEgzTmQwODlVeVNxOUlmY0hpTWZRWENUeTNSVS85UmtDTHJh?=
 =?utf-8?B?Q2dneWhvbmhPMEJRZ1JzZWdYSDFiVS9sTC9PQnY3ZEJkTWlFNGc0SmwzSjVp?=
 =?utf-8?B?L3pnMzZTNzNXeGtMZ3ZPY0Y4UHYrYkxXVHJWZktVREFBZlc3ZCtzUjlqbFV3?=
 =?utf-8?B?TmtvTHJ2TThrL3ZTSFRHS1hQT3VnaHpKMy9iaEJOTkhZOEVxSG1nUFFGRXRS?=
 =?utf-8?B?MzVzK21MUFlpQjcwZjFWRW9yZVUyTVFjQ0ZMRmY5S3NtbW9OYnJqSHJ5VXpJ?=
 =?utf-8?B?RkFid1R2UTZDclFuOWRBc3JjZlR1U2Q4TVJJTWtRS3NBN3hLTVdjSFJWVDhO?=
 =?utf-8?B?WGU3Unc2dEJFWndLcEdleE9PelJSYVN4eEZwZnRBVUszazVwcEV4dm9tODZ5?=
 =?utf-8?B?TS9BZFpQd25UTlM2bExyRmhHTzZvK096Ui9zZGpQSjRFVHJFR0dHdHNTMzNo?=
 =?utf-8?B?VVc4OGtaWFFvc1QzbExXT1pnUExtN1QyRTRwUExtWEk5eSs2S3BBOGgydE1Y?=
 =?utf-8?B?emdTSnB5QXFkSmZjMXVPS29mOEV1cTFDR2ZTWS9mMVV1ZTBYQjltVDNVTVJi?=
 =?utf-8?B?SVZJSEhoVlArS3oxaUJxZWJqYTlaMnNUU2p2TDJBSGY2bG1Yd0hoYUIwYk0x?=
 =?utf-8?B?MFU0dEp6NFNjdkN0ZWVZTklGYy9pbmo3bjVzR1RpRHMwdE0rcHhlcXRjVWlh?=
 =?utf-8?B?M2hocWlqeXExcG81RDg4WGFSdTZwcHJrUGhuQk5DWFp2bzJvaXZ3RHc3Znc1?=
 =?utf-8?B?bnhRQjFEamhuQm9wSHp5NWFTQVZZUjA1MHE1bTg2RStaMStYT0E2bzdTc2ZZ?=
 =?utf-8?B?dllBODl6WGRJTW9IMGxYYWN1eVlSWjRrREVudThwWXBTZXpMUDVRUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a11101e-2454-45d0-9268-08dec5fa20a4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:38:41.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOZaZ4+v21kvQxm2EuafqWuHGGr58JDBVVgSqU+bADoddHS2RtJUDU9TXUFSaj1wfWUP+XIpDJdPO4H+Sc2zZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6857



On 6/2/2026 19:28, Mario Limonciello wrote:
> 
> 
> On 6/1/26 06:21, Shyam Sundar S K wrote:
>> The series introduces the necessary device identification, refactors
>> SMU
>> mailbox register handling for better maintainability, and configures
>> the
>> SoC-specific register offsets required for SMU communication.
>>
>> Patch 1 refactors the per-SoC configuration by introducing
>> amd_pmc_cpu_info
>> struct that consolidates SMU register offsets, IP block table, and
>> OS hint.
>> The individual smu_msg, num_ips, and ips_ptr fields in amd_pmc_dev are
>> replaced with a single cpu_info pointer. Per-SoC instances are embedded
>> directly as driver_data in the PCI ID table via PCI_DEVICE_DATA(),
>> eliminating the amd_pmc_get_ip_info() and amd_pmc_get_os_hint() switch
>> statements. The AMD_CPU_ID_* macros are renamed to
>> PCI_DEVICE_ID_AMD_CPU_ID_* with compatibility aliases retained.
>>
>> Patch 2 adds support for the AMD 1Ah Family 80h SoC by defining its
>> distinct SMU register offsets (msg: 0xA10, arg: 0xA18, rsp: 0xA14),
>> adding
>> the amd_1ah_m80_cpu_info instance, and wiring it into the PCI ID table,
>> amd_pmc_set_cpu_info(), and amd_pmc_idlemask_read(). The corresponding
>> ACPI ID AMDI000C is also added.
>>
>> v2:
>>   - Consolidate 5-patch series into 2 patches
>>   - Use PCI_DEVICE_DATA() and maintain per SoC data.
>>   - Address other remarks as per Ilpo comments in v1
>>
>> Shyam Sundar S K (2):
>>    platform/x86/amd/pmc: Use per-SoC cpu_info struct for SMU mailbox
>> and
>>      IP info
>>    platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah M80H SoC
>>
>>   drivers/platform/x86/amd/pmc/pmc.c | 176 +++++++++++++++++++
>> +---------
>>   drivers/platform/x86/amd/pmc/pmc.h |  75 ++++++++----
>>   2 files changed, 177 insertions(+), 74 deletions(-)
>>
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 
> As a general statement though about patch 1:
> 
> If there ends up being too many "Special case" blocks in the future it
> may be better to just switch to explicit CPU ID range matching later.
> There are some other drivers that do this like k10temp:
> 
> https://github.com/torvalds/linux/
> blob/6f3ed7fec72fc8979b2a8c7219c0a9fcfc8d07b5/drivers/hwmon/
> k10temp.c#L490

Sure. Apologies, I missed this. Can you please add your Reviewed-by
tag on v3 which I just submitted now?

Thanks,
Shyam
