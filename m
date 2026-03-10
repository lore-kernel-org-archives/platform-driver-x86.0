Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D820279903;
	Tue, 10 Mar 2026 04:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115886; cv=fail; b=Vz9Cx/ACEpkjWvg4I1oA/pLNGMUREeu72WTJV2IvEWWZt6LjOxj0nJ+Sxe4/o3sF8eAcfTnfzLE9d7FXmvrfqBFpXSyKUFyfPMnYuUacqU1L3mbQW6RhxJuNpGEXQsQMWTFaI8Z1iIyD+6F27OA7+sz3tvWs/G89JT/Bz1+0JsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115886; c=relaxed/simple;
	bh=ta+Y3byiVuRDhAbNf6s1iTD1eFyb/DRbWjUfVJ+yVrU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ICk0c7xfeQIIFpGCNv9WfmbAIvoJO2s75kM5Q2uE387earPmHHlz0BzrdgLnwk5cuzxiF/NMmpIKubvOVltwMF9qBFqR9n/t8xezkQaCbSvQidDCZWQgR8O2kwcGSXtQu8gY9LDvkwFSbl0yDFKuxHcdKUDvZnzw7uvtoSP2jH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kSSW41Vq; arc=fail smtp.client-ip=40.107.208.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kSSW41Vq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyDSWcVipQo4DQEnjxj8CAc0Y+RMlOoqJOQfsS0HTt0buRlyEUitXcyoQfnouDOuyp/BTVcNqSsmBbdfrl2+73cAUJf+ikhPSWLIbopKPvtrZ1iJ+8j98NI1Fyl1aqBMkyI9YY5+zj18uma1/2ln0bM9edLkfy0fXm+GgqsrfJ2WqmWZYTHMvMBttlwbAjzYf9JmAyWsNg4wccu0eY7dAIckVHwuwZlofD1XXy4APGqi4FNFhs6UDddVRn9FLNOVL2g5qYCy6FRBp7klolObCY/1YaWyDVDe43LoVEO4zyPAxi1HSqu+IVC+xCbMcNiW51719aHPhcdLO4P2XzrgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GF02zPcKo/CtG7lTLXGVHcD2iqYNZ+Qb5teNAKoCgiw=;
 b=JrwffFM7VO/JzSQHPl3fgSHD/Xicb8EhWd4+pDClbP8HqIDhObCJvN11fheNeuJRiKogyXTz2H72eDcA7kL4CuKyzqjQkGlT/tEN+Jh5YmyC2DHAW+BhdAqizvQnHoTO1F8cjYrZr2bNQfalTBDDQAXtayXaXjfEf2iGEUJOiyN1nlZQYWIhqoQ35LfzQjIUv7QEdNx2XHq9sBhNCAXNGWrm4MbBtI599zEb4XSL73h3FK4AfNzj2FVINNdZCqq84vvHaClZ3qT2dH9qIovvenTDtCG5uY/BwbqLjrnRDmb/pIVY8XwiUtrRtjEx8qVf6uETASHsHAQsipJ2IrtNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF02zPcKo/CtG7lTLXGVHcD2iqYNZ+Qb5teNAKoCgiw=;
 b=kSSW41VqTRXAfvraN4h1Z9qYeP/62hiPYX0HlDDk0D5KNQjT/oZoL8Titm1XQNHaw9NncVZQFanlmqFDLsX+tvcDd5En0RrZb/kMrq8IJhUsVJE3ebWhHjs8wsZaqe4OxuWQqAipY2u1qZuWYvyMryzKJ2RpviyQiMUUKR7JdoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by PH7PR12MB6586.namprd12.prod.outlook.com (2603:10b6:510:212::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 04:11:21 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 04:11:21 +0000
Message-ID: <d5c2a4e0-1263-42ac-a64a-c6218e91bc09@amd.com>
Date: Mon, 9 Mar 2026 23:11:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 4/4] platform/x86/amd: dptc: Add device entries for
 handheld PCs
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
 derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260309205125.293148-1-lkml@antheas.dev>
 <20260309205125.293148-5-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260309205125.293148-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|PH7PR12MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: 75329475-e6bd-4411-a72e-08de7e5b1642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	l4xTjYgmhOsNlSFh0+hEa6HR8t0TPTM3v1pTC94+gASAVmoDkPUTzSJs+mnQAAtiCdA4nEA/2E9JWn6yd0pmkxIQ9eFL07AjC766WTVxlLC+nOts2qHCQjACzOYLdrrMjN3JJ+c+nxp1KDNGZ1CGHE7alxnKKAxqBaiQUZRnVGh492/kLKpJ8pAynaron91vm2+pHYq5ahkQ8bupTJX6f8D5yfK84gLl4d2/K3wksjQXG00izPH0ZENlk4uuUicM/MTk7Z1wfrtYJyIpWl6olDlA2jNmoysBOHeJqzz6qgRkoQtzw+gMLh6iehK9zi+9zoV+aCok4nAQXys7OPysOLzGypniW94nzKEDUin2Ai4UinPwde3TP7VbT3OYVEE7HuLbHD0MPOwUNYLfb8ensKymaLfQ44XlE11PA76QrPn6kUvXed35zPW9bGK6AuTUFeOrSnn0w2Tj9KXiD5pPW9h9OttfCgcvd1Q2RzWOxSN4lRSv9ajMM2h97WqlJaU67hi0C8E60FZXz8Ubn7OqBaBcW6DIRiBo+GE5ca6EZ1ZxkCT3CzfSrN275w++Z9tUEIA3XWbLRjRGD2pfERuapJKnXKXQHCICsSMxiXk7ECXEa1I+i9sxS3sMFSQbFKkUZ5MGmClskeEojGdY/zeF2U9TkD7VV7YaGQlRdWW1lkWUEV4uhClxVDJLtTTJoYykz+FHSSITNMkZUxdOnTi+q0v3olQN0Yg0OrBthiXM/mo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N05HZEpnWVhObWs5QjZ2T3dsTFh0d1V4V3AwMzV4c2NVUm1CWkk2SjJCaEtE?=
 =?utf-8?B?VDNMN1IvR3dHYXJTVENqUUY3M0JxNnlsWlZoc1BIRFVyUndZdWoyMFFkOXov?=
 =?utf-8?B?bVUrMU5IM2N2M0l5NjdTSjVBaWtWcG0xRUVyNFE4Yi9zOE5DNkpDdGpyem9R?=
 =?utf-8?B?OTJrNmZtL1VhVUY1Z3orTkVXT1NqaE1HYWxNUUQxenltcThNRktraXhyNmlI?=
 =?utf-8?B?V1FBNEI2RHI5OXNGNHFmQldXbU40WU05Z21NMms3emV5Q1k4eTB4QjZoR1lU?=
 =?utf-8?B?STlWMWgrOVUvZEhWaGJKb1ZVM0NaWFJZU3MyVlkyL3lhMDZCcWx5Ujgremx4?=
 =?utf-8?B?R3lMbXZUblgxcElNcEs5SVFZMG45eWJqYnJxU0tzQzlDNlFuM3FXWXJqSDUv?=
 =?utf-8?B?ckpiczVmdW9OcmM3eURXbUNuZUxMQ2prK3VkTllRanc5dkFEcU9iMTloZ3I1?=
 =?utf-8?B?SmMvRTVQUHBGUS8vYjkzUGw4YkZJaGFSUEdtWFEvdXlrVlNOQ2ZvWWh2QU1h?=
 =?utf-8?B?OFZKNUg2TlhVLzJyQXN4aWFrT25NemZJQnNEdEM3d1IxUlJuNHd2anNQb0k0?=
 =?utf-8?B?aDdkV0tXcGY2aHNPbUIvSUNGUVI4VUc3TUJMc1pxNi9NL0JEb0luL1hxREJ1?=
 =?utf-8?B?MzNMMTVqZDhWNk9SMzc5TmpCV0JlZEdNQzlidjNXVGFRdUdyd05OeG13TURo?=
 =?utf-8?B?ZGhqWmhERTdRdXRxMGQ4RDB6bGRTWDlzM1hheFlONWVTU2VZaGZEYzlIc3Rn?=
 =?utf-8?B?Z1orN2cvcW0rNmw5ZEwyU0EzUmtuNVBVWm9CbGdjdDh2cGR6TEtWS1dIRHNl?=
 =?utf-8?B?QkxyUm9wSzUzYmdpWWo4ZUhvS1FCWlFCNDErTngzSTdZNk5hTlhJUWptSjl6?=
 =?utf-8?B?b04xQjRCV1RFdjdLMituNDVYRDcxRlF0ZlRPTkNrVFRYcmNCRFFyZStwdTAr?=
 =?utf-8?B?K3hWSGxGQ2hTdmFScHVuaGlvVGxNUGpRc0NYR3BQYk4yWE81Qi9LUnErb3Rx?=
 =?utf-8?B?M1FFMzZqNEo2OGxsK3Fqb3NhZDl3OGxtdFVHdUkvM09CQkdTWlZaakZ1WVEw?=
 =?utf-8?B?UFFsVlBaNDZXTUJPNkllcjVDMHZ4MTBXcVRHUzVOQUNITFhERXdjekp3M1Rq?=
 =?utf-8?B?UnB5ZWY3RVZXcDd6SW9yZXQwRW5ETjdvckg1YnNvQVQzWm1iMGlVUTZ1aEht?=
 =?utf-8?B?cUgwRSs2VG1NYmhDSXBBMnlwLzdRSE0zbjZzQUpwaVI2Z054OVNSNkdSdEk0?=
 =?utf-8?B?L0JBaWtOTDhKV29VY2JWZGRkZzVSbXlDeGhpVW9WN01WZStuMVE3SE9MMk5u?=
 =?utf-8?B?YmlqdU5BQ2M1akhyQUxlMW1sSXhCeDZIZU9yRFBadEVvN28yNWIvakorcHFI?=
 =?utf-8?B?ZTFqbUZLMGFiaHZHUnBOVW5rbUdOM013Y05NdVBERjVzK3RBWTFkRGpyMlhx?=
 =?utf-8?B?ZlNnVUZxT1BZSjU5SURYaTdOanVBRU04SXZ6UVFVZ3VPR25zc01rc0tyTi9x?=
 =?utf-8?B?SE5wS3BsN2JUdkVodmVGY2ltRFloYUg5WmxpSkJoSHJTVlE2RjBZc1VkTjZQ?=
 =?utf-8?B?TlhZQ0xuMzNwVU1lV2Q4NGxMOXplMEhaWmpZRzVKRVFLNGg2TWdLc0xNZzhx?=
 =?utf-8?B?Nkw4WDlHN09PdG5uTktCYnVDVDlheXlKdWgyNjBBVHp3Y3ZibXpveVRwaEJQ?=
 =?utf-8?B?bXl1eXhaUlREZCtnTUw5d2pzZUVKTGhpNlAydTUrSkdxRDVSNkh0NEFBNmJk?=
 =?utf-8?B?RVUyL2Zxazg4MGxTMGgvVXMrT0tpWHFGT3p2MmRqakN2cXJBUmJIbnM2SVVX?=
 =?utf-8?B?cW5EYXdoUURsRjBCV3dkMi9zbVpySGhkK1pFYXVZYnVFbi91K0NkQmtOMG1k?=
 =?utf-8?B?ZkZuYkF4TW1GUU8ya0g1UDNkUWRoNityK0lyL041bUw4dENhM0xlOG9ZRWF1?=
 =?utf-8?B?OTl4OWp1amhrb0p3UEdOZlVoNGRWOEREUk81SmhxOW1YVzFUSUR1MHlpOWpU?=
 =?utf-8?B?cFZBTWZHVldqU3oyT2FqUU52N1hvNVo3UUNtOFJkR0lZV0pBeHJtd05OSTlo?=
 =?utf-8?B?eGxrV3NtbUlJcmJQVkhYQmNPeWoyUXR4T2Rxb1paM1kza2F5N0VOOHE4cC80?=
 =?utf-8?B?LzNCQTllTzhrYUpkRDY0bUhLcnFhMUk1alpQd2pGRUNFL1haMWVqam13L0xX?=
 =?utf-8?B?MWE2TDRMR2szWkFaeklIRjBXNE5keGtma3BNcE9HMUJuczJqbzl0dW54emJC?=
 =?utf-8?B?S1NHZXpOYzV2QXp1dmc1Y1lGdUYreTF3RHIwWWtPdXFQZCthNkREWlJmbVQ4?=
 =?utf-8?B?OGlsQnJQcFdQekFFRGhJaUNWcXdRSjFHYWtOS1JYUlVhQXVZU0grQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75329475-e6bd-4411-a72e-08de7e5b1642
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 04:11:21.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nf+X3Y+hXzOoE3PqHENunB2seZJw7LNAINqEEnaRxpZu/OCBHgXAh9vyYLqwS5ya36qG5msiWEdlcoNoRF0USw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6586



On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
> Add limit tables and DMI entries for AMD APU-based handheld devices:
> 
>   - 15W class: AYANEO AIR
>   - 18W class: AYANEO AIR Plus/Pro
>   - 25W class: AYANEO AIR 1S, NEXT/KUN
>   - 28W class: GPD Win Mini/4/Max 2, GPD Duo, GPD Pocket 4, AYANEO 2,
>                 OrangePi NEO-01, SuiPlay0X1
>   - 30W class: AYANEO FLIP/GEEK/SLIDE/3, AOKZOE A1/A1X/A2,
>                 OneXPlayer F1Pro/2/X1/G1, AYN Loki Max, Zeenix Pro
> 
> Also add SoC strings for Ryzen AI, Ryzen 8000/7040/6000/5000
> families, extending support beyond the initial AI MAX series.

There are a lot of numbers here.  Where did they all come from?  What 
are guesses?  What came from RE?  What came from documentation?
How do you know these are good for the thermal design of the platform?

I appreciate some of them could be cargo culted from another codebase, 
but I think it would be a good idea to document which ones are more 
likely to be accurate and why.

> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/amd/dptc.c | 420 ++++++++++++++++++++++++++++++++
>   1 file changed, 420 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
> index f4db95affb1b..b2820f8652f1 100644
> --- a/drivers/platform/x86/amd/dptc.c
> +++ b/drivers/platform/x86/amd/dptc.c
> @@ -86,6 +86,81 @@ static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] = {
>   				 1, ALIB_ID_TEMP_TARGET },
>   };
>   
> +/* 15W class: AYANEO AIR (Ryzen 5 5560U) */
> +static const struct dptc_device_limits limits_15w = {
> +	.params = {
> +		[DPTC_PPT_PL1_SPL]  = {  1,  5, 10, 15,  18 },
> +		[DPTC_PPT_PL2_SPPT] = {  1,  5, 10, 15,  18 },
> +		[DPTC_PPT_PL3_FPPT] = {  1,  5, 12, 18,  22 },
> +		[DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> +	},
> +	.profiles = {
> +		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
> +		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 10, 12, 15, 0 } },
> +		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 15, 15, 18, 0 } },
> +	},
> +};
> +
> +/* 18W class: AYANEO AIR Plus/Pro (Ryzen 5 5560U, Ryzen 7 5825U) */
> +static const struct dptc_device_limits limits_18w = {
> +	.params = {
> +		[DPTC_PPT_PL1_SPL]  = {  1,  5, 15, 18,  22 },
> +		[DPTC_PPT_PL2_SPPT] = {  1,  5, 15, 18,  22 },
> +		[DPTC_PPT_PL3_FPPT] = {  1,  5, 15, 20,  25 },
> +		[DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> +	},
> +	.profiles = {
> +		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
> +		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 12, 14, 15, 0 } },
> +		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 18, 18, 20, 0 } },
> +	},
> +};
> +
> +/* 25W class: Ryzen 5000 handhelds (AYANEO NEXT, KUN) */
> +static const struct dptc_device_limits limits_25w = {
> +	.params = {
> +		[DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 25,  32 },
> +		[DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 27,  35 },
> +		[DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 30,  37 },
> +		[DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> +	},
> +	.profiles = {
> +		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> +		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 20, 0 } },
> +		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 27, 30, 0 } },
> +	},
> +};
> +
> +/* 28W class: GPD Win series, AYANEO 2, OrangePi NEO-01 */
> +static const struct dptc_device_limits limits_28w = {
> +	.params = {
> +		[DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 28,  32 },
> +		[DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 30,  35 },
> +		[DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 32,  37 },
> +		[DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> +	},
> +	.profiles = {
> +		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> +		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 22, 0 } },
> +		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 32, 0 } },
> +	},
> +};
> +
> +/* 30W class: OneXPlayer, AYANEO FLIP/GEEK/SLIDE/3, AOKZOE */
> +static const struct dptc_device_limits limits_30w = {
> +	.params = {
> +		[DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 30,  40 },
> +		[DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 32,  43 },
> +		[DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 41,  50 },
> +		[DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
> +	},
> +	.profiles = {
> +		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
> +		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 25, 0 } },
> +		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 41, 0 } },
> +	},
> +};
> +
>   /* AI MAX Handheld class: GPD Win 5 */
>   static const struct dptc_device_limits limits_maxhh = {
>   	.params = {
> @@ -107,11 +182,56 @@ static const char * const dptc_soc_table[] = {
>   	"AMD RYZEN AI MAX+ 395",
>   	"AMD RYZEN AI MAX+ 385",
>   	"AMD RYZEN AI MAX 380",
> +	/* Ryzen AI */
> +	"AMD Ryzen AI 9 HX 370",
> +	/* Ryzen 8000 */
> +	"AMD Ryzen 7 8840U",
> +	/* Ryzen 7040 */
> +	"AMD Ryzen 7 7840U",
> +	/* Ryzen 6000 */
> +	"AMD Ryzen 7 6800U",
> +	"AMD Ryzen 7 6600U",
> +	/* Ryzen 5000 */
> +	"AMD Ryzen 7 5800U",
> +	"AMD Ryzen 7 5700U",
> +	"AMD Ryzen 5 5560U",

Still don't understand the point of this list.

>   	NULL,
>   };
>   
>   static const struct dmi_system_id dptc_dmi_table[] = {
>   	/* GPD */
> +	{
> +		.ident = "GPD Win Mini",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-01"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Win Mini 2024",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Win Mini 2024",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02-L"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Win 4",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
>   	{
>   		.ident = "GPD Win 5",
>   		.matches = {
> @@ -120,6 +240,306 @@ static const struct dmi_system_id dptc_dmi_table[] = {
>   		},
>   		.driver_data = (void *)&limits_maxhh,
>   	},
> +	{
> +		.ident = "GPD Win Max 2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1619-04"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Win Max 2 2024",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1619-05"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Duo",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Duo",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01-L"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Pocket 4",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "GPD Pocket 4",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04-L"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	/* OrangePi */
> +	{
> +		.ident = "OrangePi NEO-01",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEO-01"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	/* AYN */
> +	{
> +		.ident = "AYN Loki Max",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	/* Tectoy (Zeenix Pro = Loki Max) */
> +	{
> +		.ident = "Zeenix Pro",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Pro"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	/* AOKZOE */
> +	{
> +		.ident = "AOKZOE A1 AR07",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AOKZOE A1 Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 Pro"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AOKZOE A1X",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1X"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AOKZOE A2 Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	/* OneXPlayer (Intel variants filtered by SoC table) */

Are you telling me the Intel variants actually have the same ACPI 
methods this series looks for?

> +	{
> +		.ident = "ONEXPLAYER F1Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1Pro"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER F1 EVA-02",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1 EVA-02"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER 2",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 2"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER X1 A",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 A"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER X1z",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1z"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER X1Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Pro"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "ONEXPLAYER G1 A",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 A"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	/* AYANEO - 15W */
> +	{
> +		.ident = "AYANEO AIR",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
> +		},
> +		.driver_data = (void *)&limits_15w,
> +	},
> +	/* AYANEO - 18W */
> +	{
> +		.ident = "AYANEO AIR Plus",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Plus"),
> +		},
> +		.driver_data = (void *)&limits_18w,
> +	},
> +	{
> +		.ident = "AYANEO AIR Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
> +		},
> +		.driver_data = (void *)&limits_18w,
> +	},
> +	/* AYANEO - 25W */
> +	{
> +		.ident = "AYANEO AIR 1S",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "AIR 1S"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	{
> +		.ident = "AYANEO NEXT Advance",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	{
> +		.ident = "AYANEO NEXT Lite",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Lite"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	{
> +		.ident = "AYANEO NEXT Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	{
> +		.ident = "AYANEO NEXT",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	{
> +		.ident = "AYANEO KUN",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	{
> +		.ident = "AYANEO KUN",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO KUN"),
> +		},
> +		.driver_data = (void *)&limits_25w,
> +	},
> +	/* AYANEO - 28W */
> +	{
> +		.ident = "AYANEO 2",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	{
> +		.ident = "SuiPlay0X1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
> +		},
> +		.driver_data = (void *)&limits_28w,
> +	},
> +	/* AYANEO - 30W */
> +	{
> +		/* DMI_MATCH catches all FLIP variants (DS, KB, 1S DS, 1S KB) */
> +		.ident = "AYANEO FLIP",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		/* DMI_MATCH catches GEEK and GEEK 1S */
> +		.ident = "AYANEO GEEK",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AYANEO SLIDE",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "SLIDE"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
> +	{
> +		.ident = "AYANEO 3",
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
> +		},
> +		.driver_data = (void *)&limits_30w,
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);

