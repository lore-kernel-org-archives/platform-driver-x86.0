Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F9F30C16D
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968467; cv=fail; b=smdaWnwmuoo1jMdAWcFTgiGamlqlkcxO4Df4wZNkq6QXM8de3raoHuvgW6DYBpypPqZGHJy4arxtQh1cJLZcSd/nLAb3tUQovADjTUK52JoydMM2PzVFuJGioU4TwPGwwUIKWm3S/hZJBl7TeMCdlUGLpNri7xH4rNoEC5iYyKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968467; c=relaxed/simple;
	bh=vLjJ83RY8hQOuuwKEF+kRY/3d/6fCNTKYi/UtMx0wDs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sV+SCf0rFDUHsP1/ViJD/PPPIzP5oZqWrgdq86aDu8Z5+xNe4MLeErwuaxsWdmvKsl7/fToRs1wnnjq2SHxA5qUKo4V3s+WgVbAKVr/y44cEV6bC20SwI6pe70ygFaoz58urRJejAuFXs7cYQYzvJmO6adTSDGS1/W9LHBRrwGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q6WVGCY5; arc=fail smtp.client-ip=52.101.201.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q6WVGCY5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1UAcQCw/NCYlCJVJosJYfmi99zTtYLaMVRp+rslDYCvMZOdPkbnEuTfVClrCEk41gBIS/RM7Sxw+IgxMaaU0Teo0/JnJjwWS4cMB9DlrSl0PkRnBwyKAQkVtXY0S/pSBFh79RQcLhoLi2GVt2hWIoUEAodFeKP6VwK7NvcHvkX9pC5pi1NOOdrzDUqHANyKcirFpfQV3Hyxvoaht7mRnBw5YMHKFIxHtah6JU7GzFYmzubMHkaZgzq/YTc6TZIOmtzQA68BqUVZXKgrUeboOQQlNFeSV5VHzikmUOFZAaYKrlM+p7kcGn4JZRUavpzBdy0eBaxj8soHD/iTDiL+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hoDn2bofqrBuRViptF8l3Uw0wlIhhIKW05OwjiXkis=;
 b=QUvqXhBaI/oJR8EOkE6MTGteojaJq+yTVBBpii9UECLEJpumriMg8QSINSfC8D5VQndVnGzmYJ2DcyqSp7rLy1nWwlvrSzecNlweWZa1P4DBW3QA+bZTuBcUXN8hcIZWuhIONKtBH7woIY1kqagj47k1JM96UDxVpbs+m7OE9RRfDawepV33Fe3ZngcE4YMVahaBhA5xTzVE289B0EJWbs80/V0PDA6PM4Uxfnp9vW10QJnetw8sT9lWyef3TWz9ZmR9Gk0n+Y+50gTIxkB+f1ze5YMShp6nxi0GNxNfiYMZUaBjMh4ZK8ARdlxAYhEhAznrnOpqJJ+LSdrbaQDdNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hoDn2bofqrBuRViptF8l3Uw0wlIhhIKW05OwjiXkis=;
 b=q6WVGCY50PJF7L2LZplf44DRh57Vn43RL0GFNwsHQ6vhZzYsEwWxEI87yjScVdtIB11BRcYC/EZroTCWdPWftSf2J3vQHneDbm7qn1YullOedrqRat1diZT85DuZbSzSOuAd/OfEOsxWSURvW1jNMtEaTAVMBve7fl8k+yUXsW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by MN0PR12MB6126.namprd12.prod.outlook.com (2603:10b6:208:3c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.23; Mon, 13 Jul
 2026 18:47:40 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 18:47:40 +0000
Message-ID: <af647ac4-d349-4ece-8167-7be353a227f3@amd.com>
Date: Mon, 13 Jul 2026 13:47:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] platform/x86/amd/pmf: Add 1AH_M80H support and
 accumulator based NPU metrics
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0081.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::7) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|MN0PR12MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbd8fec-6102-487f-8330-08dee10f3770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	U8FCI+Osfs88qYxK+WRo6TGWD72Twq7mzY14M/39nOyuXyF5ua38X4OQvfEU9ZfDrmxV/TejtqqJE44Q2ta24RHF1l8wXn97NXDh6XkJAvDPPlOeZwegA1nX6Tp9prZj05H/12pXSUQe5FUb+nxqMNwdUwX7CJfKtdJme8kR8iBEhIuzENQsOanvfBQb4lkI7wKStpaBT67FiViUZ9Pj0GnnZ0T0WCNpIf3G+D/POFs4GNB+6+u2f2e7qz9sMe7gV1VnipnMhXzKJk+em86YAHcbmokrcPaftmHhpnvFA6yafn/sFiMyyQyl5sGWxHNBqW4/t7tuJN1TRGUUcnHqHEOEIHmCzFnilG+BVBTMdATllHf2Q6x9aASc3f9KZVnebS2GpVtWIOM5QlaHJry7GUxRvOVK58v+LXJ7c+VdzNbeazijOraKh+eg3wvIVPS5ezmh7x3S4h/s6am4IFzXA6BcJdgf/Qqm7/msYGsmNgGyTgZJDAyaNszha3eQmsarwZJnGI6ywlv/3Rj/kaOl/7kjQE+VjVZqisoSAzFVoQW5B7NfOTazGH/MbAvif6ihm8P0mtUuMSbkyZQM7idVI/S0NQdOiQnskfkQGBhWIM4gCNcDDVpUOYF7/2KvV/YL56xYmRBASfzgt/eznw6KoddNILiSfsgfqx7TyD6k7qg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnkwcjdudXB5UzB1Q0p4OTVBalRybm45WjFlbS9RKzVIY21na212WE5RWDFD?=
 =?utf-8?B?NjJtbTJTalhMVHhuQWVqcXc5ZDlrMFVvaFpMQlR0TmhKdWpZT3ZtS0tKR1JH?=
 =?utf-8?B?YjhvWktPKzBvWkJGeFFBUXF1WDFENk5hekxKYy8zUGplZ1JlOGZmS2JWM1dx?=
 =?utf-8?B?eGJYMjlEd3NoOVN0ak9IMDBLSExsb2JVblhpYUh1YTBkendDNjZZemg2aTAx?=
 =?utf-8?B?WWpLNTZEYjZJMHh3TkFRZkk0SHBkQ2RGSCtNeitVdFdsejdvQWNNYkh3QTJ4?=
 =?utf-8?B?OXgwTlc4SEZIaWE3VDlPOUdEaWJoSjFqbytWSjUwa3Q1UTZDT0dRUjFvRzhj?=
 =?utf-8?B?Nm52RFY1Z2s5QktKc3UvRGlvTkVUNVcySlZOZGpaYk5SdWxGckhhNC9BTlJB?=
 =?utf-8?B?U2lrY3hLaWJqdGhMMWpsVkxreVFYYzBBMDc5cW5sejdhSG04QlkwWlF4aFVp?=
 =?utf-8?B?elZoNXdEbUJmMzl5cDRZdGJtVSsyenFWOUFJcEg3WmlJL1VodUh5WXluWnRX?=
 =?utf-8?B?L0Q3RnRhZTlURXYwN2V3SWRqYnpuRmNWWVFkM2o1dnMwY3JNdmZJSzdzUlRJ?=
 =?utf-8?B?RUZUTFdrQzl6VmtmUnhvWTdYUXBWdjVMRnJyVThHMG15VCtiRW1vWDl5VldX?=
 =?utf-8?B?Z0VQWmlkNklvL3NyTTIya1BmV0dFRTBrK2FuY1RCYUh1c2c5dWpmOFdLbU1E?=
 =?utf-8?B?Z3dhVXNzb2VrV2NaQ0RmNkZKRzVOWTJKNFNNSlhuRjArRENBNVozengyRFRx?=
 =?utf-8?B?SUhxSVdkbVFZOHFyOUVTUUdQaEFHTTdHajBSbTNCZEhEUzBEYjhKQ2JwVjV1?=
 =?utf-8?B?Q2RYUE01Vy92OGNmbWxxTXlDaFpSRTM0QmVvdG1iL1J1Q1h0N3Y0Q25UWlhY?=
 =?utf-8?B?OFUvMzVKTFVsd3RlcHZrMjNRN0hEZ0RCZWxrNm0yYkdralhNQkMyVFY5WGJy?=
 =?utf-8?B?Z3I4OEVzWmpIVi8wbE5uZVF0enEyRE9zVWhTYzQzeUY0Q1hJU1JySkRjUFc2?=
 =?utf-8?B?OEJ1RXFPeVVMc3QrMFBDQnZBUDFWVFh4ZkVKRGpuSkJKYmhMUWxuSkJ4UmpD?=
 =?utf-8?B?MkJJUzZJTW82QkJEZWxJS3dkQ0xXbmNmUjVRRTl6UmNBRFlyZUh4bVpZVUlO?=
 =?utf-8?B?SGE2K3R2VHYxY3hXMHZDQ3FockdlYzZWMk9qdkRBT1lwWXNYNXJhQjhVaSti?=
 =?utf-8?B?a1F0SXZSalpUQ0ttdEh3dEtuUWcvZXVGUnRENlhmdXBkQ24wUVR3SllKT29p?=
 =?utf-8?B?SGlEdmo4RysrVHo4SER0cVduM1puRU1FOTFpMVNLK2pPUlFPMGxhMDhrRlE2?=
 =?utf-8?B?cThEODU5RDNqbURIR0FzcVZoMUMrdmhkOHlrRFZ5SFNJL2FMTkpFNEtlZkJ2?=
 =?utf-8?B?ZnBRb29nUFZIOXF6bUUrdXc3Ri8xWmpPMUR3QzNyc2x4MFU4RkI5STgwby80?=
 =?utf-8?B?U0tTTENQWTI4c2xrMEZpS0NrblVGaFpoQkliNUEyb1E3YjdSZ2xMVkJ5TytR?=
 =?utf-8?B?eEdKUHVRZExRd3ZKT0RHNWxiREFOSDZDczRiZVllb245VjVRMWlGTkI4bGpv?=
 =?utf-8?B?blFOZUVFbnJFNmgyR2JiNTZ4VWtna0I5TnFjMW1uRmtsSUgwNXV0ei9wWlg2?=
 =?utf-8?B?aXVoZERqb2JvR1R6WEJQMytLMGNHa2c3QkhYVlMvb2dxcmptTHQ4UHVEM3k5?=
 =?utf-8?B?SEJlemttWGF4bFljQjM5b3dyZngzcWF6RnZVZ3hmR0Q2VGtFU3dCeTFHMFVY?=
 =?utf-8?B?bnQrc2RTRmVtSTZhZHczbUFuTW5JdHJhV04wU1lPV2ErbWF5TzlJU2hVNEY1?=
 =?utf-8?B?WEh6Vk9JK3hyY0hxTUV6TEZFVU4veTY0SVNiV0Y5eDBRN1pnU3lCWEQxRGJ1?=
 =?utf-8?B?aHBTNTE5UkV5SnhBS2EvTzVHRVdNdFlNcUtyK1pIUnZxcHNSdlRFUW16SEdl?=
 =?utf-8?B?OWlycFI2QXpXbDExUWNCdWV2TjNlWjI1MmdyNmp1VU9NL1EyWlhVTFVBdjd2?=
 =?utf-8?B?SEl3YjlpRlptWVlrUWE1NVcrU1RSRmxhT2RtU01IU1lsU1JqZk40emZNcFdM?=
 =?utf-8?B?bEhTUUdYUU93UFJqZ1ZjZTdxRnVkRFlxVlJFTDBDUWxKeU1hMlh0NmozdkMz?=
 =?utf-8?B?S01Ma2RseWZ2YlduU2xGcG9IVzBQOThsdkVuTEc4NDJ4UURkd3Z3Z0o4UnlZ?=
 =?utf-8?B?TUdvVWxNR1RsRHRZRlllYjFEd21UT2lhVGtDNlF2a2pwRytJUUdnN0JHcWF4?=
 =?utf-8?B?emxINXZFZGVOd1JITVBkTW1FUW9LMHozVUg0bis3SHZmWkc0ZkMwa3htQnl3?=
 =?utf-8?Q?yGkhD0+qpqy29j4GZ8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbd8fec-6102-487f-8330-08dee10f3770
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:47:40.6093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDX8IX7NgwZSQ+jkRLHlvwT2EpRUEvBh1BrHfKYEZqEV4EFqHMlRZZvDhCH6QdcYYCccnf3/gqgszJpXSrBt+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6126



On 7/13/26 13:39, Shyam Sundar S K wrote:
> This series cleans up the PMF-SMU mailbox handling, adds support for the
> AMD 1AH_M80H (Family 1AH Model 80H) platform, and introduces NPU metrics
> retrieval for it based on a firmware managed DRAM metrics table.
> 
> Today the SMU mailbox register offsets are hardcoded in the send path,
> which does not scale to platforms that use a different mailbox layout.
> The first two patches address this: patch 1 moves the offsets into a
> per-SoC struct amd_pmf_smu_regs carried as PCI driver_data, so all
> existing platforms share a single legacy instance and new platforms only
> add a table entry. Patch 2 then adds the 1AH_M80H device/ACPI IDs and its
> extended mailbox, which uses three argument registers to return the
> 64-bit DRAM address and size of the metrics table.
> 
> Patches 3 and 4 are pure refactors with no functional change: the metrics
> code moves out of core.c into a dedicated metrics.c, and the NPU metrics
> retrieval is restructured around a per-CPU-ID switch so additional table
> formats can be slotted in cleanly.
> 
> Patch 5 builds on that to add 1AH_M80H NPU metrics. Unlike earlier
> platforms that copy a transfer table, 1AH_M80H exposes an accumulator
> based metrics table (amd_pmf_metrics_v3) in DRAM; NPU values are derived
> by delta calculation between consecutive samples, with the first sample
> discarded to seed the baseline. This also extends amd_pmf_npu_metrics
> with npu_temp, sourced from the new npu_temp_acc accumulator.
> 
> The series applies cleanly and existing platforms see no functional
> change.
> 
> This series is based on top of the review-ilpo-next branch, with commit
> f6ee11d77d15 as the head.
> 
> v2:
> - Change the amd_pmf_legacy_smu_regs to amd_pmf_smu_regs_v1 and v2 for 1ah_m80h
> - Remove arg0, arg1, arg2 comments wriiten in the amd_pmf_smu_regs_v2 struct
> - Update git commit messages with amd_pmf_smu_regs_v1 and amd_pmf_smu_regs_v2 accordingly
> - Add includes and introduce separate patch for upper/lower_32_bits()
> - Use DIV_U64_ROUND_CLOSEST() instead of DIV_ROUND_CLOSEST_ULL()
> - Use macros present in units.h
> - Replace is_amd_pmf_1ah_m80h() with amd_pmf_supports_accumulator_metrics()
> - Add Reviewed-by tags
> 
> Shyam Sundar S K (6):
>    platform/x86/amd/pmf: Use per-SoC smu_regs struct for SMU mailbox
>      registers
>    platform/x86/amd/pmf: Add 1AH_M80H device IDs and extended SMU mailbox
>      registers
>    platform/x86/amd/pmf: Move metrics code to dedicated file
>    platform/x86/amd/pmf: Use upper/lower_32_bits() in
>      amd_pmf_set_dram_addr()
>    platform/x86/amd/pmf: Refactor NPU metrics for platform extensibility
>    platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics
>      support
> 
>   drivers/platform/x86/amd/pmf/Makefile  |   2 +-
>   drivers/platform/x86/amd/pmf/core.c    | 254 +++++++------------
>   drivers/platform/x86/amd/pmf/metrics.c | 330 +++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/pmf.h     | 233 +++++++++++++++++
>   include/linux/amd-pmf-io.h             |   2 +
>   5 files changed, 654 insertions(+), 167 deletions(-)
>   create mode 100644 drivers/platform/x86/amd/pmf/metrics.c
> 

For remaining patches I didn't previously review.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
